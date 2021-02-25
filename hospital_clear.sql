-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 27, 2020 at 03:58 PM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`id`, `name`, `comment`) VALUES
(1, 'add_own', 'Додавання своєї анкети'),
(2, 'del_own', 'Видалення своєї анкети'),
(3, 'update_own', 'Редагування своєї анкети'),
(4, 'view_own', 'Перегляд своєї анкети'),
(5, 'add_other', 'Додавання чужої анкети'),
(6, 'del_other', 'Видалення чужої анкети'),
(7, 'update_other', 'Редагування чужої анкети'),
(8, 'view_other', 'Перегляд чужої анкети'),
(9, 'view_profil_user', 'Перегляд чужого особистого кабінету');

-- --------------------------------------------------------

--
-- Table structure for table `action_role`
--

CREATE TABLE `action_role` (
  `role_id` int NOT NULL,
  `action_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `action_role`
--

INSERT INTO `action_role` (`role_id`, `action_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(2, 2),
(3, 2),
(4, 2),
(2, 3),
(3, 3),
(4, 3),
(2, 4),
(3, 4),
(4, 4),
(4, 5),
(3, 6),
(4, 6),
(4, 7),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(3, 9),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `anketas`
--

CREATE TABLE `anketas` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `type_id` int NOT NULL,
  `age` int DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  `city_id` int NOT NULL,
  `address` varchar(200) NOT NULL,
  `about_me` text,
  `education_id` int NOT NULL,
  `diplom_code` int NOT NULL,
  `experience_id` int NOT NULL,
  `price_1h_office` int DEFAULT NULL,
  `price_1h_challenge` int DEFAULT NULL,
  `photo_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `anketa_metro`
--

CREATE TABLE `anketa_metro` (
  `anketa_id` int NOT NULL,
  `metro_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calendars`
--

CREATE TABLE `calendars` (
  `dt` date NOT NULL,
  `y` smallint DEFAULT NULL,
  `m` tinyint DEFAULT NULL,
  `d` tinyint DEFAULT NULL,
  `weekday_id` tinyint DEFAULT NULL,
  `w` tinyint DEFAULT NULL,
  `isHoliday` binary(1) DEFAULT NULL,
  `holidayDescr` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `calendars`
--

INSERT INTO `calendars` (`dt`, `y`, `m`, `d`, `weekday_id`, `w`, `isHoliday`, `holidayDescr`) VALUES
('2020-01-02', 2020, 1, 2, 4, 0, 0x30, ''),
('2020-01-03', 2020, 1, 3, 5, 0, 0x30, ''),
('2020-01-04', 2020, 1, 4, 6, 0, 0x30, ''),
('2020-01-05', 2020, 1, 5, 7, 1, 0x30, ''),
('2020-01-06', 2020, 1, 6, 1, 1, 0x30, ''),
('2020-01-07', 2020, 1, 7, 2, 1, 0x30, ''),
('2020-01-08', 2020, 1, 8, 3, 1, 0x30, ''),
('2020-01-09', 2020, 1, 9, 4, 1, 0x30, ''),
('2020-01-10', 2020, 1, 10, 5, 1, 0x30, ''),
('2020-01-11', 2020, 1, 11, 6, 1, 0x30, ''),
('2020-01-12', 2020, 1, 12, 7, 2, 0x30, ''),
('2020-01-13', 2020, 1, 13, 1, 2, 0x30, ''),
('2020-01-14', 2020, 1, 14, 2, 2, 0x30, ''),
('2020-01-15', 2020, 1, 15, 3, 2, 0x30, ''),
('2020-01-16', 2020, 1, 16, 4, 2, 0x30, ''),
('2020-01-17', 2020, 1, 17, 5, 2, 0x30, ''),
('2020-01-18', 2020, 1, 18, 6, 2, 0x30, ''),
('2020-01-19', 2020, 1, 19, 7, 3, 0x30, ''),
('2020-01-20', 2020, 1, 20, 1, 3, 0x30, ''),
('2020-01-21', 2020, 1, 21, 2, 3, 0x30, ''),
('2020-01-22', 2020, 1, 22, 3, 3, 0x30, ''),
('2020-01-23', 2020, 1, 23, 4, 3, 0x30, ''),
('2020-01-24', 2020, 1, 24, 5, 3, 0x30, ''),
('2020-01-25', 2020, 1, 25, 6, 3, 0x30, ''),
('2020-01-26', 2020, 1, 26, 7, 4, 0x30, ''),
('2020-01-27', 2020, 1, 27, 1, 4, 0x30, ''),
('2020-01-28', 2020, 1, 28, 2, 4, 0x30, ''),
('2020-01-29', 2020, 1, 29, 3, 4, 0x30, ''),
('2020-01-30', 2020, 1, 30, 4, 4, 0x30, ''),
('2020-01-31', 2020, 1, 31, 5, 4, 0x30, ''),
('2020-02-01', 2020, 2, 1, 6, 4, 0x30, ''),
('2020-02-02', 2020, 2, 2, 7, 5, 0x30, ''),
('2020-02-03', 2020, 2, 3, 1, 5, 0x30, ''),
('2020-02-04', 2020, 2, 4, 2, 5, 0x30, ''),
('2020-02-05', 2020, 2, 5, 3, 5, 0x30, ''),
('2020-02-06', 2020, 2, 6, 4, 5, 0x30, ''),
('2020-02-07', 2020, 2, 7, 5, 5, 0x30, ''),
('2020-02-08', 2020, 2, 8, 6, 5, 0x30, ''),
('2020-02-09', 2020, 2, 9, 7, 6, 0x30, ''),
('2020-02-10', 2020, 2, 10, 1, 6, 0x30, ''),
('2020-02-11', 2020, 2, 11, 2, 6, 0x30, ''),
('2020-02-12', 2020, 2, 12, 3, 6, 0x30, ''),
('2020-02-13', 2020, 2, 13, 4, 6, 0x30, ''),
('2020-02-14', 2020, 2, 14, 5, 6, 0x30, ''),
('2020-02-15', 2020, 2, 15, 6, 6, 0x30, ''),
('2020-02-16', 2020, 2, 16, 7, 7, 0x30, ''),
('2020-02-17', 2020, 2, 17, 1, 7, 0x30, ''),
('2020-02-18', 2020, 2, 18, 2, 7, 0x30, ''),
('2020-02-19', 2020, 2, 19, 3, 7, 0x30, ''),
('2020-02-20', 2020, 2, 20, 4, 7, 0x30, ''),
('2020-02-21', 2020, 2, 21, 5, 7, 0x30, ''),
('2020-02-22', 2020, 2, 22, 6, 7, 0x30, ''),
('2020-02-23', 2020, 2, 23, 7, 8, 0x30, ''),
('2020-02-24', 2020, 2, 24, 1, 8, 0x30, ''),
('2020-02-25', 2020, 2, 25, 2, 8, 0x30, ''),
('2020-02-26', 2020, 2, 26, 3, 8, 0x30, ''),
('2020-02-27', 2020, 2, 27, 4, 8, 0x30, ''),
('2020-02-28', 2020, 2, 28, 5, 8, 0x30, ''),
('2020-02-29', 2020, 2, 29, 6, 8, 0x30, ''),
('2020-03-01', 2020, 3, 1, 7, 9, 0x30, ''),
('2020-03-02', 2020, 3, 2, 1, 9, 0x30, ''),
('2020-03-03', 2020, 3, 3, 2, 9, 0x30, ''),
('2020-03-04', 2020, 3, 4, 3, 9, 0x30, ''),
('2020-03-05', 2020, 3, 5, 4, 9, 0x30, ''),
('2020-03-06', 2020, 3, 6, 5, 9, 0x30, ''),
('2020-03-07', 2020, 3, 7, 6, 9, 0x30, ''),
('2020-03-08', 2020, 3, 8, 7, 10, 0x30, ''),
('2020-03-09', 2020, 3, 9, 1, 10, 0x30, ''),
('2020-03-10', 2020, 3, 10, 2, 10, 0x30, ''),
('2020-03-11', 2020, 3, 11, 3, 10, 0x30, ''),
('2020-03-12', 2020, 3, 12, 4, 10, 0x30, ''),
('2020-03-13', 2020, 3, 13, 5, 10, 0x30, ''),
('2020-03-14', 2020, 3, 14, 6, 10, 0x30, ''),
('2020-03-15', 2020, 3, 15, 7, 11, 0x30, ''),
('2020-03-16', 2020, 3, 16, 1, 11, 0x30, ''),
('2020-03-17', 2020, 3, 17, 2, 11, 0x30, ''),
('2020-03-18', 2020, 3, 18, 3, 11, 0x30, ''),
('2020-03-19', 2020, 3, 19, 4, 11, 0x30, ''),
('2020-03-20', 2020, 3, 20, 5, 11, 0x30, ''),
('2020-03-21', 2020, 3, 21, 6, 11, 0x30, ''),
('2020-03-22', 2020, 3, 22, 7, 12, 0x30, ''),
('2020-03-23', 2020, 3, 23, 1, 12, 0x30, ''),
('2020-03-24', 2020, 3, 24, 2, 12, 0x30, ''),
('2020-03-25', 2020, 3, 25, 3, 12, 0x30, ''),
('2020-03-26', 2020, 3, 26, 4, 12, 0x30, ''),
('2020-03-27', 2020, 3, 27, 5, 12, 0x30, ''),
('2020-03-28', 2020, 3, 28, 6, 12, 0x30, ''),
('2020-03-29', 2020, 3, 29, 7, 13, 0x30, ''),
('2020-03-30', 2020, 3, 30, 1, 13, 0x30, ''),
('2020-03-31', 2020, 3, 31, 2, 13, 0x30, ''),
('2020-04-01', 2020, 4, 1, 3, 13, 0x30, ''),
('2020-04-02', 2020, 4, 2, 4, 13, 0x30, ''),
('2020-04-03', 2020, 4, 3, 5, 13, 0x30, ''),
('2020-04-04', 2020, 4, 4, 6, 13, 0x30, ''),
('2020-04-05', 2020, 4, 5, 7, 14, 0x30, ''),
('2020-04-06', 2020, 4, 6, 1, 14, 0x30, ''),
('2020-04-07', 2020, 4, 7, 2, 14, 0x30, ''),
('2020-04-08', 2020, 4, 8, 3, 14, 0x30, ''),
('2020-04-09', 2020, 4, 9, 4, 14, 0x30, ''),
('2020-04-10', 2020, 4, 10, 5, 14, 0x30, ''),
('2020-04-11', 2020, 4, 11, 6, 14, 0x30, ''),
('2020-04-12', 2020, 4, 12, 7, 15, 0x30, ''),
('2020-04-13', 2020, 4, 13, 1, 15, 0x30, ''),
('2020-04-14', 2020, 4, 14, 2, 15, 0x30, ''),
('2020-04-15', 2020, 4, 15, 3, 15, 0x30, ''),
('2020-04-16', 2020, 4, 16, 4, 15, 0x30, ''),
('2020-04-17', 2020, 4, 17, 5, 15, 0x30, ''),
('2020-04-18', 2020, 4, 18, 6, 15, 0x30, ''),
('2020-04-19', 2020, 4, 19, 7, 16, 0x30, ''),
('2020-04-20', 2020, 4, 20, 1, 16, 0x30, ''),
('2020-04-21', 2020, 4, 21, 2, 16, 0x30, ''),
('2020-04-22', 2020, 4, 22, 3, 16, 0x30, ''),
('2020-04-23', 2020, 4, 23, 4, 16, 0x30, ''),
('2020-04-24', 2020, 4, 24, 5, 16, 0x30, ''),
('2020-04-25', 2020, 4, 25, 6, 16, 0x30, ''),
('2020-04-26', 2020, 4, 26, 7, 17, 0x30, ''),
('2020-04-27', 2020, 4, 27, 1, 17, 0x30, ''),
('2020-04-28', 2020, 4, 28, 2, 17, 0x30, ''),
('2020-04-29', 2020, 4, 29, 3, 17, 0x30, ''),
('2020-04-30', 2020, 4, 30, 4, 17, 0x30, ''),
('2020-05-01', 2020, 5, 1, 5, 17, 0x30, ''),
('2020-05-02', 2020, 5, 2, 6, 17, 0x30, ''),
('2020-05-03', 2020, 5, 3, 7, 18, 0x30, ''),
('2020-05-04', 2020, 5, 4, 1, 18, 0x30, ''),
('2020-05-05', 2020, 5, 5, 2, 18, 0x30, ''),
('2020-05-06', 2020, 5, 6, 3, 18, 0x30, ''),
('2020-05-07', 2020, 5, 7, 4, 18, 0x30, ''),
('2020-05-08', 2020, 5, 8, 5, 18, 0x30, ''),
('2020-05-09', 2020, 5, 9, 6, 18, 0x30, ''),
('2020-05-10', 2020, 5, 10, 7, 19, 0x30, ''),
('2020-05-11', 2020, 5, 11, 1, 19, 0x30, ''),
('2020-05-12', 2020, 5, 12, 2, 19, 0x30, ''),
('2020-05-13', 2020, 5, 13, 3, 19, 0x30, ''),
('2020-05-14', 2020, 5, 14, 4, 19, 0x30, ''),
('2020-05-15', 2020, 5, 15, 5, 19, 0x30, ''),
('2020-05-16', 2020, 5, 16, 6, 19, 0x30, ''),
('2020-05-17', 2020, 5, 17, 7, 20, 0x30, ''),
('2020-05-18', 2020, 5, 18, 1, 20, 0x30, ''),
('2020-05-19', 2020, 5, 19, 2, 20, 0x30, ''),
('2020-05-20', 2020, 5, 20, 3, 20, 0x30, ''),
('2020-05-21', 2020, 5, 21, 4, 20, 0x30, ''),
('2020-05-22', 2020, 5, 22, 5, 20, 0x30, ''),
('2020-05-23', 2020, 5, 23, 6, 20, 0x30, ''),
('2020-05-24', 2020, 5, 24, 7, 21, 0x30, ''),
('2020-05-25', 2020, 5, 25, 1, 21, 0x30, ''),
('2020-05-26', 2020, 5, 26, 2, 21, 0x30, ''),
('2020-05-27', 2020, 5, 27, 3, 21, 0x30, ''),
('2020-05-28', 2020, 5, 28, 4, 21, 0x30, ''),
('2020-05-29', 2020, 5, 29, 5, 21, 0x30, ''),
('2020-05-30', 2020, 5, 30, 6, 21, 0x30, ''),
('2020-05-31', 2020, 5, 31, 7, 22, 0x30, ''),
('2020-06-01', 2020, 6, 1, 1, 22, 0x30, ''),
('2020-06-02', 2020, 6, 2, 2, 22, 0x30, ''),
('2020-06-03', 2020, 6, 3, 3, 22, 0x30, ''),
('2020-06-04', 2020, 6, 4, 4, 22, 0x30, ''),
('2020-06-05', 2020, 6, 5, 5, 22, 0x30, ''),
('2020-06-06', 2020, 6, 6, 6, 22, 0x30, ''),
('2020-06-07', 2020, 6, 7, 7, 23, 0x30, ''),
('2020-06-08', 2020, 6, 8, 1, 23, 0x30, ''),
('2020-06-09', 2020, 6, 9, 2, 23, 0x30, ''),
('2020-06-10', 2020, 6, 10, 3, 23, 0x30, ''),
('2020-06-11', 2020, 6, 11, 4, 23, 0x30, ''),
('2020-06-12', 2020, 6, 12, 5, 23, 0x30, ''),
('2020-06-13', 2020, 6, 13, 6, 23, 0x30, ''),
('2020-06-14', 2020, 6, 14, 7, 24, 0x30, ''),
('2020-06-15', 2020, 6, 15, 1, 24, 0x30, ''),
('2020-06-16', 2020, 6, 16, 2, 24, 0x30, ''),
('2020-06-17', 2020, 6, 17, 3, 24, 0x30, ''),
('2020-06-18', 2020, 6, 18, 4, 24, 0x30, ''),
('2020-06-19', 2020, 6, 19, 5, 24, 0x30, ''),
('2020-06-20', 2020, 6, 20, 6, 24, 0x30, ''),
('2020-06-21', 2020, 6, 21, 7, 25, 0x30, ''),
('2020-06-22', 2020, 6, 22, 1, 25, 0x30, ''),
('2020-06-23', 2020, 6, 23, 2, 25, 0x30, ''),
('2020-06-24', 2020, 6, 24, 3, 25, 0x30, ''),
('2020-06-25', 2020, 6, 25, 4, 25, 0x30, ''),
('2020-06-26', 2020, 6, 26, 5, 25, 0x30, ''),
('2020-06-27', 2020, 6, 27, 6, 25, 0x30, ''),
('2020-06-28', 2020, 6, 28, 7, 26, 0x30, ''),
('2020-06-29', 2020, 6, 29, 1, 26, 0x30, ''),
('2020-06-30', 2020, 6, 30, 2, 26, 0x30, ''),
('2020-07-01', 2020, 7, 1, 3, 26, 0x30, ''),
('2020-07-02', 2020, 7, 2, 4, 26, 0x30, ''),
('2020-07-03', 2020, 7, 3, 5, 26, 0x30, ''),
('2020-07-04', 2020, 7, 4, 6, 26, 0x30, ''),
('2020-07-05', 2020, 7, 5, 7, 27, 0x30, ''),
('2020-07-06', 2020, 7, 6, 1, 27, 0x30, ''),
('2020-07-07', 2020, 7, 7, 2, 27, 0x30, ''),
('2020-07-08', 2020, 7, 8, 3, 27, 0x30, ''),
('2020-07-09', 2020, 7, 9, 4, 27, 0x30, ''),
('2020-07-10', 2020, 7, 10, 5, 27, 0x30, ''),
('2020-07-11', 2020, 7, 11, 6, 27, 0x30, ''),
('2020-07-12', 2020, 7, 12, 7, 28, 0x30, ''),
('2020-07-13', 2020, 7, 13, 1, 28, 0x30, ''),
('2020-07-14', 2020, 7, 14, 2, 28, 0x30, ''),
('2020-07-15', 2020, 7, 15, 3, 28, 0x30, ''),
('2020-07-16', 2020, 7, 16, 4, 28, 0x30, ''),
('2020-07-17', 2020, 7, 17, 5, 28, 0x30, ''),
('2020-07-18', 2020, 7, 18, 6, 28, 0x30, ''),
('2020-07-19', 2020, 7, 19, 7, 29, 0x30, ''),
('2020-07-20', 2020, 7, 20, 1, 29, 0x30, ''),
('2020-07-21', 2020, 7, 21, 2, 29, 0x30, ''),
('2020-07-22', 2020, 7, 22, 3, 29, 0x30, ''),
('2020-07-23', 2020, 7, 23, 4, 29, 0x30, ''),
('2020-07-24', 2020, 7, 24, 5, 29, 0x30, ''),
('2020-07-25', 2020, 7, 25, 6, 29, 0x30, ''),
('2020-07-26', 2020, 7, 26, 7, 30, 0x30, ''),
('2020-07-27', 2020, 7, 27, 1, 30, 0x30, ''),
('2020-07-28', 2020, 7, 28, 2, 30, 0x30, ''),
('2020-07-29', 2020, 7, 29, 3, 30, 0x30, ''),
('2020-07-30', 2020, 7, 30, 4, 30, 0x30, ''),
('2020-07-31', 2020, 7, 31, 5, 30, 0x30, ''),
('2020-08-01', 2020, 8, 1, 6, 30, 0x30, ''),
('2020-08-02', 2020, 8, 2, 7, 31, 0x30, ''),
('2020-08-03', 2020, 8, 3, 1, 31, 0x30, ''),
('2020-08-04', 2020, 8, 4, 2, 31, 0x30, ''),
('2020-08-05', 2020, 8, 5, 3, 31, 0x30, ''),
('2020-08-06', 2020, 8, 6, 4, 31, 0x30, ''),
('2020-08-07', 2020, 8, 7, 5, 31, 0x30, ''),
('2020-08-08', 2020, 8, 8, 6, 31, 0x30, ''),
('2020-08-09', 2020, 8, 9, 7, 32, 0x30, ''),
('2020-08-10', 2020, 8, 10, 1, 32, 0x30, ''),
('2020-08-11', 2020, 8, 11, 2, 32, 0x30, ''),
('2020-08-12', 2020, 8, 12, 3, 32, 0x30, ''),
('2020-08-13', 2020, 8, 13, 4, 32, 0x30, ''),
('2020-08-14', 2020, 8, 14, 5, 32, 0x30, ''),
('2020-08-15', 2020, 8, 15, 6, 32, 0x30, ''),
('2020-08-16', 2020, 8, 16, 7, 33, 0x30, ''),
('2020-08-17', 2020, 8, 17, 1, 33, 0x30, ''),
('2020-08-18', 2020, 8, 18, 2, 33, 0x30, ''),
('2020-08-19', 2020, 8, 19, 3, 33, 0x30, ''),
('2020-08-20', 2020, 8, 20, 4, 33, 0x30, ''),
('2020-08-21', 2020, 8, 21, 5, 33, 0x30, ''),
('2020-08-22', 2020, 8, 22, 6, 33, 0x30, ''),
('2020-08-23', 2020, 8, 23, 7, 34, 0x30, ''),
('2020-08-24', 2020, 8, 24, 1, 34, 0x30, ''),
('2020-08-25', 2020, 8, 25, 2, 34, 0x30, ''),
('2020-08-26', 2020, 8, 26, 3, 34, 0x30, ''),
('2020-08-27', 2020, 8, 27, 4, 34, 0x30, ''),
('2020-08-28', 2020, 8, 28, 5, 34, 0x30, ''),
('2020-08-29', 2020, 8, 29, 6, 34, 0x30, ''),
('2020-08-30', 2020, 8, 30, 7, 35, 0x30, ''),
('2020-08-31', 2020, 8, 31, 1, 35, 0x30, ''),
('2020-09-01', 2020, 9, 1, 2, 35, 0x30, ''),
('2020-09-02', 2020, 9, 2, 3, 35, 0x30, ''),
('2020-09-03', 2020, 9, 3, 4, 35, 0x30, ''),
('2020-09-04', 2020, 9, 4, 5, 35, 0x30, ''),
('2020-09-05', 2020, 9, 5, 6, 35, 0x30, ''),
('2020-09-06', 2020, 9, 6, 7, 36, 0x30, ''),
('2020-09-07', 2020, 9, 7, 1, 36, 0x30, ''),
('2020-09-08', 2020, 9, 8, 2, 36, 0x30, ''),
('2020-09-09', 2020, 9, 9, 3, 36, 0x30, ''),
('2020-09-10', 2020, 9, 10, 4, 36, 0x30, ''),
('2020-09-11', 2020, 9, 11, 5, 36, 0x30, ''),
('2020-09-12', 2020, 9, 12, 6, 36, 0x30, ''),
('2020-09-13', 2020, 9, 13, 7, 37, 0x30, ''),
('2020-09-14', 2020, 9, 14, 1, 37, 0x30, ''),
('2020-09-15', 2020, 9, 15, 2, 37, 0x30, ''),
('2020-09-16', 2020, 9, 16, 3, 37, 0x30, ''),
('2020-09-17', 2020, 9, 17, 4, 37, 0x30, ''),
('2020-09-18', 2020, 9, 18, 5, 37, 0x30, ''),
('2020-09-19', 2020, 9, 19, 6, 37, 0x30, ''),
('2020-09-20', 2020, 9, 20, 7, 38, 0x30, ''),
('2020-09-21', 2020, 9, 21, 1, 38, 0x30, ''),
('2020-09-22', 2020, 9, 22, 2, 38, 0x30, ''),
('2020-09-23', 2020, 9, 23, 3, 38, 0x30, ''),
('2020-09-24', 2020, 9, 24, 4, 38, 0x30, ''),
('2020-09-25', 2020, 9, 25, 5, 38, 0x30, ''),
('2020-09-26', 2020, 9, 26, 6, 38, 0x30, ''),
('2020-09-27', 2020, 9, 27, 7, 39, 0x30, ''),
('2020-09-28', 2020, 9, 28, 1, 39, 0x30, ''),
('2020-09-29', 2020, 9, 29, 2, 39, 0x30, ''),
('2020-09-30', 2020, 9, 30, 3, 39, 0x30, ''),
('2020-10-01', 2020, 10, 1, 4, 39, 0x30, ''),
('2020-10-02', 2020, 10, 2, 5, 39, 0x30, ''),
('2020-10-03', 2020, 10, 3, 6, 39, 0x30, ''),
('2020-10-04', 2020, 10, 4, 7, 40, 0x30, ''),
('2020-10-05', 2020, 10, 5, 1, 40, 0x30, ''),
('2020-10-06', 2020, 10, 6, 2, 40, 0x30, ''),
('2020-10-07', 2020, 10, 7, 3, 40, 0x30, ''),
('2020-10-08', 2020, 10, 8, 4, 40, 0x30, ''),
('2020-10-09', 2020, 10, 9, 5, 40, 0x30, ''),
('2020-10-10', 2020, 10, 10, 6, 40, 0x30, ''),
('2020-10-11', 2020, 10, 11, 7, 41, 0x30, ''),
('2020-10-12', 2020, 10, 12, 1, 41, 0x30, ''),
('2020-10-13', 2020, 10, 13, 2, 41, 0x30, ''),
('2020-10-14', 2020, 10, 14, 3, 41, 0x30, ''),
('2020-10-15', 2020, 10, 15, 4, 41, 0x30, ''),
('2020-10-16', 2020, 10, 16, 5, 41, 0x30, ''),
('2020-10-17', 2020, 10, 17, 6, 41, 0x30, ''),
('2020-10-18', 2020, 10, 18, 7, 42, 0x30, ''),
('2020-10-19', 2020, 10, 19, 1, 42, 0x30, ''),
('2020-10-20', 2020, 10, 20, 2, 42, 0x30, ''),
('2020-10-21', 2020, 10, 21, 3, 42, 0x30, ''),
('2020-10-22', 2020, 10, 22, 4, 42, 0x30, ''),
('2020-10-23', 2020, 10, 23, 5, 42, 0x30, ''),
('2020-10-24', 2020, 10, 24, 6, 42, 0x30, ''),
('2020-10-25', 2020, 10, 25, 7, 43, 0x30, ''),
('2020-10-26', 2020, 10, 26, 1, 43, 0x30, ''),
('2020-10-27', 2020, 10, 27, 2, 43, 0x30, ''),
('2020-10-28', 2020, 10, 28, 3, 43, 0x30, ''),
('2020-10-29', 2020, 10, 29, 4, 43, 0x30, ''),
('2020-10-30', 2020, 10, 30, 5, 43, 0x30, ''),
('2020-10-31', 2020, 10, 31, 6, 43, 0x30, ''),
('2020-11-01', 2020, 11, 1, 7, 44, 0x30, ''),
('2020-11-02', 2020, 11, 2, 1, 44, 0x30, ''),
('2020-11-03', 2020, 11, 3, 2, 44, 0x30, ''),
('2020-11-04', 2020, 11, 4, 3, 44, 0x30, ''),
('2020-11-05', 2020, 11, 5, 4, 44, 0x30, ''),
('2020-11-06', 2020, 11, 6, 5, 44, 0x30, ''),
('2020-11-07', 2020, 11, 7, 6, 44, 0x30, ''),
('2020-11-08', 2020, 11, 8, 7, 45, 0x30, ''),
('2020-11-09', 2020, 11, 9, 1, 45, 0x30, ''),
('2020-11-10', 2020, 11, 10, 2, 45, 0x30, ''),
('2020-11-11', 2020, 11, 11, 3, 45, 0x30, ''),
('2020-11-12', 2020, 11, 12, 4, 45, 0x30, ''),
('2020-11-13', 2020, 11, 13, 5, 45, 0x30, ''),
('2020-11-14', 2020, 11, 14, 6, 45, 0x30, ''),
('2020-11-15', 2020, 11, 15, 7, 46, 0x30, ''),
('2020-11-16', 2020, 11, 16, 1, 46, 0x30, ''),
('2020-11-17', 2020, 11, 17, 2, 46, 0x30, ''),
('2020-11-18', 2020, 11, 18, 3, 46, 0x30, ''),
('2020-11-19', 2020, 11, 19, 4, 46, 0x30, ''),
('2020-11-20', 2020, 11, 20, 5, 46, 0x30, ''),
('2020-11-21', 2020, 11, 21, 6, 46, 0x30, ''),
('2020-11-22', 2020, 11, 22, 7, 47, 0x30, ''),
('2020-11-23', 2020, 11, 23, 1, 47, 0x30, ''),
('2020-11-24', 2020, 11, 24, 2, 47, 0x30, ''),
('2020-11-25', 2020, 11, 25, 3, 47, 0x30, ''),
('2020-11-26', 2020, 11, 26, 4, 47, 0x30, ''),
('2020-11-27', 2020, 11, 27, 5, 47, 0x30, ''),
('2020-11-28', 2020, 11, 28, 6, 47, 0x30, ''),
('2020-11-29', 2020, 11, 29, 7, 48, 0x30, ''),
('2020-11-30', 2020, 11, 30, 1, 48, 0x30, ''),
('2020-12-01', 2020, 12, 1, 2, 48, 0x30, ''),
('2020-12-02', 2020, 12, 2, 3, 48, 0x30, ''),
('2020-12-03', 2020, 12, 3, 4, 48, 0x30, ''),
('2020-12-04', 2020, 12, 4, 5, 48, 0x30, ''),
('2020-12-05', 2020, 12, 5, 6, 48, 0x30, ''),
('2020-12-06', 2020, 12, 6, 7, 49, 0x30, ''),
('2020-12-07', 2020, 12, 7, 1, 49, 0x30, ''),
('2020-12-08', 2020, 12, 8, 2, 49, 0x30, ''),
('2020-12-09', 2020, 12, 9, 3, 49, 0x30, ''),
('2020-12-10', 2020, 12, 10, 4, 49, 0x30, ''),
('2020-12-11', 2020, 12, 11, 5, 49, 0x30, ''),
('2020-12-12', 2020, 12, 12, 6, 49, 0x30, ''),
('2020-12-13', 2020, 12, 13, 7, 50, 0x30, ''),
('2020-12-14', 2020, 12, 14, 1, 50, 0x30, ''),
('2020-12-15', 2020, 12, 15, 2, 50, 0x30, ''),
('2020-12-16', 2020, 12, 16, 3, 50, 0x30, ''),
('2020-12-17', 2020, 12, 17, 4, 50, 0x30, ''),
('2020-12-18', 2020, 12, 18, 5, 50, 0x30, ''),
('2020-12-19', 2020, 12, 19, 6, 50, 0x30, ''),
('2020-12-20', 2020, 12, 20, 7, 51, 0x30, ''),
('2020-12-21', 2020, 12, 21, 1, 51, 0x30, ''),
('2020-12-22', 2020, 12, 22, 2, 51, 0x30, ''),
('2020-12-23', 2020, 12, 23, 3, 51, 0x30, ''),
('2020-12-24', 2020, 12, 24, 4, 51, 0x30, ''),
('2020-12-25', 2020, 12, 25, 5, 51, 0x30, ''),
('2020-12-26', 2020, 12, 26, 6, 51, 0x30, ''),
('2020-12-27', 2020, 12, 27, 7, 52, 0x30, ''),
('2020-12-28', 2020, 12, 28, 1, 52, 0x30, ''),
('2020-12-29', 2020, 12, 29, 2, 52, 0x30, ''),
('2020-12-30', 2020, 12, 30, 3, 52, 0x30, ''),
('2020-12-31', 2020, 12, 31, 4, 52, 0x30, ''),
('2021-01-01', 2021, 1, 1, 5, 0, 0x00, ''),
('2021-01-02', 2021, 1, 2, 6, 0, 0x00, ''),
('2021-01-03', 2021, 1, 3, 7, 0, 0x00, ''),
('2021-01-04', 2021, 1, 4, 1, 1, 0x00, ''),
('2021-01-05', 2021, 1, 5, 2, 1, 0x00, ''),
('2021-01-06', 2021, 1, 6, 3, 1, 0x00, ''),
('2021-01-07', 2021, 1, 7, 4, 1, 0x00, ''),
('2021-01-08', 2021, 1, 8, 5, 1, 0x00, ''),
('2021-01-09', 2021, 1, 9, 6, 1, 0x00, ''),
('2021-01-10', 2021, 1, 10, 7, 1, 0x00, ''),
('2021-01-11', 2021, 1, 11, 1, 2, 0x00, ''),
('2021-01-12', 2021, 1, 12, 2, 2, 0x00, ''),
('2021-01-13', 2021, 1, 13, 3, 2, 0x00, ''),
('2021-01-14', 2021, 1, 14, 4, 2, 0x00, ''),
('2021-01-15', 2021, 1, 15, 5, 2, 0x00, ''),
('2021-01-16', 2021, 1, 16, 6, 2, 0x00, '');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'Київ'),
(2, 'Харків'),
(3, 'Дніпро');

-- --------------------------------------------------------

--
-- Table structure for table `diploms`
--

CREATE TABLE `diploms` (
  `code` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diploms`
--

INSERT INTO `diploms` (`code`) VALUES
(1010),
(1111),
(2222),
(3333),
(4444),
(5555),
(6666),
(7777),
(8888),
(9999);

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `name`) VALUES
(1, 'Інтерн'),
(2, 'Медичне середнє'),
(3, 'Медичне вища'),
(4, 'Професійне');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `name`) VALUES
(1, 'Немає досвіду'),
(2, 'Менше року'),
(3, 'Більше року'),
(4, 'Більше 3 років'),
(5, 'Більше 5 років'),
(6, 'Більше 10 років');

