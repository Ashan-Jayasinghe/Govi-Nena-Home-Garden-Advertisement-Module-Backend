-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Nov 02, 2024 at 05:46 PM
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
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','editor','viewer') NOT NULL DEFAULT 'viewer',
  `is_active` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_dryers`
--

CREATE TABLE `advertisement_dryers` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `condition_` varchar(255) NOT NULL,
  `rent_or_sell` varchar(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_harvesting_machines`
--

CREATE TABLE `advertisement_harvesting_machines` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `condition_` varchar(255) NOT NULL,
  `rent_or_sell` varchar(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_images`
--

CREATE TABLE `advertisement_images` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_irrigation_systems`
--

CREATE TABLE `advertisement_irrigation_systems` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `condition_` varchar(255) NOT NULL,
  `rent_or_sell` varchar(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_others`
--

CREATE TABLE `advertisement_others` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `condition_` varchar(255) NOT NULL,
  `rent_or_sell` varchar(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_planting_machines`
--

CREATE TABLE `advertisement_planting_machines` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `condition_` varchar(255) NOT NULL,
  `rent_or_sell` varchar(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_sprayers`
--

CREATE TABLE `advertisement_sprayers` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `condition_` varchar(255) NOT NULL,
  `rent_or_sell` varchar(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_tillages`
--

CREATE TABLE `advertisement_tillages` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `condition_` varchar(255) NOT NULL,
  `rent_or_sell` varchar(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_tractor`
--

CREATE TABLE `advertisement_tractor` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) NOT NULL,
  `condition_` varchar(255) NOT NULL,
  `rent_or_sell` varchar(50) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `power` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `saved_ads`
--

CREATE TABLE `saved_ads` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `saved_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_active` tinyint(1) DEFAULT 1,
  `deactivation_reason` varchar(255) DEFAULT NULL,
  `activation_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL,
  `is_revoked` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `advertisement_dryers`
--
ALTER TABLE `advertisement_dryers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_harvesting_machines`
--
ALTER TABLE `advertisement_harvesting_machines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

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
-- Indexes for table `advertisement_irrigation_systems`
--
ALTER TABLE `advertisement_irrigation_systems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_organic`
--
ALTER TABLE `advertisement_organic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_others`
--
ALTER TABLE `advertisement_others`
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
-- Indexes for table `advertisement_planting_machines`
--
ALTER TABLE `advertisement_planting_machines`
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
-- Indexes for table `advertisement_sprayers`
--
ALTER TABLE `advertisement_sprayers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_tillages`
--
ALTER TABLE `advertisement_tillages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_tractor`
--
ALTER TABLE `advertisement_tractor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `advertisement_tuber`
--
ALTER TABLE `advertisement_tuber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisement_id` (`advertisement_id`);

--
-- Indexes for table `saved_ads`
--
ALTER TABLE `saved_ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `advertisement_dryers`
--
ALTER TABLE `advertisement_dryers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `advertisement_harvesting_machines`
--
ALTER TABLE `advertisement_harvesting_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertisement_images`
--
ALTER TABLE `advertisement_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `advertisement_inorganic`
--
ALTER TABLE `advertisement_inorganic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `advertisement_irrigation_systems`
--
ALTER TABLE `advertisement_irrigation_systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertisement_organic`
--
ALTER TABLE `advertisement_organic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `advertisement_others`
--
ALTER TABLE `advertisement_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisement_pesticides`
--
ALTER TABLE `advertisement_pesticides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `advertisement_pgr`
--
ALTER TABLE `advertisement_pgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `advertisement_planting_machines`
--
ALTER TABLE `advertisement_planting_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisement_seedlings`
--
ALTER TABLE `advertisement_seedlings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `advertisement_seeds`
--
ALTER TABLE `advertisement_seeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `advertisement_sprayers`
--
ALTER TABLE `advertisement_sprayers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertisement_tillages`
--
ALTER TABLE `advertisement_tillages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertisement_tractor`
--
ALTER TABLE `advertisement_tractor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `advertisement_tuber`
--
ALTER TABLE `advertisement_tuber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `saved_ads`
--
ALTER TABLE `saved_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_dryers`
--
ALTER TABLE `advertisement_dryers`
  ADD CONSTRAINT `advertisement_dryers_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_harvesting_machines`
--
ALTER TABLE `advertisement_harvesting_machines`
  ADD CONSTRAINT `advertisement_harvesting_machines_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `advertisement_irrigation_systems`
--
ALTER TABLE `advertisement_irrigation_systems`
  ADD CONSTRAINT `advertisement_irrigation_systems_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_organic`
--
ALTER TABLE `advertisement_organic`
  ADD CONSTRAINT `advertisement_organic_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_others`
--
ALTER TABLE `advertisement_others`
  ADD CONSTRAINT `advertisement_others_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `advertisement_planting_machines`
--
ALTER TABLE `advertisement_planting_machines`
  ADD CONSTRAINT `advertisement_planting_machines_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `advertisement_sprayers`
--
ALTER TABLE `advertisement_sprayers`
  ADD CONSTRAINT `advertisement_sprayers_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_tillages`
--
ALTER TABLE `advertisement_tillages`
  ADD CONSTRAINT `advertisement_tillages_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_tractor`
--
ALTER TABLE `advertisement_tractor`
  ADD CONSTRAINT `advertisement_tractor_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `advertisement_tuber`
--
ALTER TABLE `advertisement_tuber`
  ADD CONSTRAINT `advertisement_tuber_ibfk_1` FOREIGN KEY (`advertisement_id`) REFERENCES `advertisements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_ads`
--
ALTER TABLE `saved_ads`
  ADD CONSTRAINT `saved_ads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `saved_ads_ibfk_2` FOREIGN KEY (`ad_id`) REFERENCES `advertisements` (`id`);

--
-- Constraints for table `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
