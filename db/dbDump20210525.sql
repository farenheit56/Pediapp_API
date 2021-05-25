CREATE DATABASE  IF NOT EXISTS `pediapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pediapp`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: pediapp
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electrodomésticos'),(2,'Jardinería'),(3,'Camping'),(4,'Instrumentos Musicales'),(5,'Juguetería'),(6,'Tecnología'),(7,'Mascotas'),(8,'Indumentaria');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Lucas','Dorrego 1490',11623424);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Minerva Dev',11600478,'Calle Falsa 123');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_sections`
--

DROP TABLE IF EXISTS `internal_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal_sections` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `slider_url` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `support_image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_sections`
--

LOCK TABLES `internal_sections` WRITE;
/*!40000 ALTER TABLE `internal_sections` DISABLE KEYS */;
INSERT INTO `internal_sections` VALUES (1,'Section 1','sliderimage1.jpg','Description 1','supportimage1.jpg');
/*!40000 ALTER TABLE `internal_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `amount` int NOT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_productId_foreign_idx` (`productId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_details_productId_foreign_idx` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,2,1,2);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL,
  `ts` datetime NOT NULL,
  `client_id` int NOT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-05-23 21:55:39',1,1430.75);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Heladera Whirlpool',54000.5,'Heladera para muchas birras','heladera.png'),(3,'Microondas Gama',27500.2,'Microondas de mucha potencia','microondas.png'),(4,'Maceta 12L',150,'Maceta con capacidad de 12 litros','maceta.png'),(5,'Sustrato  20L',525,'Sustrato de 20 litros','sustrato.png'),(6,'Carpa para acampar',4600,'Carpa para 5 personas con cierre','carpa-acampado.png'),(7,'Carpa Indoor',8900,'Carpa para cultivos indoor de 80x80','carpa-indoor.png'),(8,'Borcegos',6200,'Borcegos negros para hacer trekking','borcegos.png'),(9,'Guitarra Les Paul',150200,'La que usaba Slash','guitarra.png'),(10,'Sintetizador TR808',200650,'Para producir Trap','sintetizador.png'),(11,'TEG',1400,'Horas y horas de un juego que no termina mas','teg.png'),(12,'Sudoku',1400,'Libro con 700 paginas de sudoku','sudoku.png'),(13,'Samsung Galaxy 10',1400,'Celular alta gama','celular.png'),(14,'Cat Chow',1400,'Alimento balanceado para gatos adultos','catchow.png'),(15,'Cucha chica',1400,'Entra un caniche y un bulldog si lo compactas bien','cucha.png'),(16,'Remera Básica',1400,'Blanca, mas basica no la vas a encontrar','remera.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_category_subcategory`
--

DROP TABLE IF EXISTS `relation_category_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_category_subcategory` (
  `id` int NOT NULL,
  `categoryId` int DEFAULT NULL,
  `subcategoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  KEY `subcategoryId` (`subcategoryId`),
  CONSTRAINT `relation_category_subcategory_ibfk_5` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relation_category_subcategory_ibfk_6` FOREIGN KEY (`subcategoryId`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_category_subcategory`
--

LOCK TABLES `relation_category_subcategory` WRITE;
/*!40000 ALTER TABLE `relation_category_subcategory` DISABLE KEYS */;
INSERT INTO `relation_category_subcategory` VALUES (3,1,1),(4,1,2),(5,2,3),(6,2,4),(7,2,5),(8,3,5),(9,3,6),(10,4,7),(11,4,8),(12,5,9),(13,5,10),(14,6,8),(15,6,11),(16,7,12),(17,7,13),(18,8,6),(19,8,14);
/*!40000 ALTER TABLE `relation_category_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_product_category`
--

DROP TABLE IF EXISTS `relation_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_product_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_product_category`
--

LOCK TABLES `relation_product_category` WRITE;
/*!40000 ALTER TABLE `relation_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `relation_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_product_subcategory`
--

DROP TABLE IF EXISTS `relation_product_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_product_subcategory` (
  `id` int NOT NULL,
  `productId` int DEFAULT NULL,
  `subcategoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relation_product_subcategory_subcategoryId_productId_unique` (`productId`,`subcategoryId`),
  KEY `subcategoryId` (`subcategoryId`),
  CONSTRAINT `relation_product_subcategory_ibfk_17` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relation_product_subcategory_ibfk_18` FOREIGN KEY (`subcategoryId`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_product_subcategory`
--

LOCK TABLES `relation_product_subcategory` WRITE;
/*!40000 ALTER TABLE `relation_product_subcategory` DISABLE KEYS */;
INSERT INTO `relation_product_subcategory` VALUES (3,2,1),(4,3,2),(5,4,3),(6,5,4),(7,6,5),(8,7,5),(9,8,6),(10,8,14),(11,9,7),(12,10,8),(13,11,9),(14,12,10),(15,13,11),(16,14,12),(17,15,13),(18,16,6),(19,16,14);
/*!40000 ALTER TABLE `relation_product_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_networks`
--

DROP TABLE IF EXISTS `social_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_networks` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_networks`
--

LOCK TABLES `social_networks` WRITE;
/*!40000 ALTER TABLE `social_networks` DISABLE KEYS */;
INSERT INTO `social_networks` VALUES (1,'Facebook','www.facebook.com.ar','facebook.png');
/*!40000 ALTER TABLE `social_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Heladeras'),(2,'Microondas'),(3,'Macetas'),(4,'Sustratos'),(5,'Carpas'),(6,'Indumentaria para Trekking'),(7,'Guitarras'),(8,'Sintetizadores'),(9,'Juegos de mesa'),(10,'Juegos de Ingenio'),(11,'Celulares'),(12,'Alimentos Balanceados'),(13,'Cuchas'),(14,'Indumentaria Urbana');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-25  0:56:48