-- --------------------------------------------------------

--
-- Table structure for table `metros`
--

CREATE TABLE `metros` (
  `id` int NOT NULL,
  `city_id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metros`
--

INSERT INTO `metros` (`id`, `city_id`, `name`) VALUES
(1, 1, 'Академмістечко'),
(2, 1, 'Житомирська'),
(3, 1, 'Святошин'),
(4, 1, 'Нивки'),
(5, 1, 'Берестейська'),
(6, 1, 'Шулявська'),
(7, 1, 'Політехнічний інститут'),
(8, 1, 'Вокзальна'),
(9, 1, 'Університет'),
(10, 1, 'Театральна'),
(11, 1, 'Хрещатик'),
(12, 1, 'Арсенальна'),
(13, 1, 'Дніпро'),
(14, 1, 'Гідропарк'),
(15, 1, 'Лівобережна'),
(16, 1, 'Дарниця'),
(17, 1, 'Чернігівська'),
(18, 1, 'Лісова'),
(19, 1, 'Героїв Дніпра'),
(20, 1, 'Мінська'),
(21, 1, 'Оболонь'),
(22, 1, 'Почайна'),
(23, 1, 'Тараса Шевченка'),
(24, 1, 'Контрактова площа'),
(25, 1, 'Поштова площа'),
(26, 1, 'Майдан Незалежності'),
(27, 1, 'Площа Льва Толстого'),
(28, 1, 'Олімпійська'),
(29, 1, 'Палац «Україна»'),
(30, 1, 'Либідська'),
(31, 1, 'Деміївська'),
(32, 1, 'Голосіївська'),
(33, 1, 'Васильківська'),
(34, 1, 'Виставковий центр'),
(35, 1, 'Іподром'),
(36, 1, 'Теремки'),
(37, 1, 'Сирець'),
(38, 1, 'Дорогожичі'),
(39, 1, 'Лук\'янівська'),
(40, 1, 'Золоті ворота'),
(41, 1, 'Палац спорту'),
(42, 1, 'Кловська'),
(43, 1, 'Печерська'),
(44, 1, 'Дружби народів'),
(45, 1, 'Видубичі'),
(46, 1, 'Славутич'),
(47, 1, 'Осокорки'),
(48, 1, 'Позняки'),
(49, 1, 'Харківська'),
(50, 1, 'Вирлиця'),
(51, 1, 'Бориспільська'),
(52, 1, 'Червоний хутір'),
(53, 2, 'Холодна гора'),
(54, 2, 'Південний вокзал'),
(55, 2, 'Центральний ринок'),
(56, 2, 'Майдан Конституції'),
(57, 2, 'Проспект Гагаріна'),
(58, 2, 'Спортивна'),
(59, 2, 'Завод імені Малишева'),
(60, 2, 'Турбоатом'),
(61, 2, 'Імені О.С. Масельського'),
(62, 2, 'Армійська'),
(63, 2, 'Тракторний завод'),
(64, 2, 'Індустріальна'),
(65, 3, 'Покровська'),
(66, 3, 'Проспект Свободи'),
(67, 3, 'Заводська'),
(68, 3, 'Металургів'),
(69, 3, 'Метробудівників'),
(70, 2, 'Героїв праці'),
(71, 2, 'Студентська'),
(72, 2, 'Академіка Павлова'),
(73, 2, 'Академіка Барабашова'),
(74, 2, 'Київська'),
(75, 2, 'Пушкінська'),
(76, 2, 'Історичний музей'),
(77, 2, 'Перемога');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `anketa_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `timetable_id` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int NOT NULL,
  `anketa_id` int NOT NULL,
  `path` varchar(200) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`) VALUES
