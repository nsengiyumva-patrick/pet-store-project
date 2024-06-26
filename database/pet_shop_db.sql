-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2024 at 10:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_bookings`
--

CREATE TABLE `appointment_bookings` (
  `id` int(11) NOT NULL,
  `owner_name` varchar(250) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `address` varchar(250) NOT NULL,
  `pet_name` varchar(250) NOT NULL,
  `appointment_date` datetime NOT NULL,
  `services` varchar(50) NOT NULL,
  `email_address` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_bookings`
--

INSERT INTO `appointment_bookings` (`id`, `owner_name`, `phone_number`, `address`, `pet_name`, `appointment_date`, `services`, `email_address`, `status`) VALUES
(20, 'Patrick', '0786777347', 'ruhango', 'max', '2024-05-22 00:00:00', 'vaccine', 'nsengiyumvapatrick70@gmail.com', 'reject'),
(21, 'Remy', '0783910300', 'Kigali', 'Molly', '2024-05-23 00:00:00', 'diagnosis', 'remy+petstore@techdiary.site', 'approve'),
(22, 'Cyuzuzo', '0783910300', 'Kigali', 'Molly', '2024-05-22 00:00:00', 'dental', 'patricknsengiyumva01@gmail.com', 'reject'),
(23, 'Patrick', '0786777347', 'ruhango', 'Molly', '2024-05-22 00:00:00', 'diagnosis', 'patricknsengiyumva01@gmail.com', 'approve'),
(24, 'Nobleman', '0730097471', 'Nyarugenge', 'Molly', '2024-05-22 00:00:00', 'vaccine', 'nsengiyumvapatrick70@gmail.com', 'approve'),
(25, 'Shyaka ', '0730097471', 'Nyarugenge', 'Molly', '2024-05-24 00:00:00', 'dental', 'nsengiyumvapatrick70@gmail.com', 'approve'),
(26, 'Japhet', '0730097471', 'Nyarugenge', 'Molly', '2024-05-25 00:00:00', 'diagnosis', 'nsengiyumvapatrick70@gmail.com', 'approve');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(6, 3, 1, 250, 1, '2024-04-23 13:36:04'),
(43, 1, 8, 180, 1, '2024-05-24 14:19:31'),
(44, 1, 4, 150, 1, '2024-05-24 14:19:46'),
(46, 5, 5, 50, 1, '2024-05-24 14:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Shop', 'Sample Description', 1, '2021-06-21 10:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '09123456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-06-21 16:00:23'),
(2, 'nsengiyumva', 'patrick', 'Male', '+250 786777347', 'nsengiyumvapatrick70@gmail.com', '202cb962ac59075b964b07152d234b70', 'United State  America', '2024-04-22 23:58:56'),
(3, 'ja', 'phe', 'Male', '11111', 'admin@admin.com', 'c93ccd78b2076528346216b3b2f701e6', 'kigali', '2024-04-23 13:32:13'),
(5, 'Patrick', 'Nsengiyumva', 'Male', '0786777347', 'patricknsengiyumva01@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'ruhango', '2024-05-24 14:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(4, 3, 50, 'pack', 150, 'KG', '2021-06-21 16:51:12', '2024-05-20 09:41:28'),
(5, 5, 3, 'pcs', 50, 'KG', '2021-06-21 16:51:35', '2024-05-24 14:23:22'),
(6, 4, 1, 'pcs', 550, 'KG', '2021-06-21 16:51:54', '2024-05-23 10:42:48'),
(8, 6, 20, 'pcs', 180, 'KG', '2021-06-22 15:51:13', '2024-05-26 23:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(1, 1, 'Sample Address', 'Online Payment', 1100, 2, 1, '2021-06-22 13:48:54', '2021-06-22 14:49:15'),
(2, 1, 'Sample Address', 'cod', 750, 3, 1, '2021-06-22 15:26:07', '2021-06-22 15:32:55'),
(4, 2, 'United State  America', 'cod', 250, 0, 0, '2024-05-18 21:07:40', NULL),
(5, 1, '', 'cod', 550, 0, 0, '2024-05-20 09:43:42', NULL),
(6, 1, 'Nyarugenge', 'cod', 5100, 0, 0, '2024-05-22 11:21:46', NULL),
(7, 1, 'Ruhango', 'cod', 10200, 0, 0, '2024-05-23 10:40:40', NULL),
(8, 1, 'Ruhango', 'cod', 10200, 0, 0, '2024-05-23 10:40:46', NULL),
(9, 1, '', 'cod', 10200, 0, 0, '2024-05-23 10:40:57', NULL),
(10, 1, '', 'cod', 10200, 0, 0, '2024-05-23 10:41:07', NULL),
(11, 1, '', 'cod', 10200, 0, 0, '2024-05-23 10:41:15', NULL),
(12, 1, '', 'cod', 10200, 0, 0, '2024-05-23 10:41:30', NULL),
(13, 1, '', 'cod', 10250, 0, 0, '2024-05-23 10:42:09', NULL),
(14, 1, '', 'cod', 4400, 0, 0, '2024-05-23 10:42:48', NULL),
(15, 5, 'ruhango', 'cod', 50, 0, 0, '2024-05-24 14:23:22', NULL),
(16, 2, 'United State  America', 'cod', 9000, 0, 0, '2024-05-26 23:32:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(1, 1, 4, 'L', 'pcs', 2, 550, 1100),
(2, 2, 3, 'M', 'pack', 5, 150, 750),
(5, 4, 1, 'M', 'pcs', 1, 250, 250),
(6, 5, 4, 'KG', 'pcs', 1, 550, 550),
(7, 6, 4, 'KG', 'pcs', 7, 550, 3850),
(8, 6, 5, 'KG', 'pcs', 25, 50, 1250),
(9, 7, 3, 'KG', 'pack', 68, 150, 10200),
(10, 8, 3, 'KG', 'pack', 68, 150, 10200),
(11, 9, 3, 'KG', 'pack', 68, 150, 10200),
(12, 10, 3, 'KG', 'pack', 68, 150, 10200),
(13, 11, 3, 'KG', 'pack', 68, 150, 10200),
(14, 12, 3, 'KG', 'pack', 68, 150, 10200),
(15, 13, 3, 'KG', 'pack', 68, 150, 10200),
(16, 13, 5, 'KG', 'pcs', 1, 50, 50),
(17, 14, 4, 'KG', 'pcs', 8, 550, 4400),
(18, 15, 5, 'KG', 'pcs', 1, 50, 50),
(19, 16, 6, 'KG', 'pcs', 50, 180, 9000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(3, 1, 3, ' Senior Cat Food Formulas', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size:16.0pt;line-height:115%;font-family:\r\n&amp;quot;Angsana New&amp;quot;,serif&quot;&gt;Senior cat food formulas are specially designed to meet\r\nthe unique nutritional needs of aging felines. As cats get older, their dietary\r\nrequirements change, and senior cat food helps address these changes&lt;/span&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;', 1, '2021-06-21 16:48:16'),
(4, 1, 1, 'Grain-Free Food', '&lt;p&gt;&lt;span style=&quot;font-size:14.0pt;line-height:115%;\r\nfont-family:&amp;quot;Angsana New&amp;quot;,serif;mso-fareast-font-family:Aptos;mso-fareast-theme-font:\r\nminor-latin;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:\r\nAR-SA&quot;&gt;Grain-Free is pet food generally has a higher meat and protein content\r\nthan a grain included diet which allows them to digest the food better,\r\nespecially diets containing freshly prepared protein sources that have a high\r\ndigestibility&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:49:07'),
(5, 1, 1, 'Wet food', '&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size:16.0pt;line-height:115%;font-family:\r\n&amp;quot;Angsana New&amp;quot;,serif&quot;&gt;Wet food is not extruded, but rather poured into cans that\r\nare then vacuum-sealed and sterilized in a heat and steam chamber (a retort).\r\nThis process serves as a safety measure to help eliminate pathogens such as\r\nSalmonella or E. coli&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, '2021-06-21 16:50:11'),
(6, 1, 1, 'Kibble', '&lt;span style=&quot;font-family: &amp;quot;Angsana New&amp;quot;, serif; font-size: 16pt;&quot;&gt;Kibble is&lt;/span&gt;&amp;nbsp;&lt;b style=&quot;font-size: 1rem;&quot;&gt;&lt;span style=&quot;font-size:16.0pt;line-height:115%;\r\nfont-family:&amp;quot;Angsana New&amp;quot;,serif&quot;&gt;Dehydrated food&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size: 16pt; line-height: 115%; font-family: &amp;quot;Angsana New&amp;quot;, serif;&quot;&gt;&amp;nbsp;that\r\nprovides dogs with a uniform diet because it has all the vitamins, minerals,\r\nand nutrients they need to stay healthy. This type of dog food is typically\r\ninexpensive and has a low moisture content of around 3%&ndash;11%.&lt;/span&gt;&lt;p class=&quot;MsoNormal&quot;&gt;&lt;span style=&quot;font-size:16.0pt;line-height:115%;font-family:&amp;quot;Angsana New&amp;quot;,serif&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;', 1, '2021-06-22 15:50:16');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07'),
(4, 4, 250, '2024-05-18 21:07:40'),
(5, 5, 550, '2024-05-20 09:43:42'),
(6, 6, 5100, '2024-05-22 11:21:46'),
(7, 13, 10250, '2024-05-23 10:42:09'),
(8, 14, 4400, '2024-05-23 10:42:48'),
(9, 15, 50, '2024-05-24 14:23:22'),
(10, 16, 9000, '2024-05-26 23:32:13');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'KG');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Dog Food', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Cat Food', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(5, 4, 'Cat Needs', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Pet Shop Food and Veterinary Services'),
(6, 'short_name', ''),
(11, 'logo', 'uploads/1713866400_64b7ee02b7b661689775618.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1713866580_1713866400_1.gif');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_bookings`
--
ALTER TABLE `appointment_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_bookings`
--
ALTER TABLE `appointment_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
