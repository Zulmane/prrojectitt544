-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 16, 2020 at 11:30 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foody`
--
CREATE DATABASE IF NOT EXISTS `foody` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `foody`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(255) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `landmark` varchar(255) NOT NULL,
  `pincode` int(5) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `email_id`, `password`, `phone_no`, `state`, `city`, `landmark`, `pincode`) VALUES
(10, 'eizul', 'aiman', 'eizulaiman@gmail.com', 'password', '0136991877', 'perak', 'parit', 'perak tengah', 32800),
(11, 'akim', 'brusly', 'brusly@yahoo.com', '1234567890', '0123456789', 'kelantan', 'kotabaharu', 'wakaf che ye', 39000);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_id` int(255) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL,
  `price` int(20) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `price`) VALUES
(1, 'American Pizza', 20),
(2, 'Veg Pizza', 18),
(3, 'Chicken Pizza', 20),
(4, 'Pepperroni Pizza', 23),
(5, 'Veg Burger', 10),
(6, 'Chicken Burger', 10),
(7, 'Power Burger', 15),
(8, 'Sandwich Burger', 13),
(9, 'Gulab Jamun', 8),
(10, 'Chocholate Moose', 16),
(11, 'Naugat Moose', 16),
(12, 'Belgium Waffle', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_id` int(255) NOT NULL,
  `menu_id` int(255) NOT NULL,
  `quantity` int(255) NOT NULL DEFAULT 1,
  `order_status` enum('ADDED_TO_CART','CONFIRMED','PAYMENT_CONFIRMED','DELIVERED') DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `menu_id`, `quantity`, `order_status`, `time_stamp`) VALUES
(138, 2, 8, 2, 'DELIVERED', '2018-11-06 12:58:42'),
(139, 2, 4, 2, 'DELIVERED', '2018-11-06 12:58:37'),
(140, 2, 2, 2, 'DELIVERED', '2018-11-06 12:58:53'),
(141, 2, 1, 2, 'DELIVERED', '2018-11-06 12:58:47'),
(143, 2, 1, 1, 'DELIVERED', '2018-11-07 04:21:26'),
(146, 2, 12, 1, 'DELIVERED', '2018-11-07 05:43:38'),
(147, 2, 11, 1, 'DELIVERED', '2018-11-07 05:43:42'),
(148, 2, 1, 1, 'DELIVERED', '2018-11-07 14:12:03'),
(149, 2, 8, 2, 'DELIVERED', '2018-11-12 09:55:38'),
(150, 2, 7, 2, 'DELIVERED', '2018-11-10 15:28:08'),
(151, 2, 9, 2, 'PAYMENT_CONFIRMED', '2018-11-11 04:36:31'),
(152, 2, 10, 1, 'PAYMENT_CONFIRMED', '2018-11-11 04:36:31'),
(153, 2, 1, 2, 'DELIVERED', '2018-11-12 09:55:47'),
(156, 2, 6, 2, 'DELIVERED', '2018-11-12 04:31:09'),
(159, 9, 1, 1, 'ADDED_TO_CART', '2018-11-11 07:59:28'),
(160, 2, 1, 2, 'DELIVERED', '2018-11-12 04:16:04'),
(162, 2, 1, 2, 'DELIVERED', '2020-06-29 05:34:05'),
(165, 2, 1, 1, 'DELIVERED', '2018-11-12 10:58:53'),
(166, 10, 1, 1, 'DELIVERED', '2020-06-29 05:27:25'),
(167, 10, 7, 1, 'DELIVERED', '2020-06-29 05:31:01'),
(168, 10, 6, 1, 'DELIVERED', '2020-06-29 05:30:57'),
(170, 11, 1, 1, 'DELIVERED', '2020-07-05 04:52:56'),
(172, 11, 10, 1, 'PAYMENT_CONFIRMED', '2020-06-29 10:25:56'),
(173, 10, 6, 1, 'PAYMENT_CONFIRMED', '2020-07-05 05:06:25'),
(174, 10, 4, 1, 'PAYMENT_CONFIRMED', '2020-07-05 05:06:25'),
(175, 10, 12, 1, 'PAYMENT_CONFIRMED', '2020-07-08 05:31:29'),
(176, 10, 11, 1, 'PAYMENT_CONFIRMED', '2020-07-08 05:31:29'),
(177, 10, 2, 1, 'PAYMENT_CONFIRMED', '2020-07-08 05:48:50'),
(178, 10, 9, 1, 'PAYMENT_CONFIRMED', '2020-07-08 05:50:26'),
(179, 10, 10, 1, 'PAYMENT_CONFIRMED', '2020-07-08 05:52:37'),
(180, 10, 8, 1, 'PAYMENT_CONFIRMED', '2020-07-08 05:57:03'),
(181, 10, 7, 1, 'PAYMENT_CONFIRMED', '2020-07-08 06:00:40'),
(182, 10, 12, 1, 'PAYMENT_CONFIRMED', '2020-07-08 06:04:53'),
(183, 10, 4, 1, 'PAYMENT_CONFIRMED', '2020-07-08 06:15:44'),
(184, 10, 6, 1, 'PAYMENT_CONFIRMED', '2020-07-08 06:18:32'),
(186, 10, 11, 1, 'PAYMENT_CONFIRMED', '2020-07-08 06:28:32'),
(187, 10, 7, 1, 'PAYMENT_CONFIRMED', '2020-07-08 07:04:51'),
(188, 10, 2, 1, 'PAYMENT_CONFIRMED', '2020-07-08 07:04:51'),
(189, 10, 3, 1, 'PAYMENT_CONFIRMED', '2020-07-08 07:22:43'),
(190, 10, 1, 1, 'PAYMENT_CONFIRMED', '2020-07-08 07:24:15'),
(191, 10, 4, 1, 'PAYMENT_CONFIRMED', '2020-07-12 06:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `order_id` int(255) NOT NULL,
  `payment_type` enum('CASH_ON_DELIVERY','ONLINE_PAYMENT') NOT NULL DEFAULT 'CASH_ON_DELIVERY',
  `payment_status` enum('NOT_CONFIRMED','CONFIRMED') NOT NULL DEFAULT 'NOT_CONFIRMED',
  `time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `order_id`, `payment_type`, `payment_status`, `time_stamp`) VALUES
