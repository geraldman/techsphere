-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2025 at 08:18 PM
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
-- Database: `techsphere_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `user_id` int(11) NOT NULL,
  `user_address_name` varchar(100) NOT NULL,
  `address_location` text NOT NULL,
  `address_number` int(6) NOT NULL,
  `address_postal_code` int(6) NOT NULL,
  `address_city` varchar(100) NOT NULL,
  `address_country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(0, 'Admin Tech Sphere', 'admin@techsphere.com', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cart_product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_total_purchase` decimal(10,2) DEFAULT NULL,
  `order_status` enum('Pending','Shipped','Delivered','Cancelled') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `model_number` varchar(100) DEFAULT NULL,
  `product_type` enum('CPU','GPU','RAM','Motherboard','Storage','PSU','Case','Cooling','Monitor','Accessories') NOT NULL,
  `product_brand` varchar(100) DEFAULT NULL,
  `dimensions` varchar(100) DEFAULT NULL COMMENT 'LxWxH in mm',
  `weight` decimal(5,2) DEFAULT NULL COMMENT 'Weight in grams',
  `color` varchar(50) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `warranty` varchar(50) DEFAULT NULL,
  `socket_type` varchar(50) DEFAULT NULL,
  `core_count` int(11) DEFAULT NULL,
  `thread_count` int(11) DEFAULT NULL,
  `base_clock` varchar(20) DEFAULT NULL COMMENT 'GHz',
  `boost_clock` varchar(20) DEFAULT NULL COMMENT 'GHz',
  `tdp` int(11) DEFAULT NULL COMMENT 'Watts',
  `integrated_graphics` varchar(100) DEFAULT NULL,
  `l3_cache` varchar(20) DEFAULT NULL COMMENT 'MB',
  `gpu_chipset` varchar(100) DEFAULT NULL,
  `vram` varchar(20) DEFAULT NULL COMMENT 'GB',
  `vram_type` varchar(20) DEFAULT NULL,
  `gpu_clock` varchar(20) DEFAULT NULL COMMENT 'MHz',
  `boost_clock_gpu` varchar(20) DEFAULT NULL COMMENT 'MHz',
  `memory_interface` varchar(20) DEFAULT NULL COMMENT 'bit',
  `gpu_length` int(11) DEFAULT NULL COMMENT 'mm',
  `power_connectors` varchar(100) DEFAULT NULL,
  `ram_type` varchar(20) DEFAULT NULL,
  `ram_speed` varchar(20) DEFAULT NULL COMMENT 'MHz',
  `ram_capacity` varchar(20) DEFAULT NULL COMMENT 'GB',
  `ram_latency` varchar(20) DEFAULT NULL,
  `ram_voltage` varchar(20) DEFAULT NULL COMMENT 'V',
  `ram_modules` int(11) DEFAULT NULL COMMENT 'Number of sticks in kit',
  `motherboard_form_factor` varchar(20) DEFAULT NULL,
  `motherboard_chipset` varchar(50) DEFAULT NULL,
  `memory_slots` int(11) DEFAULT NULL,
  `max_memory` varchar(20) DEFAULT NULL COMMENT 'GB',
  `sata_ports` int(11) DEFAULT NULL,
  `m2_slots` int(11) DEFAULT NULL,
  `pcie_slots` varchar(100) DEFAULT NULL,
  `storage_type` enum('HDD','SSD','NVMe','Hybrid') DEFAULT NULL,
  `storage_capacity` varchar(20) DEFAULT NULL COMMENT 'GB/TB',
  `read_speed` varchar(20) DEFAULT NULL COMMENT 'MB/s',
  `write_speed` varchar(20) DEFAULT NULL COMMENT 'MB/s',
  `interface` varchar(50) DEFAULT NULL,
  `rpm` int(11) DEFAULT NULL COMMENT 'For HDDs',
  `psu_wattage` int(11) DEFAULT NULL,
  `psu_efficiency` varchar(20) DEFAULT NULL,
  `psu_modular` enum('Non-modular','Semi-modular','Full-modular') DEFAULT NULL,
  `psu_form_factor` varchar(20) DEFAULT NULL,
  `case_type` varchar(50) DEFAULT NULL,
  `case_form_factor` varchar(100) DEFAULT NULL,
  `expansion_slots` int(11) DEFAULT NULL,
  `drive_bays` varchar(100) DEFAULT NULL,
  `radiator_support` varchar(100) DEFAULT NULL,
  `included_fans` varchar(100) DEFAULT NULL,
  `cooling_type` enum('Air','Liquid','Hybrid') DEFAULT NULL,
  `fan_size` varchar(20) DEFAULT NULL COMMENT 'mm',
  `noise_level` varchar(20) DEFAULT NULL COMMENT 'dB',
  `radiator_size` varchar(20) DEFAULT NULL,
  `screen_size` varchar(20) DEFAULT NULL COMMENT 'inches',
  `resolution` varchar(20) DEFAULT NULL,
  `refresh_rate` varchar(20) DEFAULT NULL COMMENT 'Hz',
  `response_time` varchar(20) DEFAULT NULL COMMENT 'ms',
  `panel_type` varchar(50) DEFAULT NULL,
  `aspect_ratio` varchar(20) DEFAULT NULL,
  `adaptive_sync` varchar(50) DEFAULT NULL,
  `compatibility_notes` text DEFAULT NULL,
  `included_accessories` text DEFAULT NULL,
  `product_socket` varchar(50) DEFAULT NULL,
  `product_form_factor` varchar(50) DEFAULT NULL,
  `product_speed` varchar(50) DEFAULT NULL,
  `product_capacity` varchar(50) DEFAULT NULL,
  `product_interface` varchar(50) DEFAULT NULL,
  `product_wattage` varchar(50) DEFAULT NULL,
  `product_efficiency_rating` varchar(50) DEFAULT NULL,
  `product_chipset` varchar(50) DEFAULT NULL,
  `product_memory_type` varchar(50) DEFAULT NULL,
  `product_core_count` int(11) DEFAULT NULL,
  `product_thread_count` int(11) DEFAULT NULL,
  `product_clock_speed` varchar(50) DEFAULT NULL,
  `product_boost_clock` varchar(50) DEFAULT NULL,
  `product_tdp` varchar(50) DEFAULT NULL,
  `product_resolution` varchar(50) DEFAULT NULL,
  `product_refresh_rate` varchar(50) DEFAULT NULL,
  `product_response_time` varchar(50) DEFAULT NULL,
  `product_compatibility_notes` text DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `product_stock_quantity` int(5) DEFAULT NULL,
  `product_sold_quantity` int(5) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_image_url` text DEFAULT NULL,
  `created_by_admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone_number` bigint(20) DEFAULT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_gender` enum('M','F') DEFAULT NULL,
  `user_address` text DEFAULT NULL,
  `user_bio` text DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_imgprofile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_phone_number`, `user_password`, `user_gender`, `user_address`, `user_bio`, `user_birthdate`, `user_imgprofile`) VALUES
(1, 'test', 'test@gmail.com', 2132131232, '$2y$10$cx3VZWhCTMrVoWAXXHL0N.TBMbtRQFHdtFGC7UJZQKJZSApheZ.5S', '', NULL, '', '0000-00-00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`user_id`,`user_address_name`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `created_by_admin_id` (`created_by_admin_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_phone_number` (`user_phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`created_by_admin_id`) REFERENCES `admin` (`admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
