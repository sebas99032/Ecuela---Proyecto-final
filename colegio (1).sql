-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2021 a las 16:49:42
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `Id-clase` int(10) NOT NULL,
  `Id-estudiante` int(10) DEFAULT NULL,
  `Id-materia` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `Id-estudiante` int(10) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `F-nacimiento` date DEFAULT NULL,
  `Teléfono` int(10) DEFAULT NULL,
  `Correo` varchar(30) DEFAULT NULL,
  `Dirección` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`Id-estudiante`, `Nombre`, `Apellido`, `F-nacimiento`, `Teléfono`, `Correo`, `Dirección`) VALUES
(123456789, 'carlos', 'davila', '2021-05-12', 12124234, 'carlos@gmail.com', 'martin alonso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `Id-grado` int(11) NOT NULL,
  `Nombre` varchar(15) DEFAULT NULL,
  `Id-estudiante` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id-horario` int(11) NOT NULL,
  `Hora-inicio` int(11) NOT NULL,
  `Hora-final` int(11) NOT NULL,
  `Id-clase` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista`
--

CREATE TABLE `lista` (
  `Id-lista` int(10) NOT NULL,
  `Id-estudiante` int(10) DEFAULT NULL,
  `Id-profesor` int(10) DEFAULT NULL,
  `Id-materia` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `Id-materia` int(10) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Id-grado` int(10) DEFAULT NULL,
  `Id-profesor` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `Id-notas` int(10) NOT NULL,
  `Id-estudiante` int(10) DEFAULT NULL,
  `Id-materia` int(10) DEFAULT NULL,
  `Calificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `Id-periodo` int(11) NOT NULL,
  `Nombre` int(11) DEFAULT NULL,
  `Fecha-inicio` date DEFAULT NULL,
  `Fecha-Final` date DEFAULT NULL,
  `Id-materia` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `Id-profesor` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` int(30) DEFAULT NULL,
  `F-nacimiento` date DEFAULT NULL,
  `Teléfono` int(10) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Dirección` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`Id-clase`),
  ADD UNIQUE KEY `Id-estudiante` (`Id-estudiante`),
  ADD KEY `Id-materia` (`Id-materia`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`Id-estudiante`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`Id-grado`),
  ADD KEY `Id-estudiante` (`Id-estudiante`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id-horario`),
  ADD KEY `Id-clase` (`Id-clase`);

--
-- Indices de la tabla `lista`
--
ALTER TABLE `lista`
  ADD PRIMARY KEY (`Id-lista`),
  ADD KEY `Id-profesor` (`Id-profesor`),
  ADD KEY `Id-estudiante` (`Id-estudiante`),
  ADD KEY `Id-materia` (`Id-materia`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`Id-materia`),
  ADD KEY `Id-grado` (`Id-grado`),
  ADD KEY `Id-profesor` (`Id-profesor`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`Id-notas`),
  ADD KEY `Id-estudiante` (`Id-estudiante`),
  ADD KEY `Id-materia` (`Id-materia`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`Id-periodo`),
  ADD KEY `Id-materia` (`Id-materia`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`Id-profesor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `Id-clase` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `Id-estudiante` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123456790;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `Id-grado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `Id-periodo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesor`
--
ALTER TABLE `profesor`
  MODIFY `Id-profesor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`Id-materia`) REFERENCES `materia` (`Id-materia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grado`
--
ALTER TABLE `grado`
  ADD CONSTRAINT `grado_ibfk_1` FOREIGN KEY (`Id-estudiante`) REFERENCES `estudiante` (`Id-estudiante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`Id-clase`) REFERENCES `clase` (`Id-clase`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lista`
--
ALTER TABLE `lista`
  ADD CONSTRAINT `lista_ibfk_1` FOREIGN KEY (`Id-profesor`) REFERENCES `profesor` (`Id-profesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lista_ibfk_2` FOREIGN KEY (`Id-estudiante`) REFERENCES `estudiante` (`Id-estudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lista_ibfk_3` FOREIGN KEY (`Id-materia`) REFERENCES `materia` (`Id-materia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `materia_ibfk_1` FOREIGN KEY (`Id-grado`) REFERENCES `grado` (`Id-grado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `materia_ibfk_2` FOREIGN KEY (`Id-profesor`) REFERENCES `profesor` (`Id-profesor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`Id-materia`) REFERENCES `materia` (`Id-materia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD CONSTRAINT `periodo_ibfk_1` FOREIGN KEY (`Id-materia`) REFERENCES `materia` (`Id-materia`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
