-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2019 at 02:36 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soccer`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `PNo` int(10) NOT NULL,
  `Team` varchar(100) NOT NULL,
  `GId` int(10) NOT NULL,
  `CardType` varchar(6) NOT NULL,
  `CardTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `card`:
--   `PNo`
--       `player` -> `PNo`
--   `Team`
--       `game` -> `Team1`
--   `Team`
--       `game` -> `Team2`
--   `GId`
--       `game` -> `GId`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `Cid` int(11) NOT NULL,
  `CName` varchar(100) NOT NULL,
  `Confederation` varchar(8) NOT NULL,
  `Continent` varchar(50) NOT NULL,
  `Population` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `country`:
--

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `GId` int(10) NOT NULL,
  `GType` varchar(50) NOT NULL,
  `GDate` date NOT NULL,
  `SName` varchar(100) NOT NULL,
  `Team1` varchar(100) NOT NULL,
  `Team2` varchar(100) NOT NULL,
  `Score1` int(10) NOT NULL,
  `Score2` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `game`:
--   `SName`
--       `stadium` -> `SName`
--   `Team1`
--       `country` -> `CName`
--   `Team2`
--       `country` -> `CName`
--

-- --------------------------------------------------------

--
-- Table structure for table `goal`
--

CREATE TABLE `goal` (
  `PNo` int(10) NOT NULL,
  `Team` varchar(100) NOT NULL,
  `GId` int(10) NOT NULL,
  `GoalType` varchar(2) NOT NULL,
  `GoalTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `goal`:
--   `PNo`
--       `player` -> `PNo`
--   `Team`
--       `game` -> `Team1`
--   `Team`
--       `game` -> `Team2`
--   `GId`
--       `game` -> `GId`
--

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `PNo` int(10) NOT NULL,
  `CName` varchar(100) NOT NULL,
  `PPosition` varchar(2) NOT NULL,
  `PName` varchar(100) NOT NULL,
  `PJName` varchar(50) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Club` varchar(100) DEFAULT NULL,
  `Height` int(10) DEFAULT NULL,
  `Weight` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `player`:
--   `CName`
--       `country` -> `CName`
--

-- --------------------------------------------------------

--
-- Table structure for table `stadium`
--

CREATE TABLE `stadium` (
  `SId` int(10) NOT NULL,
  `SName` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Capacity` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `stadium`:
--

-- --------------------------------------------------------

--
-- Table structure for table `start_lineup`
--

CREATE TABLE `start_lineup` (
  `GId` int(10) NOT NULL,
  `PNo` int(10) NOT NULL,
  `PName` varchar(100) NOT NULL,
  `Team` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `start_lineup`:
--   `PNo`
--       `player` -> `PNo`
--   `Team`
--       `game` -> `Team1`
--   `Team`
--       `game` -> `Team2`
--   `GId`
--       `game` -> `GId`
--

-- --------------------------------------------------------

--
-- Table structure for table `substitution`
--

CREATE TABLE `substitution` (
  `GId` int(10) NOT NULL,
  `PlayerIn` int(10) NOT NULL,
  `Team` varchar(100) NOT NULL,
  `SubTime` datetime NOT NULL,
  `PlayerOut` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `substitution`:
--   `PlayerIn`
--       `player` -> `PNo`
--   `Team`
--       `game` -> `Team1`
--   `Team`
--       `game` -> `Team2`
--   `GId`
--       `game` -> `GId`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`PNo`,`Team`,`GId`),
  ADD UNIQUE KEY `CardTime` (`CardTime`),
  ADD KEY `Team` (`Team`),
  ADD KEY `GId` (`GId`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`CName`),
  ADD UNIQUE KEY `Cid` (`Cid`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`GId`,`GType`,`Team1`,`Team2`),
  ADD KEY `SName` (`SName`),
  ADD KEY `Team1` (`Team1`),
  ADD KEY `Team2` (`Team2`);

--
-- Indexes for table `goal`
--
ALTER TABLE `goal`
  ADD PRIMARY KEY (`PNo`,`Team`,`GId`),
  ADD UNIQUE KEY `GoalTime` (`GoalTime`),
  ADD KEY `Team` (`Team`),
  ADD KEY `GId` (`GId`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`PNo`,`CName`),
  ADD KEY `CName` (`CName`);

--
-- Indexes for table `stadium`
--
ALTER TABLE `stadium`
  ADD PRIMARY KEY (`SName`),
  ADD UNIQUE KEY `SId` (`SId`);

--
-- Indexes for table `start_lineup`
--
ALTER TABLE `start_lineup`
  ADD PRIMARY KEY (`PNo`,`Team`,`GId`),
  ADD KEY `Team` (`Team`),
  ADD KEY `GId` (`GId`);

--
-- Indexes for table `substitution`
--
ALTER TABLE `substitution`
  ADD PRIMARY KEY (`Team`,`PlayerIn`,`GId`),
  ADD KEY `PlayerIn` (`PlayerIn`),
  ADD KEY `GId` (`GId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `card_ibfk_1` FOREIGN KEY (`PNo`) REFERENCES `player` (`PNo`),
  ADD CONSTRAINT `card_ibfk_2` FOREIGN KEY (`Team`) REFERENCES `game` (`Team1`),
  ADD CONSTRAINT `card_ibfk_3` FOREIGN KEY (`Team`) REFERENCES `game` (`Team2`),
  ADD CONSTRAINT `card_ibfk_4` FOREIGN KEY (`GId`) REFERENCES `game` (`GId`);

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`SName`) REFERENCES `stadium` (`SName`),
  ADD CONSTRAINT `game_ibfk_2` FOREIGN KEY (`Team1`) REFERENCES `country` (`CName`),
  ADD CONSTRAINT `game_ibfk_3` FOREIGN KEY (`Team2`) REFERENCES `country` (`CName`);

--
-- Constraints for table `goal`
--
ALTER TABLE `goal`
  ADD CONSTRAINT `goal_ibfk_1` FOREIGN KEY (`PNo`) REFERENCES `player` (`PNo`),
  ADD CONSTRAINT `goal_ibfk_2` FOREIGN KEY (`Team`) REFERENCES `game` (`Team1`),
  ADD CONSTRAINT `goal_ibfk_3` FOREIGN KEY (`Team`) REFERENCES `game` (`Team2`),
  ADD CONSTRAINT `goal_ibfk_4` FOREIGN KEY (`GId`) REFERENCES `game` (`GId`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`CName`) REFERENCES `country` (`CName`);

--
-- Constraints for table `start_lineup`
--
ALTER TABLE `start_lineup`
  ADD CONSTRAINT `start_lineup_ibfk_1` FOREIGN KEY (`PNo`) REFERENCES `player` (`PNo`),
  ADD CONSTRAINT `start_lineup_ibfk_2` FOREIGN KEY (`Team`) REFERENCES `game` (`Team1`),
  ADD CONSTRAINT `start_lineup_ibfk_3` FOREIGN KEY (`Team`) REFERENCES `game` (`Team2`),
  ADD CONSTRAINT `start_lineup_ibfk_4` FOREIGN KEY (`GId`) REFERENCES `game` (`GId`);

--
-- Constraints for table `substitution`
--
ALTER TABLE `substitution`
  ADD CONSTRAINT `substitution_ibfk_1` FOREIGN KEY (`PlayerIn`) REFERENCES `player` (`PNo`),
  ADD CONSTRAINT `substitution_ibfk_2` FOREIGN KEY (`Team`) REFERENCES `game` (`Team1`),
  ADD CONSTRAINT `substitution_ibfk_3` FOREIGN KEY (`Team`) REFERENCES `game` (`Team2`),
  ADD CONSTRAINT `substitution_ibfk_4` FOREIGN KEY (`GId`) REFERENCES `game` (`GId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
