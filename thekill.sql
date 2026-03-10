-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2026 at 03:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thekill`
--

-- --------------------------------------------------------

--
-- Table structure for table `foodmenu`
--

CREATE TABLE `foodmenu` (
  `FoodID` int(11) NOT NULL,
  `FoodName` varchar(20) DEFAULT NULL,
  `Price` int(6) DEFAULT NULL,
  `Amount` int(6) DEFAULT NULL,
  `ShopID` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foodmenu`
--

INSERT INTO `foodmenu` (`FoodID`, `FoodName`, `Price`, `Amount`, `ShopID`) VALUES
(7, 'ก๋วยเตี๋ยวหมูน้ำตก', 40, 2, 101),
(8, 'ก๋วยเตี๋ยวน้ำใส', 60, 13, 101),
(10, 'ข้าวผัดกุ้ง', 35, 12, 102),
(11, 'สเต็กไก่', 55, 18, 103),
(12, 'สเต็กปลา', 35, 0, 103),
(13, 'ก๋วยเตี๋ยวไก่', 40, 8, 101),
(15, 'สเต็กเนื้อ', 60, 7, 103),
(17, 'สเต็กหมู', 60, 9, 103);

-- --------------------------------------------------------

--
-- Table structure for table `orderss`
--

CREATE TABLE `orderss` (
  `OrderID` int(11) NOT NULL,
  `UserID` int(6) NOT NULL,
  `ShopID` int(6) DEFAULT NULL,
  `FoodID` int(6) DEFAULT NULL,
  `Dates` varchar(20) DEFAULT NULL,
  `OrderQuantity` int(6) DEFAULT NULL,
  `TotalAmount` int(6) DEFAULT NULL,
  `TotalPriceIncluded` int(6) DEFAULT NULL,
  `Status` varchar(20) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderss`
--

INSERT INTO `orderss` (`OrderID`, `UserID`, `ShopID`, `FoodID`, `Dates`, `OrderQuantity`, `TotalAmount`, `TotalPriceIncluded`, `Status`) VALUES
(1, 23, 101, NULL, '1744984039', NULL, NULL, 40, 'pending'),
(2, 32, 101, NULL, '1744294969', NULL, NULL, 240, 'pending'),
(9, 32, 102, 10, '1745148387', 5, 5, 175, 'pending'),
(10, 5, 101, 8, '1773068171', 3, 3, 180, 'completed'),
(11, 5, 102, 10, '1773068286', 1, 1, 35, 'pending'),
(12, 6, 101, 8, '1773068425', 1, 1, 60, 'completed'),
(13, 5, 101, 8, '1773068789', 2, 2, 120, 'pending'),
(14, 5, 101, 8, '1773068801', 2, 2, 120, 'pending'),
(15, 5, 101, 8, '1773069038', 1, 1, 60, 'pending'),
(16, 5, 101, 7, '1773069620', 1, 1, 40, 'pending'),
(17, 5, 102, 10, '1773069654', 1, 1, 35, 'pending'),
(18, 5, 103, 12, '1773069662', 1, 1, 35, 'completed'),
(19, 5, 103, 11, '1773069669', 1, 1, 55, 'completed'),
(20, 87, 101, 8, '1773071583', 2, 2, 120, 'pending'),
(21, 5, 101, 7, '1773071836', 3, 3, 120, 'completed'),
(22, 5, 101, 8, '1773071836', 1, 1, 60, 'completed'),
(23, 5, 101, 13, '1773071836', 2, 2, 80, 'completed'),
(24, 5, 103, 12, '1773072207', 9, 9, 315, 'completed'),
(25, 5, 103, 11, '1773072250', 1, 1, 55, 'completed'),
(26, 5, 103, 15, '1773072250', 3, 3, 180, 'completed'),
(27, 5, 103, 17, '1773153022', 1, 1, 60, 'completed'),
(28, 5, 101, 8, '1773153332', 1, 1, 60, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `ShopID` int(6) NOT NULL,
  `ShopName` varchar(20) DEFAULT NULL,
  `PassWord` varchar(50) DEFAULT NULL,
  `Tel` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`ShopID`, `ShopName`, `PassWord`, `Tel`) VALUES
(101, 'ร้านก๋วยเตี๋ยว', 'noodle456', 823456789),
(102, 'ร้านข้าว', 'rice789', 834567890),
(103, 'ร้านสเต็ก', 'steak101', 845678901);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `PassWord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Name`, `PassWord`) VALUES
(5, 'Jo', '$2y$10$Hl4fVE.BXJulUpBM1BJth.AeQ9xjKGX9tfkCkQ6OAqVR/Ef79vFxi'),
(6, 'KL', '$2y$10$M0HIF3JlYqu2sV1tG9fmceWRu1WQTeyWspYzfpiyYwRc8/39XF/9K'),
(9, 'io', '$2y$10$h17iYay8fuEC8OotCE5Cj.kEA//hBPz4DjMenFUPI579A8FDaSoZe'),
(23, 'p', '$2y$10$V6urwvztVdLxlrt08EzVP.EUZ1gVjEoH8H.R7tETInCSSD3gMmR5K'),
(32, 'kof', '$2y$10$J.8OrUS81BXcaVRqeIE2KeKU7/rn93Ialolk0QJMkRtjyFQ5XQL0W'),
(33, 'l', '$2y$10$kbhdQONl7.wOg0vTgzYVNeR9mfekz2oryNJhJOs4Q/igsVrc0QIN6'),
(45, 'kop', '$2y$10$I82o1v.2UWIbeZG.YWTIDeJSuSW96fzxomTwcRlcoh1Q4FoCI3wAS'),
(78, 'Pop', '$2y$10$hVwC1/2DSr0EEuGteM1wwuxygwPD4/lLBJNAuPApwC52yifVV7scC'),
(87, 'o', '$2y$10$3Leuj8f39yRkPTsL9iAaMuQmebs8ekYASkYqdmq11EyrGsAOFojGC'),
(1234, 'lol', '$2y$10$PubeJc2oMbV4hPql/CpnpefNMV/Y0cRFROU06a1mxo8zZp4vywaDu'),
(1619, 'oplo', '$2y$10$GHXBAR7579CFf9PjfWcw0.EZ1hhr.fqrxcGtITc3gCRzgHMjYnP4m');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foodmenu`
--
ALTER TABLE `foodmenu`
  ADD PRIMARY KEY (`FoodID`),
  ADD KEY `ShopID` (`ShopID`);

--
-- Indexes for table `orderss`
--
ALTER TABLE `orderss`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ShopID` (`ShopID`),
  ADD KEY `FoodID` (`FoodID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`ShopID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodmenu`
--
ALTER TABLE `foodmenu`
  MODIFY `FoodID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orderss`
--
ALTER TABLE `orderss`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foodmenu`
--
ALTER TABLE `foodmenu`
  ADD CONSTRAINT `foodmenu_ibfk_1` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`);

--
-- Constraints for table `orderss`
--
ALTER TABLE `orderss`
  ADD CONSTRAINT `orderss_ibfk_1` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`),
  ADD CONSTRAINT `orderss_ibfk_2` FOREIGN KEY (`FoodID`) REFERENCES `foodmenu` (`FoodID`),
  ADD CONSTRAINT `orderss_ibfk_3` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
