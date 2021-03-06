-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-11-2021 a las 01:48:55
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tutoria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `IdAct` int(20) NOT NULL,
  `Actividad` blob NOT NULL,
  `Semestres` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda`
--

CREATE TABLE `ayuda` (
  `IdAyuda` int(11) NOT NULL,
  `IdTutorado` int(11) NOT NULL,
  `Tipo` varchar(25) NOT NULL,
  `Materia` varchar(25) DEFAULT NULL,
  `Motivo` varchar(250) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cambiartutor`
--

CREATE TABLE `cambiartutor` (
  `IdMensaje` int(11) NOT NULL,
  `IdTutorado` int(11) NOT NULL,
  `Mensaje` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canalizacion`
--

CREATE TABLE `canalizacion` (
  `IdCanal` int(11) NOT NULL,
  `IdTutorado` int(11) NOT NULL,
  `Tipo` varchar(25) NOT NULL,
  `Hora` time NOT NULL,
  `Comentarios` varchar(500) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coordinador`
--

CREATE TABLE `coordinador` (
  `IdCoo` int(11) NOT NULL,
  `NombreCoo` varchar(20) NOT NULL,
  `ApellidoParteno` varchar(20) NOT NULL,
  `ApellidoMarteno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `coordinador`
--

INSERT INTO `coordinador` (`IdCoo`, `NombreCoo`, `ApellidoParteno`, `ApellidoMarteno`) VALUES
(16401024, 'Jiacheng', 'Zhou', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jefedpt`
--

CREATE TABLE `jefedpt` (
  `IdJefe` int(11) NOT NULL,
  `NombreJefe` varchar(50) NOT NULL,
  `ApellidoParteno` varchar(20) NOT NULL,
  `ApellidoMarteno` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `IdReporte` int(11) NOT NULL,
  `IdTutorado` int(11) NOT NULL,
  `IdTutor` int(11) NOT NULL,
  `Semestres` tinyint(4) NOT NULL,
  `Estatus` varchar(20) NOT NULL,
  `HoraSesionIndiv` time NOT NULL,
  `HoraSesionGrup` time NOT NULL,
  `EvaValor` int(11) NOT NULL,
  `EvalNivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `IdSeguro` int(11) NOT NULL,
  `IdTutorado` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `IdTutor` int(11) NOT NULL,
  `NombreTutor` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`IdTutor`, `NombreTutor`) VALUES
(16401020, 'blanca ramirez'),
(16401027, 'Sergio Rivera Rios'),
(16401028, 'edgar valderama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutorados`
--

CREATE TABLE `tutorados` (
  `IdTutorado` int(11) NOT NULL,
  `NombreTutorado` varchar(35) NOT NULL,
  `IdTutor` int(11) DEFAULT NULL,
  `Semestres` tinyint(4) NOT NULL,
  `Domicilio` varchar(100) NOT NULL,
  `Telefono` varchar(25) NOT NULL,
  `Preparatoria` varchar(35) NOT NULL,
  `Estatus` varchar(15) NOT NULL,
  `MotivoCarrera` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tutorados`
--

INSERT INTO `tutorados` (`IdTutorado`, `NombreTutorado`, `IdTutor`, `Semestres`, `Domicilio`, `Telefono`, `Preparatoria`, `Estatus`, `MotivoCarrera`) VALUES
(100, '100', 16401020, 2, '', '', '', '', 0),
(101, '101', 16401027, 6, '', '', '', '', 0),
(102, '102', NULL, 11, '', '', '', '', 0),
(103, '103', NULL, 13, '', '', '', '', 0),
(16401026, 'Luis Miguel', 16401027, 9, '', '', '', '', 0),
(16401029, 'Jose Luis Ramos Monreal', 16401028, 11, '', '', '', '', 0),
(16401099, 'Jholaus Enrique Salazar Maldonado', NULL, 2, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUser` int(11) NOT NULL,
  `Nombre` varchar(35) NOT NULL,
  `Password` varchar(18) NOT NULL,
  `TipoUser` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUser`, `Nombre`, `Password`, `TipoUser`) VALUES
(100, '100', '', 'Alumno'),
(101, '101', '', 'Alumno'),
(102, '102', '', 'Alumno'),
(103, '103', '', 'Alumno'),
(16401020, 'blanca ramirez', 'br1234', 'Tutor'),
(16401023, 'Jiacheng Zhou', 'z1234', 'Jefe de departamento'),
(16401024, 'Juan Mario Gonzalez Borrayo', 'jm1234', 'Coordinador de Tutores'),
(16401026, 'Luis Miguel', 'lm123', 'Alumno'),
(16401027, 'Sergio Rivera Rios', 's1234', 'Tutor'),
(16401028, 'edgar valderama', 'ev123456', 'Tutor'),
(16401029, 'Jose Luis Ramos Monreal', 'jl1234', 'Alumno'),
(16401099, 'Jholaus Enrique Salazar Maldonado', 'js1234', 'Alumno');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`IdAct`);

--
-- Indices de la tabla `ayuda`
--
ALTER TABLE `ayuda`
  ADD PRIMARY KEY (`IdAyuda`),
  ADD KEY `Ayuda-Tutorado` (`IdTutorado`);

--
-- Indices de la tabla `cambiartutor`
--
ALTER TABLE `cambiartutor`
  ADD PRIMARY KEY (`IdMensaje`),
  ADD KEY `Cambiar-Tutorado` (`IdTutorado`);

--
-- Indices de la tabla `canalizacion`
--
ALTER TABLE `canalizacion`
  ADD PRIMARY KEY (`IdCanal`,`IdTutorado`),
  ADD KEY `Tutorado-Canalizacion` (`IdTutorado`);

--
-- Indices de la tabla `coordinador`
--
ALTER TABLE `coordinador`
  ADD PRIMARY KEY (`IdCoo`);

--
-- Indices de la tabla `jefedpt`
--
ALTER TABLE `jefedpt`
  ADD PRIMARY KEY (`IdJefe`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`IdReporte`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`IdSeguro`),
  ADD KEY `Tutorado-Seguro` (`IdTutorado`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`IdTutor`);

--
-- Indices de la tabla `tutorados`
--
ALTER TABLE `tutorados`
  ADD PRIMARY KEY (`IdTutorado`),
  ADD KEY `Tutor-Tutorado` (`IdTutor`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `canalizacion`
--
ALTER TABLE `canalizacion`
  MODIFY `IdCanal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `IdReporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ayuda`
--
ALTER TABLE `ayuda`
  ADD CONSTRAINT `Ayuda-Tutorado` FOREIGN KEY (`IdTutorado`) REFERENCES `tutorados` (`IdTutorado`);

--
-- Filtros para la tabla `cambiartutor`
--
ALTER TABLE `cambiartutor`
  ADD CONSTRAINT `Cambiar-Tutorado` FOREIGN KEY (`IdTutorado`) REFERENCES `tutorados` (`IdTutorado`);

--
-- Filtros para la tabla `canalizacion`
--
ALTER TABLE `canalizacion`
  ADD CONSTRAINT `Tutorado-Canalizacion` FOREIGN KEY (`IdTutorado`) REFERENCES `tutorados` (`IdTutorado`);

--
-- Filtros para la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD CONSTRAINT `Tutorado-Seguro` FOREIGN KEY (`IdTutorado`) REFERENCES `tutorados` (`IdTutorado`);

--
-- Filtros para la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `usuario-Tutor` FOREIGN KEY (`IdTutor`) REFERENCES `usuario` (`IdUser`);

--
-- Filtros para la tabla `tutorados`
--
ALTER TABLE `tutorados`
  ADD CONSTRAINT `Tutor-Tutorado` FOREIGN KEY (`IdTutor`) REFERENCES `tutor` (`IdTutor`),
  ADD CONSTRAINT `Tutorada-usuario` FOREIGN KEY (`IdTutorado`) REFERENCES `usuario` (`IdUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
