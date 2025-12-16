-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: weiyun_project
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `collect`
--

DROP TABLE IF EXISTS `collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `product_id` int DEFAULT NULL COMMENT '商品ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collect`
--

LOCK TABLES `collect` WRITE;
/*!40000 ALTER TABLE `collect` DISABLE KEYS */;
INSERT INTO `collect` VALUES (4,10,7,'2025-12-07 16:58:52'),(9,10,8,'2025-12-09 19:22:46'),(10,10,11,'2025-12-09 23:49:35'),(12,10,9,'2025-12-10 13:52:41'),(16,NULL,11,'2025-12-12 22:54:02'),(17,NULL,11,'2025-12-12 22:54:24');
/*!40000 ALTER TABLE `collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text COMMENT '内容',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `product_id` int DEFAULT NULL COMMENT '商品ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'1111',10,11,'2025-12-13 00:11:18'),(2,'222',10,11,'2025-12-13 11:44:00'),(3,'好喝',10,16,'2025-12-14 14:47:41'),(4,'不贵',10,16,'2025-12-14 14:47:51');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `seller_id` int DEFAULT NULL COMMENT '卖家ID',
  `buyer_id` int DEFAULT NULL COMMENT '买家ID',
  `product_id` int DEFAULT NULL COMMENT '商品ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int DEFAULT NULL COMMENT '订单状态,0-待付款,1-待发货,2-待收货,3-已完成,4-已取消',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (8,'202512092346201096',9,10,6,'2025-12-09 23:46:21',4,8999.00,'青蛙','13331311311'),(9,'202512110035381096',9,10,6,'2025-12-11 00:35:39',3,8999.00,'奋斗花园','13333333333'),(10,'20251214205615201012',16,20,12,'2025-12-14 20:56:15',4,18888.00,'广东海洋大学','14121212111'),(11,'20251214210312201012',10,20,12,'2025-12-14 21:03:13',4,18888.00,'广东海洋大学','13131313111');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '商品标题',
  `description` text COMMENT '商品详情',
  `price` decimal(10,2) DEFAULT NULL COMMENT '售价',
  `collect_count` int DEFAULT NULL COMMENT '收藏数',
  `status` int DEFAULT NULL COMMENT '状态，1-在售，0-下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `category` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `views` int DEFAULT NULL COMMENT '浏览数',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (6,'苹果iPhone 17 Pro（256GB）','视网膜XDR显示屏，铝金属一体成型机身，A19 Pro 芯片',8999.00,0,2,NULL,'2025-12-14 00:49:02',1,9,46),(7,'iPhone17','手机',8999.00,1,1,'2025-12-05 00:20:42','2025-12-05 00:20:42',1,10,21),(8,'iPhone','手机',8999.00,2,1,'2025-12-05 00:25:55','2025-12-05 00:25:55',1,10,12),(9,'iPhone17','手机',8999.99,1,1,'2025-12-05 13:05:22','2025-12-05 13:05:22',1,16,17),(11,'永雏塔菲喵','灌注永雏塔菲喵，灌注永雏塔菲谢谢喵',1111.00,5,1,'2025-12-08 23:25:11','2025-12-14 00:49:01',5,10,27),(12,'嘻嘻哈哈靠菲球手办永雏塔菲官方正品luckyfafa','产品名称：嘻嘻哈哈靠菲球\r\n产品尺寸：高度约11cm\r\n人工测量，会有些许误差，请以实物为准。\r\n售价：188.3元\r\n材质：PVC，ABS\r\n版权所有：@永塔菲\r\n出品方：?Lucky FaFa\r\n预售时间：2025年11月-2025年12月31日\r\n预计出荷时间：2026年02月\r\n产品出荷时间仅为预估，可能由于生产安排等原因\r\n造成延期，正式出荷时间请以实际为准。\r\n出荷时间并非到货时间，到货时间约出荷后2-4周。',18888.00,4,1,'2025-12-08 23:28:35','2025-12-14 00:48:59',5,10,44),(15,'联想拯救者y9000','联想拯救者y9000p3060y7000p电竞本r9000p游戏笔记本电脑冰魄白',7199.00,0,1,'2025-12-14 01:08:30','2025-12-14 01:08:30',1,10,4),(16,'百事可乐','百事可乐 Pepsi 碳酸汽水饮料经典罐整箱 百事出品 新老包装随机发货 【经典罐】百事可乐330ml*6罐',11.80,0,1,'2025-12-14 14:47:19','2025-12-14 14:47:19',5,10,10);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_img`
--

DROP TABLE IF EXISTS `product_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL COMMENT '商品ID',
  `img1` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_img_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_img`
--

LOCK TABLES `product_img` WRITE;
/*!40000 ALTER TABLE `product_img` DISABLE KEYS */;
INSERT INTO `product_img` VALUES (2,6,'/upload/img/products/6fb08323-023b-4ef3-afd1-01a04ae51a9a.jpg',1,'2025-12-09 21:35:03'),(3,6,'/upload/img/products/a36ce153-41d1-4cae-a859-8a96745bf9f3.jpg',2,NULL),(4,6,'/upload/img/products/4d54eccd-4893-4ce8-8c7c-55f7c6491b35.jpg',3,NULL),(5,7,'/upload/img/products/1ca7f77a-dcb8-4517-b4cc-43bee6c3317e.jpg',1,NULL),(6,7,'/upload/img/products/d78a8da7-0a48-464a-9c39-19273111d509.jpg',2,NULL),(7,7,'/upload/img/products/6a8a0547-e1bb-4cf1-a866-331777915a14.jpg',3,NULL),(8,8,'/upload/img/products/6963c31d-9c86-4323-bdad-4f1be025248b.jpg',1,NULL),(9,8,'/upload/img/products/7f665c20-5b07-44f6-bf7d-692be0289b59.jpg',2,NULL),(10,8,'/upload/img/products/654405f5-7534-4c41-849c-2ae2a16532ae.jpg',3,NULL),(11,9,'/upload/img/products/924e2e34-ab84-413c-b9be-1493a5d2bbeb.jpg',1,NULL),(12,9,'/upload/img/products/3ade6554-f5c5-423c-b82b-dba0a4f96406.jpg',2,NULL),(13,9,'/upload/img/products/1970710b-f3d9-442c-bc55-7edd0d51646c.jpg',3,NULL),(17,11,'/upload/img/products/50f9cd23-5e9a-4c63-b0fb-7549ee28f3da.jpg',1,NULL),(18,12,'/upload/img/products/a45aff43-b828-49d0-99ec-c4926c43a79c.jpg',1,NULL),(19,12,'/upload/img/products/f4b30522-c516-461a-a510-e055e7a14349.jpg',2,NULL),(20,12,'/upload/img/products/f5140d30-d000-4c23-bd88-1b87109304ca.jpg',3,NULL),(21,15,'/upload/img/products/3dee2b7f-f4ac-468f-8153-c0e7e651707c.jpg',1,'2025-12-14 01:08:30'),(22,15,'/upload/img/products/79e32abf-9aa0-42f5-bed5-aa15594fca5d.jpg',2,'2025-12-14 01:08:30'),(23,15,'/upload/img/products/c0a3cb86-791d-444f-8248-89f671e3162a.jpg',3,'2025-12-14 01:08:30'),(24,16,'/upload/img/products/837a0c96-3bff-4391-b373-029896ab9cb5.jpg',1,'2025-12-14 14:47:19'),(25,16,'/upload/img/products/6bc87f48-ceda-4143-acc1-e59be654adf5.jpg',2,'2025-12-14 14:47:20'),(26,16,'/upload/img/products/a9915b03-b7dd-4877-8004-ace42893b2c2.jpg',3,'2025-12-14 14:47:21'),(27,16,'/upload/img/products/f8b1e06b-843a-4d99-b82f-6da598daea20.jpg',4,'2025-12-14 14:47:22');
/*!40000 ALTER TABLE `product_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名，唯一',
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像 URL',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `gender` int DEFAULT NULL COMMENT '性别',
  `role` int NOT NULL COMMENT '身份',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','admin','13333333333','admin',NULL,'2025-12-15 20:42:32','2025-12-15 20:42:34',0,1),(2,'liwai','李外','12345678900','88888888','/img/moren.jpg',NULL,NULL,1,0),(3,'longlong','龙龙','13333333333','8888888888','/upload/img/default.png',NULL,NULL,1,0),(4,'xiaoli','小李','13232322323','88888888','/upload/img/default.png',NULL,NULL,1,0),(6,'22222','22222','13131313131','22222222',NULL,NULL,NULL,1,0),(7,'6666','6666','13331313113','33333333','/upload/img/9052f512-97ec-43c5-94ec-5a3cfc04919b.png',NULL,NULL,1,0),(8,'hahaha','哈哈哈','13113131313','77777777','/upload/img/49083d45-4348-43b6-9619-f860e7cc3505.png',NULL,NULL,1,0),(9,'test','test','13321519090','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','/upload/img/e5df499c-ea34-4092-8c9b-fa8036c08219.jpg',NULL,NULL,1,0),(10,'user','user','13333333333','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','/upload/img/users/bb2c6949-6306-4b5a-90c8-60eb5501a1e0.jpg','2025-12-05 10:22:44','2025-12-09 21:41:38',1,0),(11,'text1','text1','13333333333','88888888','/upload/img/users/9ce63463-05df-493e-824a-fa28d62b0a39.jpg','2025-12-05 11:27:48','2025-12-05 11:27:48',1,0),(12,'ccccc','ccccc','13333333333','33333333','/upload/img/users/27133c13-392c-4e86-9af5-6edcdb01b911.jpg','2025-12-05 11:32:03','2025-12-05 11:32:03',1,0),(13,'111111','111111','13111111111','1111111111','/upload/img/users/42876044-27e5-4388-9a5f-629c354fec13.jpg','2025-12-05 11:34:14','2025-12-05 11:34:14',2,0),(15,'222222','222222','13222222222','222222','/upload/img/users/e4e954e5-8f47-40a4-be18-20895b4af01b.jpg','2025-12-05 13:02:33','2025-12-05 13:02:33',1,0),(16,'44444','44444','14444444333','1212121','/upload/img/users/9170d7ce-0414-4950-8f54-55883e54adcd.jpg','2025-12-05 13:04:02','2025-12-06 15:12:35',1,0),(20,'acid','小艾','13333333333','bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a','/upload/img/users/95708430-8797-4d1d-b41c-9795915e0e4d.jpg','2025-12-14 19:01:27','2025-12-14 19:01:27',1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-16 17:00:24
