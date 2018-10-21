-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2018 at 03:37 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school2`
--

-- --------------------------------------------------------

--
-- Table structure for table `cijfers_data`
--

CREATE TABLE `cijfers_data` (
  `voort_gang` int(11) NOT NULL,
  `leerling_id` int(11) NOT NULL,
  `les_id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `cijfer` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_data`
--

CREATE TABLE `contact_data` (
  `contact_gegevens_id` int(11) NOT NULL,
  `verzorger_1` varchar(100) NOT NULL,
  `verzorger_2` varchar(100) NOT NULL,
  `verzorger_1_tel` int(10) NOT NULL,
  `verzorger_2_tel` int(10) NOT NULL,
  `verzorger_1_email` varchar(100) NOT NULL,
  `verzorger_2_email` varchar(100) NOT NULL,
  `verzorger_1_adres` varchar(100) NOT NULL,
  `verzorger_2_adres` varchar(100) NOT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `klas_data`
--

CREATE TABLE `klas_data` (
  `klas_id` int(11) NOT NULL,
  `mentor_id` int(11) NOT NULL,
  `klas_lokaal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leerlingen_data`
--

CREATE TABLE `leerlingen_data` (
  `leerling_id` int(11) NOT NULL,
  `voor_naam` varchar(100) NOT NULL,
  `achter_naam` varchar(100) NOT NULL,
  `geboorte_datum` date NOT NULL,
  `contact_gegevens_id` int(11) NOT NULL,
  `telefoon_nummer` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `leerling_sinds` date NOT NULL,
  `klas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leraren_data`
--

CREATE TABLE `leraren_data` (
  `leraar_id` int(11) NOT NULL,
  `voor_naam` varchar(100) NOT NULL,
  `achter_naam` varchar(100) NOT NULL,
  `tel_nummer` int(10) NOT NULL,
  `adres` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bank` varchar(15) NOT NULL,
  `in_dienst_sinds` date NOT NULL,
  `uren_week` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `les_data`
--

CREATE TABLE `les_data` (
  `les_id` int(11) NOT NULL,
  `onderwerp_les` varchar(255) NOT NULL,
  `leraar_id` int(11) NOT NULL,
  `uur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cijfers_data`
--
ALTER TABLE `cijfers_data`
  ADD PRIMARY KEY (`voort_gang`),
  ADD KEY `leerling_id` (`leerling_id`),
  ADD KEY `les_id` (`les_id`);

--
-- Indexes for table `contact_data`
--
ALTER TABLE `contact_data`
  ADD PRIMARY KEY (`contact_gegevens_id`);

--
-- Indexes for table `klas_data`
--
ALTER TABLE `klas_data`
  ADD PRIMARY KEY (`klas_id`),
  ADD KEY `mentor_id` (`mentor_id`);

--
-- Indexes for table `leerlingen_data`
--
ALTER TABLE `leerlingen_data`
  ADD PRIMARY KEY (`leerling_id`),
  ADD KEY `contact_gegevens_id` (`contact_gegevens_id`),
  ADD KEY `klas_id` (`klas_id`),
  ADD KEY `klas_id_2` (`klas_id`);

--
-- Indexes for table `leraren_data`
--
ALTER TABLE `leraren_data`
  ADD PRIMARY KEY (`leraar_id`);

--
-- Indexes for table `les_data`
--
ALTER TABLE `les_data`
  ADD PRIMARY KEY (`les_id`),
  ADD KEY `leraar_id` (`leraar_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cijfers_data`
--
ALTER TABLE `cijfers_data`
  MODIFY `voort_gang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_data`
--
ALTER TABLE `contact_data`
  MODIFY `contact_gegevens_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klas_data`
--
ALTER TABLE `klas_data`
  MODIFY `klas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leerlingen_data`
--
ALTER TABLE `leerlingen_data`
  MODIFY `leerling_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leraren_data`
--
ALTER TABLE `leraren_data`
  MODIFY `leraar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `les_data`
--
ALTER TABLE `les_data`
  MODIFY `les_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cijfers_data`
--
ALTER TABLE `cijfers_data`
  ADD CONSTRAINT `cijfers_data_ibfk_1` FOREIGN KEY (`leerling_id`) REFERENCES `leerlingen_data` (`leerling_id`),
  ADD CONSTRAINT `cijfers_data_ibfk_2` FOREIGN KEY (`les_id`) REFERENCES `les_data` (`les_id`);

--
-- Constraints for table `klas_data`
--
ALTER TABLE `klas_data`
  ADD CONSTRAINT `klas_data_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `leraren_data` (`leraar_id`);

--
-- Constraints for table `leerlingen_data`
--
ALTER TABLE `leerlingen_data`
  ADD CONSTRAINT `leerlingen_data_ibfk_1` FOREIGN KEY (`contact_gegevens_id`) REFERENCES `contact_data` (`contact_gegevens_id`),
  ADD CONSTRAINT `leerlingen_data_ibfk_2` FOREIGN KEY (`klas_id`) REFERENCES `klas_data` (`klas_id`);

--
-- Constraints for table `les_data`
--
ALTER TABLE `les_data`
  ADD CONSTRAINT `les_data_ibfk_1` FOREIGN KEY (`leraar_id`) REFERENCES `leraren_data` (`leraar_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
