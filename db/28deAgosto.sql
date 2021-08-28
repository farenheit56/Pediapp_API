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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electrodomésticos','electrodomesticos',0),(2,'Hogar','hogar',2),(3,'Cocina','cocina',4),(4,'Juegos','juegos',5),(5,'Juguetería','jugueteria',6),(6,'Tecnología','tecnologia',7),(7,'Mascotas','mascotas',3),(8,'Indumentaria','indumentaria',1);
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
) ENGINE=InnoDB;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (3,'Minerva Dev',1234567891,'Calle 123');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_sections`
--

DROP TABLE IF EXISTS `internal_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal_sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slider_url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `support_image_url` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `component_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_sections`
--

LOCK TABLES `internal_sections` WRITE;
/*!40000 ALTER TABLE `internal_sections` DISABLE KEYS */;
INSERT INTO `internal_sections` VALUES (1,'Inicio','sliderimage1.png','AAAAA{....)\n','supportimage1.png','/','Home'),(2,'Productos','sliderimage1.png','Description 1','supportimage1.png','productos','Products'),(3,'Quienes Somos','sliderimage1.png','Description 1','supportimage1.png','quienes-somos','Institutional'),(5,'Contácto','sliderimage1.png','Description 1','supportimage1.png','contacto','Contact'),(6,'Trabaja con nosotros','sliderimage1.png','Description 1','supportimage1.png','trabaja-con-nosotros','GenericSection');
/*!40000 ALTER TABLE `internal_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `orderId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_details_ibfk_4` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,2,1,NULL),(2,4,1,NULL);
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
  `total_price` double DEFAULT NULL,
  `clientId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientId` (`clientId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2021-05-23 21:55:39',27650.2,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `description` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Heladera Whirlpool',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','heladera-whirlpool','heladera.png'),(3,'Ajedrez',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','ajedrez','ajedrez.png'),(4,'Botella Eco',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','botella-eco','botellaeco.png'),(5,'Copa Cerveza',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','copa-cerveza','copa.png'),(6,'Lampara',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','lampara','lampara.png'),(7,'Lampara Escritorio',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','lampara-escritorio','lampara2.png'),(8,'Lampara madera',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','lampara-madera','lampara4.png'),(9,'Mesa',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','mesa','mesa.png'),(10,'Metegold deluxe',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','metegold-deluxe','metegold.png'),(11,'Parlante',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','parlante','parlante.png'),(12,'Plato',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','plato','plato.png'),(13,'Pool',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','pool','pool.png'),(14,'Set de cuchillos',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','set-cuchillos','setcuchillos.png'),(15,'Lampara madera',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','lampara-madera','lampara4.png'),(16,'Set Vasos',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','set-vasos','setvasos.png'),(17,'Sillon individual',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','sillon','sillon.png'),(18,'Sofa',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','sofa','sofa.png'),(19,'taburete',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','taburete','taburete.png'),(20,'taza',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','taza','taza.png'),(21,'Bowl',54000.5,'Aliquam ut dignissim diam. Fusce purus ipsum, sagittis commodo ex consequat, laoreet vulputate nisl. Nunc et mi a tortor consectetur malesuada. Donec posuere sagittis orci, non malesuada quam sagittis sed. Donec ut tempor augue, sed tempor nisi','bowl','aceitunasbowl.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_category_subcategory`
--

DROP TABLE IF EXISTS `relation_category_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_category_subcategory` (
  `categoryId` int DEFAULT NULL,
  `subcategoryId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_category_subcategory`
--

LOCK TABLES `relation_category_subcategory` WRITE;
/*!40000 ALTER TABLE `relation_category_subcategory` DISABLE KEYS */;
INSERT INTO `relation_category_subcategory` VALUES (1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,15,'1900-01-01 00:00:00','1900-01-01 00:00:00'),(1,16,'1900-01-01 00:00:00','1900-01-01 00:00:00');
/*!40000 ALTER TABLE `relation_category_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_product_category`
--

DROP TABLE IF EXISTS `relation_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_product_category` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `productId` int NOT NULL,
  `categoryId` int NOT NULL,
  PRIMARY KEY (`productId`,`categoryId`)
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_product_category`
--

LOCK TABLES `relation_product_category` WRITE;
/*!40000 ALTER TABLE `relation_product_category` DISABLE KEYS */;
INSERT INTO `relation_product_category` VALUES ('1900-00-01 00:00:00','1900-01-01 00:00:00',2,1),('2021-08-25 22:17:42','2021-08-25 22:17:42',2,4),('2021-08-25 22:17:42','2021-08-25 22:17:42',2,5),('1900-00-01 00:00:00','1900-01-01 00:00:00',3,6),('1900-00-01 00:00:00','1900-01-01 00:00:00',4,3),('1900-00-01 00:00:00','1900-01-01 00:00:00',5,3),('1900-00-01 00:00:00','1900-01-01 00:00:00',6,2),('1900-00-01 00:00:00','1900-01-01 00:00:00',7,2),('1900-00-01 00:00:00','1900-01-01 00:00:00',8,2),('1900-00-01 00:00:00','1900-01-01 00:00:00',9,2),('1900-00-01 00:00:00','1900-01-01 00:00:00',10,6),('1900-00-01 00:00:00','1900-01-01 00:00:00',11,6),('1900-00-01 00:00:00','1900-01-01 00:00:00',12,3),('1900-00-01 00:00:00','1900-01-01 00:00:00',13,6),('1900-00-01 00:00:00','1900-01-01 00:00:00',14,3),('1900-00-01 00:00:00','1900-01-01 00:00:00',15,2),('1900-00-01 00:00:00','1900-01-01 00:00:00',16,3),('1900-00-01 00:00:00','1900-01-01 00:00:00',17,2),('1900-00-01 00:00:00','1900-01-01 00:00:00',18,2),('1900-00-01 00:00:00','1900-01-01 00:00:00',19,2),('1900-00-01 00:00:00','1900-01-01 00:00:00',20,3),('1900-00-01 00:00:00','1900-01-01 00:00:00',21,3);
/*!40000 ALTER TABLE `relation_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_product_subcategory`
--

DROP TABLE IF EXISTS `relation_product_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_product_subcategory` (
  `productId` int DEFAULT NULL,
  `subcategoryId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_product_subcategory`
--

LOCK TABLES `relation_product_subcategory` WRITE;
/*!40000 ALTER TABLE `relation_product_subcategory` DISABLE KEYS */;
INSERT INTO `relation_product_subcategory` VALUES (2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,3,'2021-06-27 17:51:53','2021-06-27 17:51:53'),(2,4,'2021-06-27 17:52:23','2021-06-27 17:52:23'),(2,6,'2021-06-27 17:52:23','2021-06-27 17:52:23'),(3,9,'2021-07-07 22:12:51','2021-07-07 22:12:51'),(9,15,'2021-08-25 19:11:45','2021-08-25 19:11:45');
/*!40000 ALTER TABLE `relation_product_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_networks`
--

DROP TABLE IF EXISTS `social_networks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_networks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_networks`
--

LOCK TABLES `social_networks` WRITE;
/*!40000 ALTER TABLE `social_networks` DISABLE KEYS */;
INSERT INTO `social_networks` VALUES (1,'Facebook','www.facebook.com','1624312794702-facebook.png'),(4,'Twitter','www.twitter.com','1624732173040-residuos grafico de flujo.png'),(5,'Instagram','www.instagram.com','1624732204943-twitter.png');
/*!40000 ALTER TABLE `social_networks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategories`
--

DROP TABLE IF EXISTS `subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategories`
--

LOCK TABLES `subcategories` WRITE;
/*!40000 ALTER TABLE `subcategories` DISABLE KEYS */;
INSERT INTO `subcategories` VALUES (1,'Heladeras','heladeras'),(2,'Microondas','microondas'),(7,'Guitarras','guitarras'),(8,'Sintetizadores','sintetizadores'),(9,'Juegos de mesa','juegos-de-mesa'),(10,'Juegos de Ingenio','juegos-de-ingenio'),(11,'Celulares','celulares'),(12,'Alimentos Balanceados','alimentos-balanceados'),(13,'Cuchas','cuchas'),(14,'Indumentaria Urbana','indumentaria-urbana'),(15,'Mesas','mesas');
/*!40000 ALTER TABLE `subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrador','administrador','$2b$10$2XKpNsACi8yiYu3FkKZ96.ourEFg.RTpeSSvXxj0BqF8CFVM5n/gy');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-28 16:29:35
