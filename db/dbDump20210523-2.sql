/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ pediapp /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE pediapp;

DROP TABLE IF EXISTS categories;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS contact;
CREATE TABLE `contact` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS internal_sections;
CREATE TABLE `internal_sections` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `slider_url` varchar(45) NOT NULL,
  `description` varchar(3500) NOT NULL,
  `support_image_url` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS social_networks;
CREATE TABLE `social_networks` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `icon_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS subcategories;
CREATE TABLE `subcategories` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO categories(id,name) VALUES(1,'Sillas');

INSERT INTO contact(id,name,phone,address) VALUES(1,'Minerva Dev',11600478,'Calle Falsa 123');

INSERT INTO internal_sections(id,title,slider_url,description,support_image_url) VALUES(1,'Section 1','sliderimage1.jpg','Description 1','supportimage1.jpg');

INSERT INTO social_networks(id,name,url,icon_url) VALUES(1,'Facebook','www.facebook.com.ar','facebook.png');
INSERT INTO subcategories(id,name) VALUES(1,'Plástico'),(2,'Madera');