-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2025 at 08:21 PM
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
-- Database: `product_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `items` text NOT NULL,
  `status` varchar(50) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `username`, `order_date`, `total_amount`, `items`, `status`) VALUES
(3, 6, 'la', '2025-11-01 08:53:34', 12.00, '[{\"id\":\"1\",\"name\":\"Affogado\",\"price\":\"12\",\"imaga\":\"images\\/coffee-photo\\/faocto.jpg\",\"quantity\":1}]', 'pending'),
(21, NULL, 'Guest', '2025-11-01 16:47:57', 90.00, '[{\"id\":\"12\",\"name\":\"cofffffe\",\"price\":\"90\",\"imaga\":\"images\\/\\/ben-photo\\/\\/ben-ksa.png\",\"description\":\"ben\",\"quantity\":1}]', 'pending'),
(22, 7, 'alo', '2025-11-01 17:14:08', 4.00, '[{\"id\":\"6\",\"name\":\"Karak\",\"price\":\"4\",\"imaga\":\"images\\/tea-photo\\/kark.png \\r\\n\",\"description\":null,\"quantity\":1}]', 'pending'),
(23, 9, 'os', '2025-11-01 17:54:06', 30.00, '[{\"id\":\"5\",\"name\":\"Jasmine Tea\",\"price\":\"6\",\"imaga\":\"images\\/tea-photo\\/jaz.jpg\",\"description\":null,\"quantity\":3},{\"id\":\"6\",\"name\":\"Karak\",\"price\":\"4\",\"imaga\":\"images\\/tea-photo\\/kark.png \\r\\n\",\"description\":null,\"quantity\":1},{\"id\":\"2\",\"name\":\"Espresso\",\"price\":\"8\",\"imaga\":\"images\\/coffee-photo\\/Espreso.jpg\",\"description\":null,\"quantity\":1}]', 'pending'),
(24, 9, 'os', '2025-11-01 17:56:04', 41.00, '[{\"id\":\"2\",\"name\":\"Espresso\",\"price\":\"8\",\"imaga\":\"images\\/coffee-photo\\/Espreso.jpg\",\"description\":null,\"quantity\":1},{\"id\":\"3\",\"name\":\"Flat White\",\"price\":\"11\",\"imaga\":\"images\\/coffee-photo\\/Flatwhiat.jpg\",\"description\":null,\"quantity\":3}]', 'pending'),
(25, 10, 'al', '2025-11-01 17:59:21', 31.00, '[{\"id\":\"1\",\"name\":\"Affogado\",\"price\":\"12\",\"imaga\":\"images\\/coffee-photo\\/faocto.jpg\",\"description\":null,\"quantity\":1},{\"id\":\"2\",\"name\":\"Espresso\",\"price\":\"8\",\"imaga\":\"images\\/coffee-photo\\/Espreso.jpg\",\"description\":null,\"quantity\":1},{\"id\":\"3\",\"name\":\"Flat White\",\"price\":\"11\",\"imaga\":\"images\\/coffee-photo\\/Flatwhiat.jpg\",\"description\":null,\"quantity\":1}]', 'pending'),
(26, 11, 'rose', '2025-11-01 18:05:05', 14.00, '[{\"id\":\"8\",\"name\":\"Breakfast Tea\",\"price\":\"3\",\"imaga\":\"images\\/tea-photo\\/bracfast.png\",\"description\":null,\"quantity\":2},{\"id\":\"6\",\"name\":\"Karak\",\"price\":\"4\",\"imaga\":\"images\\/tea-photo\\/kark.png \\r\\n\",\"description\":null,\"quantity\":2}]', 'pending'),
(27, NULL, 'Guest', '2025-11-04 10:54:19', 20.00, '[{\"id\":\"1\",\"name\":\"Affogado\",\"price\":\"12\",\"imaga\":\"images\\/coffee-photo\\/faocto.jpg\",\"description\":null,\"quantity\":1},{\"id\":\"2\",\"name\":\"Espresso\",\"price\":\"8\",\"imaga\":\"images\\/coffee-photo\\/Espreso.jpg\",\"description\":null,\"quantity\":1}]', 'pending'),
(28, 13, 'hp', '2025-11-04 17:34:20', 46.00, '[{\"id\":\"2\",\"name\":\"Espresso\",\"price\":\"8\",\"imaga\":\"images\\/coffee-photo\\/Espreso.jpg\",\"description\":null,\"quantity\":1},{\"id\":\"3\",\"name\":\"Flat White\",\"price\":\"11\",\"imaga\":\"images\\/coffee-photo\\/Flatwhiat.jpg\",\"description\":null,\"quantity\":1},{\"id\":\"1\",\"name\":\"Affogado\",\"price\":\"12\",\"imaga\":\"images\\/coffee-photo\\/faocto.jpg\",\"description\":null,\"quantity\":1},{\"id\":\"8\",\"name\":\"Breakfast Tea\",\"price\":\"3\",\"imaga\":\"images\\/tea-photo\\/bracfast.png\",\"description\":null,\"quantity\":1},{\"id\":\"5\",\"name\":\"Jasmine Tea\",\"price\":\"6\",\"imaga\":\"images\\/tea-photo\\/jaz.jpg\",\"description\":null,\"quantity\":1},{\"id\":\"5\",\"name\":\"Jasmine Tea\",\"price\":\"6\",\"imaga\":\"images\\/tea-photo\\/jaz.jpg\",\"description\":null,\"quantity\":1}]', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) NOT NULL,
  `name` varchar(56) NOT NULL,
  `price` int(7) NOT NULL,
  `imaga` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `imaga`, `description`) VALUES
(1, 'Affogado', 12, 'images/coffee-photo/faocto.jpg', NULL),
(2, 'Espresso', 8, 'images/coffee-photo/Espreso.jpg', NULL),
(3, 'Flat White', 11, 'images/coffee-photo/Flatwhiat.jpg', NULL),
(4, 'Daily', 9, 'images/coffee-photo/Daley.jpg', NULL),
(5, 'Jasmine Tea', 6, 'images/tea-photo/jaz.jpg', NULL),
(6, 'Karak', 4, 'images/tea-photo/kark.png \r\n', NULL),
(7, 'Earl Grey', 8, 'images/tea-photo/ualrygray.png', NULL),
(8, 'Breakfast Tea', 3, 'images/tea-photo/bracfast.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(56) NOT NULL,
  `email` varchar(56) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'la', 'la@gamil.com', '$2y$10$CjbbDwkOhpkv4rRe1XNGmOnspy4ugY3WrJ6fcenkKfSCVLhpuG8US'),
(7, 'alo', 'alo@gmail.com', '$2y$10$FG5DeDNjAj1iLccZnyh.WuSgpi02KIf5bofk7I3oIVKopMjlLX9C.'),
(8, 'osama', 'os@ii.com', '$2y$10$A8NUqQZkn5mfX7FjjAJhUO6khDWCPzbmwrH1bIbJgl.6QzyAzqSpy'),
(9, 'os', 'osama@vv.sa', '$2y$10$dZI9TV/X0R17RTlRRLrKfuF1tYIKA.qZnb4p6sX2voTBBtxJF1ANu'),
(10, 'al', 'al@ll.sa', '$2y$10$ZYhPzsFV2yoTvAEj16vziepwwAfmHW6fPVoXaFuEeB6MZ6kU9Falq'),
(11, 'rose', 'rose@os.sa', '$2y$10$A24W.vIR4XeVR7CmKt5Ko.LwEnuzQ0baVb8DtRmZI0Ws/k2aw4GQi'),
(12, 'chama', 'cam@gamil.com', '$2y$10$A24W.vIR4XeVR7CmKt5Ko.LwEnuzQ0baVb8DtRmZI0Ws/k2aw4GQi'),
(13, 'hp', 'admin@hashplus.com', '$2y$10$QriABVBu5Rf8sg3JxL.fxOKXQX0YcBHbHKpvE22xu8au2oIdNwhm2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
