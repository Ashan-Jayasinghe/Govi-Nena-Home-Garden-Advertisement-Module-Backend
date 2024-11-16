-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2024 at 05:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `email`, `password`, `role`, `is_active`, `created_at`, `updated_at`, `image_url`) VALUES
(17, 'Test', 'test@gmail.lk', '$2b$10$YOlBjN7gnXcD7XZhHn5IS./ozFdwsBprIXH4fd/kG8vNcF8DapvxW', 'admin', 1, '2024-11-14 05:28:48', '2024-11-14 05:28:48', ''),
(18, 'Ashan JR', 'ashanjr.test@test.lk', '$2b$10$/0eq2YeG./t45JVfdfuR3ORsqx4Fee28bSPFz02sjJoEC4GnTbpvy', 'admin', 1, '2024-11-14 11:28:31', '2024-11-14 11:28:31', ''),
(19, 'Test User', 'a@a.lk', '$2b$10$pkOIX5li/Ti79HnXVxFly.PxbHtJteyI//.AQaNRK/2ZJSzc5ao2q', 'admin', 1, '2024-11-14 12:33:03', '2024-11-14 12:33:03', ''),
(20, 'AshanJR', 'ashan.test@test.com', '$2b$10$iG2mmVOSRBTlH2uka3FWqeRyhAvfgIPTGmeP7w1gFqIBlv098lRIi', 'admin', 1, '2024-11-15 17:21:00', '2024-11-15 17:21:00', ''),
(21, 'AshanJayasinghe', 'ashan.test@test.gov', '$2b$10$lAfdYu2SQq.VkSz.YCd1ueBjhpZK47DI.im2WeO0F8cADGeVNSUwO', 'admin', 1, '2024-11-15 17:21:59', '2024-11-15 17:21:59', '');

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

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `category`, `subcategory`, `title`, `stock`, `address`, `mobile`, `accept_terms`, `created_at`, `user_id`, `description`, `expires_at`, `is_active`) VALUES
(120, 'Fertilizer', 'Inorganic', 'Potassium Chloride: Boost Your Plantation’s Growth and Health!', 150, '23, Galle Road, Colombo 03, Sri Lanka', '0740984334', 1, '2024-11-15 11:37:12', 36, '“Unlock Your Plantation’s Full Potential with Potassium Chloride!”\r\n\r\nBoost your crop growth with Potassium Chloride, the essential fertilizer for improving plant health. Known for its high potassium content, it enhances disease resistance, strengthens roots, and promotes overall plant vitality. Whether you’re growing vegetables, fruits, or other crops, Potassium Chloride ensures a bountiful harvest. Apply it today for greener, healthier plants and a flourishing plantation!', '2024-12-15 12:37:12', 0),
(122, 'Fertilizer', 'Organic', 'Transform Your Garden with Rich, Nutrient-Packed Compost', 70, 'No. 45, Kandy Road, Nugegoda, Western Province, Sri Lanka', '0769056981', 1, '2024-11-15 12:32:15', 36, 'Premium quality organic compost, perfect for enriching soil, improving plant growth, and supporting sustainable gardening practices. Made from nutrient-rich organic materials, this compost provides a balanced mix of essential nutrients for healthy crops, flowers, and vegetables. Ideal for gardeners, farmers, and landscapers looking for an eco-friendly and effective soil amendment. Available in convenient quantities to suit your needs. Add it to your garden and see the difference in plant vitality.', '2024-12-15 13:32:15', 1),
(125, 'Planting Materials', 'Seeds', 'Quality Barley Seeds for a Thriving Crop', 500, 'No 120, Kaburugamuwa, Matara, Sri Lanka', '0767856104', 1, '2024-11-15 14:15:32', 36, 'Barley is a hardy and versatile crop that thrives in various soil conditions. Our premium quality barley seeds are perfect for both commercial and home farming. Whether you’re growing barley for food, animal feed, or malting, our seeds offer excellent germination rates and strong, healthy plants. Start your barley plantation today for a profitable and sustainable harvest.', '2024-12-15 15:15:32', 1),
(126, 'Planting Materials', 'Seedlings', 'Mango Seedlings for Sale – Start Your Fruitful Journey!', 150, 'Welimada, Nuwara Eliya, Sri Lanka', '0716787360', 1, '2024-11-15 14:30:36', 36, 'Grow your own mango tree with our healthy, high-quality mango seedlings! Perfect for home gardens or small orchards, our mango seedlings are carefully nurtured to ensure strong roots and vibrant growth. Whether you’re looking for a sweet tropical fruit or a shade tree, our mango seedlings are the perfect start to a fruitful future. Order now and begin cultivating your own mangoes!', '2024-12-15 15:30:36', 1),
(128, 'Planting Materials', 'Tubers', 'Fresh Ginger Tubers for Planting - High Yield & Quality', 0, 'Muththur, Jaffna, Sri Lanka', '0741289675', 1, '2024-11-15 15:36:35', 36, 'Premium-quality ginger tubers perfect for planting. These fresh, healthy tubers ensure high germination rates and vigorous growth. Ideal for home gardens or commercial farming, they thrive in well-drained soil and warm climates. Start growing your own flavorful and aromatic ginger today!', '2024-12-15 16:36:35', 1);

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

