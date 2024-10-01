-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 01, 2024 at 08:49 AM
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
-- Database: `govinena`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `accept_terms` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `category`, `subcategory`, `title`, `stock`, `address`, `mobile`, `accept_terms`, `created_at`) VALUES
(30, 'Agro Chemicals', 'Pesticides', 'Demo Title for Pesticides', 55, 'Address Line 01, Address Line 02, District, Sri Lanka', '0771236549', 1, '2024-09-30 05:13:05'),
(31, 'Agro Chemicals', 'Plant Growth Regulators', 'This is demo PGR', 5, 'Demo address', '7894561230', 1, '2024-09-30 06:04:40'),
(32, 'Agro Chemicals', 'Plant Growth Regulators', 'This is demo PGR - test', 5, 'Demo address', '7894561230', 1, '2024-09-30 06:15:05'),
(33, 'Fertilizers', 'Inorganic Fertilizers', 'Inorganic Fertilizer', 4, 'Sri lanka ,Matara', '0123456654', 1, '2024-09-30 07:24:10'),
(34, 'Fertilizers', 'Organic Fertilizers', 'Organic Fertilizer Title', 1000, 'Colombo ', '1234566541', 1, '2024-09-30 09:02:16'),
(35, 'Planting Materials', 'Seeds', 'Mango 2 months old seeds', 450, 'address  line 01', '789456123', 1, '2024-10-01 04:20:46'),
(36, 'Planting Materials', 'Seedlings', 'Brinjol seedlings', 50, 'Mount Levina', '123456789', 1, '2024-10-01 04:53:35'),
(37, 'Planting Materials', 'Seedlings', 'Pumpkin Seedlings', 45, 'Nuwara Eliya', '7894661321', 1, '2024-10-01 04:54:57'),
(38, 'Planting Materials', 'Tubers', 'Demo Title', 456, 'dhsjlweih dsbj', '7895562325', 1, '2024-10-01 05:25:00');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_images`
--

CREATE TABLE `advertisement_images` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_images`
--

INSERT INTO `advertisement_images` (`id`, `advertisement_id`, `image_path`) VALUES
(62, 30, 'uploads/imt-tractor (1) 4.png'),
(63, 30, 'uploads/communication-3-1024x1024.webp'),
(64, 30, 'uploads/REACT.png'),
(65, 31, 'uploads/Rectangle 37 (1).png'),
(66, 31, 'uploads/Rectangle 37.png'),
(67, 32, 'uploads/Rectangle 26.png'),
(68, 32, 'uploads/Rectangle 30.png'),
(69, 32, 'uploads/Rectangle 40.png'),
(70, 33, 'uploads/640px-Two_weaver_ants.jpg'),
(71, 33, 'uploads/vecteezy_editable-icon-of-development-code-smartphone-vector_22383265.jpg'),
(72, 34, 'uploads/communication-3-1024x1024.webp'),
(73, 35, 'uploads/Annona cherimola.png'),
(74, 35, 'uploads/Annona glabra.png'),
(75, 35, 'uploads/Annona muricata.png'),
(76, 35, 'uploads/Annona reticulate.png'),
(77, 36, 'uploads/Screenshot 2024-08-13 200705.png'),
(78, 37, 'uploads/Screenshot 2024-08-13 200903.png'),
(79, 38, 'uploads/Screenshot 2024-08-13 200803.png'),
(80, 38, 'uploads/Screenshot 2024-08-13 200839.png');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_inorganic`
--

CREATE TABLE `advertisement_inorganic` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `npk` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `price_1L` decimal(10,2) DEFAULT NULL,
  `price_5L` decimal(10,2) DEFAULT NULL,
  `price_10L` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_inorganic`
--

INSERT INTO `advertisement_inorganic` (`id`, `advertisement_id`, `type`, `npk`, `method`, `price_1L`, `price_5L`, `price_10L`) VALUES
(1, 33, 'urea', '45', 'By using a Sprayer', 1000.00, 3500.00, 7500.00);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_organic`
--

CREATE TABLE `advertisement_organic` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `npk` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `price_1L` decimal(10,2) DEFAULT NULL,
  `price_5L` decimal(10,2) DEFAULT NULL,
  `price_10L` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_organic`
--

INSERT INTO `advertisement_organic` (`id`, `advertisement_id`, `type`, `npk`, `method`, `price_1L`, `price_5L`, `price_10L`) VALUES
(1, 34, 'urea', '4.5', 'By Tractor', 1000.00, 4500.00, 9000.00);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_pesticides`
--

CREATE TABLE `advertisement_pesticides` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `application_ratio` decimal(10,2) DEFAULT NULL,
  `price_1L` decimal(10,2) DEFAULT NULL,
  `price_5L` decimal(10,2) DEFAULT NULL,
  `price_10L` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_pesticides`
--

INSERT INTO `advertisement_pesticides` (`id`, `advertisement_id`, `type`, `application_ratio`, `price_1L`, `price_5L`, `price_10L`) VALUES
(24, 30, 'insecticide', 1.35, 10000.00, 35000.00, 65000.00);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_pgr`
--

CREATE TABLE `advertisement_pgr` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `application_ratio` decimal(10,2) DEFAULT NULL,
  `price_1L` decimal(10,2) DEFAULT NULL,
  `price_5L` decimal(10,2) DEFAULT NULL,
  `price_10L` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_pgr`
