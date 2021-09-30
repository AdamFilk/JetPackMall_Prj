-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 26, 2020 at 05:57 AM
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
