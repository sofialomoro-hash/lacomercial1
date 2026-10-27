-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-10-2026 a las 16:56:39
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestionventas_2026`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `codigo` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `precio` double NOT NULL,
  `stock` double NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_rubro` bigint NOT NULL,
  `id_proveedor` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_id_rubro` (`id_rubro`),
  KEY `fk_id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `id_rubro`, `id_proveedor`) VALUES
(1, '101', 'iPhone SE', 'Procesador: A13 Bionic \r\n| Almacenamiento: 128 GB \r\n| Cámaras 7 Mp / 12 Mp\r\n| Pantalla: 4,7 IPS Retina', 74999, 10, 'iPhone-SE-Black.jpg', 1, 0),
(2, '102', 'Motorola Moto G100', 'Procesador: Octa-Core (3,2 GHz) \r\n| Almacenamiento: 128 GB \r\n| Cámaras: 13Mp / 64+16+2 Mp+ToF \r\n| Pantalla: 6,7 FHD+LTPS', 74999, 11, 'Motorola-Moto-G100.jpg', 1, 0),
(3, '103', 'iPhone 11 Pro', 'Procesador: Chip A13 Bionic \r\n| Almacenamiento: 256 GB \r\n| Cámaras: 12Mp / 12 Mp (Triple) \r\n| Pantalla: 5,8 Super Retina XDR - OLED Multi - Touch', 232899, 25, 'Iphone-11-Pro.jpg', 1, 0),
(4, '201', 'Samsung Galaxy A72', 'Procesador: Octa - Core(2, 3 GHz / 1, 8 GHz) \r\n| Almacenamiento: 128 GB \r\n| Cámaras: 32 Mp / 64 + 12 + 5 + 8 Mp \r\n| Pantalla: 6,7 FHD+ SuperAmoled', 66999, 12, 'Samsung-Galaxy-A72.jpg', 1, 0),
(5, '202', 'iPhone 11 Pro Max', 'Procesador: Chip A13 Bionic \r\n| Almacenamiento: 256 GB \r\n| Cámaras: 12 Mp / 12 Mp (Triple) \r\n| Pantalla: 5,8 Super Retina XDR - OLED Multi - Touch', 249899, 7, 'Iphone-11-Pro-Max.jpg', 1, 0),
(6, '203', 'Motorola Moto G9 Plus', 'Procesador: Octa - Core(2, 2 GHz) \r\n| Almacenamiento: 128 GB \r\n| Cámaras: 16 Mp / 64 + 8 + 2 + 2 Mp \r\n| Pantalla: 6,81 FHD+ LTPS', 42999, 10, 'Motorola-Moto-G9-Plus.jpg', 1, 0),
(8, '21212', '121212', '                    1212', 1212121, 0, 'Gemini_Generated_Image_z25apcz25apcz25a.png', 0, 0),
(9, '1', '1', '', 1, 0, 'Gemini_Generated_Image_z25apcz25apcz25a.png', 0, 0),
(10, '1111', 'BMW M3', '', 44646454, 0, 'bmwm3.webp', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cuit` varchar(13) COLLATE utf8mb4_general_ci NOT NULL,
  `iva` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rol` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `direccion`, `cuit`, `iva`, `email`, `telefono`, `usuario`, `password`, `rol`) VALUES
(1, 'José', 'De San Martín', 'YAPEYÚ 1778', '20-17781850-5', 'Resp. Inscripto', 'sanmartin@hotmail.com', '341 4254521', 'josesanmartin', '123456', 'cliente'),
(2, 'Manuel', 'Belgrano', 'ROSARIO 1770', '20-17701820-5', 'Monotributo', 'manuelbelgrano@gmail.com', '3476 625876', 'manuelbelgrano', '654123', ''),
(3, 'Juana', 'Azurduy', 'SUCRE 1780', '27-17801862-0', 'Cons. Final', 'jaunitaazur862@live.com', '341 5418563', 'juanaazurduy', '456789', ''),
(4, 'Gregoria', 'Matorras', 'ORENSE 1738', '23-17381813-1', 'Resp. Inscripto', 'matorras.g.813@gmail.com', '342 6325498', 'gregoriamatorras', '987654', ''),
(5, 'Administrador', '', '', '', '', '', '', 'admin', 'admin', 'admin');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
