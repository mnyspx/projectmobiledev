-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 04:04 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `camp`
--

-- --------------------------------------------------------

--
-- Table structure for table `campreserve`
--

CREATE TABLE `campreserve` (
  `Camp_res_ID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `CampID` int(11) DEFAULT NULL,
  `reserveTime` datetime NOT NULL DEFAULT current_timestamp(),
  `firstDate` date NOT NULL,
  `lastDate` date NOT NULL,
  `Day` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `campreserve`
--

INSERT INTO `campreserve` (`Camp_res_ID`, `UserID`, `CampID`, `reserveTime`, `firstDate`, `lastDate`, `Day`, `status`) VALUES
(2, 1, 1, '2020-12-08 23:54:22', '0000-00-00', '0000-00-00', 1, 0),
(3, 3, 3, '2020-10-07 09:35:12', '2020-12-08', '2020-12-08', 0, 0),
(5, 7, 3, '2020-12-08 23:54:22', '2020-12-08', '2020-12-18', 10, 1),
(8, 1, 3, '2020-12-09 03:51:19', '2020-12-09', '2020-12-17', 0, 1),
(9, 7, 5, '2020-12-09 03:51:19', '2020-12-03', '2020-12-10', 0, 1),
(10, 8, 5, '2020-12-09 03:51:43', '0000-00-00', '0000-00-00', 0, 0),
(11, 1, 1, '2020-12-09 03:52:25', '2020-12-10', '2020-12-11', 1, 2),
(12, 8, 5, '2020-12-09 03:52:25', '2020-12-03', '2020-12-10', 1, 0),
(13, 7, 5, '2020-12-09 03:52:48', '2020-12-09', '2020-12-11', 1, 1),
(14, 7, 5, '2020-12-09 03:52:48', '2020-12-03', '2020-12-10', 1, 1),
(15, 8, 3, '2020-12-09 06:04:00', '2020-12-09', '2020-12-17', 5, 2),
(16, 8, 5, '2020-12-09 06:04:00', '2020-12-03', '2020-12-10', 7, 2),
(17, 1, 1, '2020-12-09 16:33:02', '0000-00-00', '0000-00-00', 1, 0),
(18, 3, 3, '2020-12-09 18:27:41', '2020-12-09', '2020-12-31', 22, 0),
(19, 3, 1, '2020-12-09 18:49:45', '2020-12-09', '2020-12-09', 0, 2),
(20, 3, 3, '2020-12-09 21:17:02', '2020-12-09', '2020-12-18', 9, 1),
(21, 8, 12, '2020-12-09 22:58:08', '2020-12-17', '2020-12-24', 7, 0),
(22, 7, 10, '2020-12-10 00:53:37', '2020-12-09', '2020-12-17', 5, 1),
(23, 3, 14, '2020-12-10 01:12:24', '2020-12-10', '2020-12-18', 8, 0),
(24, 11, 1, '2020-12-10 14:53:56', '2020-12-10', '2020-12-18', 8, 0),
(25, 3, 15, '2020-12-10 14:54:45', '2020-12-10', '2020-12-11', 1, 0),
(26, 11, 14, '2020-12-10 15:00:45', '2020-12-10', '2020-12-10', 0, 1),
(27, 11, 12, '2020-12-10 15:00:50', '2020-12-10', '2020-12-10', 0, 1),
(28, 8, 15, '2020-12-10 15:01:08', '2020-12-10', '2020-12-10', 0, 2),
(29, 9, 15, '2020-12-10 15:01:27', '2020-12-10', '2020-12-10', 0, 2),
(30, 11, 10, '2020-12-10 15:02:52', '2020-12-10', '2020-12-10', 0, 1),
(31, 3, 5, '2020-12-10 15:42:47', '2020-12-10', '2020-12-12', 2, 1),
(32, 3, 15, '2020-12-10 15:44:13', '2020-12-10', '2020-12-17', 7, 1),
(33, 9, 16, '2020-12-10 15:49:33', '2020-12-10', '2020-12-10', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `campsite`
--

CREATE TABLE `campsite` (
  `CampID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `place` int(11) DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `statusService` tinyint(4) NOT NULL DEFAULT 1,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `campsite`
--

INSERT INTO `campsite` (`CampID`, `Name`, `image`, `Description`, `contact`, `price`, `place`, `location`, `statusService`, `UserID`) VALUES
(1, 'camp 1 camp', '30.jpg', '1 lorem', '000000000', 100, 5, '1', 0, 3),
(3, 'qwerty 2234 ws camp', '33.jpg', '2 Lorem ipsum ', '00000000zz', 200, 6, 'asds', 0, 1),
(5, 'qwerty camp', '34.jpg', '3 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nec dui eu dui consequat vehicula id at enim. Ut tempus vel nisi id facilisis. Morbi dignissim orci diam, in sodales ex porta sed. Morbi posuere mauris vitae tellus elementum porttitor. Nullam lorem odio, scelerisque vitae tristique in, ullamcorper sed lectus. Maecenas eu vulputate est. Quisque congue, erat quis feugiat sollicitudin, nisl purus maximus velit, a rutrum magna velit sit amet magna. Curabitur sed neque et neque commodo mattis eu a ante. Etiam molestie dui nibh, eget suscipit lacus venenatis eu. Nulla facilisi. Sed dapibus nibh eget lectus bibendum, ac tincidunt eros aliquam. Nam commodo luctus molestie.\r\n\r\nUt consequat tempus diam, eget efficitur massa. Etiam auctor felis et ultricies viverra. Donec placerat ornare scelerisque. Phasellus at laoreet est. Vestibulum sed enim erat. Mauris lobortis, ipsum eu vehicula ultrices, lacus ligula tincidunt ligula, in condimentum nisl nisi vel sem. Vivamus eu quam turpis. Nulla odio purus, ultrices vitae orci eget, vestibulum fringilla tellus. Maecenas nec lectus vitae sem dignissim fermentum nec sit amet velit. Nulla in auctor est. Integer eget volutpat mauris, quis bibendum mauris. Cras dictum molestie egestas. Quisque ac eros nunc.\r\n\r\nDuis ac massa egestas, sollicitudin est varius, blandit lacus. Nam vitae est vitae lacus ultrices condimentum et pharetra diam. Proin porta, ex ut maximus tincidunt, nunc leo gravida urna, sed gravida neque mauris et orci. Curabitur at nisi a dolor auctor facilisis ac imperdiet nisi. Sed nec nunc efficitur, dictum tellus vitae, iaculis massa. Nulla in ullamcorper neque. Donec at quam id lacus vehicula tincidunt.\r\n\r\nCurabitur lorem ligula, tempus porttitor eros quis, blandit suscipit diam. Praesent rutrum malesuada odio sed faucibus. Fusce bibendum posuere urna a molestie. Fusce velit libero, ullamcorper porttitor leo sed, fermentum pellentesque sapien. Phasellus pharetra justo lacus, in congue odio pharetra sagittis. Aliquam tempor massa vel odio congue ornare. Aliquam non purus ut nunc hendrerit efficitur. Quisque consequat vulputate orci in accumsan. Etiam laoreet suscipit odio at maximus.\r\n\r\nMorbi euismod ante orci, id ultricies quam accumsan quis. Suspendisse facilisis risus elit, eget suscipit ligula fringilla vel. Integer ultricies arcu diam, et elementum sapien lacinia quis. Donec pharetra nisl et enim maximus, sed maximus massa laoreet. Cras ornare cursus mi. Vivamus sem augue, euismod a felis eget, imperdiet tempor purus. Ut vel aliquam nulla, sed iaculis neque. Proin sagittis neque vitae velit accumsan, nec dignissim nisi luctus. Mauris vulputate, felis quis eleifend vulputate, nisi turpis ullamcorper ex, sit amet scelerisque libero arcu ut dolor. Sed blandit vehicula lacus sed cursus. Nulla in ex arcu.', 'google', 200, 7, '23', 0, 1),
(10, 'edit 3', '30.jpg', 'description edit 2', '00000001e', 299, 9, '2 edit', 0, 9),
(12, 'tttt', '08.jpg', 'description', '00000asda', 200, NULL, 'location', 1, 1),
(13, 'test add 1', '03.jpg', 'test add tent', ' facebook', 149, NULL, 'tent test', 1, 3),
(14, 'test request', '03.jpg', 'request1', 'resuest', 300, NULL, 'request', 1, 8),
(15, 'test add c', '34.jpg', 'aweasdzfbssvfs', '34064fgg', 500, NULL, 'vsgdvs', 0, 11),
(16, '7898', '30.jpg', '789', '789', 789, NULL, '789', 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `InvoiceID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Tent_Charge` int(11) DEFAULT NULL,
  `Camp_Charge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reserve`
--

CREATE TABLE `reserve` (
  `resID` int(11) NOT NULL,
  `serviceID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `reserveTime` datetime NOT NULL DEFAULT current_timestamp(),
  `firstDate` date NOT NULL,
  `lastDate` date NOT NULL,
  `Day` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reserve`
--

INSERT INTO `reserve` (`resID`, `serviceID`, `UserID`, `reserveTime`, `firstDate`, `lastDate`, `Day`, `status`) VALUES
(1, 4, 3, '2020-12-09 16:17:22', '2020-12-09', '2020-12-11', 5, 1),
(2, 3, 3, '2020-12-09 16:17:22', '2020-12-03', '2020-12-10', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `contact` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `scort` tinyint(4) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`ID`, `Name`, `image`, `Description`, `contact`, `price`, `location`, `scort`, `UserID`) VALUES
(3, 'tent', '02.jpg', 'desc', 'cont', 100, 'non', 1, 3),
(4, 'camp', '30.jpg', 'desc', 'contact', 230, 'non', 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tent`
--

CREATE TABLE `tent` (
  `TentID` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tent`
--

INSERT INTO `tent` (`TentID`, `Name`, `image`, `Description`, `contact`, `price`, `location`, `UserID`) VALUES
(2, 'tent 1 test query', 'none img', 'none desc', '00000001', 300, NULL, 3),
(3, 'test 02', 'none img', 'none desc', '111111111', 600, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tentreserve`
--

CREATE TABLE `tentreserve` (
  `Tent_res_ID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `TentID` int(11) DEFAULT NULL,
  `reserveTime` date NOT NULL DEFAULT current_timestamp(),
  `firstDate` date NOT NULL DEFAULT current_timestamp(),
  `lastDate` date NOT NULL DEFAULT current_timestamp(),
  `Day` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tentreserve`
--

INSERT INTO `tentreserve` (`Tent_res_ID`, `UserID`, `TentID`, `reserveTime`, `firstDate`, `lastDate`, `Day`, `status`) VALUES
(3, 3, 2, '2020-12-08', '2020-12-06', '2020-12-06', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `username`, `password`, `image`, `Email`, `FullName`, `Phone`) VALUES
(1, 'test', '1234', NULL, NULL, NULL, NULL),
(3, 'qwerty', '$2b$10$I/Hg1VCWqSBPZsEPs3sUWOot2qKnVOdkZNp.U8gn3FfofE2DfUtKu', NULL, 'asd@adasas.com', 'asss qweqrtt', '00000000'),
(7, 'user1	', '$2b$10$z6tASo/omYV2MmqzQ/IZ/uGTiBhctLbI5j04yTa3V70Z.meaT010G', NULL, 'email@email.com	', 'user username', '1234567890'),
(8, 'user2', '$2b$10$TJgMK0WNOA.6uz/9EbPBUOUGDymRnABBjRqxSQ6wEA0mZ.jpGFvsy', NULL, 'asd@adasas.com', 'asss qweqrtt', '00000001'),
(9, 'user3', '$2b$10$G0v9gBvUV0QHfU9vRWnUBO5XcR0XpCZzN0xpqMqRrJP2vh3k2kf5e', NULL, 'asd@adasas.com', 'asss qweqrtt', '00000001'),
(10, 'user4', '$2b$10$i9QeytO9Ji3i8ilSruxXjubRb.ExzdOHqD1JRCaaJnE3ris2dP2ga', NULL, 'user4@email.com', 'user4 user4', '0987654321'),
(11, 'user6', '$2b$10$msAWb/TKrZrWuPCWkW8S4ekLE4OCPR.mlVrW8QofykGu47rl5FxvS', NULL, 'user6@email.com', 'user 6 udrt 6', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `ID` int(11) NOT NULL,
  `zoneName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CampID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`ID`, `zoneName`, `CampID`) VALUES
(5, 'z1', 1),
(6, 'z2', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campreserve`
--
ALTER TABLE `campreserve`
  ADD PRIMARY KEY (`Camp_res_ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `CampID` (`CampID`);

--
-- Indexes for table `campsite`
--
ALTER TABLE `campsite`
  ADD PRIMARY KEY (`CampID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `reserve`
--
ALTER TABLE `reserve`
  ADD PRIMARY KEY (`resID`),
  ADD KEY `serviceID` (`serviceID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `tent`
--
ALTER TABLE `tent`
  ADD PRIMARY KEY (`TentID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `tentreserve`
--
ALTER TABLE `tentreserve`
  ADD PRIMARY KEY (`Tent_res_ID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `TentID` (`TentID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CampID` (`CampID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campreserve`
--
ALTER TABLE `campreserve`
  MODIFY `Camp_res_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `campsite`
--
ALTER TABLE `campsite`
  MODIFY `CampID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reserve`
--
ALTER TABLE `reserve`
  MODIFY `resID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tent`
--
ALTER TABLE `tent`
  MODIFY `TentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tentreserve`
--
ALTER TABLE `tentreserve`
  MODIFY `Tent_res_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `campreserve`
--
ALTER TABLE `campreserve`
  ADD CONSTRAINT `campreserve_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `campreserve_ibfk_2` FOREIGN KEY (`CampID`) REFERENCES `campsite` (`CampID`);

--
-- Constraints for table `campsite`
--
ALTER TABLE `campsite`
  ADD CONSTRAINT `campsite_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `reserve_ibfk_1` FOREIGN KEY (`serviceID`) REFERENCES `service` (`ID`),
  ADD CONSTRAINT `reserve_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `tent`
--
ALTER TABLE `tent`
  ADD CONSTRAINT `tent_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `tentreserve`
--
ALTER TABLE `tentreserve`
  ADD CONSTRAINT `tentreserve_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `tentreserve_ibfk_2` FOREIGN KEY (`TentID`) REFERENCES `tent` (`TentID`);

--
-- Constraints for table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`CampID`) REFERENCES `campsite` (`CampID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
