-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2026 a las 17:06:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_de_abarrotes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `CategoriaID` int(11) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`CategoriaID`, `Nombre`, `Descripcion`) VALUES
(1, 'Abarrotes Secos', 'Arroz, frijol, azúcar, pastas y granos'),
(2, 'Lácteos y Huevos', 'Leche, queso, mantequilla y huevos'),
(3, 'Bebidas', 'Agua, refrescos, jugos y cafés'),
(4, 'Limpieza del Hogar', 'Detergentes, jabones, cloro y esponjas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ClienteID` int(11) NOT NULL,
  `NombreCompleto` varchar(120) NOT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `PermiteFiado` tinyint(1) NOT NULL DEFAULT 0,
  `SaldoPendiente` decimal(10,2) NOT NULL DEFAULT 0.00 CHECK (`SaldoPendiente` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ClienteID`, `NombreCompleto`, `Telefono`, `Direccion`, `PermiteFiado`, `SaldoPendiente`) VALUES
(1, 'Público General', NULL, NULL, 0, 0.00),
(2, 'María López', '555-0201', NULL, 1, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventas`
--

CREATE TABLE `detalleventas` (
  `DetalleID` int(11) NOT NULL,
  `VentaID` int(11) NOT NULL,
  `ProductoID` int(11) NOT NULL,
  `Cantidad` decimal(10,2) NOT NULL CHECK (`Cantidad` > 0),
  `PrecioUnitario` decimal(10,2) NOT NULL CHECK (`PrecioUnitario` >= 0),
  `Subtotal` decimal(12,2) GENERATED ALWAYS AS (`Cantidad` * `PrecioUnitario`) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalleventas`
--

INSERT INTO `detalleventas` (`DetalleID`, `VentaID`, `ProductoID`, `Cantidad`, `PrecioUnitario`) VALUES
(1, 1, 1, 2.00, 24.00),
(2, 1, 3, 1.00, 18.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ProductoID` int(11) NOT NULL,
  `CodigoBarras` varchar(50) DEFAULT NULL,
  `Nombre` varchar(120) NOT NULL,
  `CategoriaID` int(11) NOT NULL,
  `ProveedorID` int(11) DEFAULT NULL,
  `UnidadMedida` varchar(20) NOT NULL DEFAULT 'Unidad',
  `PrecioCompra` decimal(10,2) NOT NULL CHECK (`PrecioCompra` >= 0),
  `PrecioVenta` decimal(10,2) NOT NULL CHECK (`PrecioVenta` >= 0),
  `StockActual` decimal(10,2) NOT NULL DEFAULT 0.00 CHECK (`StockActual` >= 0),
  `StockMinimo` decimal(10,2) NOT NULL DEFAULT 5.00 CHECK (`StockMinimo` >= 0),
  `FechaVencimiento` date DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ProductoID`, `CodigoBarras`, `Nombre`, `CategoriaID`, `ProveedorID`, `UnidadMedida`, `PrecioCompra`, `PrecioVenta`, `StockActual`, `StockMinimo`, `FechaVencimiento`, `Activo`) VALUES
(1, '7501001001', 'Arroz Blanco 1 kg', 1, 1, 'Kg', 18.00, 24.00, 50.00, 10.00, NULL, 1),
(2, '7501001002', 'Leche Entera 1 L', 2, 2, 'Litro', 20.00, 26.50, 30.00, 8.00, NULL, 1),
(3, '7501001003', 'Refresco Cola 600 ml', 3, 1, 'Unidad', 12.00, 18.00, 45.00, 12.00, NULL, 1),
(4, '7501001004', 'Detergente en Polvo 900 g', 4, 1, 'Unidad', 25.00, 34.00, 20.00, 5.00, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ProveedorID` int(11) NOT NULL,
  `NombreEmpresa` varchar(120) NOT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Correo` varchar(120) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ProveedorID`, `NombreEmpresa`, `Contacto`, `Telefono`, `Correo`, `Direccion`, `Activo`) VALUES
(1, 'Distribuidora Central', 'Carlos Méndez', '555-0101', NULL, NULL, 1),
(2, 'Lácteos del Valle', 'Ana Torres', '555-0102', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_factura`
--

CREATE TABLE `tb_factura` (
  `id_venta` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proveedor`
--

CREATE TABLE `tb_proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(34) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tienda`
--

CREATE TABLE `tb_tienda` (
  `id_tienda` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(34) DEFAULT NULL,
  `horario` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `VentaID` int(11) NOT NULL,
  `FechaVenta` datetime NOT NULL DEFAULT current_timestamp(),
  `ClienteID` int(11) DEFAULT NULL,
  `MetodoPago` varchar(30) NOT NULL DEFAULT 'Efectivo',
  `Total` decimal(12,2) NOT NULL CHECK (`Total` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`VentaID`, `FechaVenta`, `ClienteID`, `MetodoPago`, `Total`) VALUES
(1, '2026-11-24 11:05:31', 2, 'Efectivo', 66.00);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`CategoriaID`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ClienteID`);

--
-- Indices de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD PRIMARY KEY (`DetalleID`),
  ADD KEY `FK_DetalleVentas_Ventas` (`VentaID`),
  ADD KEY `FK_DetalleVentas_Productos` (`ProductoID`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProductoID`),
  ADD UNIQUE KEY `CodigoBarras` (`CodigoBarras`),
  ADD KEY `FK_Productos_Categorias` (`CategoriaID`),
  ADD KEY `FK_Productos_Proveedores` (`ProveedorID`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ProveedorID`);

--
-- Indices de la tabla `tb_factura`
--
ALTER TABLE `tb_factura`
  ADD PRIMARY KEY (`id_venta`);

--
-- Indices de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `tb_tienda`
--
ALTER TABLE `tb_tienda`
  ADD PRIMARY KEY (`id_tienda`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`VentaID`),
  ADD KEY `FK_Ventas_Clientes` (`ClienteID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  MODIFY `DetalleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ProductoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ProveedorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `VentaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleventas`
--
ALTER TABLE `detalleventas`
  ADD CONSTRAINT `FK_DetalleVentas_Productos` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`),
  ADD CONSTRAINT `FK_DetalleVentas_Ventas` FOREIGN KEY (`VentaID`) REFERENCES `ventas` (`VentaID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `FK_Productos_Categorias` FOREIGN KEY (`CategoriaID`) REFERENCES `categorias` (`CategoriaID`),
  ADD CONSTRAINT `FK_Productos_Proveedores` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK_Ventas_Clientes` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
