-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2022 at 10:42 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `street` varchar(32) NOT NULL,
  `building` varchar(32) NOT NULL,
  `floor` smallint(3) NOT NULL,
  `flat` smallint(3) NOT NULL,
  `type` enum('home','work') NOT NULL,
  `notes` text DEFAULT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `building`, `floor`, `flat`, `type`, `notes`, `region_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'el nasr ', '15', 2, 8, 'home', NULL, 2, 15, '2022-10-21 10:50:50', '2022-10-24 18:07:01'),
(2, 'el noor', '23', 12, 2, 'work', NULL, 4, 20, '2022-10-21 10:52:39', NULL),
(3, 'el mehwar', '21', 10, 2, 'work', NULL, 3, 18, '2022-10-21 10:54:04', '2022-10-24 18:06:25');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `image` varchar(64) NOT NULL DEFAULT 'HOLDER.PNG',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => AVAILABLE , 0 => NOT AVAILABLE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name_en`, `name_ar`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'lenovo', '', 'lenovo.jpg', 1, '2022-10-19 09:34:11', '2022-10-19 18:03:17'),
(2, 'iphone', '', 'iphone.jpg', 1, '2022-10-21 12:34:21', '2022-10-21 19:03:25'),
(3, 'oppo', '', 'oppo.jpg', 1, '2022-10-19 09:34:39', '2022-10-19 18:03:32'),
(4, 'samsung', '', 'samsung.jpg', 1, '2022-10-21 09:34:39', '2022-10-21 18:03:39'),
(5, 'carefore', '', 'carefore.jpg', 1, '2022-10-21 17:26:10', '2022-10-24 18:27:21');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` smallint(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `image` varchar(64) NOT NULL DEFAULT 'imageholder.png',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => available , 0 => not available',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_ar`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'books', '', 'defult.jpg', 1, '2022-10-21 07:48:14', NULL),
(2, 'Electronics', '', 'defult.jpg', 1, '2022-10-19 07:48:55', NULL),
(3, 'Supermarket', '', 'defult.jpg', 1, '2022-10-21 07:49:36', NULL),
(4, 'furniture', '', 'defult.jpg', 1, '2022-10-21 07:50:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => AVAILABLE, 0 => NOT AVAILABLE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name_en`, `name_ar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'cairo', '', 1, '2022-10-21 10:38:12', NULL),
(2, 'giza', '', 1, '2022-10-21 11:45:17', NULL),
(3, 'Alex', '', 1, '2022-10-21 19:48:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(8) NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `discount` smallint(2) NOT NULL,
  `discount_type` varchar(32) NOT NULL,
  `max_usage_count` int(6) NOT NULL,
  `max_usage_count_per_user` tinyint(1) NOT NULL,
  `min_order_price` decimal(5,2) NOT NULL,
  `max_discount_price` smallint(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => AVAILABLE , 0 => NOT AVAILABLE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `favs`
--

CREATE TABLE `favs` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Stand-in structure for view `most_ordered`
-- (See below for the actual view)
--
CREATE TABLE `most_ordered` (
`price` decimal(10,2)
,`quantity` smallint(3)
,`product_id` bigint(20) unsigned
,`order_id` bigint(20) unsigned
,`product_name_en` varchar(32)
,`product_price` decimal(9,2) unsigned
,`product_image` varchar(64)
,`order_number` int(12)
,`orders_per_product` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_en` varchar(32) NOT NULL,
  `title_ar` varchar(32) NOT NULL,
  `discount` smallint(2) NOT NULL,
  `discount_type` varchar(32) NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `image` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 => AVAILABLE , 0 => NOT AVAILABLE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `number` int(12) NOT NULL,
  `deliverd_at` datetime NOT NULL,
  `notes` text DEFAULT NULL,
  `total_price` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => AVAILABLE , 0 => NOT AVAILABLE',
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `number`, `deliverd_at`, `notes`, `total_price`, `status`, `coupon_id`, `address_id`, `created_at`, `updated_at`) VALUES
(1, 1034593689, '2022-10-21 12:55:59', NULL, '31000.00', 1, NULL, 1, '2022-10-21 10:56:40', '2022-10-24 18:47:51'),
(2, 1034556678, '2022-10-12 13:00:27', NULL, '32300.00', 1, NULL, 3, '2022-10-21 11:02:21', '2022-10-24 18:46:17'),
(3, 1034780592, '2022-10-21 14:04:24', NULL, '65300.00', 1, NULL, 1, '2022-10-21 12:04:51', '2022-10-24 18:48:58'),
(4, 1234000345, '2022-10-21 15:25:20', NULL, '150.00', 1, NULL, 1, '2022-10-21 13:25:37', '2022-10-21 13:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `details_en` varchar(32) NOT NULL,
  `details_ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => AVAILABLE , 0 => NOT AVAILABLE',
  `price` decimal(9,2) UNSIGNED NOT NULL,
  `quantity` mediumint(5) UNSIGNED NOT NULL DEFAULT 1,
  `image` varchar(64) NOT NULL DEFAULT 'default.jpg',
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_en`, `name_ar`, `details_en`, `details_ar`, `status`, `price`, `quantity`, `image`, `subcategory_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(3, 'lenovo ', '', 'ncskdbcbanmamjkhgfghjkl;kjhgfdfh', '', 1, '21000.00', 0, 'lenovo.jpg', 3, 1, '2022-10-21 09:35:56', '2022-10-21 19:04:22'),
(4, 'samsung A8', '', 'mnsbcmnbanmbsnma', '', 1, '18000.00', 15, 'samsung8.jpg', 4, 4, '2022-10-21 09:35:56', '2022-10-24 18:19:43'),
(5, 'oppo reno 2f ', '', 'ndsmnbsndmbnm ', '', 1, '5000.00', 7, 'oppo.jpg', 4, 3, '2022-10-21 09:36:50', '2022-10-21 19:04:29'),
(6, 'samsung A9', '', 'kbsanbmnasbnbsndm', '', 1, '19000.00', 4, 'samsung9.jpg', 4, 4, '2022-10-21 09:36:50', '2022-10-21 19:04:34'),
(8, 'feta cheese', '', 'cheese feta', '', 1, '8.00', 10, 'feta1.jpg', 5, 5, '2022-10-21 17:27:16', '2022-10-21 17:48:09'),
(9, 'oppo reno 6', '', 'Reno 6 ', '', 1, '7000.00', 7, 'opporeno6.jpg', 4, 3, '2022-10-21 10:01:26', '2022-10-24 18:22:27'),
(10, 'oppo A3', '', 'oppo A 3 ', '', 1, '9000.00', 9, 'oppoa3.jpg', 4, 3, '2022-10-21 10:05:47', '2022-10-24 18:23:21'),
(11, 'lenovo 12 ', '', 'lenovo 12  laptop', '', 1, '30000.00', 3, 'lenovo12.jpg', 3, 1, '2022-10-21 10:08:54', '2022-10-24 18:24:41'),
(12, 'iphone 13 ', '', 'iphone 13 ', '', 1, '19000.00', 11, 'iphone13.jpg', 4, 2, '2022-10-21 10:10:16', '2022-10-24 18:25:41'),
(13, 'iphone 14', '', 'iphone 14', '', 1, '21000.00', 1, 'iphone14.jpg', 4, 2, '2022-10-21 10:38:03', '2022-10-24 18:26:40');

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_details`
-- (See below for the actual view)
--
CREATE TABLE `products_details` (
`id` bigint(20) unsigned
,`name_en` varchar(32)
,`name_ar` varchar(32)
,`details_en` varchar(32)
,`details_ar` varchar(32)
,`status` tinyint(1)
,`price` decimal(9,2) unsigned
,`quantity` mediumint(5) unsigned
,`image` varchar(64)
,`subcategory_id` bigint(20) unsigned
,`brand_id` bigint(20) unsigned
,`created_at` timestamp
,`updated_at` timestamp
,`subcategory_name_en` varchar(32)
,`brand_name_en` varchar(32)
,`category_id` bigint(20) unsigned
,`category_name` varchar(32)
);

-- --------------------------------------------------------

--
-- Table structure for table `products_offers`
--

CREATE TABLE `products_offers` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED NOT NULL,
  `price_after_discount` decimal(5,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `price` decimal(10,2) NOT NULL,
  `quantity` smallint(3) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_orders`
--

INSERT INTO `products_orders` (`price`, `quantity`, `product_id`, `order_id`) VALUES
('30000.00', 1, 3, 1),
('18000.00', 2, 4, 1),
('8000.00', 1, 5, 2),
('5000.00', 10, 5, 4),
('9000.00', 2, 6, 2),
('8.00', 15, 8, 2),
('7000.00', 1, 9, 3),
('19000.00', 2, 12, 3),
('21000.00', 2, 13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products_specs`
--

CREATE TABLE `products_specs` (
  `value_en` varchar(64) NOT NULL,
  `value_ar` varchar(64) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `spec_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_specs`
--

INSERT INTO `products_specs` (`value_en`, `value_ar`, `product_id`, `spec_id`) VALUES
('200 GB', '', 3, 2),
('intel core i7', '', 3, 4),
('16 GB', '', 4, 1),
('camera 5tB', '', 9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => AVAILABLE, 0 => NOT AVAILABLE',
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name_en`, `name_ar`, `status`, `city_id`, `created_at`, `updated_at`) VALUES
(1, 'Haram', '', 1, 2, '2022-10-21 10:48:52', NULL),
(2, 'New Cairo', '', 1, 1, '2022-10-21 10:48:52', NULL),
(3, 'Myami', '', 1, 3, '2022-10-21 10:49:39', NULL),
(4, 'Zayed', '', 1, 2, '2022-10-21 10:49:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rate` tinyint(1) NOT NULL DEFAULT 0 CHECK (`rate` >= 0 and `rate` <= 5),
  `comment` varchar(128) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`product_id`, `user_id`, `rate`, `comment`, `created_at`, `updated_at`) VALUES
(3, 15, 5, 'wow', '2022-10-21 20:26:07', '2022-10-21 07:39:33'),
(4, 19, 4, 'perfect', '2022-10-21 20:25:20', '2022-10-21 07:40:09'),
(5, 18, 5, 'wonderful', '2022-10-19 20:21:40', '2022-10-22 07:40:21'),
(5, 20, 4, 'amazing , fast charging ', '2022-10-21 20:26:07', '2022-10-21 07:40:00'),
(6, 15, 5, 'wonderful', '2022-10-19 20:21:54', '2022-10-22 09:50:17'),
(8, 18, 4, 'good', '2022-10-19 20:25:46', '2022-10-22 07:40:49'),
(8, 20, 2, 'yukky', '2022-10-21 20:21:22', '2022-10-21 07:40:14'),
(9, 19, 3, 'very good ', '2022-10-21 20:25:00', '2022-10-21 07:40:36'),
(11, 15, 5, 'amazing ', '2022-10-21 20:25:46', '2022-10-21 07:40:44'),
(12, 18, 1, 'very bad ', '2022-10-21 20:22:09', '2022-10-21 07:40:32');

-- --------------------------------------------------------

--
-- Stand-in structure for view `reviews_details`
-- (See below for the actual view)
--
CREATE TABLE `reviews_details` (
`product_id` bigint(20) unsigned
,`user_id` bigint(20) unsigned
,`rate` tinyint(1)
,`comment` varchar(128)
,`created_at` timestamp
,`updated_at` timestamp
,`user_full_name` varchar(64)
,`product_name_en` varchar(32)
);

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `specs`
--

INSERT INTO `specs` (`id`, `name_en`, `name_ar`, `created_at`, `updated_at`) VALUES
(1, 'RAM', '', '2022-10-21 10:41:41', NULL),
(2, 'Storage', '', '2022-10-21 10:41:41', NULL),
(3, 'Screen', '', '2022-10-21 10:42:52', NULL),
(4, 'Processor', '', '2022-10-21 10:42:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => AVAILABLE , 0 => NOT AVAILABLE',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name_en`, `name_ar`, `status`, `created_at`, `updated_at`, `category_id`) VALUES
(3, 'laptop ', '', 1, '2022-10-21 09:30:59', NULL, 2),
(4, 'mobile', '', 1, '2022-10-21 09:30:59', NULL, 2),
(5, 'cheese', '', 1, '2022-10-21 17:33:19', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `gender` tinyint(1) NOT NULL COMMENT '1 => MALE , 0 => FEMALE',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 => AVAILABLE , 0 => NOT AVAILABLE',
  `email` varchar(64) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `image` varchar(64) NOT NULL DEFAULT 'default.jpg',
  `password` varchar(128) NOT NULL,
  `verification_code` int(6) UNSIGNED DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `gender`, `status`, `email`, `phone`, `image`, `password`, `verification_code`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(15, 'nada', 'moukhtar', 0, 1, 'nada.moukhtar@msa.edu.eg', '01013149599', 'default.jpg', '$2y$10$tvkYoDmaAlvotbmrEoh9ZOqFFWGc0VlQPw1w53VLhmg07kTA/yNyO', 26251, '2022-10-24 19:11:28', '2022-10-18 17:57:34', '2022-10-24 19:12:03'),
(18, 'abeer', 'khaled', 0, 1, 'abeer.khaled@gmail.com', '01290896752', 'default.jpg', '$2y$10$5sU5wbcuiU/BlKUSnJ..weJq8uwUCNHR1eElfHRTu743BtACennCq', 51317, NULL, '2022-10-19 17:03:34', NULL),
(19, 'nada', 'hassan', 0, 1, 'nada.hassan@gmail.com', '01053429755', 'default.jpg', '$2y$10$XGt1jAJzBwk3sIoxTWWHeORcteRam5/THXnLPgJ//EHgaH.dQnG1K', 30104, NULL, '2022-10-19 20:23:34', NULL),
(20, 'mohamed', 'ahmed', 1, 1, 'mohamed.ahmed@gmail.com', '01023465876', 'default.jpg', '', NULL, NULL, '2022-10-24 19:13:40', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `users_orders_reviews`
-- (See below for the actual view)
--
CREATE TABLE `users_orders_reviews` (
`price` decimal(10,2)
,`quantity` smallint(3)
,`product_id` bigint(20) unsigned
,`order_id` bigint(20) unsigned
,`product_name_en` varchar(32)
,`order_notes` text
,`user_id` bigint(20) unsigned
,`user_first_name` varchar(32)
);

-- --------------------------------------------------------

--
-- Structure for view `most_ordered`
--
DROP TABLE IF EXISTS `most_ordered`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `most_ordered`  AS   (select `products_orders`.`price` AS `price`,`products_orders`.`quantity` AS `quantity`,`products_orders`.`product_id` AS `product_id`,`products_orders`.`order_id` AS `order_id`,`products`.`name_en` AS `product_name_en`,`products`.`price` AS `product_price`,`products`.`image` AS `product_image`,`orders`.`number` AS `order_number`,count(`products_orders`.`order_id`) AS `orders_per_product` from ((`products_orders` join `orders` on(`orders`.`id` = `products_orders`.`order_id`)) join `products` on(`products`.`id` = `products_orders`.`product_id`)) group by `products_orders`.`product_id` order by count(`products_orders`.`order_id`) desc)  ;

-- --------------------------------------------------------

--
-- Structure for view `products_details`
--
DROP TABLE IF EXISTS `products_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_details`  AS   (select `products`.`id` AS `id`,`products`.`name_en` AS `name_en`,`products`.`name_ar` AS `name_ar`,`products`.`details_en` AS `details_en`,`products`.`details_ar` AS `details_ar`,`products`.`status` AS `status`,`products`.`price` AS `price`,`products`.`quantity` AS `quantity`,`products`.`image` AS `image`,`products`.`subcategory_id` AS `subcategory_id`,`products`.`brand_id` AS `brand_id`,`products`.`created_at` AS `created_at`,`products`.`updated_at` AS `updated_at`,`subcategories`.`name_en` AS `subcategory_name_en`,`brands`.`name_en` AS `brand_name_en`,`categories`.`id` AS `category_id`,`categories`.`name_en` AS `category_name` from (((`products` left join `subcategories` on(`subcategories`.`id` = `products`.`subcategory_id`)) left join `brands` on(`brands`.`id` = `products`.`brand_id`)) left join `categories` on(`categories`.`id` = `subcategories`.`category_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `reviews_details`
--
DROP TABLE IF EXISTS `reviews_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reviews_details`  AS   (select `reviews`.`product_id` AS `product_id`,`reviews`.`user_id` AS `user_id`,`reviews`.`rate` AS `rate`,`reviews`.`comment` AS `comment`,`reviews`.`created_at` AS `created_at`,`reviews`.`updated_at` AS `updated_at`,concat(`users`.`first_name`,`users`.`last_name`) AS `user_full_name`,`products`.`name_en` AS `product_name_en` from ((`reviews` join `users` on(`users`.`id` = `reviews`.`user_id`)) join `products` on(`products`.`id` = `reviews`.`product_id`)))  ;

-- --------------------------------------------------------

--
-- Structure for view `users_orders_reviews`
--
DROP TABLE IF EXISTS `users_orders_reviews`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_orders_reviews`  AS   (select `products_orders`.`price` AS `price`,`products_orders`.`quantity` AS `quantity`,`products_orders`.`product_id` AS `product_id`,`products_orders`.`order_id` AS `order_id`,`products`.`name_en` AS `product_name_en`,`orders`.`notes` AS `order_notes`,`addresses`.`user_id` AS `user_id`,`users`.`first_name` AS `user_first_name` from ((((`products_orders` left join `orders` on(`orders`.`id` = `products_orders`.`order_id`)) left join `addresses` on(`addresses`.`id` = `orders`.`address_id`)) left join `users` on(`users`.`id` = `addresses`.`user_id`)) left join `products` on(`products`.`id` = `products_orders`.`product_id`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `carts_products_fk` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `favs`
--
ALTER TABLE `favs`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `favs_products_fk` (`product_id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `number` (`number`),
  ADD UNIQUE KEY `number_2` (`number`),
  ADD KEY `orders_addresses_fk` (`address_id`),
  ADD KEY `orders_coupons_fk` (`coupon_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_subcategory_fk` (`subcategory_id`),
  ADD KEY `products_brands_fk` (`brand_id`);

--
-- Indexes for table `products_offers`
--
ALTER TABLE `products_offers`
  ADD PRIMARY KEY (`product_id`,`offer_id`),
  ADD KEY `products_offers_fk` (`offer_id`);

--
-- Indexes for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD PRIMARY KEY (`product_id`,`order_id`),
  ADD KEY `products_orders_fk` (`order_id`);

--
-- Indexes for table `products_specs`
--
ALTER TABLE `products_specs`
  ADD PRIMARY KEY (`product_id`,`spec_id`),
  ADD KEY `products_specs_specs_fk` (`spec_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `reviews_users_fk` (`user_id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_subcategories_fk` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favs`
--
ALTER TABLE `favs`
  ADD CONSTRAINT `favs_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favs_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_addresses_fk` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_coupons_fk` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brands_fk` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_subcategory_fk` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_offers`
--
ALTER TABLE `products_offers`
  ADD CONSTRAINT `products_offers2_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `products_offers_fk` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `products_orders2_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_orders_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_specs`
--
ALTER TABLE `products_specs`
  ADD CONSTRAINT `products_specs_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_specs_specs_fk` FOREIGN KEY (`spec_id`) REFERENCES `specs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_products_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_users_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `categories_subcategories_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
