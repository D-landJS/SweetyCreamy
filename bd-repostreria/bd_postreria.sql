-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2020 a las 08:23:45
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_postreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` mediumtext COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategoria`, `nombre`, `descripcion`) VALUES
(1, 'Tortas', 'Las mejores tortas de San Miguel'),
(2, 'Cheesecake ', 'Los mas sabrosos cheesecake de San Miguel'),
(3, 'Tartas', 'Las mejores tartas de San Miguel.'),
(4, 'Chifones', 'Las mejores chifones de San Miguel.'),
(5, 'Kekes', 'Las mejores kekes de San Miguel.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL,
  `caracteristica` mediumtext COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `idCategoria`, `caracteristica`, `precio`) VALUES
(1, 'Torta Tres Leches Chica 10 Porciones\r\n', 1, 'Bizcochuelo de vainilla embebido a base de tres leches relleno de manjar blanco.', 36),
(2, 'Torta Tres Leches de Lúcuma Mediana 16 Porciones', 1, 'Bizcochuelo de chocolate relleno de pulpa de lúcuma y fodge de chocolate, tres leches de vainilla con pulpa de  lúcuma.', 60),
(3, 'Cheesecake Horneado Fresa 10 Porciones', 2, ' Cremoso y delicioso postre a base de queso crema y compota de fresa', 54),
(4, 'Cheesecake de Maracuyá 10 Porciones', 2, 'Cremoso y delicioso postre a base de queso crema y jalea de maracuyá.', 58),
(5, 'Tarta de Fresas y Arándanos 12 Porciones', 3, 'Tarta rellena con crema pastelera, arándanos y fresas,', 40),
(6, 'Tarta de Frutas 12 Porciones', 3, 'Tarta con capa de crema pastelera y frutas de decoración: durazno, uva, arándanos y fresas.', 40),
(7, 'Chifón de Naranja x Unid', 4, 'Delicado chifón a base de huevo y zumo de naranja.', 20),
(8, 'Chifón Marmoleado x Unid', 4, 'Delicado chifón a base de huevo con cocoa.', 20),
(9, 'Cake Marmoleado Rectangular x Unid', 5, 'Deliciosos cake, sabor vainilla y chocolate.', 12),
(10, 'Cake de Naranja Rectangular x Unid', 5, 'Delicioso cake, a base de zumo de naranja', 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
