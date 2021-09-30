-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 26, 2020 at 04:51 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jetpackmall`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pann Thee', 'images/brand/1597978666.jpeg', '2020-08-20 20:31:59', '2020-08-19 22:44:53', '2020-08-20 20:31:59'),
(2, 'AMD', 'images/brand/1597900530.jpeg', NULL, '2020-08-19 22:45:30', '2020-08-19 22:45:30'),
(3, 'Samsung', 'images/brand/1597900544.jpeg', NULL, '2020-08-19 22:45:44', '2020-08-19 22:45:44'),
(4, 'Air Jordan', 'images/brand/1597900553.jpeg', NULL, '2020-08-19 22:45:53', '2020-08-19 22:45:53'),
(5, 'Zip Zap', 'images/brand/1597900568.jpeg', NULL, '2020-08-19 22:46:08', '2020-08-19 22:46:08'),
(6, 'Chemical Guys', 'images/brand/1597913650.jpeg', NULL, '2020-08-20 02:24:10', '2020-08-20 02:24:10'),
(7, 'ASUS', 'images/brand/1597914061.png', NULL, '2020-08-20 02:31:01', '2020-08-20 02:31:01'),
(8, 'Nvidia', 'images/brand/1597914391.png', NULL, '2020-08-20 02:36:31', '2020-08-20 02:36:31'),
(9, 'ZOZO', 'images/logo/1598346610.png', '2020-08-25 02:46:22', '2020-08-25 02:40:10', '2020-08-25 02:46:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `photo`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Automotive and Motorbike', 'images/category/1597899914.jpeg', NULL, '2020-08-19 22:35:14', '2020-08-19 22:35:14'),
(2, 'Babies and Toys', 'images/category/1597899962.jpeg', NULL, '2020-08-19 22:36:02', '2020-08-19 22:36:02'),
(3, 'Electronics and Accessories', 'images/category/1597899996.jpeg', '2020-08-25 01:29:24', '2020-08-19 22:36:36', '2020-08-25 01:29:24'),
(4, 'Groceries and Pet', 'images/category/1597900067.png', NULL, '2020-08-19 22:37:47', '2020-08-19 22:37:47'),
(5, 'Healthy and Beauty', 'images/category/1597900114.jpeg', '2020-08-25 01:29:51', '2020-08-19 22:38:34', '2020-08-25 01:29:51'),
(6, 'Fashion', 'images/category/1597900133.jpeg', NULL, '2020-08-19 22:38:53', '2020-08-19 22:38:53'),
(7, 'Sports and Acessories', 'images/category/1597900169.jpeg', NULL, '2020-08-19 22:39:29', '2020-08-19 22:39:29'),
(8, 'Category', 'images/category/1598340480.jpeg', NULL, '2020-08-25 00:58:00', '2020-08-25 00:58:00'),
(9, 'api category update', 'images/category/1598340504.jpeg', '2020-08-25 01:24:36', '2020-08-25 00:58:24', '2020-08-25 01:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codeno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `codeno`, `name`, `photo`, `price`, `discount`, `description`, `subcategory_id`, `brand_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'JPM-38374', 'LG 24\"TV', '[\"images\\/item\\/15979013081.jpeg\"]', '2000000', '1600000', '<p>This is TV<br></p>', 7, 3, NULL, '2020-08-19 22:58:28', '2020-08-19 22:58:28'),
(4, 'JPM-48023', 'Chemical Clean Kit', '[\"images\\/item\\/15979136821.jpeg\"]', '40000', NULL, '<p>This can make your car clean</p>', 1, 6, NULL, '2020-08-20 02:24:42', '2020-08-20 02:24:42'),
(5, 'JPM-71028', 'ASUS ROG Gaming laptop', '[\"images\\/item\\/15979141851.jpeg\"]', '4000000', NULL, '<ul><li>CPU- 3.5 GHz</li><li>RAM- 4 GB</li><li>Graphic- Nvidia 2080Ti</li><li>Storage- 2TB SSD</li><li>Display- 1080x1920 144Hz</li></ul>', 7, 7, NULL, '2020-08-20 02:33:05', '2020-08-20 02:33:05'),
(6, 'JPM-64185', 'AMD RX-580', '[\"images\\/item\\/15979143411.jpeg\"]', '1000000', NULL, '<p>This is a graphic card</p>', 8, 7, NULL, '2020-08-20 02:35:41', '2020-08-20 22:38:53'),
(7, 'JPM-38280', 'Nvidia GTX 2080', '[\"images\\/item\\/15979144531.jpeg\"]', '20000000', NULL, '<p>More expensive than the other one.&nbsp;</p><p>JK. Got Ray Tracing Tech. Super cool!</p>', 8, 8, NULL, '2020-08-20 02:37:33', '2020-08-20 02:37:33'),
(8, 'JPM-13264', 'Samsung S9', '[\"images\\/item\\/15979145391.jpeg\"]', '10000000', '5000000', '<p>You say you dont want no expensive I-phone?</p><p>Well...Here is an expensive&nbsp; Andriod phone.</p>', 5, 3, NULL, '2020-08-20 02:38:59', '2020-08-20 02:38:59'),
(9, 'JPM-54537', 'White Jordan', '[\"images\\/item\\/15979816751.png\"]', '30000', '20000', '<p>THIS IS CLEAN</p>', 9, 4, NULL, '2020-08-20 21:17:14', '2020-08-20 22:32:41'),
(10, 'JPM-68001', 'ASUS ROG gaming phone', '[\"images\\/item\\/15979826421.jpeg\"]', '1000000', '500000', '<p>This phone is good for gaming</p>', 5, 7, NULL, '2020-08-20 21:34:02', '2020-08-20 21:34:02'),
(11, 'JPM-32415', 'Samsung Galaxy A31', '[\"images\\/item\\/15979827441.jpeg\"]', '250000', '150000', '<p>This is a good budget phone below 300$</p>', 5, 3, NULL, '2020-08-20 21:35:44', '2020-08-20 21:35:44'),
(12, 'JPM-36989', 'Samsung Galaxy Note 10', '[\"images\\/item\\/15979828661.jpeg\"]', '500000', '450000', '<p>KBOOM!</p>', 5, 3, NULL, '2020-08-20 21:37:46', '2020-08-20 21:37:46'),
(13, 'JPM-28865', 'Air-Jordan Black', '[\"images\\/item\\/15979829951.jpeg\"]', '100000', NULL, '<p>First copy Alibaba Black ones</p>', 9, 4, NULL, '2020-08-20 21:39:55', '2020-08-20 21:40:39'),
(14, 'JPM-63844', 'Lenovo ASUS JAVA', '[\"images\\/item\\/15979862491.jpeg\"]', '1000', '800', '<p>This is Alibaba ASUS</p>', 6, 7, NULL, '2020-08-20 22:34:09', '2020-08-20 22:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(40, '2014_10_12_000000_create_users_table', 1),
(41, '2014_10_12_100000_create_password_resets_table', 1),
(42, '2019_08_19_000000_create_failed_jobs_table', 1),
(43, '2020_08_18_064804_create_categories_table', 1),
(44, '2020_08_18_064942_create_subcategories_table', 1),
(45, '2020_08_18_064954_create_brands_table', 1),
(46, '2020_08_18_065002_create_items_table', 1),
(47, '2020_08_18_065308_create_orders_table', 1),
(48, '2020_08_18_065317_create_order_details_table', 1),
(49, '2020_08_20_024755_create_townships_table', 1),
(50, '2020_08_21_085000_create_permission_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2),
(2, 'App\\User', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `orderdate` date NOT NULL,
  `voucherno` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderdate`, `voucherno`, `total`, `note`, `status`, `user_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2020-08-24', '5f43739fe2093', '1600000', '11', 'order', 2, NULL, '2020-08-24 01:30:31', '2020-08-24 01:30:31'),
(2, '2020-08-24', '5f4373b7cf81f', '1600000', '11', 'order', 2, NULL, '2020-08-24 01:30:55', '2020-08-24 01:30:55'),
(3, '2020-08-24', '5f4373c754740', '1600000', '11', 'order', 2, NULL, '2020-08-24 01:31:11', '2020-08-24 01:31:11'),
(4, '2020-08-24', '5f4373cf11e4b', '1600000', '11', 'order', 2, NULL, '2020-08-24 01:31:19', '2020-08-24 01:31:19'),
(5, '2020-08-24', '5f4373f5ecdfd', '1600000', '111', 'order', 2, NULL, '2020-08-24 01:31:57', '2020-08-24 01:31:57'),
(6, '2020-08-24', '5f4377db4e986', '1600000', '11', 'order', 2, NULL, '2020-08-24 01:48:35', '2020-08-24 01:48:35'),
(7, '2020-08-25', '5f44bb280341c', '5000000', NULL, 'order', 2, NULL, '2020-08-25 00:48:00', '2020-08-25 00:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `qty`, `item_id`, `order_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '1', 3, 5, NULL, '2020-08-24 01:31:58', '2020-08-24 01:31:58'),
(2, '1', 3, 6, NULL, '2020-08-24 01:48:35', '2020-08-24 01:48:35'),
(3, '1', 8, 7, NULL, '2020-08-25 00:48:00', '2020-08-25 00:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2020-08-21 02:55:58', '2020-08-21 02:55:58'),
(2, 'customer', 'web', '2020-08-21 02:55:58', '2020-08-21 02:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `category_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Auto Detail', 1, NULL, '2020-08-19 22:40:04', '2020-08-23 13:09:38'),
(2, 'Motobike', 1, NULL, '2020-08-19 22:41:24', '2020-08-19 22:41:24'),
(3, 'Toys', 2, NULL, '2020-08-19 22:41:42', '2020-08-19 22:41:42'),
(4, 'Dipers', 2, '2020-08-23 13:13:47', '2020-08-19 22:41:50', '2020-08-23 13:13:47'),
(5, 'Phones', 3, NULL, '2020-08-19 22:41:57', '2020-08-19 22:41:57'),
(6, 'Tablet', 3, NULL, '2020-08-19 22:42:06', '2020-08-19 22:42:06'),
(7, 'Laptop', 3, NULL, '2020-08-19 22:42:16', '2020-08-19 22:42:16'),
(8, 'Graphic Card', 3, NULL, '2020-08-20 02:35:04', '2020-08-20 02:35:04'),
(9, 'Shoes', 6, NULL, '2020-08-20 21:40:15', '2020-08-20 21:40:15'),
(10, 'Chair', 2, NULL, '2020-08-25 02:57:59', '2020-08-25 02:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `townships`
--

CREATE TABLE `townships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `townships`
--

INSERT INTO `townships` (`id`, `name`, `price`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Pazundaun', '2000', NULL, '2020-08-20 00:42:03', '2020-08-20 20:41:22'),
(2, 'Bothaung', '3000', NULL, '2020-08-20 00:42:04', '2020-08-20 00:42:04'),
(3, 'Kyauk Da Dar', '5000', '2020-08-23 13:13:53', '2020-08-20 00:42:04', '2020-08-23 13:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `registerdate` date NOT NULL DEFAULT '2020-08-20',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `township_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `registerdate`, `name`, `profile`, `email`, `email_verified_at`, `password`, `phone`, `address`, `township_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '2020-08-20', 'admin', 'images/user/admin.jpg', 'admin@gmail.com', NULL, '$2y$10$qb8VmSntII4qX.CU48SIVu7ZKK3Z5IPZTfQqY1bEs7coJp5dCQ5Su', '0987654321', 'Yangon', NULL, '0', NULL, '2020-08-21 02:57:30', '2020-08-21 02:57:30'),
(2, '2020-08-20', 'Aung Chan', 'images/user/customer.png', 'customer@gmail.com', NULL, '$2y$10$ZqlE1IBGa6ma0jTWtDpUBu6f88hiueJ.VIEQjuqe37CD4F6tIPBr6', '0987654321', 'Yangon', NULL, '0', NULL, '2020-08-21 02:57:31', '2020-08-21 02:57:31'),
(3, '2020-08-20', 'AungChanOo', 'images/user/customer.png', 'adsltheprescence@gmail.com', NULL, '$2y$10$F9vFaHRLb.AI1or6t04n6engBGz4fyypN9Tkfr0WaUGNgU7rjRcJ6', '09513608', 'Minmanaing', NULL, '0', NULL, '2020-08-24 02:27:18', '2020-08-24 02:27:18'),
(5, '2020-08-20', 'Zaw Htet Naung', 'images/user/customer.png', 'zawhtet@gmail.com', NULL, '$2y$10$ezaz2hrPkovpqnkCKH.49O2ZIpByI9JYuI/TAj/ZWZlqNxDmgzhgu', '099999', 'Minmanaing', NULL, '0', NULL, '2020-08-24 02:28:19', '2020-08-24 02:28:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `items_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_item_id_foreign` (`item_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `townships`
--
ALTER TABLE `townships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `townships`
--
ALTER TABLE `townships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
