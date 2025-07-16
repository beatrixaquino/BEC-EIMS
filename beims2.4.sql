-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2025 at 09:59 PM
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
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(11) NOT NULL,
  `idnum` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middleinitial` varchar(10) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `department` enum('Student','Faculty Member') NOT NULL,
  `course` varchar(255) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `cpnnumber` varchar(20) NOT NULL,
  `consent` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('pending','approved','rejected','returned') DEFAULT 'pending',
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `idnum`, `firstname`, `middleinitial`, `lastname`, `department`, `course`, `email`, `cpnnumber`, `consent`, `status`, `borrow_date`, `return_date`, `created_at`) VALUES
(3, '2022000093', 'Jon Phoenix', 'A.', 'Aquino', 'Student', 'cookery', 'aaaaaaaa@gmail.com', '09123456789', 1, 'pending', '2025-07-15', '2025-07-15', '2025-07-13 16:39:55'),
(4, '2022000094', 'Aldwin Floyd', 'J.', 'Ilao', 'Student', 'cookery', 'ilaoaldwin@gmail.com', '09123456789', 1, 'approved', '2025-07-15', '2025-07-16', '2025-07-13 16:49:44'),
(6, '2022000095', 'Abegail Joy', 'O.', 'Beredo', 'Student', 'cookery', 'aaaaaaaa@gmail.com', '09123456789', 1, 'returned', '2025-07-16', '2025-07-17', '2025-07-13 17:35:47'),
(7, '20222023079', 'Aldwin Floyd', 'J.', 'Ilao', 'Student', 'fbs', 'ilaoaldwin@gmail.com', '09123456789', 1, 'rejected', '2025-07-15', '2025-07-16', '2025-07-14 10:14:37'),
(8, '2023000099', 'Melania', 'G.', 'Cuya', 'Student', 'cookery', 'aaaaaaaa@gmail.com', '09123456789', 1, 'approved', '2025-07-17', '2025-07-18', '2025-07-16 15:33:32'),
(9, '2024000100', 'Sebastian ', 'A.', 'Michaelis', 'Faculty Member', 'NULL', 'aaaaaaaa@gmail.com', '09123456789', 1, 'pending', '2025-07-18', '2025-07-19', '2025-07-16 17:05:18'),
(10, '2025000099', 'Ciel', 'J.', 'Phantomhive', 'Student', 'fos', 'aaaaaaaa@gmail.com', '09123456789', 1, 'pending', '2025-07-26', '2025-07-27', '2025-07-16 17:12:25'),
(11, '20222023076', 'Jon Francis', 'O.', 'Cuya', 'Student', 'fos', 'aaaaaaaa@gmail.com', '09123456789', 1, 'rejected', '2025-07-31', '2025-07-31', '2025-07-16 17:29:38'),
(12, '20222023079', 'Claude ', 'M.', 'Faustus', 'Faculty Member', NULL, 'aaaaaaaa@gmail.com', '09123456789', 1, 'pending', '2025-08-22', '2025-08-23', '2025-07-16 19:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Supplies and Materials', '2025-07-12 03:38:19', '2025-07-12 03:38:19'),
(2, 'Tools', '2025-07-12 03:38:19', '2025-07-16 16:51:05'),
(3, 'Equipment', '2025-07-12 03:38:19', '2025-07-12 03:38:19'),
(4, 'Bartending', '2025-07-16 16:51:12', '2025-07-16 16:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `item_id`, `category_id`, `created_at`) VALUES
(10, 3, 1, '2025-07-13 14:56:36'),
(20, 2, 1, '2025-07-16 16:50:26'),
(21, 1, 1, '2025-07-16 16:50:37'),
(24, 6, 1, '2025-07-16 18:48:44');

-- --------------------------------------------------------

--
-- Table structure for table `item_list`
--

CREATE TABLE `item_list` (
  `id` int(11) NOT NULL,
  `itemname` varchar(255) NOT NULL,
  `specification` text DEFAULT NULL,
  `quantityreq` int(11) DEFAULT 0,
  `unit_req` varchar(50) DEFAULT 'pcs',
  `quantityon` int(11) DEFAULT 0,
  `unit_on` varchar(50) DEFAULT 'pcs',
  `difference` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `itemdescription` text DEFAULT NULL,
  `complianceauditone` int(11) DEFAULT NULL,
  `unit1` varchar(50) DEFAULT 'pcs',
  `complianceaudittwo` int(11) DEFAULT NULL,
  `unit2` varchar(50) DEFAULT 'pcs',
  `eqpphoto` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_list`
--

