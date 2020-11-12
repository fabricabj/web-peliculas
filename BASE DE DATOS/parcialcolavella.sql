-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2020 a las 21:37:42
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parcialcolavella`
--
CREATE DATABASE IF NOT EXISTS `parcialcolavella` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `parcialcolavella`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `destacados`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `destacados` ()  NO SQL
BEGIN
  SELECT * FROM movies WHERE puntaje BETWEEN 7 and 10;
END$$

--
-- Funciones
--
DROP FUNCTION IF EXISTS `validacionmail`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `validacionmail` (`vmail` VARCHAR(100)) RETURNS VARCHAR(100) CHARSET utf8 NO SQL
BEGIN
 RETURN (SELECT mail FROM usuarios WHERE mail=vmail);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deletepeliculas`
--

DROP TABLE IF EXISTS `deletepeliculas`;
CREATE TABLE `deletepeliculas` (
  `id_pelicula` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `genero` varchar(250) NOT NULL,
  `duracion` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `puntaje` float NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `anio` int(5) NOT NULL,
  `trailer` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `deletepeliculas`
--

INSERT INTO `deletepeliculas` (`id_pelicula`, `titulo`, `genero`, `duracion`, `descripcion`, `puntaje`, `imagen`, `anio`, `trailer`) VALUES
(82, 'EFQFQ', '', '23', 'sxfsfaff', 9, 'ASFAFAFAF', 4144, ''),
(83, 'rwrasfa', ' Fantasia Terror accion', '23', 'awddadw3r', 9, 'ASFAFAFAF', 4144, ''),
(84, 'dadawrqa', ' Terror accion', '23', 'dasfaf', 9, 'ASFAFAFAF', 4144, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE `grupos` (
  `id_grupo` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id_grupo`, `nombre`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'ESPECTADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `id_pelicula` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `genero` varchar(250) NOT NULL,
  `duracion` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `puntaje` float NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `anio` int(5) DEFAULT NULL,
  `trailer` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id_pelicula`, `titulo`, `genero`, `duracion`, `descripcion`, `puntaje`, `imagen`, `anio`, `trailer`) VALUES
(2, 'Harry Potter y la Piedra Filosofal', ' Fantasia Drama Aventura', '152', 'Un niÃ±o huÃ©rfano se matricula en una escuela de hechicerÃ­a, donde descubre la verdad sobre sÃ­ mismo, su familia y el terrible mal que atormenta al mundo mÃ¡gico', 7.6, 'https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_UX182_CR0,0,182,268_AL_.jpg', 2001, 'WE4AJuIvG1Y'),
(16, 'Harry Potter y la cÃ¡mara secreta', ' Fantasia Drama Aventura', '161', 'Una antigua profecÃ­a parece hacerse realidad cuando una presencia misteriosa comienza a acechar los pasillos de una escuela de magia y deja a sus vÃ­ctimas paralizadas', 7.4, 'https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_UX182_CR0,0,182,268_AL_.jpg', 2002, 'C8CL5TbiFwY'),
(17, 'Harry Potter y el prisionero de Azkaban', ' Fantasia Drama Aventura', '142', 'Harry Potter, Ron y Hermione regresan a la Escuela de BrujerÃ­a y HechicerÃ­a de Hogwarts para su tercer aÃ±o de estudio, donde profundizan en el misterio que rodea a un prisionero fugitivo que representa una amenaza peligrosa para el joven mago', 7.9, 'https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2004, 'RBh-IomuTjk'),
(19, 'Harry Potter y la orden del FÃ©nix', ' Fantasia Drama Aventura', '138', 'Con su advertencia sobre el regreso de Lord Voldemort (Ralph Fiennes) burlado, Harry (Daniel Radcliffe) y Dumbledore (Sir Michael Gambon) son atacados por las autoridades del Mago mientras un burÃ³crata autoritario toma lentamente el poder en Hogwart', 7.5, 'https://m.media-amazon.com/images/M/MV5BMTM0NTczMTUzOV5BMl5BanBnXkFtZTYwMzIxNTg3._V1_UX182_CR0,0,182,268_AL_.jpg', 2007, 'gh8eOzf_fos'),
(20, 'Harry Potter y el misterio del principe', ' Fantasia Drama Aventura', '153', 'Cuando Harry Potter (Daniel Radcliffe) comienza su sexto año en Hogwarts, descubre un viejo libro marcado como \"propiedad del Pri­ncipe Mestizo\" y comienza a aprender mas sobre el oscuro pasado de Lord Voldemort (Ralph Fiennes)', 7.6, 'https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2009, 'ST_FLbmyrlY'),
(21, 'Harry Potter y las reliquias de la muerte - Parte 1', ' Fantasia Drama Aventura', '146', 'Mientras Harry (Daniel Radcliffe), Ron (Rupert Grint) y Hermione (Emma Watson) compiten contra el tiempo y el mal para destruir los Horrocruxes, descubren la existencia de los tres objetos mas poderosos del mundo magico: las Reliquias de la Muerte', 7.7, 'https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2010, 'WsJ9LDIX7ic'),
(22, 'Harry Potter y las reliquias de la muerte - Parte 2', ' Fantasia Drama Aventura', '130', 'Harry, Ron y Hermione buscan los Horrocruxes restantes de Voldemort en su esfuerzo por destruir al Señor Oscuro mientras la batalla final continua en Hogwarts.', 8.1, 'https://m.media-amazon.com/images/M/MV5BMjIyZGU4YzUtNDkzYi00ZDRhLTljYzctYTMxMDQ4M2E0Y2YxXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_UX182_CR0,0,182,268_AL_.jpg', 2011, 'I8KCaGH780w'),
(23, 'Animales fantÃ¡sticos y dÃ³nde encontrarlos', ' Fantasia Aventura', '132', 'Las aventuras del escritor Newt Scamander en la comunidad secreta de brujas y magos de Nueva York setenta aÃ±os antes de que Harry Potter lea su libro en la escuela', 7.3, 'https://m.media-amazon.com/images/M/MV5BMjMxOTM1OTI4MV5BMl5BanBnXkFtZTgwODE5OTYxMDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 2016, ''),
(24, 'Animales fantasticos: los cri­menes de Grindelwald', ' Fantasia Drama Aventura', '134', 'La segunda entrega de la serie ', 6.6, 'https://m.media-amazon.com/images/M/MV5BYWVlMDI5N2UtZTIyMC00NjZkLWI5Y2QtODM5NGE5MzA0NmVjXkEyXkFqcGdeQXVyNzU3NjUxMzE@._V1_UX182_CR0,0,182,268_AL_.jpg', 2018, 'dd3ixokfnsU'),
(28, 'El hoyo', ' Terror SCI-FI', '94', 'Una prisiÃ³n vertical con una celda por nivel. Dos personas por celda. Una sola plataforma de alimentos y dos minutos por dÃ­a para alimentar de arriba a abajo. Una pesadilla interminable atrapada en The Hole', 7, 'https://m.media-amazon.com/images/M/MV5BOTMyYTIyM2MtNjQ2ZC00MWFkLThhYjQtMjhjMGZiMjgwYjM2XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2019, 'Oyuomep8Ac4'),
(29, 'IT Capitulo 2', ' Terror Crimen', '169', 'Veintisiete aÃ±os despuÃ©s de su primer encuentro con el aterrador Pennywise, el Club de Perdedores creciÃ³ y se alejÃ³, hasta que una llamada telefÃ³nica devastadora los trajo de vuelta', 6.6, 'https://m.media-amazon.com/images/M/MV5BYTJlNjlkZTktNjEwOS00NzI5LTlkNDAtZmEwZDFmYmM2MjU2XkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_UX182_CR0,0,182,268_AL_.jpg', 2019, '8gJ2K0xBRO4'),
(37, 'Capitan America: Civil War', ' accion SCI-FI Aventura', '147', 'La participaciÃ³n polÃ­tica en los asuntos de los Vengadores causa una brecha entre el CapitÃ¡n AmÃ©rica y Iron Man', 7.8, 'https://m.media-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_UY190_CR0,0,128,190_AL_.jpg', 2016, 's5PVmDAEuro'),
(38, 'Los Vengadores: La era de Ultron', ' Fantasia accion SCI-FI Aventura', '141', 'Cuando Tony Stark y Bruce Banner intentan poner en marcha un programa inactivo de mantenimiento de la paz llamado Ultron, las cosas van terriblemente mal y depende de los hÃ©roes mÃ¡s poderosos de la Tierra evitar que el villano Ultron ejecute su ter', 7.3, 'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_UX182_CR0,0,182,268_AL_.jpg', 2015, 'uLmntu8OH-I'),
(40, 'Capitan America: El Soldado del Invierno', ' Fantasia accion SCI-FI Aventura', '136', 'Mientras Steve Rogers lucha por asumir su papel en el mundo moderno, se une a un compaÃ±ero de Avenger y agente de S.H.I.E.L.D, Black Widow, para luchar contra una nueva amenaza de la historia: un asesino conocido como el Soldado de Invierno', 7.7, 'https://m.media-amazon.com/images/M/MV5BMzA2NDkwODAwM15BMl5BanBnXkFtZTgwODk5MTgzMTE@._V1_UY268_CR1,0,182,268_AL_.jpg', 2014, 'mGqYQog6biY'),
(41, 'Capitan America: El primer vengador', ' Fantasia accion SCI-FI Aventura', '124', 'Steve Rogers, un soldado militar rechazado, se transforma en el CapitÃ¡n AmÃ©rica despuÃ©s de tomar una dosis de un ', 6.9, 'https://m.media-amazon.com/images/M/MV5BMTYzOTc2NzU3N15BMl5BanBnXkFtZTcwNjY3MDE3NQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2011, 'B96CZzcM1CA'),
(77, 'Yummy', ' Terror accion Comedia', '88', 'Una joven pareja viaja al Europa del Este para realizar una cirugÃ­a plÃ¡stica. La mujer desea una reducciÃ³n de pecho, mientras que su madre, que acompaÃ±a a ambos jÃ³venes, anhela un estiramiento facial. En un momento del viaje, mientras el novio e', 6, 'https://m.media-amazon.com/images/M/MV5BYjZkMjE3NjgtZGRjOS00YzIxLTkyZmMtNGZhNThlOTZiODc5XkEyXkFqcGdeQXVyMTIyNDQxMTE@._V1_UY268_CR3,0,182,268_AL_.jpg', 2019, 'MgkUxUU8tAg'),
(79, 'Deberi­as haberte ido', ' Terror Drama', '93', 'David Kehlman es un escritor que espera poder redactar el guion de una pelicula para volver a lanzar su carrera. Para ello, David se traslada, junto a su mujer y su hija, a una casa que la familia alquila en las montañas de Alemania.\r\n\r\nSin embargo', 5.3, 'https://m.media-amazon.com/images/M/MV5BYTMxMTJhNWQtYzQwMC00MThhLTkzNjMtMDljMGE1MmE1NWM2XkEyXkFqcGdeQXVyODkxMzcxOTY@._V1_UX182_CR0,0,182,268_AL_.jpg', 2020, 'Rf58fKNRyIA'),
(81, 'fsfsf', ' Drama SCI-FI', '2332', 'etete', 2, 'ettet', 232, '');

--
-- Disparadores `movies`
--
DROP TRIGGER IF EXISTS `deletemovie`;
DELIMITER $$
CREATE TRIGGER `deletemovie` AFTER DELETE ON `movies` FOR EACH ROW BEGIN 
   INSERT INTO deletepeliculas(id_pelicula,titulo,genero,duracion,descripcion,puntaje,imagen,anio) VALUES (OLD.id_pelicula,OLD.titulo,OLD.genero,OLD.duracion,OLD.descripcion,OLD.puntaje,OLD.imagen,OLD.anio);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `contr` varchar(100) DEFAULT NULL,
  `id_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `mail`, `contr`, `id_grupo`) VALUES
(1, 'Administrador', 'Administrador', 'administrador@gmail.com', '7b902e6ff1db9f560443f2048974fd7d386975b0', 1),
(2, 'fabricio', 'colavella', 'colavella22@gmail.com', 'fa813a90024da3dd40d7b47309a8ff3ab11bf652', 2),
(4, 'fabri', 'Colavella', 'colavella62@gmail.com', '35f38d4214693c4bb7176370275c0efe590b2baa', 2),
(5, 'fabricio', 'sgsggsgs', 'colavella44@gmail.com', 'b279b7f4d0bc48a7660f007ae7983154b706ac57', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_movies`
--

DROP TABLE IF EXISTS `usuarios_movies`;
CREATE TABLE `usuarios_movies` (
  `id_pelicula` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_movies`
--

INSERT INTO `usuarios_movies` (`id_pelicula`, `id_usuario`) VALUES
(24, 1),
(79, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deletepeliculas`
--
ALTER TABLE `deletepeliculas`
  ADD PRIMARY KEY (`id_pelicula`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id_pelicula`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_grupo` (`id_grupo`);

--
-- Indices de la tabla `usuarios_movies`
--
ALTER TABLE `usuarios_movies`
  ADD KEY `id_pelicula` (`id_pelicula`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `deletepeliculas`
--
ALTER TABLE `deletepeliculas`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupos` (`id_grupo`);

--
-- Filtros para la tabla `usuarios_movies`
--
ALTER TABLE `usuarios_movies`
  ADD CONSTRAINT `usuarios_movies_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `movies` (`id_pelicula`),
  ADD CONSTRAINT `usuarios_movies_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