(209, 138, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-06 12:53:56'),
(210, 139, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-06 12:53:56'),
(212, 140, 'ONLINE_PAYMENT', 'CONFIRMED', '2018-11-06 12:57:37'),
(213, 141, 'ONLINE_PAYMENT', 'CONFIRMED', '2018-11-06 12:57:37'),
(215, 143, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-06 17:43:49'),
(216, 146, 'ONLINE_PAYMENT', 'CONFIRMED', '2018-11-07 04:20:01'),
(217, 147, 'ONLINE_PAYMENT', 'CONFIRMED', '2018-11-07 04:20:01'),
(219, 148, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-07 05:44:28'),
(220, 149, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-09 07:54:10'),
(221, 150, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-09 07:54:10'),
(223, 151, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-11 04:36:31'),
(224, 152, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-11 04:36:31'),
(225, 153, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-11 04:36:31'),
(237, 156, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-11 06:29:11'),
(238, 160, 'CASH_ON_DELIVERY', 'CONFIRMED', '2018-11-12 04:15:10'),
(239, 162, 'ONLINE_PAYMENT', 'CONFIRMED', '2018-11-12 09:54:04'),
(240, 165, 'ONLINE_PAYMENT', 'CONFIRMED', '2018-11-12 10:57:53'),
(241, 166, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-06-29 05:21:33'),
(242, 167, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-06-29 05:30:29'),
(243, 168, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-06-29 05:30:29'),
(245, 170, 'ONLINE_PAYMENT', 'CONFIRMED', '2020-06-29 10:25:56'),
(246, 172, 'ONLINE_PAYMENT', 'CONFIRMED', '2020-06-29 10:25:56'),
(247, 173, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-05 05:06:25'),
(248, 174, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-05 05:06:25'),
(249, 175, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 05:31:29'),
(250, 176, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 05:31:29'),
(252, 177, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 05:48:50'),
(253, 178, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 05:50:26'),
(254, 179, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 05:52:37'),
(255, 180, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 05:57:03'),
(256, 181, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 06:00:40'),
(257, 182, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 06:04:53'),
(258, 183, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 06:15:44'),
(259, 184, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 06:18:31'),
(260, 186, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 06:28:32'),
(261, 187, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 07:04:51'),
(262, 187, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 07:04:51'),
(263, 188, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 07:04:51'),
(265, 189, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 07:22:43'),
(266, 190, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-08 07:24:15'),
(267, 191, 'CASH_ON_DELIVERY', 'CONFIRMED', '2020-07-12 06:54:01');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

DROP TABLE IF EXISTS `payment_details`;
CREATE TABLE IF NOT EXISTS `payment_details` (
  `payment_id` int(255) NOT NULL AUTO_INCREMENT,
  `customer_id` int(255) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `card_holder_name` varchar(255) NOT NULL,
  `cvv` int(3) NOT NULL,
  `exp_month` int(2) NOT NULL,
  `exp_year` int(4) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`payment_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`payment_id`, `customer_id`, `card_number`, `card_holder_name`, `cvv`, `exp_month`, `exp_year`, `time_stamp`) VALUES
(11, 2, '1234123412341234', 'winston', 122, 12, 22, '2018-11-07 04:20:01'),
(14, 11, '1234567812345678', 'osman', 240, 4, 20, '2020-06-29 10:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE IF NOT EXISTS `restaurant` (
  `restaurant_id` int(255) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `designation` enum('EMPLOYEE','ADMIN') NOT NULL DEFAULT 'EMPLOYEE',
  PRIMARY KEY (`restaurant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `password`, `first_name`, `last_name`, `designation`) VALUES
(101, '123456', 'Eizul', 'Aiman', 'ADMIN'),
(1001, '1234', 'Mohamad Zarif', 'Mohamad yazid', 'EMPLOYEE'),
(1005, '12345', 'Akim', 'Muqris', 'EMPLOYEE'),
(1009, '1234', 'Sharini', 'Sha', 'EMPLOYEE');

--
-- Triggers `restaurant`
--
DROP TRIGGER IF EXISTS `res_id`;
DELIMITER $$
CREATE TRIGGER `res_id` BEFORE INSERT ON `restaurant` FOR EACH ROW BEGIN
 SET NEW.restaurant_id = (SELECT MAX(restaurant_id) + 4 FROM restaurant);
 END
$$
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