--
-- Dumping data for table `advertisement_images`
--

INSERT INTO `advertisement_images` (`id`, `advertisement_id`, `image_path`) VALUES
(261, 120, 'uploads/DALL·E_2024_11_15_16_49_53_Create_a_professional_advertisement_for.webp'),
(262, 120, 'uploads/DALL·E_2024_11_15_16_50_09_Design_a_visually_appealing_advertisement.webp'),
(263, 120, 'uploads/DALL·E_2024_11_15_16_50_17_Create_a_professional_and_modern_advertisement.webp'),
(264, 120, 'uploads/DALL·E_2024_11_15_16_50_21_Design_an_advertisement_for_potassium.webp'),
(269, 122, 'uploads/compost 01.jpg'),
(270, 122, 'uploads/compost 02.jpg'),
(271, 122, 'uploads/compost 04.jpg'),
(272, 122, 'uploads/compost 05.jpg'),
(278, 125, 'uploads/DALL·E_2024_10_14_12_02_54_A_vibrant_advertisement_showcasing_a.webp'),
(279, 125, 'uploads/DALL·E_2024_10_14_12_03_36_A_colorful_advertisement_displaying_a.webp'),
(280, 125, 'uploads/DALL·E_2024_10_14_12_04_10_An_eye_catching_advertisement_showcasing.webp'),
(281, 125, 'uploads/DALL·E_2024_11_15_14_12_08_A_realistic_image_of_a_variety_of_grains.webp'),
(282, 126, 'uploads/2024-11-15 19.58.47.jpg'),
(283, 126, 'uploads/2024-11-15 19.58.50.jpg'),
(284, 126, 'uploads/2024-11-15 19.58.44.jpg'),
(285, 126, 'uploads/DALL·E_2024_11_15_19_57_34_Create_an_image_featuring_healthy_mango.webp'),
(290, 128, 'uploads/2024-11-15 21.01.29.jpg'),
(291, 128, 'uploads/2024-11-15 21.01.33.jpg'),
(292, 128, 'uploads/2024-11-15 21.01.20.jpg'),
(293, 128, 'uploads/2024-11-15 21.01.24.jpg');

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
  `unit` varchar(20) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_inorganic`
--

INSERT INTO `advertisement_inorganic` (`id`, `advertisement_id`, `type`, `npk`, `method`, `unit`, `amount`, `price`) VALUES
(9, 120, 'kcl', '0-0-60', 'Apply Potassium Chloride based on soil test results, using the appropriate method and timing, followed by thorough watering and monitoring plant response', 'kg', 1.00, 3700.00);

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
  `unit` varchar(20) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_organic`
--

INSERT INTO `advertisement_organic` (`id`, `advertisement_id`, `type`, `npk`, `method`, `unit`, `amount`, `price`) VALUES
(18, 122, 'compost', '2-1-1', 'Mix organic materials with a balanced blend of carbon-rich and nitrogen-rich ingredients, then allow the mixture to decompose over time through aerobic processes.', 'kg', 10.00, 2750.00);

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

--
-- Dumping data for table `advertisement_seedlings`
--

INSERT INTO `advertisement_seedlings` (`id`, `advertisement_id`, `type`, `variety`, `age`, `size`, `price`) VALUES
(5, 126, 'fruit', 'Mango', 7, '27', 1250.00);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_seeds`
--

CREATE TABLE `advertisement_seeds` (
  `id` int(11) NOT NULL,
  `advertisement_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `variety` varchar(255) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_seeds`
--

INSERT INTO `advertisement_seeds` (`id`, `advertisement_id`, `type`, `variety`, `unit`, `amount`, `price`) VALUES
(11, 125, 'grains', 'Barley', 'g', 100.00, 270.00);

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
  `unit` varchar(20) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advertisement_tuber`
