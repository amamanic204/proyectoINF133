-- MySQL dump 10.13  Distrib 9.5.0, for Win64 (x86_64)
--
-- Host: localhost    Database: ong3
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '49acd6f3-bfb6-11f0-b0fc-b0fde480d096:1-704,
c9ba17fa-bc55-11f0-b863-3c970e3a0328:1-329';

--
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias` (
  `id_asistencia` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_voluntario` int NOT NULL,
  `hora_llegada` datetime NOT NULL,
  `hora_salida` datetime DEFAULT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_evento` (`id_evento`),
  KEY `id_voluntario` (`id_voluntario`),
  CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE,
  CONSTRAINT `asistencias_ibfk_2` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntarios` (`id_voluntario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias`
--

LOCK TABLES `asistencias` WRITE;
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
INSERT INTO `asistencias` VALUES (5,3,3,'2025-11-20 11:00:00','2025-11-20 14:00:00'),(6,2,5,'2025-12-25 06:00:00','2025-12-25 00:00:00'),(7,7,15,'2025-11-22 08:00:00','2025-11-22 11:00:00'),(8,7,10,'2025-11-22 08:00:00','2025-11-22 12:00:00'),(9,7,20,'2025-11-22 08:30:00','2025-11-22 11:00:00'),(10,7,18,'2025-11-22 10:00:00','2025-11-22 15:00:00'),(11,6,14,'2015-11-21 08:00:00','2015-11-21 13:00:00'),(12,6,16,'2025-11-21 08:00:00','2025-11-21 13:00:00'),(13,8,19,'2026-01-10 09:00:00','2026-01-10 18:00:00'),(14,8,14,'2026-01-11 09:00:00','2026-01-11 18:00:00'),(15,8,11,'2026-01-12 09:00:00','2026-01-12 18:00:00'),(16,8,3,'2026-01-13 09:00:00','2026-01-13 20:00:00');
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add asistencia',7,'add_asistencia'),(26,'Can change asistencia',7,'change_asistencia'),(27,'Can delete asistencia',7,'delete_asistencia'),(28,'Can view asistencia',7,'view_asistencia'),(29,'Can add evento',8,'add_evento'),(30,'Can change evento',8,'change_evento'),(31,'Can delete evento',8,'delete_evento'),(32,'Can view evento',8,'view_evento'),(33,'Can add inscripcion',9,'add_inscripcion'),(34,'Can change inscripcion',9,'change_inscripcion'),(35,'Can delete inscripcion',9,'delete_inscripcion'),(36,'Can view inscripcion',9,'view_inscripcion'),(37,'Can add voluntario',10,'add_voluntario'),(38,'Can change voluntario',10,'change_voluntario'),(39,'Can delete voluntario',10,'delete_voluntario'),(40,'Can view voluntario',10,'view_voluntario');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$DKzjPAi3BzJ5dxnpuE3eoA$41XsKcQqzxl7gvB1epPDwGHaTQ/TTb/wAP3636PSkyc=','2025-11-30 21:39:59.307559',1,'admin','','','admin@gmail.com',1,1,'2025-11-30 17:28:42.816969'),(2,'pbkdf2_sha256$1000000$8mBdsrFq8PYQippv96Kgfm$OwtqlL7F87gyBed5kEvNJ8xkbLjcHaA05GCGUBqOQqI=','2025-11-30 23:09:22.304969',0,'operador01','Alan','Brito','alanbrito@gmail.com',1,1,'2025-11-30 23:00:50.000000'),(3,'pbkdf2_sha256$1000000$ue8mTxlOWryxpXXNDczgdM$Oyd9cobjayJb54UET1IYdB2hzTbGPwuWaTMyAv04ztY=',NULL,0,'operador02','juan','marcos','juanmarcos@gmail.com',1,1,'2025-11-30 23:03:06.000000'),(4,'pbkdf2_sha256$1000000$GttEpdvqxyclccKbcapxD8$HV+BCTrlr049Q+ChfgTtLc5ZU9HaXEqTidu/idEPgSc=',NULL,0,'operador03','Luz','Clara','LuzClara@gmail.com',1,1,'2025-11-30 23:04:47.000000'),(5,'pbkdf2_sha256$1000000$ASssN5uTzMG9A5h39nVUdV$Q5H1BpqqOH/cg0SosINn2LElH/g0zW5Yi5+VvhNksCc=',NULL,1,'admin2','ad','min','admin2@gmail.com',1,1,'2025-11-30 23:07:06.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-11-30 23:00:51.561450','2','operador01',1,'[{\"added\": {}}]',4,1),(2,'2025-11-30 23:02:01.930044','2','operador01',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\"]}}]',4,1),(3,'2025-11-30 23:03:07.626972','3','operador02',1,'[{\"added\": {}}]',4,1),(4,'2025-11-30 23:03:30.849669','3','operador02',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\"]}}]',4,1),(5,'2025-11-30 23:04:48.091330','4','operador03',1,'[{\"added\": {}}]',4,1),(6,'2025-11-30 23:05:39.960210','4','operador03',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\"]}}]',4,1),(7,'2025-11-30 23:07:07.540490','5','admin2',1,'[{\"added\": {}}]',4,1),(8,'2025-11-30 23:07:21.473128','5','admin2',2,'[{\"changed\": {\"fields\": [\"Email address\", \"Staff status\", \"Superuser status\"]}}]',4,1),(9,'2025-11-30 23:07:46.724250','5','admin2',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'appong','asistencia'),(8,'appong','evento'),(9,'appong','inscripcion'),(10,'appong','voluntario'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-11-30 17:27:39.725270'),(2,'auth','0001_initial','2025-11-30 17:27:40.630576'),(3,'admin','0001_initial','2025-11-30 17:27:40.858016'),(4,'admin','0002_logentry_remove_auto_add','2025-11-30 17:27:40.869542'),(5,'admin','0003_logentry_add_action_flag_choices','2025-11-30 17:27:40.900729'),(6,'appong','0001_initial','2025-11-30 17:27:40.908776'),(7,'contenttypes','0002_remove_content_type_name','2025-11-30 17:27:41.093014'),(8,'auth','0002_alter_permission_name_max_length','2025-11-30 17:27:41.206932'),(9,'auth','0003_alter_user_email_max_length','2025-11-30 17:27:41.247240'),(10,'auth','0004_alter_user_username_opts','2025-11-30 17:27:41.258216'),(11,'auth','0005_alter_user_last_login_null','2025-11-30 17:27:41.358801'),(12,'auth','0006_require_contenttypes_0002','2025-11-30 17:27:41.363344'),(13,'auth','0007_alter_validators_add_error_messages','2025-11-30 17:27:41.375646'),(14,'auth','0008_alter_user_username_max_length','2025-11-30 17:27:41.491016'),(15,'auth','0009_alter_user_last_name_max_length','2025-11-30 17:27:41.613331'),(16,'auth','0010_alter_group_name_max_length','2025-11-30 17:27:41.643860'),(17,'auth','0011_update_proxy_permissions','2025-11-30 17:27:41.658968'),(18,'auth','0012_alter_user_first_name_max_length','2025-11-30 17:27:41.780529'),(19,'sessions','0001_initial','2025-11-30 17:27:41.854934');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('47pvhcb33x838s3g4wji9djevx89d42s','.eJxVjDsOwjAQBe_iGlkbx19Kes5g7XodHEC2FCcV4u4QKQW0b2beS0Tc1hK3npc4szgLJU6_G2F65LoDvmO9NZlaXZeZ5K7Ig3Z5bZyfl8P9OyjYy7cGJA2g84iswSbtEhpmz9Znb4Jj5chOPDCMBilNqJVKLgwEmg0Fm8X7A_CTOFU:1vPqXi:6QBRKTgUZvGkfYjC_6nL3GVzbhIhEYC7_q9VcFWXk8w','2025-12-14 23:09:22.309984'),('r6xgfnns7p984z05n1y2o5i3qp6ot6qe','.eJxVjDsOwjAQBe_iGlnE8ZeSnjNY6901DiBbipMKcXcSKQW0b2beW0RYlxLXznOcSFzEIE6_WwJ8ct0BPaDem8RWl3lKclfkQbu8NeLX9XD_Dgr0stXZOBMyjaPOwIE9KOMTAGkKxhKh0cjOWQ_oB23VCDb5c9aYrdvKpMTnCwDJOFE:1vPlEm:Yw0TqWnbMsTmzhsKJrJGvoAPNgtaoyLLUPTDwEWViaY','2025-12-14 17:29:28.064550');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `proposito` varchar(200) NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime NOT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'noche buena en familia','reunir familiar de bajos recursos en la noche buena','2025-12-24 20:00:00','2025-12-24 23:00:00'),(2,'papa noel visita Viacha','repartir juguetes a los infantes de Viacha','2025-12-25 07:30:00','2025-12-25 08:30:00'),(3,'el agua es un recurso valioso','dar 3 dias continuos de seminarios  para concientisar sobre la importancia del agua en La Paz','2025-11-30 20:30:00','2025-11-30 22:00:00'),(5,'la calidad del aire en la paz','un seminario que concientiza a los ciudadanos de La Paz','2025-12-01 18:00:00','2025-12-01 22:00:00'),(6,'Conciencia sobre el medio ambiente','Con el proposito de concientizar sobre el medio ambiente y dar un mensaje a todas las personas sobre el estado del acosistema.','2025-11-21 10:00:00','2025-11-21 12:00:00'),(7,'Curso de Reciclaje','Para poder guiar a las personas sobre el correcto metodo de implementación del reciclaje','2025-11-22 09:00:00','2025-11-22 12:00:00'),(8,'Campaña de utiles escolares','Para que los niños puedan iniciar el año con los utiles necesarios para iniciar clases.','2026-01-10 10:00:00','2026-01-13 15:00:00');
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_voluntario` int NOT NULL,
  `rol` varchar(100) NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `id_evento` (`id_evento`),
  KEY `id_voluntario` (`id_voluntario`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE,
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntarios` (`id_voluntario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
INSERT INTO `inscripciones` VALUES (3,1,1,'seguridad'),(4,2,3,'chofer'),(5,3,5,'presentador'),(6,5,6,'seguridad'),(7,1,6,'chef'),(8,7,15,'Logistica'),(9,7,10,'Presentador'),(10,7,20,'Seguridad'),(11,7,18,'Presentador'),(12,6,14,'Presentador'),(13,6,16,'logistica'),(14,8,19,'Logistica'),(15,8,14,'logistica'),(16,8,11,'logistica'),(17,8,3,'logistica');
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntarios`
--

DROP TABLE IF EXISTS `voluntarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voluntarios` (
  `id_voluntario` int NOT NULL AUTO_INCREMENT,
  `ci` int NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `correo` varchar(255) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`id_voluntario`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntarios`
--

LOCK TABLES `voluntarios` WRITE;
/*!40000 ALTER TABLE `voluntarios` DISABLE KEYS */;
INSERT INTO `voluntarios` VALUES (1,11111111,'jorge','rivas perez','2010-03-21','jorgeRivas@hotmail.com',76576565),(3,12312345,'lucia','colque quispe','2003-02-01','luciaColque@gmail.com',65768688),(5,15151515,'silvia','huanca mamani','1978-05-20','silviaHuanca@gmail.com',66968896),(6,14141414,'joel','fernandez','2008-11-15','joelFernandez@gmail.com',78733221),(7,123233332,'Alan','Brito','2000-10-14','AlanBrito@gmail.com',11133),(8,1414532,'Juana','Mariela','2001-01-11','JuanaMa@gmail.com',77725326),(9,9251522,'Marcos','Coaquira','1998-09-12','Matador3000@gmail.com',77768692),(10,14985247,'Laura','Chambi','2002-11-11','LauraLL@gmail.com',77768256),(11,10002325,'Ramon','Valdez','1992-08-18','DonRamon@gmail.com',66687874),(12,11122233,'Ruth','Quispe Mamani','2001-01-01','ruthQuiMa@gmail.com',1112325),(13,1211454,'Remi','Caja Marca','1998-09-12','RemiCM@gmail.com',66687987),(14,10047535,'Diego','Quino Beltran','2000-08-16','DiegoJavier@gmail.com',60007898),(15,1552454,'Mariela','Chura','2003-01-11','MarielaTQ@gmail.com',14442515),(16,251256,'Juan','Mamani Poma','1989-12-12','JuanMamani@gmail.com',14124555),(17,1511332,'Dalinar','Kholin','2000-01-01','SeniorDalinar@gmail.com',10101024),(18,256354,'Shalland','Davar','1998-04-05','Shalland@gmail.com',14124425),(19,16161621,'Kelsier','Thaidakar','1999-10-11','Sobreviviente@hotmail.com',16161102),(20,54681561,'Kevin','Marca Turco','2001-07-16','KevinTurco@gmail.com',15656236);
/*!40000 ALTER TABLE `voluntarios` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-30 19:14:22
