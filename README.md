[taller_hoy (1).sql](https://github.com/user-attachments/files/35297619/taller_hoy.1.sql)
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2026 a las 21:13:44
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
-- Base de datos: `taller_hoy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion`) VALUES
(1, 'Laptops', 'Computadores portátiles de uso personal y profesional'),
(2, 'Smartphones', 'Teléfonos inteligentes de diversas gamas'),
(3, 'Monitores', 'Pantallas LED, IPS y curvas para oficina y gaming'),
(4, 'Teclados', 'Teclados mecánicos, de membrana e inalámbricos'),
(5, 'Mouse', 'Ratones ópticos, ergonómicos y para videojuegos'),
(6, 'Audio', 'Audífonos, diademas y parlantes Bluetooth'),
(7, 'Almacenamiento', 'Discos duros externos, SSD y memorias USB'),
(8, 'Componentes', 'Tarjetas gráficas, memorias RAM y procesadores'),
(9, 'Redes', 'Routers, repetidores Wi-Fi y switches'),
(10, 'Accesorios', 'Cables, adaptadores, soportes y mochilas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ciudad` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `correo`, `telefono`, `ciudad`) VALUES
(1, 'Camila Rojas', 'camila.rojas@correo.com', '3104567890', 'Bogotá'),
(2, 'Mateo Gómez', 'mateo.gomez@correo.com', '3157891234', 'Medellín'),
(3, 'Valentina Herrera', 'valentina.h@correo.com', '3209876543', 'Cali'),
(4, 'Sebastián Castro', 'sebastian.c@correo.com', '3012345678', 'Barranquilla'),
(5, 'Laura Morales', 'laura.morales@correo.com', '3186543210', 'Bucaramanga');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre_producto`, `precio`, `stock`, `id_categoria`) VALUES
(1, 'Laptop Lenovo IdeaPad 3', 650.00, 15, 1),
(2, 'iPhone 15 128GB', 899.99, 20, 2),
(3, 'Monitor LG UltraGear 24\"', 210.50, 12, 3),
(4, 'Teclado Mecánico Redragon Kumara', 45.00, 30, 4),
(5, 'Mouse Logitech G203', 29.99, 40, 5),
(6, 'Audífonos Sony WH-1000XM5', 349.00, 10, 6),
(7, 'SSD Kingston NV2 1TB', 68.50, 25, 7),
(8, 'Memoria RAM Corsair 16GB DDR4', 52.00, 35, 8),
(9, 'Router TP-Link Archer AX50', 89.99, 18, 9),
(10, 'Hub USB-C 7 en 1 Ugreen', 34.50, 50, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `fecha_venta` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total_venta` decimal(10,2) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `fecha_venta`, `cantidad`, `total_venta`, `id_producto`, `id_cliente`) VALUES
(1, '2026-11-01', 1, 650.00, 1, 1),
(2, '2026-11-02', 2, 1799.98, 2, 2),
(3, '2026-11-03', 1, 210.50, 3, 3),
(4, '2026-11-04', 3, 135.00, 4, 4),
(5, '2026-11-05', 2, 59.98, 5, 5),
(6, '2026-11-06', 1, 349.00, 6, 1),
(7, '2026-11-07', 4, 274.00, 7, 2),
(8, '2026-11-08', 2, 104.00, 8, 3),
(9, '2026-11-09', 1, 89.99, 9, 4),
(10, '2026-11-10', 5, 172.50, 10, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_producto_categoria` (`id_categoria`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `fk_venta_producto` (`id_producto`),
  ADD KEY `fk_venta_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venta_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
