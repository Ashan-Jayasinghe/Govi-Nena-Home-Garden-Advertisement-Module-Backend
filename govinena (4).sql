-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Oct 10, 2024 at 07:53 AM
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `category`, `subcategory`, `title`, `stock`, `address`, `mobile`, `accept_terms`, `created_at`, `user_id`, `description`) VALUES
(48, 'Machineries', 'Dryers', 'Dryer for Rent', 5, 'Kaburupitiya-Matara', '7890543279', 1, '2024-10-08 12:02:04', 21, 'You can work Efficiently'),
(49, 'Machineries', 'Harvesting Machines', 'Demo Title', 3, 'hldsakhlkds', '4613279845', 1, '2024-10-08 12:28:26', 21, 'Noting'),
(55, 'Machineries', 'Planting Machines', 'New Paddy Planting Machine', 2, 'Nittabuwa', '1234569870', 1, '2024-10-08 14:19:18', 21, 'First Time In Sri Lanka'),
(56, 'Machineries', 'Harvesting Machines', 'Cashew Harvesting Machine', 5, 'Colombo', '1234567890', 1, '2024-10-08 17:14:16', 21, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled'),
(57, 'Machineries', 'Harvesting Machines', 'Sprayer for sale', 10, 'Colombo', '0771234567', 1, '2024-10-09 04:14:18', 22, ''),
(58, 'Machineries', 'Sprayers', 'Sprayers For Sale', 10, 'Kurunegala', '0771234567', 1, '2024-10-09 04:17:20', 22, ''),
(59, 'Machineries', 'Harvesting Machines', 'Tillage for daily rent', 5, 'Jaffna', '1234567890', 1, '2024-10-09 04:25:53', 22, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled'),
(60, 'Machineries', 'Tillages', 'Tillage for daily rent', 5, 'Jaffna', '1234567890', 1, '2024-10-09 04:26:34', 22, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled'),
(61, 'Machineries', 'Tractors', 'Tractors for Sale', 5, 'Sri Lanka', '1234567890', 1, '2024-10-09 05:13:20', 22, ''),
(62, 'Machineries', 'Tractors', 'Tractors for Sale', 5, 'Sri Lanka', '1234567890', 1, '2024-10-09 05:14:26', 22, 'orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not'),
(63, 'Machineries', 'Sprayers', 'Demo', 0, '', '1224567897', 1, '2024-10-09 05:47:26', 22, ''),
(64, 'Machineries', 'Tractors', 'Test  Title', 0, '', '0147258369', 1, '2024-10-09 06:25:28', 22, ''),
(65, 'Machineries', 'Tillages', 'kfaljkla;dsfjjk;lfads', 0, '', '8795461300', 1, '2024-10-09 06:48:00', 22, ''),
(66, 'Agro Chemicals', 'Pesticides', 'demo Add', 0, '', '7945136412', 1, '2024-10-09 06:56:57', 22, ''),
(67, 'Agro Chemicals', 'Pesticides', 'Herbicide Advertisement ', 25, 'Kalutara', '0341234567', 1, '2024-10-09 07:39:19', 22, ''),
(68, 'Agro Chemicals', 'Plant Growth Regulators', 'PGR for your Garden', 5, 'Kalutara', '0341234567', 1, '2024-10-09 08:44:45', 22, 'Lorem ipsum odor amet, consectetuer adipiscing elit. Interdum rutrum taciti cras vehicula ut tincidunt nullam litora. Ultricies sagittis parturient et rhoncus euismod montes. Gravida ultrices porttitor interdum lacus nostra accumsan.'),
(69, 'Agro Chemicals', 'Inorganic Fertilizers', 'Inorganic Advertisment', 120, 'Aluthgama', '2134644678', 1, '2024-10-09 09:07:28', 22, 'Lorem ipsum odor amet, consectetuer adipiscing elit. Curabitur dignissim et; potenti vehicula vehicula fusce. Netus suspendisse diam maecenas penatibus consectetur hac. Suscipit leo faucibus elementum at fringilla iaculis dapibus tellus. Ac quisque metus duis nec tempor ridiculus sapien vestibulum. Arcu '),
(70, 'Fertilizer', 'Inorganic Fertilizers', 'Inorganic Advertisment', 120, 'Aluthgama', '2134644678', 1, '2024-10-09 09:10:21', 22, 'Lorem ipsum odor amet, consectetuer adipiscing elit. Curabitur dignissim et; potenti vehicula vehicula fusce. Netus suspendisse diam maecenas penatibus consectetur hac. Suscipit leo faucibus elementum at fringilla iaculis dapibus tellus. Ac quisque metus duis nec tempor ridiculus sapien vestibulum. Arcu '),
(71, 'Fertilizer', 'Inorganic', 'Urea for Your Farm', 250, 'kalutara', '7418529630', 1, '2024-10-09 09:13:42', 22, 'Lorem ipsum odor amet, consectetuer adipiscing elit. Curabitur dignissim et; potenti vehicula vehicula fusce. Netus suspendisse diam maecenas penatibus consectetur hac. Suscipit leo faucibus elementum at fringilla iaculis dapibus tellus. Ac quisque metus duis nec tempor ridiculus sapien vestibulum. Arcu '),
(72, 'Fertilizer', 'Organic', 'Organic Fertilizer For Farm', 80, 'MahaNuwara', '7896541230', 1, '2024-10-09 09:51:09', 22, 'Lorem ipsum odor amet, consectetuer adipiscing elit. Curabitur dignissim et; potenti vehicula vehicula fusce. Netus suspendisse diam maecenas penatibus consectetur hac. Suscipit leo faucibus elementum at fringilla iaculis dapibus tellus. Ac quisque metus duis nec tempor ridiculus sapien vestibulum. Arcu ');

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

--
-- Dumping data for table `advertisement_dryers`
--

INSERT INTO `advertisement_dryers` (`id`, `advertisement_id`, `condition_`, `rent_or_sell`, `manufacturer`, `price`) VALUES
(7, 48, 'new', 'rent', 'John Deer', 50000.00);

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

--
-- Dumping data for table `advertisement_harvesting_machines`
--

INSERT INTO `advertisement_harvesting_machines` (`id`, `advertisement_id`, `condition_`, `rent_or_sell`, `manufacturer`, `price`) VALUES
(2, 49, 'new', 'rent', 'Bajaj', 2112.00),
(3, 56, 'new', 'sell', 'John Dear', 500000.00);

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
(111, 48, 'uploads/Rectangle 26.png'),
(112, 48, 'uploads/Rectangle 30.png'),
(113, 48, 'uploads/Rectangle 40.png'),
(114, 48, 'uploads/Rectangle 40.png'),
(115, 49, 'uploads/Rectangle 26.png'),
(116, 49, 'uploads/Fertilizers.png'),
(119, 55, 'uploads/Rectangle 37.png'),
(120, 56, 'uploads/REACT.png'),
(121, 57, 'uploads/Weaverantnest05268.jpg'),
(122, 58, 'uploads/Rectangle 30.png'),
(123, 59, 'uploads/homecar.jpg'),
(124, 60, 'uploads/homecar.jpg'),
(125, 61, 'uploads/Tractors.jpg'),
(126, 62, 'uploads/Tractors.jpg'),
(127, 67, 'uploads/Pestisides.jpg'),
(128, 68, 'uploads/Rectangle 26.png'),
(129, 69, 'uploads/inorganic.jpg'),
(130, 70, 'uploads/inorganic.jpg'),
(131, 71, 'uploads/Rectangle 26.png'),
(132, 72, 'uploads/seeds.jpg');

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
(2, 69, 'urea', '2.5', 'by hand', 10000.00, 20000.00, 50000.00),
(3, 70, 'urea', '2.5', 'by hand', 10000.00, 20000.00, 50000.00),
(4, 71, 'urea', '5.2', 'By Hand using gloves', 1000.00, 5000.00, 10000.00);

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

--
-- Dumping data for table `advertisement_organic`
--

INSERT INTO `advertisement_organic` (`id`, `advertisement_id`, `type`, `npk`, `method`, `price_1L`, `price_5L`, `price_10L`) VALUES
(2, 72, 'urea', '1.5', 'safe to use by hand with/without gloves.', 500.00, 2000.00, 4500.00);

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

--
-- Dumping data for table `advertisement_pesticides`
--

INSERT INTO `advertisement_pesticides` (`id`, `advertisement_id`, `type`, `application_ratio`, `price_1L`, `price_5L`, `price_10L`) VALUES
(25, 66, 'insecticide', 0.00, 231.00, 0.00, 0.00),
(26, 67, 'herbicide', 2.50, 5000.00, 20000.00, 45000.00);

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
(3, 68, 'insecticide', 1.45, 5200.00, 14500.00, 45000.00);

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

--
-- Dumping data for table `advertisement_planting_machines`
--

INSERT INTO `advertisement_planting_machines` (`id`, `advertisement_id`, `condition_`, `rent_or_sell`, `manufacturer`, `price`) VALUES
(1, 55, 'new', 'sell', 'TATA', 10000.00);

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

--
-- Dumping data for table `advertisement_sprayers`
--

INSERT INTO `advertisement_sprayers` (`id`, `advertisement_id`, `condition_`, `rent_or_sell`, `manufacturer`, `price`) VALUES
(1, 57, 'new', 'sell', 'PVC', 10000.00),
(2, 58, 'new', 'sell', 'Arpico', 5000.00),
(3, 63, 'new', 'rent', '', 145200.00);

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

--
-- Dumping data for table `advertisement_tillages`
--

INSERT INTO `advertisement_tillages` (`id`, `advertisement_id`, `condition_`, `rent_or_sell`, `manufacturer`, `price`) VALUES
(1, 59, 'new', 'rent', '', 10000.00),
(2, 60, 'new', 'rent', '', 10000.00),
(3, 65, 'new', 'sell', '', 46.00);

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

--
-- Dumping data for table `advertisement_tractor`
--

INSERT INTO `advertisement_tractor` (`id`, `advertisement_id`, `condition_`, `rent_or_sell`, `manufacturer`, `price`, `power`) VALUES
(1, 61, 'new', 'sell', 'John Dear', 1000000.00, 450.00),
(2, 62, 'new', 'sell', 'John Dear', 1000000.00, 450.00),
(3, 64, 'used', 'rent', '', 10000.00, 0.00);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image_url`, `password_hash`, `created_at`, `updated_at`) VALUES
(21, 'AshanJR', 'ashan@gmail.com', NULL, '$2y$10$1dcF.nVpViXAtcI/ML2Q2Oj1U0qTxXmDcNoGDZ4WTEsROoY0BFmr2', '2024-10-08 11:52:41', '2024-10-08 11:52:41'),
(22, 'AshanJR', 'ashan.test@gmail.com', 'uploads/profile_images/1728443131__fed1398f-3e13-414d-ba2c-c7ad57bfc557.jpeg', '$2y$10$kyZXyevLuQO38LtTo4ne7O4b4IpoRUG/LbCDR6XrG5BrTbxtLQRnu', '2024-10-09 03:04:41', '2024-10-09 03:05:31');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `advertisement_dryers`
--
ALTER TABLE `advertisement_dryers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `advertisement_harvesting_machines`
--
ALTER TABLE `advertisement_harvesting_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertisement_images`
--
ALTER TABLE `advertisement_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `advertisement_inorganic`
--
ALTER TABLE `advertisement_inorganic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `advertisement_irrigation_systems`
--
ALTER TABLE `advertisement_irrigation_systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertisement_organic`
--
ALTER TABLE `advertisement_organic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertisement_others`
--
ALTER TABLE `advertisement_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisement_pesticides`
--
ALTER TABLE `advertisement_pesticides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `advertisement_pgr`
--
ALTER TABLE `advertisement_pgr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertisement_planting_machines`
--
ALTER TABLE `advertisement_planting_machines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `advertisement_tuber`
--
ALTER TABLE `advertisement_tuber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