--

INSERT INTO `advertisement_pgr` (`id`, `advertisement_id`, `type`, `application_ratio`, `price_1L`, `price_5L`, `price_10L`) VALUES
(1, 31, 'insecticide', 5.60, 1500.00, 5000.00, 15000.00),
(2, 32, 'insecticide', 5.60, 1500.00, 5000.00, 15000.00);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_seedlings`
--

CREATE TABLE `advertisement_seedlings` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `variety` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_seedlings`
--

INSERT INTO `advertisement_seedlings` (`id`, `advertisement_id`, `type`, `variety`, `age`, `size`, `price`) VALUES
(1, 36, 'vegetable', 'Brinjol', 2, '15', 1500.00),
(2, 37, 'vegetable', 'Pumpkin', 15, '30', 1500.00);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_seeds`
--

CREATE TABLE `advertisement_seeds` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `variety` varchar(255) NOT NULL,
  `price_1kg` decimal(10,2) DEFAULT NULL,
  `price_5kg` decimal(10,2) DEFAULT NULL,
  `price_10kg` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_seeds`
--

INSERT INTO `advertisement_seeds` (`id`, `advertisement_id`, `type`, `variety`, `price_1kg`, `price_5kg`, `price_10kg`) VALUES
(1, 35, '', 'Mango', 500.00, 5000.00, 8000.00);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_specifications`
--

CREATE TABLE `advertisement_specifications` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `specification` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_specifications`
--

INSERT INTO `advertisement_specifications` (`id`, `advertisement_id`, `specification`) VALUES
(27, 30, 'Brand New'),
(28, 30, 'Imported from USA'),
(29, 31, 'Brand New Condition'),
(30, 31, 'ISO'),
(31, 32, 'Brand New Condition'),
(32, 32, 'ISO'),
(33, 33, 'No harm for skin'),
(34, 34, 'Loose Available'),
(35, 35, 'Karthakolomban'),
(36, 35, 'Jaffna'),
(37, 36, 'Best one'),
(38, 37, 'Fresh'),
(39, 37, 'Healthy'),
(40, 38, 'sanlf');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_tuber`
--

CREATE TABLE `advertisement_tuber` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `variety` varchar(255) NOT NULL,
  `price_1kg` decimal(10,2) DEFAULT NULL,
  `price_5kg` decimal(10,2) DEFAULT NULL,
  `price_10kg` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_tuber`
--

INSERT INTO `advertisement_tuber` (`id`, `advertisement_id`, `type`, `variety`, `price_1kg`, `price_5kg`, `price_10kg`) VALUES
(1, 38, 'vegetable', 'Demo Variety', 56.00, 87.00, 895.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisement_images`
--
ALTER TABLE `advertisement_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_inorganic`
--
ALTER TABLE `advertisement_inorganic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_organic`
--
ALTER TABLE `advertisement_organic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_pesticides`
--
ALTER TABLE `advertisement_pesticides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_pgr`
--
ALTER TABLE `advertisement_pgr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_seedlings`
--
ALTER TABLE `advertisement_seedlings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_seeds`
--
ALTER TABLE `advertisement_seeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_specifications`
--
ALTER TABLE `advertisement_specifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_tuber`
--
ALTER TABLE `advertisement_tuber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `advertisement_images`
--
ALTER TABLE `advertisement_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `advertisement_inorganic`
--
ALTER TABLE `advertisement_inorganic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisement_organic`
--
ALTER TABLE `advertisement_organic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisement_pesticides`
--
ALTER TABLE `advertisement_pesticides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `advertisement_pgr`
--
ALTER TABLE `advertisement_pgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertisement_seedlings`
--
ALTER TABLE `advertisement_seedlings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertisement_seeds`
--
ALTER TABLE `advertisement_seeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisement_specifications`
--
ALTER TABLE `advertisement_specifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `advertisement_tuber`
--
ALTER TABLE `advertisement_tuber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisement_images`
--
ALTER TABLE `advertisement_images`
  ADD CONSTRAINT `advertisement_images_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_inorganic`
--
ALTER TABLE `advertisement_inorganic`
  ADD CONSTRAINT `advertisement_inorganic_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_organic`
--
ALTER TABLE `advertisement_organic`
  ADD CONSTRAINT `advertisement_organic_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_pesticides`
--
ALTER TABLE `advertisement_pesticides`
  ADD CONSTRAINT `advertisement_pesticides_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_pgr`
--
ALTER TABLE `advertisement_pgr`
  ADD CONSTRAINT `advertisement_pgr_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_seedlings`
--
ALTER TABLE `advertisement_seedlings`
  ADD CONSTRAINT `advertisement_seedlings_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_seeds`
--
ALTER TABLE `advertisement_seeds`
  ADD CONSTRAINT `advertisement_seeds_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_specifications`
--
ALTER TABLE `advertisement_specifications`
  ADD CONSTRAINT `advertisement_specifications_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_tuber`
--
ALTER TABLE `advertisement_tuber`
  ADD CONSTRAINT `advertisement_tuber_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
