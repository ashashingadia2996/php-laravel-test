-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: laravel
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `device_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_user_id_device_id_unique` (`user_id`,`device_id`),
  KEY `access_device_id_foreign` (`device_id`),
  CONSTRAINT `access_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `access_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (1,1,21,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(2,1,22,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(3,1,23,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(4,1,24,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(5,1,25,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(6,2,26,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(7,2,27,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(8,2,28,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(9,2,29,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(10,2,30,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(11,3,31,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(12,3,32,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(13,3,33,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(14,3,34,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(15,3,35,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(16,4,36,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(17,4,37,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(18,4,38,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(19,4,39,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(20,4,40,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(21,5,41,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(22,5,42,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(23,5,43,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(24,5,44,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(25,5,45,'2024-11-23 14:22:41','2024-11-23 14:22:41'),(26,6,46,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(27,6,47,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(28,6,48,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(29,6,49,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(30,6,50,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(31,7,51,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(32,7,52,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(33,7,53,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(34,7,54,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(35,7,55,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(36,8,56,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(37,8,57,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(38,8,58,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(39,8,59,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(40,8,60,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(41,9,61,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(42,9,62,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(43,9,63,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(44,9,64,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(45,9,65,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(46,11,66,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(47,11,67,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(48,11,68,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(49,11,69,'2024-11-23 14:22:42','2024-11-23 14:22:42'),(50,11,70,'2024-11-23 14:22:42','2024-11-23 14:22:42');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_tokens`
--

DROP TABLE IF EXISTS `access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_tokens_token_unique` (`token`),
  KEY `access_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `access_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_tokens`
--

LOCK TABLES `access_tokens` WRITE;
/*!40000 ALTER TABLE `access_tokens` DISABLE KEYS */;
INSERT INTO `access_tokens` VALUES (3,11,'0c588c6e439d955d5ad02da8acb8c1c40cc785f6a84f7e27fa4d721a058d5765','2024-11-24 07:25:24','2024-11-24 07:10:24','2024-11-24 07:10:24');
/*!40000 ALTER TABLE `access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `devices_serial_number_unique` (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,'sit Device','JPP-273','SN-074180','2024-11-23 14:22:41','2024-11-23 14:22:41'),(2,'eius Device','EFZ-325','SN-784964','2024-11-23 14:22:41','2024-11-23 14:22:41'),(3,'autem Device','BAA-380','SN-227855','2024-11-23 14:22:41','2024-11-23 14:22:41'),(4,'facilis Device','WUA-899','SN-915814','2024-11-23 14:22:41','2024-11-23 14:22:41'),(5,'aliquam Device','TUX-951','SN-375707','2024-11-23 14:22:41','2024-11-23 14:22:41'),(6,'et Device','VMB-923','SN-895439','2024-11-23 14:22:41','2024-11-23 14:22:41'),(7,'itaque Device','ZZJ-568','SN-142255','2024-11-23 14:22:41','2024-11-23 14:22:41'),(8,'voluptates Device','JEF-029','SN-872269','2024-11-23 14:22:41','2024-11-23 14:22:41'),(9,'quisquam Device','GSZ-252','SN-344522','2024-11-23 14:22:41','2024-11-23 14:22:41'),(10,'sit Device','NZB-038','SN-472529','2024-11-23 14:22:41','2024-11-23 14:22:41'),(11,'voluptas Device','QVN-413','SN-968038','2024-11-23 14:22:41','2024-11-23 14:22:41'),(12,'est Device','CAQ-092','SN-407172','2024-11-23 14:22:41','2024-11-23 14:22:41'),(13,'ea Device','JEY-955','SN-252375','2024-11-23 14:22:41','2024-11-23 14:22:41'),(14,'excepturi Device','NCR-653','SN-209034','2024-11-23 14:22:41','2024-11-23 14:22:41'),(15,'libero Device','WSK-995','SN-015497','2024-11-23 14:22:41','2024-11-23 14:22:41'),(16,'ut Device','YEV-327','SN-388561','2024-11-23 14:22:41','2024-11-23 14:22:41'),(17,'perspiciatis Device','WIU-540','SN-989027','2024-11-23 14:22:41','2024-11-23 14:22:41'),(18,'maiores Device','NXO-177','SN-667374','2024-11-23 14:22:41','2024-11-23 14:22:41'),(19,'similique Device','HJH-490','SN-007554','2024-11-23 14:22:41','2024-11-23 14:22:41'),(20,'eos Device','CUC-055','SN-713159','2024-11-23 14:22:41','2024-11-23 14:22:41'),(21,'debitis Device','HCL-187','SN-791654','2024-11-23 14:22:41','2024-11-23 14:22:41'),(22,'dolorem Device','XAO-827','SN-335253','2024-11-23 14:22:41','2024-11-23 14:22:41'),(23,'temporibus Device','LIX-071','SN-407387','2024-11-23 14:22:41','2024-11-23 14:22:41'),(24,'odio Device','LDP-903','SN-494417','2024-11-23 14:22:41','2024-11-23 14:22:41'),(25,'iure Device','NLL-372','SN-945755','2024-11-23 14:22:41','2024-11-23 14:22:41'),(26,'odio Device','ERG-582','SN-413575','2024-11-23 14:22:41','2024-11-23 14:22:41'),(27,'labore Device','GLR-742','SN-531999','2024-11-23 14:22:41','2024-11-23 14:22:41'),(28,'voluptas Device','PQH-910','SN-409157','2024-11-23 14:22:41','2024-11-23 14:22:41'),(29,'voluptatibus Device','QXN-883','SN-822355','2024-11-23 14:22:41','2024-11-23 14:22:41'),(30,'voluptas Device','VHU-775','SN-202071','2024-11-23 14:22:41','2024-11-23 14:22:41'),(31,'omnis Device','FZV-653','SN-807121','2024-11-23 14:22:41','2024-11-23 14:22:41'),(32,'est Device','GES-691','SN-955500','2024-11-23 14:22:41','2024-11-23 14:22:41'),(33,'quia Device','FUJ-406','SN-055073','2024-11-23 14:22:41','2024-11-23 14:22:41'),(34,'tenetur Device','XEL-400','SN-864888','2024-11-23 14:22:41','2024-11-23 14:22:41'),(35,'alias Device','UBL-692','SN-624109','2024-11-23 14:22:41','2024-11-23 14:22:41'),(36,'veniam Device','KUW-957','SN-211136','2024-11-23 14:22:41','2024-11-23 14:22:41'),(37,'quia Device','HYM-118','SN-394734','2024-11-23 14:22:41','2024-11-23 14:22:41'),(38,'et Device','GSY-595','SN-235822','2024-11-23 14:22:41','2024-11-23 14:22:41'),(39,'non Device','FMV-067','SN-951303','2024-11-23 14:22:41','2024-11-23 14:22:41'),(40,'delectus Device','ZMA-186','SN-623884','2024-11-23 14:22:41','2024-11-23 14:22:41'),(41,'asperiores Device','MIO-005','SN-821443','2024-11-23 14:22:41','2024-11-23 14:22:41'),(42,'possimus Device','QWE-674','SN-040889','2024-11-23 14:22:41','2024-11-23 14:22:41'),(43,'alias Device','YCP-922','SN-204235','2024-11-23 14:22:41','2024-11-23 14:22:41'),(44,'error Device','CEN-120','SN-355252','2024-11-23 14:22:41','2024-11-23 14:22:41'),(45,'architecto Device','PNU-778','SN-505979','2024-11-23 14:22:41','2024-11-23 14:22:41'),(46,'esse Device','WFJ-358','SN-782138','2024-11-23 14:22:41','2024-11-23 14:22:41'),(47,'occaecati Device','ZLD-836','SN-309063','2024-11-23 14:22:41','2024-11-23 14:22:41'),(48,'similique Device','UOS-628','SN-911100','2024-11-23 14:22:42','2024-11-23 14:22:42'),(49,'quidem Device','QIT-075','SN-333311','2024-11-23 14:22:42','2024-11-23 14:22:42'),(50,'saepe Device','BPN-092','SN-667951','2024-11-23 14:22:42','2024-11-23 14:22:42'),(51,'beatae Device','YVP-152','SN-367919','2024-11-23 14:22:42','2024-11-23 14:22:42'),(52,'deserunt Device','MFK-468','SN-448178','2024-11-23 14:22:42','2024-11-23 14:22:42'),(53,'alias Device','UWX-302','SN-290154','2024-11-23 14:22:42','2024-11-23 14:22:42'),(54,'voluptatem Device','CAI-234','SN-955173','2024-11-23 14:22:42','2024-11-23 14:22:42'),(55,'voluptas Device','MYT-290','SN-444752','2024-11-23 14:22:42','2024-11-23 14:22:42'),(56,'voluptas Device','GPN-544','SN-267937','2024-11-23 14:22:42','2024-11-23 14:22:42'),(57,'est Device','LPJ-095','SN-725304','2024-11-23 14:22:42','2024-11-23 14:22:42'),(58,'minus Device','CSP-950','SN-045999','2024-11-23 14:22:42','2024-11-23 14:22:42'),(59,'unde Device','SBH-468','SN-036377','2024-11-23 14:22:42','2024-11-23 14:22:42'),(60,'a Device','SOR-740','SN-218864','2024-11-23 14:22:42','2024-11-23 14:22:42'),(61,'qui Device','KUR-303','SN-281685','2024-11-23 14:22:42','2024-11-23 14:22:42'),(62,'rerum Device','KTO-202','SN-221472','2024-11-23 14:22:42','2024-11-23 14:22:42'),(63,'qui Device','MHP-116','SN-486888','2024-11-23 14:22:42','2024-11-23 14:22:42'),(64,'voluptatem Device','POY-916','SN-495822','2024-11-23 14:22:42','2024-11-23 14:22:42'),(65,'voluptatem Device','DKO-921','SN-990851','2024-11-23 14:22:42','2024-11-23 14:22:42'),(66,'quae Device','PBY-165','SN-828016','2024-11-23 14:22:42','2024-11-23 14:22:42'),(67,'laborum Device','ZIX-858','SN-392701','2024-11-23 14:22:42','2024-11-23 14:22:42'),(68,'sit Device','CVT-051','SN-977730','2024-11-23 14:22:42','2024-11-23 14:22:42'),(69,'minus Device','PYB-191','SN-071176','2024-11-23 14:22:42','2024-11-23 14:22:42'),(70,'voluptatem Device','HAS-965','SN-985765','2024-11-23 14:22:42','2024-11-23 14:22:42');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2024_11_23_072102_create_access_tokens_table',1),(6,'2024_11_23_072103_create_refresh_tokens_table',1),(7,'2024_11_23_185421_create_devices_table',1),(8,'2024_11_23_194300_create_access_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `refresh_tokens_token_unique` (`token`),
  KEY `refresh_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `refresh_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_tokens`
--

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
INSERT INTO `refresh_tokens` VALUES (3,11,'9fa8ccd1755163f5f0cd954e2e531a5511c428a14edfc14151d0089636699943','2024-12-24 07:10:24','2024-11-24 07:10:24','2024-11-24 07:10:24');
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Derick Kutch','verdie87@example.net','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(2,'Prof. Edwardo Maggio','bailey.dallin@example.org','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(3,'Michelle Williamson','rodriguez.ezekiel@example.com','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(4,'Prof. Antwon Dickens','vicky77@example.org','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(5,'Gerda Mraz','cordie.hills@example.net','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(6,'Moses Zieme III','bogan.orland@example.net','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(7,'Raheem D\'Amore DVM','marcelina98@example.com','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(8,'Kennith Howe Sr.','reina.pfannerstill@example.com','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(9,'Mrs. Nannie Friesen','jacobs.julien@example.org','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(10,'Prof. Antonina Rice','semard@example.org','2024-11-23 14:22:41','$2y$12$qjtQxD5EWwAjzRfo1Wt4SeYPHjROALNTeA1jxSl.VJWCWyLUOyPly','2024-11-23 14:22:41','2024-11-23 14:22:41'),(11,'Asha','ashashingadia@gmail.com',NULL,'$2y$12$7UyXk89LS.5fU7HPLQ9xrOWCBvYc8OAi4D34GqACheknLh12vfovm','2024-11-23 14:28:07','2024-11-23 14:28:07');
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

-- Dump completed on 2024-11-24 18:19:32
