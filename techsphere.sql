-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2025 at 01:19 PM
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
-- Database: `tech_sphere`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_name` varchar(100) NOT NULL,
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
  `address_id` int(11) NOT NULL,
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
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `total_has_been_paid` int(70) DEFAULT NULL,
  `payment_status` enum('Unpaid','Successful') DEFAULT 'Unpaid'
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
  `product_description` text DEFAULT NULL,
  `product_stock_quantity` int(5) DEFAULT NULL,
  `product_sold_quantity` int(5) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `product_image_url` text DEFAULT NULL,
  `created_by_admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_accessories`
--

CREATE TABLE `product_accessories` (
  `product_id` int(11) NOT NULL,
  `accessory_type` varchar(50) NOT NULL,
  `compatibility_notes` text DEFAULT NULL,
  `included_accessories` text DEFAULT NULL,
  `connectivity` varchar(100) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_case`
--

CREATE TABLE `product_case` (
  `product_id` int(11) NOT NULL,
  `case_type` varchar(50) NOT NULL,
  `case_form_factor` varchar(100) NOT NULL,
  `expansion_slots` int(11) NOT NULL,
  `drive_bays` varchar(100) NOT NULL,
  `radiator_support` varchar(100) DEFAULT NULL,
  `included_fans` varchar(100) DEFAULT NULL,
  `max_gpu_length` int(11) DEFAULT NULL COMMENT 'mm',
  `max_cpu_cooler_height` int(11) DEFAULT NULL COMMENT 'mm',
  `side_panel_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_cooling`
--

CREATE TABLE `product_cooling` (
  `product_id` int(11) NOT NULL,
  `cooling_type` enum('Air','Liquid','Hybrid') NOT NULL,
  `fan_size` varchar(20) DEFAULT NULL COMMENT 'mm',
  `noise_level` varchar(20) DEFAULT NULL COMMENT 'dB',
  `radiator_size` varchar(20) DEFAULT NULL,
  `compatibility` text DEFAULT NULL,
  `max_tdp` int(11) DEFAULT NULL COMMENT 'Watts',
  `rgb_support` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_cpu`
--

CREATE TABLE `product_cpu` (
  `product_id` int(11) NOT NULL,
  `socket_type` varchar(50) NOT NULL,
  `core_count` int(11) NOT NULL,
  `thread_count` int(11) NOT NULL,
  `base_clock` varchar(20) NOT NULL COMMENT 'GHz',
  `boost_clock` varchar(20) DEFAULT NULL COMMENT 'GHz',
  `tdp` int(11) NOT NULL COMMENT 'Watts',
  `integrated_graphics` varchar(100) DEFAULT NULL,
  `l3_cache` varchar(20) NOT NULL COMMENT 'MB',
  `manufacturing_process` varchar(20) DEFAULT NULL COMMENT 'nm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_gpu`
--

CREATE TABLE `product_gpu` (
  `product_id` int(11) NOT NULL,
  `gpu_chipset` varchar(100) NOT NULL,
  `vram` varchar(20) NOT NULL COMMENT 'GB',
  `vram_type` varchar(20) NOT NULL,
  `gpu_clock` varchar(20) NOT NULL COMMENT 'MHz',
  `boost_clock_gpu` varchar(20) DEFAULT NULL COMMENT 'MHz',
  `memory_interface` varchar(20) NOT NULL COMMENT 'bit',
  `gpu_length` int(11) NOT NULL COMMENT 'mm',
  `power_connectors` varchar(100) NOT NULL,
  `recommended_psu` int(11) DEFAULT NULL COMMENT 'Watts'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_monitor`
--

CREATE TABLE `product_monitor` (
  `product_id` int(11) NOT NULL,
  `screen_size` varchar(20) NOT NULL COMMENT 'inches',
  `resolution` varchar(20) NOT NULL,
  `refresh_rate` varchar(20) NOT NULL COMMENT 'Hz',
  `response_time` varchar(20) NOT NULL COMMENT 'ms',
  `panel_type` varchar(50) NOT NULL,
  `aspect_ratio` varchar(20) NOT NULL,
  `adaptive_sync` varchar(50) DEFAULT NULL,
  `hdr_support` tinyint(1) DEFAULT 0,
  `curved` tinyint(1) DEFAULT 0,
  `vesa_mount` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_motherboard`
--

CREATE TABLE `product_motherboard` (
  `product_id` int(11) NOT NULL,
  `motherboard_form_factor` varchar(20) NOT NULL,
  `motherboard_chipset` varchar(50) NOT NULL,
  `socket_type` varchar(50) NOT NULL,
  `memory_slots` int(11) NOT NULL,
  `max_memory` varchar(20) NOT NULL COMMENT 'GB',
  `sata_ports` int(11) NOT NULL,
  `m2_slots` int(11) NOT NULL,
  `pcie_slots` varchar(100) NOT NULL,
  `wifi_support` tinyint(1) DEFAULT 0,
  `bluetooth_support` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_psu`
--

CREATE TABLE `product_psu` (
  `product_id` int(11) NOT NULL,
  `psu_wattage` int(11) NOT NULL,
  `psu_efficiency` varchar(20) NOT NULL,
  `psu_modular` enum('Non-modular','Semi-modular','Full-modular') NOT NULL,
  `psu_form_factor` varchar(20) NOT NULL,
  `pcie_connectors` int(11) DEFAULT NULL,
  `sata_connectors` int(11) DEFAULT NULL,
  `cpu_connectors` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_ram`
--

CREATE TABLE `product_ram` (
  `product_id` int(11) NOT NULL,
  `ram_type` varchar(20) NOT NULL,
  `ram_speed` varchar(20) NOT NULL COMMENT 'MHz',
  `ram_capacity` varchar(20) NOT NULL COMMENT 'GB',
  `ram_latency` varchar(20) NOT NULL,
  `ram_voltage` varchar(20) NOT NULL COMMENT 'V',
  `ram_modules` int(11) NOT NULL COMMENT 'Number of sticks in kit',
  `ecc_support` tinyint(1) DEFAULT 0,
  `rgb_support` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_storage`
--

CREATE TABLE `product_storage` (
  `product_id` int(11) NOT NULL,
  `storage_type` enum('HDD','SSD','NVMe','Hybrid') NOT NULL,
  `storage_capacity` varchar(20) NOT NULL COMMENT 'GB/TB',
  `read_speed` varchar(20) DEFAULT NULL COMMENT 'MB/s',
  `write_speed` varchar(20) DEFAULT NULL COMMENT 'MB/s',
  `interface` varchar(50) NOT NULL,
  `rpm` int(11) DEFAULT NULL COMMENT 'For HDDs',
  `endurance_rating` varchar(50) DEFAULT NULL COMMENT 'For SSDs (TBW)',
  `nvme_protocol` varchar(20) DEFAULT NULL
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
  `user_bio` text DEFAULT NULL,
  `user_birthdate` date DEFAULT NULL,
  `user_imgprofile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_phone_number`, `user_password`, `user_gender`, `user_bio`, `user_birthdate`, `user_imgprofile`) VALUES
(1, 'test', 'test@gmail.com', 2132131232, '$2y$10$cx3VZWhCTMrVoWAXXHL0N.TBMbtRQFHdtFGC7UJZQKJZSApheZ.5S', '', '', '0000-00-00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_user_id` (`user_id`);

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_address_id` (`address_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `created_by_admin_id` (`created_by_admin_id`);

--
-- Indexes for table `product_accessories`
--
ALTER TABLE `product_accessories`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_case`
--
ALTER TABLE `product_case`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_cooling`
--
ALTER TABLE `product_cooling`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_cpu`
--
ALTER TABLE `product_cpu`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_gpu`
--
ALTER TABLE `product_gpu`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_monitor`
--
ALTER TABLE `product_monitor`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_motherboard`
--
ALTER TABLE `product_motherboard`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_psu`
--
ALTER TABLE `product_psu`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_ram`
--
ALTER TABLE `product_ram`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_storage`
--
ALTER TABLE `product_storage`
  ADD PRIMARY KEY (`product_id`);

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
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

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
  ADD CONSTRAINT `fk_address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`created_by_admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `product_accessories`
--
ALTER TABLE `product_accessories`
  ADD CONSTRAINT `product_accessories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_case`
--
ALTER TABLE `product_case`
  ADD CONSTRAINT `product_case_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_cooling`
--
ALTER TABLE `product_cooling`
  ADD CONSTRAINT `product_cooling_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_cpu`
--
ALTER TABLE `product_cpu`
  ADD CONSTRAINT `product_cpu_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_gpu`
--
ALTER TABLE `product_gpu`
  ADD CONSTRAINT `product_gpu_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_monitor`
--
ALTER TABLE `product_monitor`
  ADD CONSTRAINT `product_monitor_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_motherboard`
--
ALTER TABLE `product_motherboard`
  ADD CONSTRAINT `product_motherboard_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_psu`
--
ALTER TABLE `product_psu`
  ADD CONSTRAINT `product_psu_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_ram`
--
ALTER TABLE `product_ram`
  ADD CONSTRAINT `product_ram_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product_storage`
--
ALTER TABLE `product_storage`
  ADD CONSTRAINT `product_storage_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
