CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `image_url` varchar(255) NOT NULL,
  `productId` int NOT NULL,
  PRIMARY KEY (`id`)
)DEFAULT CHARSET=utf8;

INSERT INTO `product_images` VALUES (1,'prueba.png',2),(2,'prueba2.png',2);



