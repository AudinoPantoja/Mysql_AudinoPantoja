-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: inventario
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
-- Table structure for table `detalleordencompra`
--

DROP TABLE IF EXISTS `detalleordencompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleordencompra` (
  `detalle_id` int NOT NULL AUTO_INCREMENT,
  `orden_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `Precio_total` decimal(10,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  PRIMARY KEY (`detalle_id`),
  KEY `orden_id` (`orden_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalleordencompra_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenescompra` (`orden_id`),
  CONSTRAINT `detalleordencompra_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleordencompra`
--

LOCK TABLES `detalleordencompra` WRITE;
/*!40000 ALTER TABLE `detalleordencompra` DISABLE KEYS */;
INSERT INTO `detalleordencompra` (`detalle_id`, `orden_id`, `producto_id`, `cantidad`, `precio_unitario`) VALUES (1,1,1,5,1150.00),(2,1,3,2,240.00),(3,2,2,10,580.00),(4,3,4,3,95.00);
/*!40000 ALTER TABLE `detalleordencompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenescompra`
--

DROP TABLE IF EXISTS `ordenescompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenescompra` (
  `orden_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_id` int NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`orden_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `ordenescompra_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenescompra`
--

LOCK TABLES `ordenescompra` WRITE;
/*!40000 ALTER TABLE `ordenescompra` DISABLE KEYS */;
INSERT INTO `ordenescompra` VALUES (1,1,'2024-09-01'),(2,2,'2024-09-02'),(3,3,'2024-09-03'),(4,4,'2024-09-04');
/*!40000 ALTER TABLE `ordenescompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` text,
  `precio_base` decimal(10,2) NOT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop','Laptop de 14 pulgadas, 8GB RAM, 256GB SSD',1200.00),(2,'Smartphone','Smartphone Android, 6GB RAM, 128GB',600.00),(3,'Monitor','Monitor Full HD de 24 pulgadas',250.00),(4,'Teclado','Teclado mecánico retroiluminado',100.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `tipo_identificacion_id` int NOT NULL,
  `identificacion` varchar(12) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `primer_apellido` varchar(45) DEFAULT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `tipo_identificacion_id` (`tipo_identificacion_id`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`tipo_identificacion_id`) REFERENCES `tipo_identificacion` (`tipo_identificacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,1,'123456789','Juan','Pérez','García','3001234567','juan.perez@gmail.com','Calle 123 #45-67'),(2,2,'987654321','María','López',NULL,'3109876543','maria.lopez@hotmail.com','Carrera 45 #67-89'),(3,3,'234567890','Carlos','Ramírez','Hernández','3124567890','carlos.ramirez@yahoo.es','Avenida 1 #23-45'),(4,4,'900345234-8','Empresa S.A.S',NULL,NULL,'3156789012','contacto@empresa.com','Zona Industrial #56');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_identificacion`
--

DROP TABLE IF EXISTS `tipo_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_identificacion` (
  `tipo_identificacion_id` int NOT NULL AUTO_INCREMENT,
  `tipo_identificacion` varchar(4) NOT NULL,
  PRIMARY KEY (`tipo_identificacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_identificacion`
--

LOCK TABLES `tipo_identificacion` WRITE;
/*!40000 ALTER TABLE `tipo_identificacion` DISABLE KEYS */;
INSERT INTO `tipo_identificacion` VALUES (1,'TI'),(2,'CC'),(3,'CE'),(4,'NIT');
/*!40000 ALTER TABLE `tipo_identificacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-11  2:10:30
