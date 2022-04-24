-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 22, 2022 at 12:17 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelms`
--

-- --------------------------------------------------------

--
-- Table structure for table `addroom`
--

CREATE TABLE `addroom` (
  `id` int(11) NOT NULL,
  `romm_type` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addroom`
--

INSERT INTO `addroom` (`id`, `romm_type`, `image`, `price`) VALUES
(7, 'Triple ROOM', '1637609442_419065.jpg', 100),
(8, 'Double ROOM', '1637609485_627339.jpg', 67),
(9, 'Mini-Suite ROOM', '1637609520_927765.jpg', 400),
(10, 'Triple ROOM', '1637609558_37177.jpg', 500),
(11, 'Single ROOM', '1637609571_494972.jpg', 200),
(12, 'Double ROOM', '1637609755_839013.jpg', 600),
(13, 'Master ROOM', '1637610007_602334.jpg', 5600),
(14, 'Family ROOM', '1637610449_984852.jpg', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `room_id` int(10) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_in` varchar(100) DEFAULT NULL,
  `check_out` varchar(100) NOT NULL,
  `total_price` int(10) NOT NULL,
  `remaining_price` int(10) NOT NULL,
  `payment_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `customer_id`, `room_id`, `booking_date`, `check_in`, `check_out`, `total_price`, `remaining_price`, `payment_status`) VALUES