--

INSERT INTO `advertisement_tuber` (`id`, `advertisement_id`, `type`, `variety`, `unit`, `amount`, `price`) VALUES
(5, 128, 'medicinal-functional', 'Ginger', 'kg', 1.00, 2250.00);

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image_url`, `password_hash`, `created_at`, `updated_at`, `is_active`, `deactivation_reason`, `activation_reason`) VALUES
(36, 'Ashan Jayasinghe', 'ashan.test@gmail.com', NULL, '$2y$10$qxFPAuJMr5G/L2NZr7gza.erKGdtzGhQ1Gp/UVaByxbqKRvTgiPzC', '2024-11-14 22:53:39', '2024-11-14 22:53:39', 1, NULL, NULL);

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
-- Dumping data for table `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `user_id`, `token`, `created_at`, `expires_at`, `is_revoked`) VALUES
(19, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE3LCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE1Nzg3MTksImV4cCI6MTczMTU4MjMxOX0.PZudvlPisAJZtzxF-Dzt_9DNHzpTzxtIiIYfW1nhnhc', '2024-11-14 10:05:19', '2024-11-14 16:35:19', 1),
(20, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE3LCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE1Nzg4MTMsImV4cCI6MTczMTU4MjQxM30.BGFmcXT3C2hFvFeETcfDXk3hMTCU0KoSue7eoYkcshQ', '2024-11-14 10:06:53', '2024-11-14 16:36:53', 1),
(21, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE3LCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE1NzkwOTcsImV4cCI6MTczMTU4MjY5N30.jdEKCTpLg59o6fofpxh3sBjfNqjNoJEB2wKs4EmIJ5M', '2024-11-14 10:11:37', '2024-11-14 16:41:37', 1),
(22, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE3LCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE1NzkyMTUsImV4cCI6MTczMTU4MjgxNX0.0A_KCQyLPDiX_ZYyI0qkTbnRSSjLsPmv9K1aLvWmMmY', '2024-11-14 10:13:35', '2024-11-14 16:43:35', 1),
(23, 18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE4LCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE1ODM3MjEsImV4cCI6MTczMTU4NzMyMX0.JRKP9Ect45cF-61ts1WbuW8phmUBECDmF7mCxMZMExc', '2024-11-14 11:28:41', '2024-11-14 17:58:41', 1),
(24, 19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjE5LCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE1ODc1OTksImV4cCI6MTczMTU5MTE5OX0.VJxkcpV529KHtXWAmUCe4x3CIOpu8p7T84YD4rghfdQ', '2024-11-14 12:33:19', '2024-11-14 19:03:19', 0),
(25, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE2OTEzMzYsImV4cCI6MTczMTY5NDkzNn0.ZYRNYI96DQk4NH3fhdVLuzPDe_tr8U14fV14B1v4Eq8', '2024-11-15 17:22:16', '2024-11-15 23:52:16', 1),
(26, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE2OTE0NDksImV4cCI6MTczMTY5NTA0OX0.BUf94GqVaV55VxdhDXhR7ujFBW5-iGEn_RRCWEFrDgs', '2024-11-15 17:24:09', '2024-11-15 23:54:09', 0),
(27, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE2OTQzNzAsImV4cCI6MTczMTY5Nzk3MH0.0qayxj64Q2ZSYGuo1Djbe6R2_aAFiWxYxPVR_XHZTfU', '2024-11-15 18:12:50', '2024-11-16 00:42:50', 0),
(28, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE2OTUxNTMsImV4cCI6MTczMTY5ODc1M30.QLzt_0IpTEiLeJhyTE2oYk5d-Vg4OA3FAGf6uo0jPL4', '2024-11-15 18:25:53', '2024-11-16 00:55:53', 0),
(29, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3MzAxNjUsImV4cCI6MTczMTczMzc2NX0._x0JYCti7Bvdgezdc9TYBoD2MHJcG3oNWVkzdCuZh7k', '2024-11-16 04:09:25', '2024-11-16 10:39:25', 0),
(30, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3MzQ5MzEsImV4cCI6MTczMTczODUzMX0.asN89IjmQiKd-w0BK-t-yiwqydSaVPkjWQX5nTutt8k', '2024-11-16 05:28:51', '2024-11-16 11:58:51', 0),
(31, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NDAzMjcsImV4cCI6MTczMTc0MzkyN30.JD-nj8hyq53BQ3lHFb9pSuXW6BRFPd6pqJaLprjTQrI', '2024-11-16 06:58:47', '2024-11-16 13:28:47', 0),
(32, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NDQwMDgsImV4cCI6MTczMTc0NzYwOH0.taEy11FIsWsUb4qQqgkqNbvc3WxPMLsk_bfaLvv_6zE', '2024-11-16 08:00:08', '2024-11-16 14:30:08', 0),
(33, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NDc3MjgsImV4cCI6MTczMTc1MTMyOH0.dtiuRM6sW-1hrtiK9V3HeYTo4h14qmfEcRloUJL-ccY', '2024-11-16 09:02:08', '2024-11-16 15:32:08', 1),
(34, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NDc3MjksImV4cCI6MTczMTc1MTMyOX0.8yFwls5FelH1HoiK6DLJwhZfK3fSFKwKnwYu86lP3XQ', '2024-11-16 09:02:09', '2024-11-16 15:32:09', 0),
(35, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NTEwNjIsImV4cCI6MTczMTc1NDY2Mn0.eeNFMXXkJL_fzw7bniN324ReWitLmkYYdIWlnuQm24g', '2024-11-16 09:57:42', '2024-11-16 16:27:42', 0),
(36, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NTMxNzEsImV4cCI6MTczMTc1Njc3MX0.03T1pBHisUOCIRsCMbaOqYplBnF5Kjkw_bPxTnspuF0', '2024-11-16 10:32:51', '2024-11-16 17:02:51', 0),
(37, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NTQ3MjAsImV4cCI6MTczMTc1ODMyMH0.nRv3vmP1vMqPEAiOMl9KWw3pfYLZCbaDZaFZE2_03DA', '2024-11-16 10:58:40', '2024-11-16 17:28:40', 0),
(38, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NTgzNjcsImV4cCI6MTczMTc2MTk2N30.uos4dlr9i1uHNfssxyMy3ZY7qbIc6L11JxzJ6FggYxk', '2024-11-16 11:59:27', '2024-11-16 18:29:27', 0),
(39, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NTk5NTcsImV4cCI6MTczMTc2MzU1N30.w1_r10evTOzG6oo_AYFqamcWRcRuJAYTYJIkVz-6W6s', '2024-11-16 12:25:57', '2024-11-16 18:55:57', 0),
(40, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NjIwMDEsImV4cCI6MTczMTc2NTYwMX0.KlQrRmSIhwa2AmfKE_f6B0vcoXcn2FgnB9zRuaIDWso', '2024-11-16 13:00:01', '2024-11-16 19:30:01', 0),
(41, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NjU2MzYsImV4cCI6MTczMTc2OTIzNn0.kMnFASE2b8uAqTeT-JyhSBoug5am1nsoGLEb8UgSFZw', '2024-11-16 14:00:36', '2024-11-16 20:30:36', 1),
(42, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NjY1NDksImV4cCI6MTczMTc3MDE0OX0.JcA2-p6EGiscoHrwB4VYxejQxOPx65_St9fZFOBwysE', '2024-11-16 14:15:49', '2024-11-16 20:45:49', 1),
(43, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NjY2MTQsImV4cCI6MTczMTc3MDIxNH0.reqg1CGPmx416qWcB7601jByNJX3s35ZbCV3LNgQRAo', '2024-11-16 14:16:54', '2024-11-16 20:46:54', 0),
(44, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3Njc3MTksImV4cCI6MTczMTc3MTMxOX0.H905dLd7zNJEnTlzno6WHADOjlY1IVjuAbfAi_2YzMI', '2024-11-16 14:35:19', '2024-11-16 21:05:19', 1),
(45, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3Njg2MjgsImV4cCI6MTczMTc3MjIyOH0.HEEjfcP1zkB4mq7Jji7COAsJSC4wQi7gyOn4pVfBZpM', '2024-11-16 14:50:28', '2024-11-16 21:20:28', 0),
(46, 20, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MzE3NzIzODYsImV4cCI6MTczMTc3NTk4Nn0.cH1V_ubXs_nBPQiZsK8RlePHlRHAgxjZfyxyQPCvozA', '2024-11-16 15:53:06', '2024-11-16 22:23:06', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `advertisement_inorganic`
--
ALTER TABLE `advertisement_inorganic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `advertisement_irrigation_systems`
--
ALTER TABLE `advertisement_irrigation_systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `advertisement_organic`
--
ALTER TABLE `advertisement_organic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `advertisement_seeds`
--
ALTER TABLE `advertisement_seeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `saved_ads`
--
ALTER TABLE `saved_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
