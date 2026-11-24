-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2026 a las 22:46:57
-- Versión del servidor: 10.11.16-MariaDB
-- Versión de PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `trnasmilenio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacion`
--

CREATE TABLE `estacion` (
  `ID_ESTACION` int(11) NOT NULL,
  `UBICACION` varchar(150) NOT NULL,
  `TIPO_ESTACION` varchar(50) NOT NULL,
  `ID_TRASMILENIO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estacion`
--

INSERT INTO `estacion` (`ID_ESTACION`, `UBICACION`, `TIPO_ESTACION`, `ID_TRASMILENIO`, `NOMBRE`) VALUES
(1, 'Calle 26 con Carrera 30', 'Intermedia', 1, 'CAD'),
(2, 'Autopista Norte con Calle 100', 'Sencilla', 1, 'Calle 100'),
(3, 'Carrera 30 con Calle 45', 'Sencilla', 1, 'Av. El Dorado'),
(4, 'Portal Norte', 'Portal', 1, 'Portal del Norte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recorrido`
--

CREATE TABLE `recorrido` (
  `ID_RECORRIDO` int(11) NOT NULL,
  `ID_RUTA` int(11) NOT NULL,
  `ID_ESTACION` int(11) NOT NULL,
  `HORA_LLEGADA` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recorrido`
--

INSERT INTO `recorrido` (`ID_RECORRIDO`, `ID_RUTA`, `ID_ESTACION`, `HORA_LLEGADA`) VALUES
(1, 1, 4, '06:00:00'),
(2, 1, 2, '06:18:00'),
(3, 1, 1, '06:35:00'),
(4, 2, 1, '07:00:00'),
(5, 2, 3, '07:10:00'),
(6, 2, 2, '07:25:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `ID_RUTA` int(11) NOT NULL,
  `ORIGEN` varchar(100) NOT NULL,
  `DESTINO` varchar(100) NOT NULL,
  `HORARIO` varchar(100) NOT NULL,
  `DIRECCION_CENTRAL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`ID_RUTA`, `ORIGEN`, `DESTINO`, `HORARIO`, `DIRECCION_CENTRAL`) VALUES
(1, 'Portal del Norte', 'CAD', '04:30 - 23:00', 1),
(2, 'CAD', 'Calle 100', '05:00 - 22:30', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasmilenio`
--

CREATE TABLE `trasmilenio` (
  `id_trasmi` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `direccion_central` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trasmilenio`
--

INSERT INTO `trasmilenio` (`id_trasmi`, `nombre`, `ciudad`, `direccion_central`) VALUES
(1, 'TransMilenio S.A.', 'Bogotá', 'Av. El Dorado # 69-76');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estacion`
--
ALTER TABLE `estacion`
  ADD PRIMARY KEY (`ID_ESTACION`),
  ADD KEY `fk_estacion_trasmi` (`ID_TRASMILENIO`);

--
-- Indices de la tabla `recorrido`
--
ALTER TABLE `recorrido`
  ADD PRIMARY KEY (`ID_RECORRIDO`),
  ADD KEY `fk_recorrido_ruta` (`ID_RUTA`),
  ADD KEY `fk_recorrido_estacion` (`ID_ESTACION`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`ID_RUTA`),
  ADD KEY `fk_ruta_direccion_central` (`DIRECCION_CENTRAL`);

--
-- Indices de la tabla `trasmilenio`
--
ALTER TABLE `trasmilenio`
  ADD PRIMARY KEY (`id_trasmi`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estacion`
--
ALTER TABLE `estacion`
  MODIFY `ID_ESTACION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `recorrido`
--
ALTER TABLE `recorrido`
  MODIFY `ID_RECORRIDO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ruta`
--
ALTER TABLE `ruta`
  MODIFY `ID_RUTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trasmilenio`
--
ALTER TABLE `trasmilenio`
  MODIFY `id_trasmi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estacion`
--
ALTER TABLE `estacion`
  ADD CONSTRAINT `fk_estacion_trasmi` FOREIGN KEY (`ID_TRASMILENIO`) REFERENCES `trasmilenio` (`id_trasmi`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `recorrido`
--
ALTER TABLE `recorrido`
  ADD CONSTRAINT `fk_recorrido_estacion` FOREIGN KEY (`ID_ESTACION`) REFERENCES `estacion` (`ID_ESTACION`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recorrido_ruta` FOREIGN KEY (`ID_RUTA`) REFERENCES `ruta` (`ID_RUTA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `fk_ruta_direccion_central` FOREIGN KEY (`DIRECCION_CENTRAL`) REFERENCES `trasmilenio` (`id_trasmi`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
