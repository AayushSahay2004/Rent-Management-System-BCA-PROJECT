-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2024 at 04:17 PM
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
-- Database: `rent_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_details`
--

CREATE TABLE `bill_details` (
  `id` int(11) NOT NULL,
  `renter_id` int(11) NOT NULL,
  `month` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `room_rent` decimal(10,2) NOT NULL,
  `units_used` int(11) NOT NULL,
  `electric_bill` decimal(10,2) NOT NULL,
  `advance_paid` decimal(10,2) NOT NULL,
  `amount_dues` decimal(10,2) NOT NULL,
  `miscellaneous` text NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill_details`
--

INSERT INTO `bill_details` (`id`, `renter_id`, `month`, `year`, `due_date`, `room_rent`, `units_used`, `electric_bill`, `advance_paid`, `amount_dues`, `miscellaneous`, `total_amount`, `created_at`) VALUES
(1, 1, 'July', 2024, '2024-07-15', 2300.00, 11, 99.00, 200.00, 0.00, '[{\"description\":\"Car Parking fee\",\"amount\":\"800\"}]', 2999.00, '2024-07-04 10:08:54');

-- --------------------------------------------------------

--
-- Table structure for table `enq_comm`
--

CREATE TABLE `enq_comm` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `time_of_saving` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enq_comm`
--

INSERT INTO `enq_comm` (`id`, `name`, `age`, `gender`, `address`, `mobile`, `time_of_saving`) VALUES
(1, 'AAYUSH SAHAY', 20, 'Male', 'KADAMKUAN , PATNA , BIHAR ', 9994445550, '2024-06-30 05:50:43'),
(2, 'Akash Kumar', 21, 'Male', 'Rajapur , Patna', 1234512345, '2024-06-30 05:56:34'),
(3, 'Sneha Kumari', 22, 'Female', 'Rajendra Nagar , Patna', 9879874545, '2024-06-30 05:57:19'),
(4, 'Mrs. Anita Devi', 48, 'Female', 'Rajendra Nagar , Patna ', 1234512345, '2024-07-03 13:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `room_id` varchar(50) NOT NULL,
  `photo_path` varchar(255) NOT NULL,
  `sign_path` varchar(255) NOT NULL,
  `aadhar_path` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `room_id`, `photo_path`, `sign_path`, `aadhar_path`, `created_at`) VALUES
(1, '1', 'stores/entry1Mr. Amit Kumar/photo.jpg', 'stores/entry1Mr. Amit Kumar/sign.jpg', 'stores/entry1Mr. Amit Kumar/aadhar.jpg', '2024-07-02 10:57:04'),
(2, '2', 'stores/entry2Mrs. Anita Devi/photo.jpg', 'stores/entry2Mrs. Anita Devi/sign.jpg', 'stores/entry2Mrs. Anita Devi/aadhar.jpg', '2024-07-03 13:05:12');

-- --------------------------------------------------------

--
-- Table structure for table `file_upload`
--

CREATE TABLE `file_upload` (
  `id` int(11) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `roomname` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL,
  `folder_path` varchar(100) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_upload`
--

INSERT INTO `file_upload` (`id`, `filename`, `roomname`, `status`, `folder_path`, `timestamp`) VALUES
(6, 'room15.pdf', 'Room1', 'Available ', 'uploads/', '2024-06-30 05:57:40'),
(7, '07p_ch1 introduction.pdf', 'Room 2', 'Available ', 'uploads/', '2024-07-03 15:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL,
  `renter_id` varchar(50) NOT NULL,
  `date_pay` date NOT NULL,
  `month` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `pay_status` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`id`, `renter_id`, `date_pay`, `month`, `amount`, `pay_status`, `description`) VALUES
(1, '1', '2024-07-06', 'JULY', 2999.00, 'July Full Paid', '-'),
(2, '1', '2024-07-06', '', 2999.00, 'online_trxn_success', 'Mr. Amit Kumar1234512345UPI2FBPGI'),
(5, '2', '2024-07-06', '', 3200.00, 'online_trxn_success', 'Mrs. Anita Devi9090909090UPIEBZ3XS');

-- --------------------------------------------------------

--
-- Table structure for table `reg_renter`
--

CREATE TABLE `reg_renter` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `datereg` date NOT NULL,
  `aadhar` varchar(20) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `roomNo` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reg_renter`
--

INSERT INTO `reg_renter` (`id`, `name`, `age`, `gender`, `datereg`, `aadhar`, `mobile`, `address`, `roomNo`, `price`) VALUES
(1, 'Mr. Amit Kumar', 32, 'Male', '2024-07-02', '23232323', '9090909090', 'gaya , bihar', '1', 2300.00),
(2, 'Mrs. Anita Devi', 47, 'Female', '2024-07-03', '5656565656', '1234512345', 'Rajendra Nagar Patna', '2', 3200.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `productkey` int(5) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `user_name`, `password`, `productkey`, `date`) VALUES
(1, 7, 'test@gmail.com', 'test', 55555, '2024-07-01 05:34:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enq_comm`
--
ALTER TABLE `enq_comm`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_upload`
--
ALTER TABLE `file_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reg_renter`
--
ALTER TABLE `reg_renter`
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
-- AUTO_INCREMENT for table `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enq_comm`
--
ALTER TABLE `enq_comm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `entries`
--
ALTER TABLE `entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `file_upload`
--
ALTER TABLE `file_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reg_renter`
--
ALTER TABLE `reg_renter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
