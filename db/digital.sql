-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Авг 22 2020 г., 22:53
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `digital`
--

-- --------------------------------------------------------

--
-- Структура таблицы `table1`
--

CREATE TABLE IF NOT EXISTS `table1` (
  `ID` int(11) NOT NULL,
  `ObjectName` text NOT NULL,
  `SnapshotPath` text NOT NULL,
  `SnapshotTime` datetime NOT NULL,
  `Result` int(11) NOT NULL,
  `Sensibility` text NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `table1`
--

INSERT INTO `table1` (`ID`, `ObjectName`, `SnapshotPath`, `SnapshotTime`, `Result`, `Sensibility`) VALUES
(1, 'Датчик температуры', 'shot/1.png', '2020-08-21 22:43:01', 83, '90%'),
(2, 'Разъединитель', 'shot/2.png', '2020-08-21 20:33:53', 0, '78%'),
(3, 'Индикатор цвета', 'shot/3.png', '2020-08-22 03:36:21', 3, '91%'),
(4, 'Разъединитель 2', 'shot/4.png', '2020-08-22 13:26:55', 1, '82%'),
(5, 'Разъединитель 3', 'shot/5.png', '2020-08-22 18:30:30', 0, '66%'),
(6, 'Разъединитель 4', 'shot/6.png', '2020-08-22 10:28:19', 1, '71%');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
