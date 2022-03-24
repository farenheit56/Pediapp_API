SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `home` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `slider_url` varchar(255) DEFAULT NULL,
  `support_image_url` varchar(255) DEFAULT NULL,
  `banner_image_1_url` varchar(255) DEFAULT NULL,
  `banner_image_2_url` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `component_name` varchar(255) NOT NULL,
  `body_banner_image_1_url` varchar(255) DEFAULT NULL,
  `body_banner_image_2_url` varchar(255) DEFAULT NULL,
  `extra_info_image_1_url` varchar(255) DEFAULT NULL,
  `extra_info_image_2_url` varchar(255) DEFAULT NULL,
  `extra_info_image_3_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `internal_sections` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slider_url` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `support_image_url` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `component_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ts` datetime NOT NULL,
  `total_price` double DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` longtext NOT NULL,
  `path` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `active` tinyint(4) NOT NULL,
  `stock` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL COMMENT 'primary key',
  `image_url` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `relation_category_subcategory` (
  `categoryId` int(11) DEFAULT NULL,
  `subcategoryId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `relation_product_category` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `relation_product_subcategory` (
  `productId` int(11) DEFAULT NULL,
  `subcategoryId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `social_networks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `name`, `user`, `pass`) VALUES
(2, 'Administrador', 'administrador', '$2b$10$DiaPaAWQJ1Rom90/cK9AAOpE8OkACwfmQA4Bmt1Wl3jdVsY3iWesG');

INSERT INTO `contact` (`id`, `name`, `phone`, `address`, `email`) VALUES
(3, '', NULL, NULL, '');

INSERT INTO `home` (`id`, `title`, `description`, `slider_url`, `support_image_url`, `banner_image_1_url`, `banner_image_2_url`, `path`, `component_name`, `body_banner_image_1_url`, `body_banner_image_2_url`, `extra_info_image_1_url`, `extra_info_image_2_url`, `extra_info_image_3_url`) VALUES
(4, '', NULL, NULL, NULL, NULL, NULL, '/home', 'home', NULL, NULL, NULL, NULL, NULL);

INSERT INTO `internal_sections` (`id`, `title`, `slider_url`, `description`, `support_image_url`, `path`, `component_name`) VALUES
(1, 'Inicio', '1642536777966-1.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vestibulum augue ut nulla commodo, tristique dignissim nulla sagittis. Praesent a quam ut nulla viverra interdum ut in dui. Donec fringilla imperdiet risus, ut bibendum orci egestas ut. Curab', '1642536777968-1.png', '/', 'Home'),
(2, 'Productos', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vestibulum augue ut nulla commodo, tristique dignissim nulla sagittis. Praesent a quam ut nulla viverra interdum ut in dui. Donec fringilla imperdiet risus, ut bibendum orci egestas ut. Curab', NULL, 'productos', 'Products');

ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `home`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `internal_sections`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`);

ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderId` (`orderId`),
  ADD KEY `productId` (`productId`);

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `relation_product_category`
  ADD PRIMARY KEY (`productId`,`categoryId`);

ALTER TABLE `social_networks`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `internal_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key';

ALTER TABLE `social_networks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
