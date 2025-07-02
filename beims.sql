-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2025 at 05:23 AM
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
-- Database: `beims`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowers_form`
--

CREATE TABLE `borrowers_form` (
  `id` int(11) NOT NULL,
  `idnum` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middleinitial` varchar(10) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `department` enum('Student','Faculty Member') NOT NULL,
  `course` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `cpnnumber` varchar(20) NOT NULL,
  `consent` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers_form`
--

INSERT INTO `borrowers_form` (`id`, `idnum`, `firstname`, `middleinitial`, `lastname`, `department`, `course`, `email`, `cpnnumber`, `consent`, `status`, `created_at`) VALUES
(1, '2021000097', 'Isabelle Beatrix', 'A.', 'Aquino', 'Student', 'CHRM Cookery NC II', 'isabelle@gmail.com', '09123456789', 1, 'pending', '2025-06-30 10:09:53');

-- --------------------------------------------------------

--
-- Table structure for table `item_list`
--

CREATE TABLE `item_list` (
  `id` int(11) NOT NULL,
  `itemname` varchar(255) NOT NULL,
  `specification` varchar(255) NOT NULL,
  `itemcategory` varchar(100) NOT NULL,
  `quantityreq` int(11) NOT NULL,
  `unit_req` varchar(20) NOT NULL,
  `quantityon` int(11) NOT NULL,
  `unit_on` varchar(20) NOT NULL,
  `difference` varchar(100) NOT NULL,
  `remarks` text NOT NULL,
  `itemdescription` text NOT NULL,
  `complianceauditone` int(11) NOT NULL,
  `unit1` varchar(20) NOT NULL,
  `complianceaudittwo` int(11) NOT NULL,
  `unit2` varchar(20) NOT NULL,
  `idphoto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_list`
--

INSERT INTO `item_list` (`id`, `itemname`, `specification`, `itemcategory`, `quantityreq`, `unit_req`, `quantityon`, `unit_on`, `difference`, `remarks`, `itemdescription`, `complianceauditone`, `unit1`, `complianceaudittwo`, `unit2`, `idphoto`, `created_at`) VALUES
(1, 'Menu folder', 'Plastic', 'Supplies and Materials', 3, 'pcs', 3, 'pcs', '', '', '', 0, 'pcs', 0, 'pcs', '', '2025-07-01 03:27:45'),
(2, 'Service Station', 'Wood', 'supplyandmaterials', 1, 'units', 1, 'units', '0', '', '', 0, '0', 0, 'pcs', NULL, '2025-07-01 04:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `acctype`, `created_at`) VALUES
(1, 'superadmin', 'superadmin', 'superadmin', '2025-06-30 09:57:04'),
(2, 'admin', 'admin', 'admin', '2025-06-30 09:57:04'),
(3, 'teacher', 'teacher', 'teacher', '2025-06-30 09:57:04'),
(4, 'student', 'student', 'student', '2025-06-30 09:57:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowers_form`
--
ALTER TABLE `borrowers_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_list`
--
ALTER TABLE `item_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowers_form`
--
ALTER TABLE `borrowers_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item_list`
--
ALTER TABLE `item_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
