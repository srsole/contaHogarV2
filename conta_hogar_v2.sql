-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2016 a las 15:44:22
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `conta_hogar_v2`
--
CREATE DATABASE IF NOT EXISTS `conta_hogar_v2` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `conta_hogar_v2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id_concepto` int(11) NOT NULL COMMENT 'es la primary key',
  `fecha_atual` date NOT NULL COMMENT 'es la fecha en que se guarda el registro',
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL COMMENT 'es el nombre del gasto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`id_concepto`, `fecha_atual`, `nombre`) VALUES
(1, '2016-09-06', 'nomina'),
(2, '2016-09-06', 'comida'),
(3, '2016-09-06', 'luz'),
(4, '2016-09-06', 'agua'),
(5, '2016-09-06', 'alquiler'),
(6, '2016-09-06', 'paga extra'),
(7, '2016-09-06', 'horas extra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_cuenta` int(11) NOT NULL COMMENT 'es la primary key',
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'es el nombre de la cuenta',
  `password` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'es el password de la cuenta',
  `fecha_alta` date NOT NULL COMMENT 'es la fecha que se creo la cuenta',
  `fecha_baja` date DEFAULT NULL COMMENT 'es la fecha que se cancelo la cuenta',
  `activo` tinyint(1) NOT NULL COMMENT 'indica si la cuenta esta activa o no',
  `id_user` int(11) NOT NULL COMMENT 'foren de user',
  `id_moneda` int(11) NOT NULL COMMENT 'foren de moneda'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id_cuenta`, `nombre`, `password`, `fecha_alta`, `fecha_baja`, `activo`, `id_user`, `id_moneda`) VALUES
(1, 'cuenta casa', NULL, '2016-09-06', NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto`
--

CREATE TABLE `gasto` (
  `id_gasto` int(11) NOT NULL COMMENT 'es la primary key',
  `fecha_atual` date NOT NULL COMMENT 'es la fecha en que se guarda el registro',
  `fecha_efectivo` date NOT NULL COMMENT 'es la fecha en la que se hara el gasto',
  `valor` double NOT NULL COMMENT 'es el valor del gasto',
  `efectuado_por` enum('recurrente','fijo','manual') COLLATE utf8_spanish_ci NOT NULL COMMENT 'inidica como se hizo el gasto',
  `id_cuenta` int(11) NOT NULL COMMENT 'es la foren de cuenta',
  `id_concepto` int(11) NOT NULL COMMENT 'es la foren de concepto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `gasto`
--

INSERT INTO `gasto` (`id_gasto`, `fecha_atual`, `fecha_efectivo`, `valor`, `efectuado_por`, `id_cuenta`, `id_concepto`) VALUES
(1, '2016-09-06', '2016-09-01', 430.1, 'manual', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto_fijo`
--

CREATE TABLE `gasto_fijo` (
  `id_gasto_fijo` int(11) NOT NULL COMMENT 'es la primary key',
  `fecha_atual` date NOT NULL COMMENT 'es la fecha en que se guarda el registro',
  `fecha_efectivo` date NOT NULL COMMENT 'es la fecha en la que se hara el gasto',
  `fecha_inicio` date NOT NULL COMMENT 'es la fecha en la que se empezara a hacer el gasto',
  `fecha_fin` date NOT NULL COMMENT 'es la fecha en la que se terminara de hacer el gasto',
  `valor` double NOT NULL COMMENT 'es el valor que tendra el gasto',
  `id_cuenta` int(11) NOT NULL COMMENT 'foren de cuenta',
  `id_concepto` int(11) NOT NULL COMMENT 'forecn de concepto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gasto_recurrente`
--

CREATE TABLE `gasto_recurrente` (
  `id_gasto_recurrente` int(11) NOT NULL COMMENT 'es la primary key',
  `fecha_atual` date NOT NULL COMMENT 'es la fecha en que se guarda el registro',
  `fecha_efectivo` date NOT NULL COMMENT 'es la fecha en la que se hara el gasto',
  `fecha_inicio` date NOT NULL COMMENT 'es la fecha en la que se empezara a hacer el gasto',
  `fecha_fin` date NOT NULL COMMENT 'es la fecha en la que se terminara de hacer el gasto',
  `id_cuenta` int(11) NOT NULL COMMENT 'foren de cuenta',
  `id_concepto` int(11) NOT NULL COMMENT 'forecn de concepto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id_ingreso` int(11) NOT NULL COMMENT 'es la primary key',
  `fecha_atual` date NOT NULL COMMENT 'es la fecha en que se guarda el registro',
  `fecha_efectivo` date NOT NULL COMMENT 'es la fecha en la que se hara el ingreso',
  `valor` double NOT NULL COMMENT 'es el valor del ingreso;',
  `efectuado_por` enum('recurrente','fijo','manual') COLLATE utf8_spanish_ci NOT NULL COMMENT 'inidica como se hizo el ingreso',
  `id_cuenta` int(11) NOT NULL COMMENT 'foren de cuenta',
  `id_concepto` int(11) NOT NULL COMMENT 'forecn de concepto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`id_ingreso`, `fecha_atual`, `fecha_efectivo`, `valor`, `efectuado_por`, `id_cuenta`, `id_concepto`) VALUES
(1, '2016-09-06', '2016-09-01', 1067, 'manual', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_fijo`
--

CREATE TABLE `ingreso_fijo` (
  `id_ingreso_fijo` int(11) NOT NULL COMMENT 'es la primary key',
  `fecha_atual` date NOT NULL COMMENT 'es la fecha en que se guarda el registro',
  `fecha_efectivo` date NOT NULL COMMENT 'es la fecha en la que se hara el ingreso',
  `fecha_inicio` date NOT NULL COMMENT 'es la fecha en la que se empezara a hacer el ingreso',
  `fecha_fin` date NOT NULL COMMENT 'es la fecha en la que se terminara de hacer el ingreso',
  `valor` double NOT NULL COMMENT 'es el valor que tendra el ingreso',
  `id_cuenta` int(11) NOT NULL COMMENT 'foren de cuenta',
  `id_concepto` int(11) NOT NULL COMMENT 'forecn de concepto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_recurrente`
--

CREATE TABLE `ingreso_recurrente` (
  `id_ingreso_recurrente` int(11) NOT NULL COMMENT 'es la primary key',
  `fecha_atual` date NOT NULL COMMENT 'es la fecha en que se guarda el registro',
  `fecha_efectivo` date NOT NULL COMMENT 'es la fecha en la que se hara el ingreso',
  `fecha_inicio` date NOT NULL COMMENT 'es la fecha en la que se empezara a hacer el ingreso',
  `fecha_fin` date NOT NULL COMMENT 'es la fecha en la que se terminara de hacer el ingreso',
  `id_cuenta` int(11) NOT NULL COMMENT 'foren de cuenta',
  `id_concepto` int(11) NOT NULL COMMENT 'forecn de concepto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda`
--

CREATE TABLE `moneda` (
  `id_moneda` int(11) NOT NULL COMMENT 'es la primary key',
  `fecha_atual` date NOT NULL COMMENT 'es la fecha en que se guarda el registro',
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'es el nombre de la moneda',
  `simbolo` varchar(4) COLLATE utf8_spanish_ci NOT NULL COMMENT 'simbolo de la moneda como $ o €'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `moneda`
--

INSERT INTO `moneda` (`id_moneda`, `fecha_atual`, `nombre`, `simbolo`) VALUES
(1, '2016-09-06', 'euro', 'EUR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL COMMENT 'el la primary key',
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'es el nombre real del usuario',
  `apellido1` varchar(200) COLLATE utf8_spanish_ci NOT NULL COMMENT 'es el apellido real del usuario',
  `apellido2` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'es el segundo apellido real del user, opcional',
  `email_opcional` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'email opcional del usuario',
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'es la direccion del usuario',
  `codigo_postal` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'es el cp del usuario',
  `poblacion` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'es la poblacion donde reside el usuario',
  `fecha_nacimiento` date NOT NULL COMMENT 'es la fecha de nacimiento del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `nombre`, `apellido1`, `apellido2`, `email_opcional`, `direccion`, `codigo_postal`, `poblacion`, `fecha_nacimiento`) VALUES
(1, 'Francisco', 'Sole', 'Gonzalez', NULL, 'c/ orient', '08904', 'barcelona', '1987-06-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL COMMENT 'es la primary key',
  `nick_name` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'es el user name del usuario',
  `password` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'la contraseña del usuario ',
  `email` varchar(255) COLLATE utf8_spanish_ci NOT NULL COMMENT 'el email de el usuario',
  `fecha_alta` date NOT NULL COMMENT 'la fecha que se inscribio el usuario',
  `fecha_baja` date DEFAULT NULL COMMENT 'fecha en que se dio de baja, puede ser null',
  `activo` tinyint(1) NOT NULL COMMENT 'inidica si el user esta activo',
  `id_perfil` int(11) NOT NULL COMMENT 'forenkey de PERFIL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id_user`, `nick_name`, `password`, `email`, `fecha_alta`, `fecha_baja`, `activo`, `id_perfil`) VALUES
(1, 'srsole', '9983212', 'srsole@gamil.com', '2016-09-06', NULL, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id_concepto`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id_cuenta`);

--
-- Indices de la tabla `gasto`
--
ALTER TABLE `gasto`
  ADD PRIMARY KEY (`id_gasto`);

--
-- Indices de la tabla `gasto_fijo`
--
ALTER TABLE `gasto_fijo`
  ADD PRIMARY KEY (`id_gasto_fijo`);

--
-- Indices de la tabla `gasto_recurrente`
--
ALTER TABLE `gasto_recurrente`
  ADD PRIMARY KEY (`id_gasto_recurrente`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id_ingreso`);

--
-- Indices de la tabla `ingreso_fijo`
--
ALTER TABLE `ingreso_fijo`
  ADD PRIMARY KEY (`id_ingreso_fijo`);

--
-- Indices de la tabla `ingreso_recurrente`
--
ALTER TABLE `ingreso_recurrente`
  ADD PRIMARY KEY (`id_ingreso_recurrente`);

--
-- Indices de la tabla `moneda`
--
ALTER TABLE `moneda`
  ADD PRIMARY KEY (`id_moneda`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `gasto`
--
ALTER TABLE `gasto`
  MODIFY `id_gasto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `gasto_fijo`
--
ALTER TABLE `gasto_fijo`
  MODIFY `id_gasto_fijo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key';
--
-- AUTO_INCREMENT de la tabla `gasto_recurrente`
--
ALTER TABLE `gasto_recurrente`
  MODIFY `id_gasto_recurrente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key';
--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `id_ingreso` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `ingreso_fijo`
--
ALTER TABLE `ingreso_fijo`
  MODIFY `id_ingreso_fijo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key';
--
-- AUTO_INCREMENT de la tabla `ingreso_recurrente`
--
ALTER TABLE `ingreso_recurrente`
  MODIFY `id_ingreso_recurrente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key';
--
-- AUTO_INCREMENT de la tabla `moneda`
--
ALTER TABLE `moneda`
  MODIFY `id_moneda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'el la primary key', AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'es la primary key', AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
