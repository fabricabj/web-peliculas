-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2020 a las 16:17:18
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `genero` enum('fantasia','terror','accion') NOT NULL,
  `duracion` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `puntaje` float NOT NULL,
  `imagen` varchar(250) NOT NULL,
  `anio` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id_pelicula`, `titulo`, `genero`, `duracion`, `descripcion`, `puntaje`, `imagen`, `anio`) VALUES
(2, 'Harry Potter y la Piedra Filosofal', 'fantasia', '152', 'Un niÃ±o huÃ©rfano se matricula en una escuela de hechicerÃ­a, donde descubre la verdad sobre sÃ­ mismo, su familia y el terrible mal que atormenta al mundo mÃ¡gico', 7.6, 'https://m.media-amazon.com/images/M/MV5BNjQ3NWNlNmQtMTE5ZS00MDdmLTlkZjUtZTBlM2UxMGFiMTU3XkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_UX182_CR0,0,182,268_AL_.jpg', 2001),
(16, 'Harry Potter y la cÃ¡mara secreta', 'fantasia', '161', 'Una antigua profecÃ­a parece hacerse realidad cuando una presencia misteriosa comienza a acechar los pasillos de una escuela de magia y deja a sus vÃ­ctimas paralizadas', 7.4, 'https://m.media-amazon.com/images/M/MV5BMTcxODgwMDkxNV5BMl5BanBnXkFtZTYwMDk2MDg3._V1_UX182_CR0,0,182,268_AL_.jpg', 2002),
(17, 'Harry Potter y el prisionero de Azkaban', 'fantasia', '142', 'Harry Potter, Ron y Hermione regresan a la Escuela de BrujerÃ­a y HechicerÃ­a de Hogwarts para su tercer aÃ±o de estudio, donde profundizan en el misterio que rodea a un prisionero fugitivo que representa una amenaza peligrosa para el joven mago', 7.9, 'https://m.media-amazon.com/images/M/MV5BMTY4NTIwODg0N15BMl5BanBnXkFtZTcwOTc0MjEzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2004),
(19, 'Harry Potter y la orden del FÃ©nix', 'fantasia', '138', 'Con su advertencia sobre el regreso de Lord Voldemort (Ralph Fiennes) burlado, Harry (Daniel Radcliffe) y Dumbledore (Sir Michael Gambon) son atacados por las autoridades del Mago mientras un burÃ³crata autoritario toma lentamente el poder en Hogwart', 7.5, 'https://m.media-amazon.com/images/M/MV5BMTM0NTczMTUzOV5BMl5BanBnXkFtZTYwMzIxNTg3._V1_UX182_CR0,0,182,268_AL_.jpg', 2007),
(20, 'Harry Potter y el misterio del prÃ­ncipe', 'fantasia', '153', 'Cuando Harry Potter (Daniel Radcliffe) comienza su sexto aÃ±o en Hogwarts, descubre un viejo libro marcado como \"propiedad del PrÃ­ncipe Mestizo\" y comienza a aprender mÃ¡s sobre el oscuro pasado de Lord Voldemort (Ralph Fiennes)', 7.6, 'https://m.media-amazon.com/images/M/MV5BNzU3NDg4NTAyNV5BMl5BanBnXkFtZTcwOTg2ODg1Mg@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2009),
(21, 'Harry Potter y las reliquias de la muerte - Parte 1', 'fantasia', '146', 'Mientras Harry (Daniel Radcliffe), Ron (Rupert Grint) y Hermione (Emma Watson) compiten contra el tiempo y el mal para destruir los Horrocruxes, descubren la existencia de los tres objetos mÃ¡s poderosos del mundo mÃ¡gico: las Reliquias de la Muerte', 7.7, 'https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2010),
(22, 'Harry Potter y las reliquias de la muerte - Parte 2', 'fantasia', '130', '149/5000\r\nHarry, Ron y Hermione buscan los Horrocruxes restantes de Voldemort en su esfuerzo por destruir al SeÃ±or Oscuro mientras la batalla final continÃºa en Hogwarts.', 8.1, 'https://m.media-amazon.com/images/M/MV5BMjIyZGU4YzUtNDkzYi00ZDRhLTljYzctYTMxMDQ4M2E0Y2YxXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_UX182_CR0,0,182,268_AL_.jpg', 2011),
(23, 'Animales fantÃ¡sticos y dÃ³nde encontrarlos', 'fantasia', '132', 'Las aventuras del escritor Newt Scamander en la comunidad secreta de brujas y magos de Nueva York setenta aÃ±os antes de que Harry Potter lea su libro en la escuela', 7.3, 'https://m.media-amazon.com/images/M/MV5BMjMxOTM1OTI4MV5BMl5BanBnXkFtZTgwODE5OTYxMDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 2016),
(24, 'Animales fantÃ¡sticos: los crÃ­menes de Grindelwald', 'fantasia', '134', 'La segunda entrega de la serie ', 6.6, 'https://m.media-amazon.com/images/M/MV5BYWVlMDI5N2UtZTIyMC00NjZkLWI5Y2QtODM5NGE5MzA0NmVjXkEyXkFqcGdeQXVyNzU3NjUxMzE@._V1_UX182_CR0,0,182,268_AL_.jpg', 2018),
(25, 'DeberÃ­as haberte ido', 'terror', '93', 'Un ex banquero, su esposa actriz y su enÃ©rgica hija reservan unas vacaciones en una casa moderna y aislada en el campo de Gales, donde nada es lo que parece', 5.3, 'https://m.media-amazon.com/images/M/MV5BYTMxMTJhNWQtYzQwMC00MThhLTkzNjMtMDljMGE1MmE1NWM2XkEyXkFqcGdeQXVyODkxMzcxOTY@._V1_UX182_CR0,0,182,268_AL_.jpg', 2020),
(26, 'El albergue', 'terror', '108', 'Una futura madrastra estÃ¡ nevada con los dos hijos de su prometido en un remoto pueblo de vacaciones. Justo cuando las relaciones comienzan a descongelarse entre el trÃ­o, ocurren algunos eventos extraÃ±os y aterradores', 6, 'https://m.media-amazon.com/images/M/MV5BNDQ2YWVmZjEtMTE1ZS00MDk1LTg5ODUtMDVlODk0OTM2ODMwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2019),
(27, 'Te veo', 'terror', '98', 'ExtraÃ±os sucesos plagan a un detective de un pueblo pequeÃ±o y a su familia mientras investiga la desapariciÃ³n de un niÃ±o', 6.8, 'https://m.media-amazon.com/images/M/MV5BNzVkOWM5YTEtMDdkNi00YjMzLWEzNWEtODEwN2IyZTc4Yjg2XkEyXkFqcGdeQXVyMjc5MTg0MzQ@._V1_UX182_CR0,0,182,268_AL_.jpg', 2019),
(28, 'El hoyo', 'terror', '94', 'Una prisiÃ³n vertical con una celda por nivel. Dos personas por celda. Una sola plataforma de alimentos y dos minutos por dÃ­a para alimentar de arriba a abajo. Una pesadilla interminable atrapada en The Hole', 7, 'https://m.media-amazon.com/images/M/MV5BOTMyYTIyM2MtNjQ2ZC00MWFkLThhYjQtMjhjMGZiMjgwYjM2XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2019),
(29, 'IT CÃ¡pitulo 2', 'terror', '169', 'Veintisiete aÃ±os despuÃ©s de su primer encuentro con el aterrador Pennywise, el Club de Perdedores creciÃ³ y se alejÃ³, hasta que una llamada telefÃ³nica devastadora los trajo de vuelta', 6.6, 'https://m.media-amazon.com/images/M/MV5BYTJlNjlkZTktNjEwOS00NzI5LTlkNDAtZmEwZDFmYmM2MjU2XkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_UX182_CR0,0,182,268_AL_.jpg', 2019),
(30, 'HUYE', 'terror', '104', 'Un joven afroamericano visita a los padres de su novia blanca durante el fin de semana, donde su inquietud a causa de su recepciÃ³n llega a un punto de ebulliciÃ³n.', 7.7, 'https://m.media-amazon.com/images/M/MV5BMjUxMDQwNjcyNl5BMl5BanBnXkFtZTgwNzcwMzc0MTI@._V1_UX182_CR0,0,182,268_AL_.jpg', 2017),
(31, 'La miserable', 'terror', '96', 'Un adolescente desafiante, luchando con el inminente divorcio de sus padres, se enfrenta a una bruja de mil aÃ±os, que vive bajo la piel y se hace pasar por la mujer de al lado', 5.8, 'https://m.media-amazon.com/images/M/MV5BMmE2MjM0YmUtMzAxNC00NDdiLWE1ZTQtMzMyMmQ4MmVkMjIyXkEyXkFqcGdeQXVyNTIyODMzMzA@._V1_UX182_CR0,0,182,268_AL_.jpg', 2020),
(32, 'IT ', 'terror', '135', 'En el verano de 1989, un grupo de niÃ±os acosados se unen para destruir a un monstruo que cambia de forma, que se disfraza de payaso y se aprovecha de los niÃ±os de Derry, su pequeÃ±o pueblo de Maine', 7.3, 'https://m.media-amazon.com/images/M/MV5BZDVkZmI0YzAtNzdjYi00ZjhhLWE1ODEtMWMzMWMzNDA0NmQ4XkEyXkFqcGdeQXVyNzYzODM3Mzg@._V1_UX182_CR0,0,182,268_AL_.jpg', 2017),
(33, 'Un lugar tranquilo Parte II', 'terror', '97', 'DespuÃ©s de los eventos en casa, la familia Abbott ahora enfrenta los terrores del mundo exterior. Forzados a aventurarse en lo desconocido, se dan cuenta de que las criaturas que cazan por el sonido no son las Ãºnicas amenazas que acechan mÃ¡s allÃ¡', 8.4, 'https://m.media-amazon.com/images/M/MV5BMmE3OGY2NzMtMGJmOS00NGViLWI4NjYtMjhlNTMxZjA5MDExXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2020),
(34, 'El brillante', 'terror', '146', 'Una familia se dirige a un hotel aislado para pasar el invierno, donde una presencia siniestra influye en la violencia del padre, mientras que su hijo psÃ­quico ve terribles presentimientos del pasado y del futuro', 8.4, 'https://m.media-amazon.com/images/M/MV5BZWFlYmY2MGEtZjVkYS00YzU4LTg0YjQtYzY1ZGE3NTA5NGQxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg', 1980),
(37, 'Capitan America: Civil War', 'accion', '147', 'La participaciÃ³n polÃ­tica en los asuntos de los Vengadores causa una brecha entre el CapitÃ¡n AmÃ©rica y Iron Man', 7.8, 'https://m.media-amazon.com/images/M/MV5BMjQ0MTgyNjAxMV5BMl5BanBnXkFtZTgwNjUzMDkyODE@._V1_UY190_CR0,0,128,190_AL_.jpg', 2016),
(38, 'Los Vengadores: La era de Ultron', 'accion', '141', 'Cuando Tony Stark y Bruce Banner intentan poner en marcha un programa inactivo de mantenimiento de la paz llamado Ultron, las cosas van terriblemente mal y depende de los hÃ©roes mÃ¡s poderosos de la Tierra evitar que el villano Ultron ejecute su ter', 7.3, 'https://m.media-amazon.com/images/M/MV5BMTM4OGJmNWMtOTM4Ni00NTE3LTg3MDItZmQxYjc4N2JhNmUxXkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_UX182_CR0,0,182,268_AL_.jpg', 2015),
(40, 'CapitÃ¡n AmÃ©rica: El Soldado del Invierno', 'accion', '136', 'Mientras Steve Rogers lucha por asumir su papel en el mundo moderno, se une a un compaÃ±ero de Avenger y agente de S.H.I.E.L.D, Black Widow, para luchar contra una nueva amenaza de la historia: un asesino conocido como el Soldado de Invierno', 7.7, 'https://m.media-amazon.com/images/M/MV5BMzA2NDkwODAwM15BMl5BanBnXkFtZTgwODk5MTgzMTE@._V1_UY268_CR1,0,182,268_AL_.jpg', 2014),
(41, 'CapitÃ¡n AmÃ©rica: El primer vengador', 'accion', '124', 'Steve Rogers, un soldado militar rechazado, se transforma en el CapitÃ¡n AmÃ©rica despuÃ©s de tomar una dosis de un ', 6.9, 'https://m.media-amazon.com/images/M/MV5BMTYzOTc2NzU3N15BMl5BanBnXkFtZTcwNjY3MDE3NQ@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2011),
(42, 'Avengers: Endgame', 'accion', '181', 'DespuÃ©s de los devastadores eventos de Avengers: Infinity War (2018), el universo estÃ¡ en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reÃºnen una vez mÃ¡s para revertir las acciones de Thanos y restablecer el equilibrio en el u', 8.4, 'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_UX182_CR0,0,182,268_AL_.jpg', 2019),
(43, 'Avengers: Infinity War ', 'accion', '149', 'Los Vengadores y sus aliados deben estar dispuestos a sacrificar todo en un intento de derrotar al poderoso Thanos antes de que su bombardeo de devastaciÃ³n y ruina ponga fin al universo.', 8.4, 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_UX182_CR0,0,182,268_AL_.jpg', 2018),
(44, 'Batman: El caballero de la noche asciende', 'accion', '164', 'Ocho aÃ±os despuÃ©s del reinado de anarquÃ­a del Joker, Batman, con la ayuda de la enigmÃ¡tica Catwoman, se ve obligado a abandonar su exilio para salvar a Gotham City del brutal terrorista guerrillero Bane', 8.4, 'https://m.media-amazon.com/images/M/MV5BMTk4ODQzNDY3Ml5BMl5BanBnXkFtZTcwODA0NTM4Nw@@._V1_UX182_CR0,0,182,268_AL_.jpg', 2012),
(45, ' Batman Begins', 'accion', '140', 'DespuÃ©s de entrenar con su mentor, Batman comienza su lucha para liberar a la ciudad de Gotham de la corrupciÃ³n.', 8.2, 'https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_UY268_CR9,0,182,268_AL_.jpg', 2005);

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
(4, 'fabri', 'Colavella', 'colavella62@gmail.com', '35f38d4214693c4bb7176370275c0efe590b2baa', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_movies`
--

DROP TABLE IF EXISTS `usuarios_movies`;
CREATE TABLE `usuarios_movies` (
  `id_usuario` int(11) NOT NULL,
  `id_pelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios_movies`
--

INSERT INTO `usuarios_movies` (`id_usuario`, `id_pelicula`) VALUES
(1, 2),
(4, 23),
(2, 16),
(1, 22),
(1, 24),
(2, 31),
(2, 23),
(2, 21),
(2, 19),
(2, 17),
(2, 20),
(2, 33),
(2, 29);

--
-- Índices para tablas volcadas
--

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
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_pelicula` (`id_pelicula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `grupos`
--
ALTER TABLE `grupos`
  MODIFY `id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `usuarios_movies_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuarios_movies_ibfk_2` FOREIGN KEY (`id_pelicula`) REFERENCES `movies` (`id_pelicula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
