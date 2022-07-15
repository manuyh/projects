-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!50606 SET @OLD_INNODB_STATS_AUTO_RECALC=@@INNODB_STATS_AUTO_RECALC */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=OFF */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ops`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ops` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ops`;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (1,'gender','2022-07-13 22:13:00',NULL),(2,'time-units','2022-07-13 22:13:06',NULL),(3,'basic','2022-07-13 22:13:38',NULL),(4,'manner-of-death','2022-07-13 22:13:55',NULL),(5,'place-of-death','2022-07-13 22:14:00',NULL),(6,'pregnant-condition','2022-07-13 22:14:21',NULL);
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs_items`
--

DROP TABLE IF EXISTS `catalogs_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogs_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` bigint NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `catalog_id` bigint NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  CONSTRAINT `catalogs_items_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs_items`
--

LOCK TABLES `catalogs_items` WRITE;
/*!40000 ALTER TABLE `catalogs_items` DISABLE KEYS */;
INSERT INTO `catalogs_items` VALUES (1,1,'HOMBRE',1,'2022-07-12 18:35:10',NULL),(2,2,'MUJER',1,'2022-07-12 18:35:20',NULL),(3,9,'SE IGNORA',1,'2022-07-12 18:35:35',NULL),(4,1,'MINUTOS',2,'2022-07-12 18:49:54',NULL),(5,2,'HORAS',2,'2022-07-12 18:50:03',NULL),(6,3,'DÍAS',2,'2022-07-12 18:50:37',NULL),(7,4,'MESES',2,'2022-07-12 18:50:47',NULL),(8,5,'AÑOS',2,'2022-07-12 18:50:59',NULL),(9,9,'SE IGNORA',2,'2022-07-12 18:51:20',NULL),(10,1,'SÍ',3,'2022-07-12 18:51:44',NULL),(11,2,'NO',3,'2022-07-12 18:51:52',NULL),(12,9,'SE IGNORA',3,'2022-07-12 18:52:03',NULL),(13,0,'NATURAL (ENFERMEDAD)',4,'2022-07-12 18:53:26',NULL),(14,1,'HOMICIDIO',4,'2022-07-12 18:54:06',NULL),(15,2,'ACCIDENTE',4,'2022-07-12 18:54:14',NULL),(16,3,'A LA ESPERA DE INVESTIGACIÓN',4,'2022-07-12 18:54:37',NULL),(17,4,'SUICIDIO',4,'2022-07-12 18:54:53',NULL),(18,5,'NO SE PUDO DETERMINAR (SE IGNORA)',4,'2022-07-12 18:55:19',NULL),(19,6,'NO RELLENADO (DESCONOCIDO)',4,'2022-07-12 18:55:42',NULL),(20,8,'INTERVENCIÓN LEGAL',4,'2022-07-12 18:56:00',NULL),(21,9,'GUERRA',4,'2022-07-12 18:56:06',NULL),(22,0,'VIVIENDA PARTICULAR',5,'2022-07-12 18:57:14',NULL),(23,1,'VIVIENDA COLECTIVA',5,'2022-07-12 18:57:25',NULL),(24,2,'ESCUELA U OFICINA PÚBLICA',5,'2022-07-12 18:57:35',NULL),(25,3,'ÁREAS DEPORTIVAS',5,'2022-07-12 18:57:47',NULL),(26,4,'CALLE O CARRETERA (VÍA PÚBLICA)',5,'2022-07-12 18:58:05',NULL),(27,5,'ÁREA COMERCIAL O DE SERVICIOS',5,'2022-07-12 18:58:18',NULL),(28,6,'ÁREA INDUSTRIAL (TALLER, FABRICA U OBRA)',5,'2022-07-12 18:58:37',NULL),(29,7,'GRANJA (RANCHO O PARCELA)',5,'2022-07-12 18:58:51',NULL),(30,8,'OTRO',5,'2022-07-12 18:59:02',NULL),(31,9,'SE IGNORA',5,'2022-07-12 18:59:10',NULL),(32,1,'EL EMBARAZO',6,'2022-07-12 19:00:56',NULL),(33,2,'EL PARTO',6,'2022-07-12 19:01:06',NULL),(34,3,'EL PUEPERIO',6,'2022-07-12 19:01:14',NULL),(35,4,'43 DÍAS A 11 MESES DESPUÉS DEL PARTO O ABORTO',6,'2022-07-12 19:01:33',NULL),(36,5,'NO ESTUVO EMBARAZADA EN LOS ÚLTIMOS 11 MESES PREVIOS A LA MUERTE',6,'2022-07-12 19:02:03',NULL),(37,8,'NO APLICA',6,'2022-07-12 19:02:15',NULL);
/*!40000 ALTER TABLE `catalogs_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `identifier` bigint NOT NULL,
  `gender` bigint NOT NULL,
  `age` bigint NOT NULL,
  `age_unit` bigint NOT NULL,
  `birthdate` text NOT NULL,
  `deathdate` text NOT NULL,
  `variable1` text NOT NULL,
  `variable2` text NOT NULL,
  `a` text NOT NULL,
  `time_a` bigint NOT NULL,
  `time_unit_a` bigint NOT NULL,
  `b` text NOT NULL,
  `time_b` bigint NOT NULL,
  `time_unit_b` bigint NOT NULL,
  `c` text NOT NULL,
  `time_c` bigint NOT NULL,
  `time_unit_c` bigint NOT NULL,
  `d` text NOT NULL,
  `time_d` bigint NOT NULL,
  `time_unit_d` bigint NOT NULL,
  `part_2` text NOT NULL,
  `time_part_2` bigint NOT NULL,
  `time_unit_part_2` bigint NOT NULL,
  `surgery` bigint NOT NULL,
  `surgery_date` text NOT NULL,
  `autopsy` bigint NOT NULL,
  `used_foundings` bigint NOT NULL,
  `manner_of_death` bigint NOT NULL,
  `place_of_death` bigint NOT NULL,
  `multiple_pregnancy` bigint NOT NULL,
  `hours_alive` bigint NOT NULL,
  `weight_in_grams` bigint NOT NULL,
  `full_weeks_of_pregnancy` bigint NOT NULL,
  `mother_age_in_years` bigint NOT NULL,
  `woman_pregnancy_condition` bigint NOT NULL,
  `pregnancy_contribution_to_death` bigint NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!50606 SET GLOBAL INNODB_STATS_AUTO_RECALC=@OLD_INNODB_STATS_AUTO_RECALC */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 22:26:36
