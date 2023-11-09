-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 09, 2023 at 11:26 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sinep`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `cat_name` varchar(45) NOT NULL,
  `browser_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat_name`, `browser_name`) VALUES
(1, 'sets', 'Сеты'),
(2, 'sushi', 'Суши'),
(3, 'rolls', 'Роллы');

-- --------------------------------------------------------

--
-- Table structure for table `good`
--

CREATE TABLE `good` (
  `id` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `composition` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `link_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='	';

--
-- Dumping data for table `good`
--

INSERT INTO `good` (`id`, `category`, `name`, `composition`, `price`, `descr`, `img`, `link_name`) VALUES
(1, 'sets', 'Сет Запеченный', 'запеченные роллы', 800, 'lorem', 'baked.jpg', 'baked_set'),
(2, 'sets', 'Сет Филамикс', 'три разных ролла Филадельфия', 950, 'lorem', 'philaset.jpg', 'phila_set'),
(3, 'rolls', 'Ролл Филадельфия', 'лосось, сливочный сыр', 300, 'lorem', 'phila.jpg', 'phila'),
(4, 'rolls', 'Ролл Калифорния', 'краб, огурец, масаго', 200, 'lorem', 'california.jpg', 'california'),
(5, 'sushi', 'Суши Лосось', 'лосось, рис', 100, 'lorem', 'salmon.jpg', 'salmon'),
(6, 'sushi', 'Суши Угорь', 'угорь, рис', 110, 'lorem', 'eel.jpg', 'eel');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `sum` int NOT NULL,
  `status` enum('Новый','Завершен') NOT NULL DEFAULT 'Новый'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `order_good`
--

CREATE TABLE `order_good` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sum` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `order_good`
--

INSERT INTO `order_good` (`id`, `order_id`, `product_id`, `name`, `price`, `quantity`, `sum`) VALUES
(1, 12, 1, 'Сет Запеченный', 800, 1, 800),
(2, 12, 2, 'Сет Филамикс', 950, 1, 950),
(3, 12, 3, 'Ролл Филадельфия', 300, 2, 600),
(4, 13, 4, 'Ролл Калифорния', 200, 2, 400),
(5, 13, 2, 'Сет Филамикс', 950, 2, 1900),
(6, 13, 6, 'Суши Угорь', 110, 1, 110),
(7, 13, 1, 'Сет Запеченный', 800, 1, 800),
(8, 13, 3, 'Ролл Филадельфия', 300, 5, 1500),
(9, 14, 2, 'Сет Филамикс', 950, 1, 950),
(10, 14, 3, 'Ролл Филадельфия', 300, 2, 600),
(11, 15, 5, 'Суши Лосось', 100, 1, 100),
(12, 15, 6, 'Суши Угорь', 110, 2, 220),
(13, 16, 2, 'Сет Филамикс', 950, 1, 950),
(14, 17, 2, 'Сет Филамикс', 950, 1, 950),
(15, 17, 3, 'Ролл Филадельфия', 300, 1, 300),
(16, 18, 2, 'Сет Филамикс', 950, 1, 950),
(17, 19, 2, 'Сет Филамикс', 950, 1, 950),
(18, 20, 3, 'Ролл Филадельфия', 300, 1, 300),
(19, 21, 3, 'Ролл Филадельфия', 300, 1, 300),
(20, 22, 2, 'Сет Филамикс', 950, 1, 950),
(21, 23, 3, 'Ролл Филадельфия', 300, 1, 300),
(22, 23, 2, 'Сет Филамикс', 950, 1, 950),
(23, 24, 2, 'Сет Филамикс', 950, 1, 950),
(24, 25, 3, 'Ролл Филадельфия', 300, 1, 300),
(25, 26, 3, 'Ролл Филадельфия', 300, 1, 300),
(26, 27, 2, 'Сет Филамикс', 950, 1, 950),
(27, 28, 3, 'Ролл Филадельфия', 300, 1, 300),
(28, 29, 2, 'Сет Филамикс', 950, 1, 950),
(29, 30, 1, 'Сет Запеченный', 800, 2, 1600),
(30, 31, 2, 'Сет Филамикс', 950, 1, 950),
(31, 32, 2, 'Сет Филамикс', 950, 1, 950),
(32, 33, 1, 'Сет Запеченный', 800, 1, 800),
(33, 34, 2, 'Сет Филамикс', 950, 1, 950),
(34, 35, 3, 'Ролл Филадельфия', 300, 1, 300),
(35, 36, 2, 'Сет Филамикс', 950, 1, 950),
(36, 37, 1, 'Сет Запеченный', 800, 1, 800),
(37, 38, 5, 'Суши Лосось', 100, 1, 100),
(38, 39, 1, 'Сет Запеченный', 800, 2, 1600),
(39, 39, 3, 'Ролл Филадельфия', 300, 1, 300),
(40, 40, 2, 'Сет Филамикс', 950, 1, 950),
(41, 40, 3, 'Ролл Филадельфия', 300, 1, 300);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `auth_key`) VALUES
(1, 'admin', '$2y$13$OzahBu2mo8152R9lQdvagOXmQ3r26TENt42QjSDJFS2mReC16oUrC', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `good`
--
ALTER TABLE `good`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_good`
--
ALTER TABLE `order_good`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `order_good`
--
ALTER TABLE `order_good`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
