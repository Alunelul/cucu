-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2019 at 12:10 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_theatre`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked_tickets`
--

CREATE TABLE `booked_tickets` (
  `ticket_no` int(11) NOT NULL,
  `show_id` int(11) NOT NULL,
  `seat_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `halls`
--

CREATE TABLE `halls` (
  `hall_id` int(11) NOT NULL,
  `class` varchar(10) NOT NULL,
  `no_of_seats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `halls`
--

INSERT INTO `halls` (`hall_id`, `class`, `no_of_seats`) VALUES
(1, 'gold', 35),
(1, 'standard', 75),
(2, 'gold', 27),
(2, 'standard', 97),
(3, 'gold', 26),
(3, 'standard', 98);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `movie_name` varchar(40) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `show_start` date DEFAULT NULL,
  `show_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `movie_name`, `length`, `language`, `show_start`, `show_end`) VALUES
(598853639, 'Piratii din Caraibe 1', 2, 'engleza', '2019-05-01', '2019-05-30'),
(701534034, 'Tunurile din Navarone', 1, 'engleza', '2019-05-02', '2019-06-05'),
(1755000589, 'Titanic', 2, 'engleza', '2019-05-03', '2019-06-03');

-- --------------------------------------------------------

--
-- Table structure for table `price_listing`
--

CREATE TABLE `price_listing` (
  `price_id` int(11) NOT NULL,
  `type` varchar(3) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `price_listing`
--

INSERT INTO `price_listing` (`price_id`, `type`, `day`, `price`) VALUES
(1, '2D', 'Monday', 210),
(2, '3D', 'Monday', 295),
(3, '4DX', 'Monday', 380),
(4, '2D', 'Tuesday', 210),
(5, '3D', 'Tuesday', 295),
(6, '4DX', 'Tuesday', 380),
(7, '2D', 'Wednesday', 210),
(8, '3D', 'Wednesday', 295),
(9, '4DX', 'Wednesday', 380),
(10, '2D', 'Thursday', 210),
(11, '3D', 'Thursday', 295),
(12, '4DX', 'Thursday', 380),
(13, '2D', 'Friday', 320),
(14, '3D', 'Friday', 335),
(15, '4DX', 'Friday', 495),
(16, '2D', 'Saturday', 320),
(17, '3D', 'Saturday', 335),
(18, '4DX', 'Saturday', 495),
(19, '2D', 'Sunday', 15),
(20, '3D', 'Sunday', 335),
(21, '4DX', 'Sunday', 495);

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `show_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `hall_id` int(11) DEFAULT NULL,
  `type` varchar(3) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `price_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`show_id`, `movie_id`, `hall_id`, `type`, `time`, `Date`, `price_id`) VALUES
(1162759741, 1755000589, 3, '2D', 1430, '2019-05-03', NULL),
(1264800267, 598853639, 1, '2D', 1300, '2019-05-01', NULL),
(1828302762, 701534034, 2, '2D', 1845, '2019-05-02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `movie_id` int(11) NOT NULL,
  `type1` varchar(3) DEFAULT NULL,
  `type2` varchar(3) DEFAULT NULL,
  `type3` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`movie_id`, `type1`, `type2`, `type3`) VALUES
(598853639, '2D', 'NUL', 'NUL'),
(701534034, '2D', 'NUL', 'NUL'),
(1755000589, '2D', 'NUL', 'NUL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked_tickets`
--
ALTER TABLE `booked_tickets`
  ADD PRIMARY KEY (`ticket_no`,`show_id`),
  ADD KEY `show_id` (`show_id`);

--
-- Indexes for table `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`hall_id`,`class`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `price_listing`
--
ALTER TABLE `price_listing`
  ADD PRIMARY KEY (`price_id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`show_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `hall_id` (`hall_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`movie_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booked_tickets`
--
ALTER TABLE `booked_tickets`
  ADD CONSTRAINT `booked_tickets_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`) ON DELETE CASCADE;

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `halls` (`hall_id`),
  ADD CONSTRAINT `shows_ibfk_3` FOREIGN KEY (`price_id`) REFERENCES `price_listing` (`price_id`) ON UPDATE CASCADE;

--
-- Constraints for table `types`
--
ALTER TABLE `types`
  ADD CONSTRAINT `types_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