(1, 'blocked', 'Заблокований користувач'),
(2, 'user', 'Користувач'),
(3, 'owner', 'Власник організації '),
(4, 'admin', 'Адміністратор');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int NOT NULL,
  `anketa_id` int NOT NULL,
  `weekday_id` tinyint NOT NULL,
  `timetable_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timetables`
--

CREATE TABLE `timetables` (
  `id` int NOT NULL,
  `begin` time NOT NULL,
  `end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timetables`
--

INSERT INTO `timetables` (`id`, `begin`, `end`) VALUES
(1, '06:00:00', '06:30:00'),
(2, '06:30:00', '07:00:00'),
(3, '07:00:00', '07:30:00'),
(4, '07:30:00', '08:00:00'),
(5, '08:00:00', '08:30:00'),
(6, '08:30:00', '09:00:00'),
(7, '09:00:00', '09:30:00'),
(8, '09:30:00', '10:00:00'),
(9, '10:30:00', '11:00:00'),
(10, '11:30:00', '12:00:00'),
(11, '12:30:00', '13:00:00'),
(12, '13:30:00', '14:00:00'),
(13, '14:30:00', '15:00:00'),
(14, '15:30:00', '16:00:00'),
(15, '16:30:00', '17:00:00'),
(16, '17:30:00', '18:00:00'),
(17, '18:30:00', '19:00:00'),
(18, '19:30:00', '20:00:00'),
(19, '20:30:00', '21:00:00'),
(20, '21:30:00', '22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`) VALUES
(1, 'Терапевт'),
(2, 'Терапевт підлітковий'),
(3, 'Кардіолог'),
(4, 'Хірург'),
(5, 'Онколог'),
(6, 'Уролог'),
(7, 'Невролог'),
(8, 'Психотерапевт'),
(9, 'Педіатр'),
(10, 'Травматолог'),
(11, 'Офтальмолог'),
(12, 'Дерматовенеролог'),
(13, 'Стоматолог'),
(14, 'Ревматолог'),
(15, 'Акушер-гінеколог'),
(16, 'Фтизіатр');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancels` int NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `join_date` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int NOT NULL DEFAULT '2',
  `diplom_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weekdays`
--

CREATE TABLE `weekdays` (
  `id` tinyint NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `weekdays`
--

INSERT INTO `weekdays` (`id`, `name`) VALUES
(1, 'Понеділок'),
(2, 'Вівторок'),
(3, 'Середа'),
(4, 'Четвер'),
(5, 'П\'ятниця'),
(6, 'Субота'),
(7, 'Неділя');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_role`
--
ALTER TABLE `action_role`
  ADD PRIMARY KEY (`role_id`,`action_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `anketas`
--
ALTER TABLE `anketas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `diplom_id` (`diplom_code`),
  ADD UNIQUE KEY `diplom_code` (`diplom_code`),
  ADD KEY `id_city` (`city_id`),
  ADD KEY `id_type` (`type_id`),
  ADD KEY `id_education` (`education_id`),
  ADD KEY `id_experience` (`experience_id`),
  ADD KEY `anketas_ibfk_8` (`photo_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `anketa_metro`
--
ALTER TABLE `anketa_metro`
  ADD PRIMARY KEY (`anketa_id`,`metro_id`),
  ADD KEY `metro_id` (`metro_id`);

--
-- Indexes for table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`dt`),
  ADD KEY `weekday_id` (`weekday_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diploms`
--
ALTER TABLE `diploms`
  ADD PRIMARY KEY (`code`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metros`
--
ALTER TABLE `metros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `metros_ibfk_1` (`city_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anketa_id` (`anketa_id`,`date`,`timetable_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`date`,`timetable_id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`,`anketa_id`,`date`),
  ADD KEY `date` (`date`),
  ADD KEY `timetable_id` (`timetable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_ibfk_1` (`anketa_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `anketa_id` (`anketa_id`,`weekday_id`,`timetable_id`),
  ADD KEY `timetable_id` (`timetable_id`),
  ADD KEY `weekday_id` (`weekday_id`);

--
-- Indexes for table `timetables`
--
ALTER TABLE `timetables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `login` (`name`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `weekdays`
--
ALTER TABLE `weekdays`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `anketas`
--
ALTER TABLE `anketas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=601;

--
-- AUTO_INCREMENT for table `timetables`
--
ALTER TABLE `timetables`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `weekdays`
--
ALTER TABLE `weekdays`
  MODIFY `id` tinyint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `action_role`
--
ALTER TABLE `action_role`
  ADD CONSTRAINT `action_role_ibfk_1` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`),
  ADD CONSTRAINT `action_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `anketas`
--
ALTER TABLE `anketas`
  ADD CONSTRAINT `anketas_ibfk_10` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anketas_ibfk_11` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `anketas_ibfk_12` FOREIGN KEY (`diplom_code`) REFERENCES `diploms` (`code`),
  ADD CONSTRAINT `anketas_ibfk_4` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `anketas_ibfk_5` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`),
  ADD CONSTRAINT `anketas_ibfk_6` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`),
  ADD CONSTRAINT `anketas_ibfk_7` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`);

--
-- Constraints for table `anketa_metro`
--
ALTER TABLE `anketa_metro`
  ADD CONSTRAINT `anketa_metro_ibfk_1` FOREIGN KEY (`anketa_id`) REFERENCES `anketas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `anketa_metro_ibfk_2` FOREIGN KEY (`metro_id`) REFERENCES `metros` (`id`);

--
-- Constraints for table `calendars`
--
ALTER TABLE `calendars`
  ADD CONSTRAINT `calendars_ibfk_1` FOREIGN KEY (`weekday_id`) REFERENCES `weekdays` (`id`);

--
-- Constraints for table `metros`
--
ALTER TABLE `metros`
  ADD CONSTRAINT `metros_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`anketa_id`) REFERENCES `anketas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`date`) REFERENCES `calendars` (`dt`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`anketa_id`) REFERENCES `anketas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`anketa_id`) REFERENCES `anketas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`id`),
  ADD CONSTRAINT `schedules_ibfk_3` FOREIGN KEY (`weekday_id`) REFERENCES `weekdays` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