INSERT INTO `item_list` (`id`, `itemname`, `specification`, `quantityreq`, `unit_req`, `quantityon`, `unit_on`, `difference`, `remarks`, `itemdescription`, `complianceauditone`, `unit1`, `complianceaudittwo`, `unit2`, `eqpphoto`, `created_at`, `updated_at`) VALUES
(1, 'Menu Folder', 'Plastic', 8, 'pcs', 8, 'pcs', NULL, NULL, NULL, NULL, 'pcs', NULL, 'pcs', '1752294300_1751883920_menufolder.jpg', '2025-07-12 04:25:00', '2025-07-16 16:50:37'),
(2, 'Dining Room Chairs', 'Monoblock', 8, 'pcs', 8, 'pcs', NULL, NULL, NULL, NULL, 'pcs', NULL, 'pcs', '1752296959_1751884473_monoblock.webp', '2025-07-12 05:09:19', '2025-07-16 16:50:26'),
(3, 'Service Station', 'Wood', 2, 'pcs', 2, 'pcs', NULL, NULL, NULL, NULL, 'pcs', NULL, 'pcs', '1752297253_1751882593_servicestation.jpg', '2025-07-12 05:14:13', '2025-07-16 16:36:24'),
(6, 'Square Table Cloth', '68\"x68\"', 12, 'pcs', 12, 'pcs', NULL, NULL, NULL, NULL, 'pcs', NULL, 'pcs', '1752691724_1751884679_SquareTableCloth.jpg', '2025-07-16 18:48:44', '2025-07-16 18:48:44');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('new_form','form_approved','form_rejected','form_submitted','equipment_added','equipment_updated','user_registered') NOT NULL,
  `related_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `related_id`, `is_read`, `created_at`) VALUES
(1, 1, 'New Borrow Form Submitted', 'A new borrow form has been submitted by John Doe', 'new_form', 1, 1, '2025-07-16 17:02:11'),
(2, 1, 'Form Approved', 'Borrow form #123 has been approved', 'form_approved', 123, 1, '2025-07-16 17:02:11'),
(3, 1, 'Equipment Added', 'New equipment \"Laptop\" has been added to the system', 'equipment_added', 5, 1, '2025-07-16 17:02:11'),
(4, NULL, 'Form Submitted Successfully', 'Your borrow request has been submitted successfully. Request ID: #10', 'form_submitted', 10, 0, '2025-07-16 17:12:25'),
(5, 1, 'New Borrow Form Submitted', 'A new borrow form has been submitted by Ciel Phantomhive (Student)', 'new_form', 10, 1, '2025-07-16 17:12:25'),
(6, 1, 'New Borrow Form Submitted', 'A new borrow form has been submitted by Jon Francis Cuya (Student)', 'new_form', 11, 1, '2025-07-16 17:29:38'),
(7, 1, 'Form Status Updated', 'Form for Jon Francis Cuya has been rejected', 'form_rejected', 11, 1, '2025-07-16 17:30:05'),
(8, 1, 'New Equipment Added', 'Equipment \'Menu Folder\' has been added to the system', 'equipment_added', 4, 0, '2025-07-16 18:43:09'),
(9, 1, 'New Equipment Added', 'Equipment \'Menu Folder\' has been added to the system', 'equipment_added', 5, 0, '2025-07-16 18:46:05'),
(10, 1, 'New Equipment Added', 'Equipment \'Square Table Cloth\' has been added to the system', 'equipment_added', 6, 0, '2025-07-16 18:48:44'),
(11, 1, 'New Borrow Form Submitted', 'A new borrow form has been submitted by Claude  Faustus (Faculty Member)', 'new_form', 12, 0, '2025-07-16 19:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `requested_items`
--

CREATE TABLE `requested_items` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `requested_items`
--

INSERT INTO `requested_items` (`id`, `borrower_id`, `item_id`, `quantity`, `unit`, `created_at`) VALUES
(1, 3, 2, 1, 'pcs', '2025-07-13 16:39:55'),
(2, 4, 3, 1, 'pcs', '2025-07-13 16:49:44'),
(3, 6, 2, 2, 'pcs', '2025-07-13 17:35:47'),
(4, 7, 1, 2, 'pcs', '2025-07-14 10:14:37'),
(5, 8, 2, 1, 'pcs', '2025-07-16 15:33:32'),
(6, 9, 3, 1, 'pcs', '2025-07-16 17:05:18'),
(7, 10, 1, 1, 'pcs', '2025-07-16 17:12:25'),
(8, 11, 2, 1, 'pcs', '2025-07-16 17:29:38'),
(9, 12, 6, 1, 'pcs', '2025-07-16 19:37:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `acctype` varchar(20) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `acctype`, `status`, `created_at`) VALUES
(1, 'superadmin', 'superadmin', 'superadmin', 'active', '2025-06-29 17:57:04'),
(2, 'admin', 'admin', 'admin', 'active', '2025-06-29 17:57:04'),
(3, 'teacher', 'teacher', 'teacher', 'active', '2025-06-29 17:57:04'),
(4, 'student', 'student', 'student', 'active', '2025-06-29 17:57:04'),
(5, 'aldwin', 'hotdog', 'superadmin', 'inactive', '2025-07-13 13:08:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_item_category` (`item_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `item_list`
--
ALTER TABLE `item_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_is_read` (`is_read`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `requested_items`
--
ALTER TABLE `requested_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id` (`borrower_id`),
  ADD KEY `fk_requested_items_item_id` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `item_list`
--
ALTER TABLE `item_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `requested_items`
--
ALTER TABLE `requested_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `requested_items`
--
ALTER TABLE `requested_items`
  ADD CONSTRAINT `fk_requested_items_borrower_id` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`),
  ADD CONSTRAINT `fk_requested_items_item_id` FOREIGN KEY (`item_id`) REFERENCES `item_list` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
