-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `idAddresses` int NOT NULL AUTO_INCREMENT,
  `street` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idAddresses`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'123 Av Colombia','Mocoa','M','90001'),(2,'456 Obrero','San Francisco','SF','94101'),(3,'789 Progreso','Puerto Asis','PA','33101');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificationtype`
--

DROP TABLE IF EXISTS `identificationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identificationtype` (
  `idType` int NOT NULL AUTO_INCREMENT,
  `nameType` varchar(4) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificationtype`
--

LOCK TABLES `identificationtype` WRITE;
/*!40000 ALTER TABLE `identificationtype` DISABLE KEYS */;
INSERT INTO `identificationtype` VALUES (1,'CC'),(2,'CE'),(3,'NIT');
/*!40000 ALTER TABLE `identificationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `idOrderDetails` int NOT NULL AUTO_INCREMENT,
  `idPurchaseOrders` int NOT NULL,
  `idProducts` int NOT NULL,
  `quantity` int NOT NULL,
  `unitPrice` decimal(10,2) NOT NULL,
  `totalPrice` decimal(10,2) GENERATED ALWAYS AS ((`quantity` * `unitPrice`)) STORED,
  PRIMARY KEY (`idOrderDetails`),
  KEY `idPurchaseOrders` (`idPurchaseOrders`),
  KEY `idProducts` (`idProducts`),
  CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`idPurchaseOrders`) REFERENCES `purchaseorders` (`idPurchaseOrders`),
  CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`idProducts`) REFERENCES `products` (`idProducts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` (`idOrderDetails`, `idPurchaseOrders`, `idProducts`, `quantity`, `unitPrice`) VALUES (1,1,1,10,12000.00),(2,2,2,50,250.00),(3,3,3,20,700.00);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `idOrderStatus` int NOT NULL AUTO_INCREMENT,
  `statusName` varchar(20) NOT NULL,
  PRIMARY KEY (`idOrderStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'Pending'),(2,'Shipped'),(3,'Delivered'),(4,'Cancelled');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productprices`
--

DROP TABLE IF EXISTS `productprices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productprices` (
  `idProductPrices` int NOT NULL AUTO_INCREMENT,
  `idProducts` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `effectiveDate` date NOT NULL,
  PRIMARY KEY (`idProductPrices`),
  KEY `idProducts` (`idProducts`),
  CONSTRAINT `productprices_ibfk_1` FOREIGN KEY (`idProducts`) REFERENCES `products` (`idProducts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productprices`
--

LOCK TABLES `productprices` WRITE;
/*!40000 ALTER TABLE `productprices` DISABLE KEYS */;
INSERT INTO `productprices` VALUES (1,1,12000.00,'2024-08-01'),(2,2,250.00,'2024-09-22'),(3,3,700.00,'2024-06-13');
/*!40000 ALTER TABLE `productprices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `idProducts` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(45) NOT NULL,
  `descriptionProducts` text,
  PRIMARY KEY (`idProducts`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Laptop','High-performance laptop with 16GB RAM and 512GB SSD'),(2,'Mouse','Wireless mouse with ergonomic design'),(3,'Keyboard','Mechanical keyboard with RGB lighting');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseorders`
--

DROP TABLE IF EXISTS `purchaseorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchaseorders` (
  `idPurchaseOrders` int NOT NULL AUTO_INCREMENT,
  `idSuppliers` int NOT NULL,
  `date` date NOT NULL,
  `idOrderStatus` int NOT NULL,
  PRIMARY KEY (`idPurchaseOrders`),
  KEY `idSuppliers` (`idSuppliers`),
  KEY `idOrderStatus` (`idOrderStatus`),
  CONSTRAINT `purchaseorders_ibfk_1` FOREIGN KEY (`idSuppliers`) REFERENCES `suppliers` (`idSuppliers`),
  CONSTRAINT `purchaseorders_ibfk_2` FOREIGN KEY (`idOrderStatus`) REFERENCES `orderstatus` (`idOrderStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseorders`
--

LOCK TABLES `purchaseorders` WRITE;
/*!40000 ALTER TABLE `purchaseorders` DISABLE KEYS */;
INSERT INTO `purchaseorders` VALUES (1,1,'2024-09-11',1),(2,2,'2024-09-16',1),(3,3,'2024-09-19',2);
/*!40000 ALTER TABLE `purchaseorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `idSuppliers` int NOT NULL AUTO_INCREMENT,
  `idType` int NOT NULL,
  `identificationNumber` varchar(12) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `secondName` varchar(45) DEFAULT NULL,
  `lastName1` varchar(45) NOT NULL,
  `lastName2` varchar(45) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `idAddresses` int DEFAULT NULL,
  PRIMARY KEY (`idSuppliers`),
  KEY `idType` (`idType`),
  KEY `idAddresses` (`idAddresses`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`idType`) REFERENCES `identificationtype` (`idType`),
  CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`idAddresses`) REFERENCES `addresses` (`idAddresses`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,1,'12345678A','Juan','Carlos','Perez','Lopez','3205462345','juan.perez@gmail.com',1),(2,2,'98765432B','Carla',NULL,'Gomez','Martinez','3138948424','carla.gomez@hotmail.com',2),(3,3,'11223344C','Ana','Maria','Fernandez',NULL,'3504536473','ana.fernandez@itp.edu.co',3);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-29 20:47:51