(1, 1, 5, '2017-11-13 05:45:17', '13-11-2017', '15-11-2017', 3000, 2700, 0),
(2, 2, 2, '2017-11-13 05:46:04', '13-11-2017', '16-11-2017', 6000, 0, 1),
(3, 3, 2, '2017-11-11 06:49:19', '11-11-2017', '14-11-2017', 6000, 0, 1),
(4, 4, 7, '2017-11-09 06:50:24', '11-11-2017', '15-11-2017', 10000, 10000, 0),
(5, 5, 13, '2017-11-17 06:59:10', '17-11-2017', '20-11-2017', 12000, 0, 1),
(6, 6, 9, '2021-04-08 09:45:56', '08-04-2021', '10-04-2021', 3000, 0, 1),
(7, 7, 14, '2021-04-08 17:56:41', '08-04-2021', '10-04-2021', 16500, 11500, 0),
(8, 8, 22, '2021-04-09 08:32:57', '09-04-2021', '13-04-2021', 34500, 0, 1),
(9, 9, 4, '2021-11-07 09:51:31', '21-11-2021', '24-11-2021', 12000, 0, 1),
(10, 11, 25, '2021-11-07 09:54:46', '28-11-2021', '30-11-2021', 24000, 24000, 0),
(11, 12, 2, '2021-11-15 16:21:50', '17-11-2021', '20-11-2021', 6000, 0, 1),
(12, 13, 10, '2021-11-15 16:25:22', '17-11-2021', '22-11-2021', 9000, 0, 1),
(13, 14, 24, '2021-11-15 17:16:13', '16-11-2021', '19-11-2021', 14400, 14400, 0),
(14, 15, 15, '2021-11-22 13:59:51', '25-11-2021', '29-11-2021', 27500, 27500, 0),
(15, 16, 3, '2021-11-22 14:09:17', '25-11-2021', '26-11-2021', 0, -100, 0),
(16, 17, 9, '2021-11-23 18:35:53', '25-11-2021', '24-11-2021', 0, 0, 0),
(17, 18, 16, '2022-03-10 18:06:04', '14-03-2022', '15-03-2022', 11000, 11000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` int(11) NOT NULL,
  `name` text,
  `photo` text,
  `supervisor` text,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buildings`
--

INSERT INTO `buildings` (`id`, `name`, `photo`, `supervisor`, `details`) VALUES
(2, 'Serina building', 'uploads/1650583367-hotel-sarina-bar.jpeg', 'Johjn Black', 'WELCOME TO HOTEL SARINA\r\nWelcome to Hotel Sarina, Dhaka’s most conveniently located Five Star Hotel. ‘Banani’, one of the posh areas of Dhaka, also the new business hub, are the neighborhood of Hotel Sarina.\r\n\r\nBeing located in this business district you are not far from any of the important destination of your choice like business district of Gulshan, Baridhara Diplomatic Zone, Airport and so on. It is only thirty minutes drive from the International Airport, about five to ten minutes drive to Gulshan and to the diplomatic zone. Two renowned shopping malls are only a few minutes walking distance from the hotel.'),
(3, 'DELUXE KING', 'uploads/1650584591-hotel-sarina-bar.jpeg', '', 'At Deluxe king you can indulge yourself in a big luxurious bed to relieve your all day’s hustle and bustle. The rooms are well equipped with all the necessary amenities. The spacious bathroom is another great feature of this room.\r\n\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `car_image`
--

CREATE TABLE `car_image` (
  `id` int(11) NOT NULL,
  `car_type` varchar(70) NOT NULL,
  `image` varchar(70) NOT NULL,
  `price` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_image`
--

INSERT INTO `car_image` (`id`, `car_type`, `image`, `price`) VALUES
(1, 'range rover', '1638681773_758400.jpg', '1200'),
(2, 'mini_bus', '1638682097_722862.jpg', '30'),
(4, 'Ferrari', '1640066521_708346.png', '1200'),
(5, 'Ferrari', '1640066540_124732.png', '6790'),
(6, 'Bugatti', '1640066621_833677.jpg', '2340'),
(7, 'Bugatti', '1640066656_728348.png', '3450'),
(8, 'Lambourghini', '1640066674_356736.jpg', '3456'),
(9, 'Lambourghini', '1640066690_452377.jpg', '1234'),
(10, 'mini_bus', 'noproduct.png', '32000'),
(11, 'Car\r\nBest 4x4', '1650388474_781403.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `category_carmodel`
--

CREATE TABLE `category_carmodel` (
  `id` int(11) NOT NULL,
  `username` varchar(70) NOT NULL,
  `email` varchar(70) NOT NULL,
  `roomnumber` varchar(70) NOT NULL,
  `phone_number` varchar(70) NOT NULL,
  `place` varchar(70) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `category_aller` varchar(70) NOT NULL,
  `category_day` varchar(70) NOT NULL,
  `category_place` varchar(70) NOT NULL,
  `category_carmodel` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_carmodel`
--

INSERT INTO `category_carmodel` (`id`, `username`, `email`, `roomnumber`, `phone_number`, `place`, `checkin`, `checkout`, `category_aller`, `category_day`, `category_place`, `category_carmodel`) VALUES
(1, '', '', '', '', '', '0000-00-00', '0000-00-00', '', '', '', ''),
(2, 'moindjie', 'housnatamoindjie@gmail.com', 'e120', '+8801640910153', 'comore', '2021-12-17', '2021-12-21', 'aller sans retour', 'one week', '6', 'mini_bus'),
(3, 'moindjie', 'housnatamoindjie@gmail.com', 'e120', '+8801640910153', 'Moroni', '2021-12-17', '2021-12-25', 'aller sans retour', '3', '6', 'range rover'),
(4, 'moindjie', 'housnatamoindjie@gmail.com', '', '+8801640910153', 'comore', '2021-12-21', '2021-12-23', 'aller sans retour', '3', '3', 'range rover'),
(5, 'moindjie', 'housnatamoindjie@gmail.com', 'e120', '+8801640910153', 'comore', '2021-12-23', '2021-12-24', 'aller avec retour', '2', '1', 'Ferrari');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL,
  `complainant_name` varchar(100) NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `complaint` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `resolve_status` tinyint(1) NOT NULL,
  `resolve_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `budget` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`id`, `complainant_name`, `complaint_type`, `complaint`, `created_at`, `resolve_status`, `resolve_date`, `budget`) VALUES
(1, 'Janice Alexander\n', 'Room Windows', 'Doesnot operate properly', '2020-07-16 06:51:24', 1, '2020-07-17 06:51:58', 3600),
(2, 'Robert Peter\n', 'Air Conditioner', 'Sensor Problems', '2020-10-01 06:51:44', 1, '2020-10-03 07:06:02', 7950),
(3, 'Jason J Pirkle\n', 'Bad Smells', 'Some odd smells around room areas', '2018-04-01 07:01:17', 1, '2018-04-01 07:01:52', 500),
(5, 'Will Williams', 'Faulty Electronics', 'Due to some weird reasons, the electronics are not working as it should; some voltage problems too - M-135', '2021-04-09 08:38:19', 1, '2021-04-09 08:38:39', 2500),
(6, 'hutr', 'modul', 'sdfghjkl;', '2021-11-23 13:47:21', 1, '2021-11-23 18:58:50', 233),
(7, 'LIGHT', 'ELECTROCITY', 'LIGHT PROBLEM', '2021-11-24 02:08:27', 0, '2021-11-24 02:08:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_card_type_id` int(10) NOT NULL,
  `id_card_no` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `contact_no`, `email`, `id_card_type_id`, `id_card_no`, `address`) VALUES
(1, 'Billy S. Burke', 7540001240, 'billyb9@gmail.com', 1, '422510099122', '3166 Rockford Road'),
(2, 'John Mitchell', 2870214970, 'johnm@gmail.com', 2, '422510099122', '1954 Armory Road'),
(3, 'Beatriz M. Matthews', 1247778460, 'matthews@gmail.com', 1, '422510099122', '4879 Shearwood Forest Drive'),
(4, 'Kevin Johnson', 1478546500, 'kevin@gmail.com', 3, '0', '926 Richland Avenue\n'),
(5, 'Dwayne Scott', 2671249780, 'scottdway@gmail.com', 1, '422510099122', '4698 Columbia Road\n'),
(6, 'Bruno Denn', 1245554780, 'denbru@gmail.com', 4, 'AASS 12454784541', '4764 Warner Street\n'),
(7, 'Ric Austin', 2450006974, 'austinric@gmail.com', 1, '457896000002', '1680  Brownton Road'),
(8, 'Andrew Stuartt', 2457778450, 'andrew@gmail.com', 1, '147000245810', '766  Lodgeville Road'),
(9, 'Housnata moindjie', 1640910153, 'housnatamoindjie@gmail.com', 1, '52345678956789', 'BOARD BAZAR iut, iu, iut'),
(11, 'amina nizar', 1869587138, 'aminanizar@htmail.com', 2, '23456789067891234567', 'comoros,hamahamet,hadjambou'),
(12, 'Housnata moindjie', 1640910153, 'housnatamoindjie@gmail.com', 1, '78933568901234123456', 'BOARD BAZAR iut, iu, iut'),
(13, 'Housnata nizar', 1640910153, 'housnatamoindjie@gmail.com', 3, '1234567890', 'BOARD BAZAR iut, iu, iut'),
(14, 'Housnata moindjie', 1640910153, 'housnatamoindjie@gmail.com', 3, '234567890', 'BOARD BAZAR iut, iu, iut'),
(15, 'Housnata moindjie', 1640910153, 'housnatamoindjie@gmail.com', 1, '1234567890', 'BOARD BAZAR iut, iu, iut'),
(16, 'Housnata moindjie', 1640910153, 'housnatamoindjie@gmail.com', 1, '1234567890', 'BOARD BAZAR iut, iu, iut'),
(17, 'Housnata moindjie', 1640910153, 'housnatamoindjie@gmail.com', 1, '23456789023456789', 'BOARD BAZAR iut, iu, iut'),
(18, 'Housnata moindjie', 23456780123456, 'housnatamoindjie@gmail.com', 1, '123456789024567', 'BOARD BAZAR iut');

-- --------------------------------------------------------

--
-- Table structure for table `dinning_user`
--

CREATE TABLE `dinning_user` (
  `id` int(11) NOT NULL,
  `datee` varchar(44) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` text NOT NULL,
  `phone_number` varchar(40) NOT NULL,
  `texteara` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dinning_user`
--

INSERT INTO `dinning_user` (`id`, `datee`, `email`, `username`, `password`, `phone_number`, `texteara`) VALUES
(1, '2021-11-19', 'housnatamoindjie@gmail.com', 'housnatamoindjie', 'papa', '+8801640910153', 'htr'),
(2, '2021-11-23', 'housnatamoindjie@gmail.com', 'housnatamoindjie', 'papa', '+8801640910153', 'here'),
(3, '2021-11-24', 'housnamoindjie@outlook.com', 'housna', '$2y$10$VNUW.5Ww7rxRO6dApSOxRuL9MSaIXJLD3e8JaPjR72TraZbbyd.oa', '+8801640910153', 'i just need r'),
(4, '2021-11-24', 'housnamoindjie@outlook.com', 'housna', '$2y$10$GLLSWurlSyIqffywB5G/gOUWSzEjeZ.OJpxi0t6v5Moqu.UBWh2GW', '+8801640910153', 'i just need r'),
(5, '2021-11-24', 'housnamoindjie@outlook.com', 'housna', '$2y$10$juG.sHetkePxgSpbvQiXj.QQYiYtgIlFnnozBP9hsQ211mtT8e/L6', '+8801640910153', 'i just need r'),
(6, '2021-11-24', 'housnamoindjie@outlook.com', 'housna', '$2y$10$ABee9feCltDukvzQP6XcQuYMVV8u9C87oWUQGlzk6LOdU.vFcKmyK', '+8801640910153', 'i just need r'),
(7, '2021-12-02', 'housnatamoindjie@gmail.com', 'moindjie@gmail.com', '$2y$10$56kquTQ6sy026svY6XSe4uusnBA3WHy/l9IO9an79RL1MzXuyfdz2', '+8801640910153', 'i just need r'),
(8, '2021-11-27', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$i9BYSaB8xGFpUZmR3hfsHOfJRsQqUfROPw3EaptJ4c7kmxc1Nh9M6', '+8801640910153', 'i just need r'),
(9, '2021-11-27', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$i9BYSaB8xGFpUZmR3hfsHOfJRsQqUfROPw3EaptJ4c7kmxc1Nh9M6', '+8801640910153', 'i just need r'),
(10, '2021-11-27', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$txbyBcp90ytVt8h54Xldzevr3cerIotfYB/pnq3oN/NkKmpGOR4ae', '+8801640910153', 'i just need r'),
(11, '2021-11-27', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$txbyBcp90ytVt8h54Xldzevr3cerIotfYB/pnq3oN/NkKmpGOR4ae', '+8801640910153', 'i just need r');

-- --------------------------------------------------------

--
-- Table structure for table `emp_history`
--

CREATE TABLE `emp_history` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_history`
--

INSERT INTO `emp_history` (`id`, `emp_id`, `shift_id`, `from_date`, `to_date`, `created_at`) VALUES
(1, 1, 1, '2017-11-13 05:39:06', '2017-11-15 02:22:26', '2017-11-13 05:39:06'),
(2, 2, 3, '2017-11-13 05:39:39', '2017-11-15 02:22:43', '2017-11-13 05:39:39'),
(3, 3, 1, '2017-11-13 05:40:18', '2017-11-15 02:22:49', '2017-11-13 05:40:18'),
(4, 4, 1, '2017-11-13 05:40:56', '2017-11-15 02:22:35', '2017-11-13 05:40:56'),
(5, 5, 1, '2017-11-13 05:41:31', NULL, '2017-11-13 05:41:31'),
(6, 6, 3, '2017-11-13 05:42:03', NULL, '2017-11-13 05:42:03'),
(7, 7, 4, '2017-11-13 05:42:35', '2017-11-18 02:35:02', '2017-11-13 05:42:35'),
(8, 8, 3, '2017-11-13 05:43:13', '2017-11-18 02:32:26', '2017-11-13 05:43:13'),
(9, 9, 2, '2017-11-13 05:43:49', NULL, '2017-11-13 05:43:49'),
(10, 10, 1, '2017-11-13 06:30:45', '2017-11-18 02:34:28', '2017-11-13 06:30:45'),
(11, 1, 2, '2017-11-15 06:52:26', '2017-11-17 02:23:05', '2017-11-15 06:52:26'),
(12, 4, 3, '2017-11-15 06:52:35', NULL, '2017-11-15 06:52:35'),
(13, 2, 3, '2017-11-15 06:52:43', NULL, '2017-11-15 06:52:43'),
(14, 3, 3, '2017-11-15 06:52:49', NULL, '2017-11-15 06:52:49'),
(15, 1, 3, '2017-11-17 06:53:05', NULL, '2017-11-17 06:53:05'),
(16, 8, 1, '2017-11-18 07:02:26', NULL, '2017-11-18 07:02:26'),
(17, 11, 2, '2017-11-18 07:04:03', NULL, '2017-11-18 07:04:03'),
(18, 10, 2, '2017-11-18 07:04:28', NULL, '2017-11-18 07:04:28'),
(19, 7, 2, '2017-11-18 07:05:02', NULL, '2017-11-18 07:05:02'),
(20, 12, 1, '2021-04-08 17:54:22', NULL, '2021-04-08 17:54:22'),
(21, 13, 2, '2021-04-09 08:35:27', NULL, '2021-04-09 08:35:27'),
(22, 14, 4, '2021-11-23 14:35:28', NULL, '2021-11-23 14:35:28'),
(23, 15, 2, '2021-11-23 14:38:33', NULL, '2021-11-23 14:38:33'),
(24, 16, 3, '2021-11-23 14:40:38', NULL, '2021-11-23 14:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `gym_images`
--

CREATE TABLE `gym_images` (
  `id` int(11) NOT NULL,
  `material_type` varchar(40) NOT NULL,
  `description` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gym_images`
--

INSERT INTO `gym_images` (`id`, `material_type`, `description`, `image`) VALUES
(1, 'chest', 'beld yourself', '1639935933_727702.jpg'),
(2, 'leg', 'let move', '1640024367_319178.jpg'),
(3, 'leg', '', '1640024379_420207.jpg'),
(4, 'leg', '', '1640024390_220781.jpg'),
(5, 'leg', '', '1640024398_418866.jpg'),
(6, 'leg', '', '1640024404_705190.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `gym_users`
--

CREATE TABLE `gym_users` (
  `id` int(11) NOT NULL,
  `days` varchar(40) NOT NULL,
  `room_num` varchar(40) NOT NULL,
  `bodypart` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `details` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gym_users`
--

INSERT INTO `gym_users` (`id`, `days`, `room_num`, `bodypart`, `email`, `username`, `details`) VALUES
(1, '9 days', '678', '', 'housnatamoindjie@gmail.com', 'Mondjie', 'edtfvgbhnj'),
(2, '9 days', '678', '', 'housnatamoindjie@gmail.com', 'Mondjie', 'edtfvgbhnj'),
(3, '9 days', '678', '', 'housnatamoindjie@gmail.com', 'Mondjie', 'edtfvgbhnj'),
(4, '10 days', '567', '', 'housnatamoindjie@gmail.com', 'Mondjie', 'cfvgbhnjmk'),
(5, '10 days', '567', '', 'housnatamoindjie@gmail.com', 'Mondjie', 'cfvgbhnjmk'),
(6, '10 days', '567', '', 'housnatamoindjie@gmail.com', 'Mondjie', 'cfvgbhnjmk'),
(7, '10 days', '567', '', 'housnatamoindjie@gmail.com', 'Mondjie', 'cfvgbhnjmk'),
(8, '9 days', '67', 'chest', 'housnatamoindjie@gmail.com', 'moindjie', 'ghbjk');

-- --------------------------------------------------------

--
-- Table structure for table `id_card_type`
--

CREATE TABLE `id_card_type` (
  `id_card_type_id` int(10) NOT NULL,
  `id_card_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `id_card_type`
--

INSERT INTO `id_card_type` (`id_card_type_id`, `id_card_type`) VALUES
(1, 'National Identity Card'),
(2, 'Voter Id Card'),
(3, 'Pan Card'),
(4, 'Driving License');

-- --------------------------------------------------------

--
-- Table structure for table `my_user`
--

CREATE TABLE `my_user` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(69) NOT NULL,
  `password` varchar(60) NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `my_user`
--

INSERT INTO `my_user` (`id`, `name`, `username`, `email`, `password`, `created`) VALUES
(1, 'Housnata moindjie', 'housna', 'housnatamoindjie@gmail.com', '$2y$10$0BY.gO81XQd2G54TXi0GIO4X470mM2bO.kkZyZEDjl3QOX2Udb.5K', '0000-00-00'),
(2, 'Housnata moindjie', 'housna', 'housnatamoindjie@gmail.com', '$2y$10$2RohYlIT3GsQwZdPkOfAb.KMzfz2D0lhTSCsfzc/c/sM8SHO0zDue', '0000-00-00'),
(3, 'Housnata moindjie', 'housna', 'housnatamoindjie@gmail.com', '$2y$10$3rDAMr3P.x1u5WDh5nqP3uEgumcUqk5vZdy1ronzPex/Nwjuy4rxa', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(10) NOT NULL,
  `room_type_id` int(10) NOT NULL,
  `room_no` varchar(10) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `check_in_status` tinyint(1) NOT NULL,
  `check_out_status` tinyint(1) NOT NULL,
  `deleteStatus` tinyint(1) DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `phone-number` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_type_id`, `room_no`, `status`, `check_in_status`, `check_out_status`, `deleteStatus`, `name`, `phone-number`) VALUES
(1, 2, 'A-101', NULL, 0, 0, 1, '', ''),
(2, 2, 'A-102', NULL, 0, 1, 0, '', ''),
(3, 3, 'A-103', 1, 1, 0, 0, '', ''),
(4, 4, 'A-104', NULL, 0, 1, 0, '', ''),
(5, 1, 'B-101', 1, 1, 0, 0, '', ''),
(6, 2, 'B-102', NULL, 0, 0, 1, '', ''),
(7, 3, 'B-103', 1, 0, 0, 0, '', ''),
(8, 4, 'B-104', NULL, 0, 0, 1, '', ''),
(9, 1, 'C-101', 1, 0, 1, 0, '', ''),
(10, 2, 'C-102', NULL, 0, 1, 0, '', ''),
(11, 3, 'C-103', NULL, 0, 0, 1, '', ''),
(12, 4, 'C-104', NULL, 0, 0, 0, '', ''),
(13, 4, 'D-101', NULL, 0, 1, 1, '', ''),
(14, 5, 'K-699', 1, 1, 0, 0, '', ''),
(15, 5, 'K-799', 1, 0, 0, 0, '', ''),
(16, 5, 'K-899', 1, 0, 0, 0, '', ''),
(17, 6, 'M-333', NULL, 0, 0, 0, '', ''),
(18, 6, 'M-444', NULL, 0, 0, 0, '', ''),
(19, 6, 'M-555', NULL, 0, 0, 0, '', ''),
(20, 9, 'P-696', NULL, 0, 0, 0, '', ''),
(21, 10, 'M-966', NULL, 0, 0, 0, '', ''),
(22, 10, 'M-869', NULL, 0, 1, 0, '', ''),
(23, 8, 'Z-666', NULL, 0, 0, 0, '', ''),
(24, 7, 'X-969', 1, 0, 0, 0, '', ''),
(25, 8, 'Z-111', 1, 0, 0, 0, '', ''),
(26, 6, 'M-135', NULL, 0, 0, 0, '', ''),
(27, 9, '23', NULL, 0, 0, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` text,
  `building_id` text,
  `details` text,
  `photo` text,
  `photos` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `building_id`, `details`, `photo`, `photos`) VALUES
(1, 'DELUXE KING', '2', 'At Deluxe king you can indulge yourself in a big luxurious bed to relieve your all day’s hustle and bustle. The rooms are well equipped with all the necessary amenities. The spacious bathroom is another great feature of this room.\r\n\r\n', 'uploads/1650584724-deluxe-04.jpeg', '[\"uploads/1650584724-deluxe-04.jpeg\"]'),
(2, 'DELUXE KING', '2', 'At Deluxe king you can indulge yourself in a big luxurious bed to relieve your all day’s hustle and bustle. The rooms are well equipped with all the necessary amenities. The spacious bathroom is another great feature of this room.\r\n\r\n', 'uploads/1650584725-deluxe-04.jpeg', '[\"uploads/1650584725-deluxe-04.jpeg\"]'),
(3, 'DELUXE KING', '2', 'At Deluxe king you can indulge yourself in a big luxurious bed to relieve your all day’s hustle and bustle. The rooms are well equipped with all the necessary amenities. The spacious bathroom is another great feature of this room.\r\n\r\n', 'uploads/1650584744-deluxe-04.jpeg', '[\"uploads/1650584744-deluxe-04.jpeg\"]');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `room_type_id` int(10) NOT NULL,
  `room_type` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `max_person` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`room_type_id`, `room_type`, `price`, `max_person`) VALUES
(1, 'Single', 1000, 1),
(2, 'Double', 1500, 2),
(3, 'Triple', 2000, 3),
(4, 'Family', 3000, 2),
(5, 'King Sized', 5500, 4),
(6, 'Master Suite', 6500, 6),
(7, 'Mini-Suite', 3600, 3),
(8, 'Connecting Rooms', 8000, 6),
(9, 'Presidential Suite', 21000, 4),
(10, 'Murphy Room', 6900, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_id` int(10) NOT NULL,
  `shift` varchar(100) NOT NULL,
  `shift_timing` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_id`, `shift`, `shift_timing`) VALUES
(1, 'Morning', '5:00 AM - 10:00 AM'),
(2, 'Day', '10:00 AM - 4:00PM'),
(3, 'Evening', '4:00 PM - 10:00 PM'),
(4, 'Night', '10:00PM - 5:00AM');

-- --------------------------------------------------------

--
-- Table structure for table `spaimage`
--

CREATE TABLE `spaimage` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `img_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spaimage`
--

INSERT INTO `spaimage` (`id`, `image`, `img_num`) VALUES
(17, '1637165982_521133.jpg', 1),
(18, '1637166049_169588.jpg', 2),
(20, '1637166099_304561.jpg', 4),
(21, '1637166121_356543.jpg', 5),
(22, '1637166152_324101.jpg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `spa_manager`
--

CREATE TABLE `spa_manager` (
  `id` int(11) NOT NULL,
  `datee` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `texteara` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spa_manager`
--

INSERT INTO `spa_manager` (`id`, `datee`, `email`, `username`, `password`, `phone_number`, `texteara`) VALUES
(1, '2021-11-23', 'housnatamoindjie@gmail.com', 'HUSNA', '$2y$10$bgjZso.xFGX4nKX7XRM6qumXEOfhYlefme8u4VD8YXB', '+8801640910153', 'HERE'),
(2, '2021-11-24', 'housnatamoindjie@gmail.com', 'housna', '$2y$10$O1w3GJb.5VhZd26kGD1gueRAFOzSFWZ3Lb270QJURwL', '+8801640910153', 'MEHERE'),
(3, '2021-11-24', 'housnatamoindjie@gmail.com', 'housna', '$2y$10$uWVWinkWkxl86.YdidmBW.hqPu/17wTi8YkB1UJBxma', '+8801640910153', 'MEHERE'),
(4, '2021-11-20', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$YU.EH9I08f0GF9VwO1wha.uQ6cVItcNfblFfGtz0dx9', '+8801640910153', 'i just need r'),
(5, '2021-11-25', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$x3SE/QmcEdhfd85CwUTZAOIR33rTv8LHJNyaoZI75g2', '+8801640910153', 'i just need r'),
(6, '2021-11-25', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$i8FXP8TUX5aBno2alkkKTuzLJl64fz2XisIYny6IrlC', '+8801640910153', 'i just need r'),
(7, '2021-11-25', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$Q05Fq0odueeC7udaiyiyvOIg3DCygVPr3c9IUyrJgZ8', '+8801640910153', 'i just need r'),
(8, '2021-11-25', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$I6CoM/bjAWmzIjyioDklKO9BDYO5eQlb3MsT8VqWeqw', '+8801640910153', 'i just need r'),
(9, '2021-11-25', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$8G7BMfZ37CnL/1BJTb2K.euVVt4orxGwpjs9Hv4zzo0', '+8801640910153', 'i just need r'),
(10, '2021-11-25', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$8G7BMfZ37CnL/1BJTb2K.euVVt4orxGwpjs9Hv4zzo0', '+8801640910153', 'i just need r'),
(11, '2021-11-25', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$7quI3c3J8Gustxih4oVQ8eXfkyzAY4s5/YrIRQ5ejfH', '+8801640910153', 'i just need r'),
(12, '2021-11-25', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$7quI3c3J8Gustxih4oVQ8eXfkyzAY4s5/YrIRQ5ejfH', '+8801640910153', 'i just need r'),
(13, '2021-11-20', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$ByaLjSX8QfzdvZFcdG/xiugLkuq.cWOvjy1ol6VOO.q', '+8801640910153', 'i just need r'),
(14, '2021-11-20', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$ByaLjSX8QfzdvZFcdG/xiugLkuq.cWOvjy1ol6VOO.q', '+8801640910153', 'i just need r'),
(15, '2021-11-18', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$97wE6I9xLiT2vgWRhkQWt.xP7Li.Ym8JMs0i6uafAfG', '+8801640910153', 'i just need r'),
(16, '2021-11-18', 'housnatamoindjie@gmail.com', 'housnatamoindjie@gmail.com', '$2y$10$97wE6I9xLiT2vgWRhkQWt.xP7Li.Ym8JMs0i6uafAfG', '+8801640910153', 'i just need r'),
(17, '2021-11-06', 'housnamoindjie@outlook.com', 'housnatamoindjie@gmail.com', '$2y$10$57PrP34lCEq6/mG1MSJ7V.lRQokb/0Dy5qHhC/e5j/X', '+8801640910153', 'MEHERE'),
(18, '2021-11-06', 'housnamoindjie@outlook.com', 'housnatamoindjie@gmail.com', '$2y$10$57PrP34lCEq6/mG1MSJ7V.lRQokb/0Dy5qHhC/e5j/X', '+8801640910153', 'MEHERE'),
(19, '0000-00-00', '', '', '$2y$10$UpEoNWOTiPKLWU9mK6CS3ukBiiyoIbLR4iQB.qcEvxX', '', ''),
(20, '0000-00-00', '', '', '$2y$10$UpEoNWOTiPKLWU9mK6CS3ukBiiyoIbLR4iQB.qcEvxX', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `staff_type_id` int(11) NOT NULL,
  `shift_id` int(11) NOT NULL,
  `id_card_type` int(11) NOT NULL,
  `id_card_no` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `salary` bigint(20) NOT NULL,
  `joining_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`emp_id`, `emp_name`, `staff_type_id`, `shift_id`, `id_card_type`, `id_card_no`, `address`, `contact_no`, `salary`, `joining_date`, `updated_at`) VALUES
(1, 'Joseph Bow', 1, 3, 1, '422510099122', '4516 Spruce Drive\n', 3479454777, 21000, '2020-11-13 05:39:06', '2021-04-08 17:36:16'),
(2, 'Cleta Landon', 3, 3, 1, '422510099122', '2555 Hillside Drive', 1479994500, 12500, '2021-04-07 20:21:00', '2021-04-08 17:36:23'),
(3, 'Gerald White', 2, 3, 1, '422510099122', 'Ap #897-1459 Quam Avenue', 976543111, 25000, '2019-11-13 05:40:18', '2021-04-08 17:36:27'),
(4, 'Frank J. Welch', 2, 3, 2, '0', '2272 Sun Valley Road\n', 7451112450, 31000, '2017-11-13 05:40:55', '2021-04-08 17:36:33'),
(5, 'Gary Johnson', 4, 1, 1, '12345341212', '458 Chandler Drive\n', 4578884500, 28000, '2018-11-13 05:41:31', '2021-04-08 17:36:42'),
(6, 'Miguel M. Miller', 3, 3, 3, '0', 'Ap #897-1459 Quam Avenue', 8520000000, 40000, '2017-11-13 05:42:03', '2021-04-08 17:36:47'),
(7, 'Clement L. Brainerd\n', 2, 2, 1, '422510099122', '4381 Gateway Road\n', 4547778450, 40000, '2017-11-13 05:42:35', '2021-04-08 17:36:51'),
(8, 'Randall Leclair', 1, 1, 4, '0', '1724 Round Table Drive\n', 1457845554, 15000, '2020-11-13 05:43:13', '2021-04-08 17:36:56'),
(9, 'Fredrick A. Wile', 3, 2, 4, '0', '3431 Joyce Street\n', 7145554500, 20000, '2020-11-13 05:43:49', '2021-04-08 17:36:59'),
(10, 'Brent Tatro', 5, 2, 1, '422510099122', '1616 Coventry Court\n', 3475468569, 24000, '2019-11-13 06:30:45', '2021-04-08 17:37:07'),
(11, 'Charles Miller', 3, 2, 1, '0', '382 Byers Lane\n', 7869696969, 20000, '2019-11-18 07:04:03', '2021-04-08 17:37:10'),
(12, 'John Doe', 2, 1, 4, 'AD69 14579500002', '3714  Duffy Street', 1475550036, 13500, '2021-04-08 17:54:22', '2021-04-08 17:54:22'),
(13, 'Brent Dixon', 9, 2, 1, '457854555012', '1821 Harry Place', 7457778560, 65500, '2021-04-09 08:35:27', '2021-04-09 08:35:27'),
(14, 'Housnata moindjie moindjie', 1, 4, 4, '1234567890 567890', 'BOARD BAZAR iut, iu, iut', 1640910153, 1234, '2021-11-23 14:35:28', '2021-11-23 14:35:28'),
(15, 'Khalid camara camara', 3, 2, 1, '123456789053', 'BOARD BAZAR', 1987543789, 2457, '2021-11-23 14:38:33', '2021-11-23 14:38:33'),
(16, 'Halime Said', 2, 3, 3, '1234567890321', 'BOARD BAZAR gazipur', 1640910153, 12345678, '2021-11-23 14:40:38', '2021-11-23 14:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `staff_type`
--

CREATE TABLE `staff_type` (
  `staff_type_id` int(10) NOT NULL,
  `staff_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_type`
--

INSERT INTO `staff_type` (`staff_type_id`, `staff_type`) VALUES
(1, 'Manager'),
(2, 'Housekeeping Manager'),
(3, 'Front Desk Receptionist'),
(4, 'Cheif'),
(5, 'Waiter'),
(6, 'Room Attendant'),
(7, 'Concierge'),
(8, 'Hotel Maintenance Engineer'),
(9, 'Hotel Sales Manager');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `email`, `password`, `created`) VALUES
(2, 'Christinea', 'christinea', 'christine@gmail.com', '$2y$10$Vjyzj5QNReEPs4FB2.AKduxvfK.743uvI0PuGKGdIqcxA7rL80Be6', '2015-11-12 12:49:22'),
(3, 'Housnata', 'iut cse', 'housnatamoindjie@gmail.com', '$2y$10$Vjyzj5QNReEPs4FB2.AKduxvfK.743uvI0PuGKGdIqcxA7rL80Be6', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addroom`
--
ALTER TABLE `addroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_image`
--
ALTER TABLE `car_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_carmodel`
--
ALTER TABLE `category_carmodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `customer_id_type` (`id_card_type_id`);

--
-- Indexes for table `dinning_user`
--
ALTER TABLE `dinning_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emp_history`
--
ALTER TABLE `emp_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `shift_id` (`shift_id`);

--
-- Indexes for table `gym_images`
--
ALTER TABLE `gym_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gym_users`
--
ALTER TABLE `gym_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `id_card_type`
--
ALTER TABLE `id_card_type`
  ADD PRIMARY KEY (`id_card_type_id`);

--
-- Indexes for table `my_user`
--
ALTER TABLE `my_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`room_type_id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_id`);

--
-- Indexes for table `spaimage`
--
ALTER TABLE `spaimage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spa_manager`
--
ALTER TABLE `spa_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `id_card_type` (`id_card_type`),
  ADD KEY `shift_id` (`shift_id`),
  ADD KEY `staff_type_id` (`staff_type_id`);

--
-- Indexes for table `staff_type`
--
ALTER TABLE `staff_type`
  ADD PRIMARY KEY (`staff_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addroom`
--
ALTER TABLE `addroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `car_image`
--
ALTER TABLE `car_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_carmodel`
--
ALTER TABLE `category_carmodel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `dinning_user`
--
ALTER TABLE `dinning_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `emp_history`
--
ALTER TABLE `emp_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `gym_images`
--
ALTER TABLE `gym_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gym_users`
--
ALTER TABLE `gym_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `id_card_type`
--
ALTER TABLE `id_card_type`
  MODIFY `id_card_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `my_user`
--
ALTER TABLE `my_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_type`
--
ALTER TABLE `room_type`
  MODIFY `room_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shift`
--
ALTER TABLE `shift`
  MODIFY `shift_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `spaimage`
--
ALTER TABLE `spaimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `spa_manager`
--
ALTER TABLE `spa_manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `staff_type`
--
ALTER TABLE `staff_type`
  MODIFY `staff_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`id_card_type_id`) REFERENCES `id_card_type` (`id_card_type_id`);

--
-- Constraints for table `emp_history`
--
ALTER TABLE `emp_history`
  ADD CONSTRAINT `emp_history_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `staff` (`emp_id`),
  ADD CONSTRAINT `emp_history_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`id_card_type`) REFERENCES `id_card_type` (`id_card_type_id`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`),
  ADD CONSTRAINT `staff_ibfk_3` FOREIGN KEY (`staff_type_id`) REFERENCES `staff_type` (`staff_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
