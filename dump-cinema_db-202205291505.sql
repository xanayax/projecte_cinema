-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: cinema_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add butaca',7,'add_butaca'),(26,'Can change butaca',7,'change_butaca'),(27,'Can delete butaca',7,'delete_butaca'),(28,'Can view butaca',7,'view_butaca'),(29,'Can add producte',8,'add_producte'),(30,'Can change producte',8,'change_producte'),(31,'Can delete producte',8,'delete_producte'),(32,'Can view producte',8,'view_producte'),(33,'Can add reserva',9,'add_reserva'),(34,'Can change reserva',9,'change_reserva'),(35,'Can delete reserva',9,'delete_reserva'),(36,'Can view reserva',9,'view_reserva'),(37,'Can add sessio',10,'add_sessio'),(38,'Can change sessio',10,'change_sessio'),(39,'Can delete sessio',10,'delete_sessio'),(40,'Can view sessio',10,'view_sessio'),(41,'Can add pelicula',11,'add_pelicula'),(42,'Can change pelicula',11,'change_pelicula'),(43,'Can delete pelicula',11,'delete_pelicula'),(44,'Can view pelicula',11,'view_pelicula'),(45,'Can add fila',12,'add_fila'),(46,'Can change fila',12,'change_fila'),(47,'Can delete fila',12,'delete_fila'),(48,'Can view fila',12,'view_fila'),(49,'Can add sala',13,'add_sala'),(50,'Can change sala',13,'change_sala'),(51,'Can delete sala',13,'delete_sala'),(52,'Can view sala',13,'view_sala'),(53,'Can add client',14,'add_client'),(54,'Can change client',14,'change_client'),(55,'Can delete client',14,'delete_client'),(56,'Can view client',14,'view_client'),(57,'Can add generes',15,'add_generes'),(58,'Can change generes',15,'change_generes'),(59,'Can delete generes',15,'delete_generes'),(60,'Can view generes',15,'view_generes'),(61,'Can add butaca_ sessio',16,'add_butaca_sessio'),(62,'Can change butaca_ sessio',16,'change_butaca_sessio'),(63,'Can delete butaca_ sessio',16,'delete_butaca_sessio'),(64,'Can view butaca_ sessio',16,'view_butaca_sessio'),(65,'Can add comentari',17,'add_comentari'),(66,'Can change comentari',17,'change_comentari'),(67,'Can delete comentari',17,'delete_comentari'),(68,'Can view comentari',17,'view_comentari'),(69,'Can add butaca_ reserves',18,'add_butaca_reserves'),(70,'Can change butaca_ reserves',18,'change_butaca_reserves'),(71,'Can delete butaca_ reserves',18,'delete_butaca_reserves'),(72,'Can view butaca_ reserves',18,'view_butaca_reserves'),(73,'Can add usuari',19,'add_usuari'),(74,'Can change usuari',19,'change_usuari'),(75,'Can delete usuari',19,'delete_usuari'),(76,'Can view usuari',19,'view_usuari');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `is_email_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$XugdnAvKDIUgrgxf0qrVtZ$H95h2FRhuI5B33NRAhBUoN8IUWQIywnP2XWG10tRpq4=','2021-06-04 16:18:20.221408',1,'xanayax','','','',1,1,'2021-04-17 15:13:11.682833',1);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-04-21 15:17:10.013278','1','Producte object (1)',1,'[{\"added\": {}}]',8,1),(2,'2021-04-21 15:17:16.891676','1','Client object (1)',1,'[{\"added\": {}}]',14,1),(3,'2021-04-22 08:15:38.089280','3','Pelicula object (3)',2,'[{\"changed\": {\"fields\": [\"Imatge\"]}}]',11,1),(4,'2021-04-22 08:18:43.406378','3','Pelicula object (3)',2,'[{\"changed\": {\"fields\": [\"Imatge\"]}}]',11,1),(5,'2021-04-22 08:21:55.128979','3','Pelicula object (3)',2,'[{\"changed\": {\"fields\": [\"Imatge\"]}}]',11,1),(6,'2021-05-03 13:16:31.464078','6','Sala object (6)',1,'[{\"added\": {}}]',13,1),(7,'2021-05-03 17:57:19.796779','2','Fila object (2)',1,'[{\"added\": {}}]',12,1),(8,'2021-05-03 17:57:38.539696','1','Butaca object (1)',1,'[{\"added\": {}}]',7,1),(9,'2021-05-03 17:57:44.364317','2','Butaca object (2)',1,'[{\"added\": {}}]',7,1),(10,'2021-05-03 17:57:48.116748','3','Butaca object (3)',1,'[{\"added\": {}}]',7,1),(11,'2021-05-03 17:57:53.037081','4','Butaca object (4)',1,'[{\"added\": {}}]',7,1),(12,'2021-05-03 17:57:56.053638','5','Butaca object (5)',1,'[{\"added\": {}}]',7,1),(13,'2021-05-03 17:59:27.940792','3','Fila object (3)',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'gestio_cine','butaca'),(18,'gestio_cine','butaca_reserves'),(16,'gestio_cine','butaca_sessio'),(14,'gestio_cine','client'),(17,'gestio_cine','comentari'),(12,'gestio_cine','fila'),(15,'gestio_cine','generes'),(11,'gestio_cine','pelicula'),(8,'gestio_cine','producte'),(9,'gestio_cine','reserva'),(13,'gestio_cine','sala'),(10,'gestio_cine','sessio'),(19,'gestio_cine','usuari'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-04-16 18:01:27.315280'),(2,'auth','0001_initial','2021-04-16 18:01:27.589548'),(3,'admin','0001_initial','2021-04-16 18:01:28.489299'),(4,'admin','0002_logentry_remove_auto_add','2021-04-16 18:01:28.721303'),(5,'admin','0003_logentry_add_action_flag_choices','2021-04-16 18:01:28.747230'),(6,'contenttypes','0002_remove_content_type_name','2021-04-16 18:01:28.964012'),(7,'auth','0002_alter_permission_name_max_length','2021-04-16 18:01:29.100790'),(8,'auth','0003_alter_user_email_max_length','2021-04-16 18:01:29.130748'),(9,'auth','0004_alter_user_username_opts','2021-04-16 18:01:29.144511'),(10,'auth','0005_alter_user_last_login_null','2021-04-16 18:01:29.230817'),(11,'auth','0006_require_contenttypes_0002','2021-04-16 18:01:29.236866'),(12,'auth','0007_alter_validators_add_error_messages','2021-04-16 18:01:29.251871'),(13,'auth','0008_alter_user_username_max_length','2021-04-16 18:01:29.280622'),(14,'auth','0009_alter_user_last_name_max_length','2021-04-16 18:01:29.305708'),(15,'auth','0010_alter_group_name_max_length','2021-04-16 18:01:29.336605'),(16,'auth','0011_update_proxy_permissions','2021-04-16 18:01:29.353560'),(17,'auth','0012_alter_user_first_name_max_length','2021-04-16 18:01:29.379640'),(18,'sessions','0001_initial','2021-04-16 18:01:29.429746'),(19,'gestio_cine','0001_initial','2021-04-16 18:53:38.777318'),(20,'gestio_cine','0002_pelicula_qualificacio','2021-04-19 14:44:09.739509'),(21,'gestio_cine','0003_auto_20210419_1736','2021-04-19 15:37:59.539064'),(22,'gestio_cine','0004_auto_20210421_1719','2021-04-21 15:19:21.749830'),(23,'gestio_cine','0005_auto_20210422_1007','2021-04-22 08:07:34.186115'),(24,'gestio_cine','0006_client_user','2021-04-22 08:54:57.891804'),(25,'gestio_cine','0007_auto_20210422_1125','2021-04-22 09:25:30.198537'),(26,'gestio_cine','0008_auto_20210422_1134','2021-04-22 09:34:14.314957'),(27,'gestio_cine','0009_auto_20210422_1137','2021-04-22 09:37:24.805664'),(28,'gestio_cine','0010_producte_imatge','2021-04-25 19:17:17.298633'),(29,'gestio_cine','0011_auto_20210503_1234','2021-05-03 10:34:14.697122'),(30,'gestio_cine','0012_auto_20210504_1630','2021-05-04 14:30:49.064289'),(31,'gestio_cine','0013_auto_20210504_1858','2021-05-04 17:13:32.942549'),(32,'gestio_cine','0014_auto_20210504_1913','2021-05-04 17:13:33.078180'),(33,'gestio_cine','0015_remove_reserva_data','2021-05-06 18:17:39.775943'),(34,'gestio_cine','0016_sala_id_pelicula','2021-05-07 10:50:37.754768'),(35,'gestio_cine','0017_auto_20210511_0856','2021-05-11 07:59:13.690025'),(36,'gestio_cine','0018_auto_20210511_0857','2021-05-11 07:59:13.695974'),(37,'gestio_cine','0019_auto_20210511_0901','2021-05-11 07:59:13.701229'),(38,'gestio_cine','0020_remove_pelicula_id_genere','2021-05-11 07:59:13.706622'),(39,'gestio_cine','0021_pelicula_id_genere','2021-05-11 07:59:13.712167'),(40,'gestio_cine','0022_auto_20210511_0917','2021-05-11 07:59:13.717987'),(41,'gestio_cine','0023_generes','2021-05-11 07:59:13.724963'),(42,'gestio_cine','0024_pelicula_id_genere','2021-05-11 07:59:13.730235'),(43,'gestio_cine','0025_auto_20210511_0949','2021-05-11 07:59:13.736631'),(44,'gestio_cine','0026_generes','2021-05-11 07:59:13.742221'),(45,'gestio_cine','0027_pelicula_id_genere','2021-05-11 07:59:13.747957'),(46,'gestio_cine','0028_remove_pelicula_id_genere','2021-05-11 08:01:09.016166'),(47,'gestio_cine','0029_delete_generes','2021-05-11 08:01:23.054981'),(48,'gestio_cine','0030_generes','2021-05-11 08:01:39.573430'),(49,'gestio_cine','0031_pelicula_id_genere','2021-05-11 08:03:12.741700'),(50,'gestio_cine','0032_remove_pelicula_id_genere','2021-05-11 08:03:12.801671'),(51,'gestio_cine','0033_pelicula_id_genere','2021-05-11 08:28:47.846323'),(52,'gestio_cine','0034_rename_id_sala_butaca_id_fila','2021-05-11 09:20:29.562673'),(53,'gestio_cine','0035_auto_20210513_1125','2021-05-13 11:17:51.419518'),(54,'gestio_cine','0036_rename_disponible_butaca_ocupat','2021-05-14 14:50:48.180887'),(55,'gestio_cine','0037_butaca_sessio','2021-05-18 07:28:39.457119'),(56,'gestio_cine','0038_remove_butaca_sessio','2021-05-18 08:31:40.318061'),(57,'gestio_cine','0039_auto_20210518_1032','2021-05-18 08:32:44.595585'),(58,'gestio_cine','0040_auto_20210518_1047','2021-05-18 17:56:36.939487'),(59,'gestio_cine','0041_auto_20210518_1048','2021-05-18 17:56:36.947463'),(60,'gestio_cine','0042_auto_20210518_1048','2021-05-18 17:56:36.954448'),(61,'gestio_cine','0043_butaca_ocupat','2021-05-18 17:56:36.960625'),(62,'gestio_cine','0044_auto_20210518_1152','2021-05-18 17:56:36.966457'),(63,'gestio_cine','0045_auto_20210518_1209','2021-05-18 17:56:36.972444'),(64,'gestio_cine','0046_remove_butaca_ocupat','2021-05-18 17:56:36.978505'),(65,'gestio_cine','0047_auto_20210518_1212','2021-05-18 17:56:36.985441'),(66,'gestio_cine','0048_auto_20210518_1229','2021-05-18 17:56:36.992421'),(67,'gestio_cine','0049_delete_butaca_sessio','2021-05-18 17:56:36.999404'),(68,'gestio_cine','0050_butaca_id_sessio','2021-05-18 17:56:37.005387'),(69,'gestio_cine','0051_auto_20210518_1956','2021-05-18 17:56:37.010374'),(70,'gestio_cine','0052_remove_sala_detalls','2021-05-18 18:00:19.787210'),(71,'gestio_cine','0053_sala_detalls','2021-05-18 18:00:44.420148'),(72,'gestio_cine','0054_remove_butaca_ocupat','2021-05-20 07:48:42.167906'),(73,'gestio_cine','0055_butaca_reserva','2021-05-20 07:48:59.385067'),(74,'gestio_cine','0056_remove_reserva_id_client','2021-05-20 15:43:26.884286'),(75,'gestio_cine','0057_auto_20210521_0846','2021-05-21 06:46:40.614011'),(76,'gestio_cine','0058_comentari_id_pelicula','2021-05-21 07:43:01.473455'),(77,'gestio_cine','0059_remove_comentari_data','2021-05-21 08:21:27.894566'),(78,'gestio_cine','0060_comentari_data','2021-05-21 08:22:40.977773'),(79,'gestio_cine','0061_remove_butaca_reserva','2021-05-21 18:04:40.847089'),(80,'gestio_cine','0062_auto_20210521_2008','2021-05-21 18:08:07.506329'),(81,'gestio_cine','0063_auto_20210604_2005','2021-06-04 18:05:59.871275'),(82,'gestio_cine','0064_auto_20210605_0747','2021-06-05 05:49:44.042317'),(83,'gestio_cine','0065_usuari_is_email_verified','2021-06-05 09:27:27.809905'),(84,'gestio_cine','0066_auto_20210606_1246','2021-06-06 10:48:22.619057'),(85,'gestio_cine','0067_auto_20210606_1247','2021-06-06 10:48:22.626135'),(86,'gestio_cine','0068_remove_comentari_comentari','2021-06-06 10:55:28.819054'),(87,'gestio_cine','0069_comentari_comentari','2021-06-06 10:55:28.825822'),(88,'gestio_cine','0070_delete_comentari','2021-06-06 10:55:28.830771'),(89,'gestio_cine','0071_comentari','2021-06-06 10:56:36.461577'),(90,'gestio_cine','0072_butaca_reserves_id_sessio','2021-07-09 15:53:39.362831'),(91,'gestio_cine','0073_alter_butaca_reserves_id_sessio','2021-07-09 15:53:39.369810'),(92,'gestio_cine','0074_remove_butaca_reserves_id_sessio','2021-07-09 15:53:39.376790'),(93,'gestio_cine','0075_butaca_reserves_id_sessio','2021-07-09 16:04:40.250977'),(94,'gestio_cine','0076_usuari_profile_pic','2021-08-04 17:30:15.124573'),(95,'gestio_cine','0077_alter_butaca_reserves_unique_together','2022-04-19 16:56:31.375864'),(96,'gestio_cine','0078_alter_butaca_reserves_unique_together','2022-04-19 17:21:04.320126');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1vx8nzh12g0ivjrhhx5o315kjttp2v43','.eJxVjEEOgjAURO_StWn6KbWtS_eegcz_bQU1kABdGe8uJCx0O-_Ne6sOde27uuS5G5K6qKZRp9-RIc887iQ9MN4nLdO4zgPrXdEHXfRtSvl1Pdy_QI-l395WGGzINlJMSGyytEAgc0axLci4gpIpUYkJzou44Cwb72MMWUjiFuW6QrC1qFWfL2WuPJ8:1ltnUf:R8rper-cCkZIkrCriYL-oLBFyyqTF4O6Cmyk4OnjH3M','2021-07-01 08:35:21.779424'),('41jgz86gasjbkmak4s4kbzgbr52fcaca','.eJxVjEEOgjAQRe_StWkcmE6LS_eeoZnptIIaSCisjHcXEha6_e_99zaR16WPa81zHNRcDJjT7yacnnncgT54vE82TeMyD2J3xR602tuk-XU93L9Az7Xf3k0HAKSB20LkPGiTfRHpUEQxYXYA6BUDIJYQQH1phQS6xp2Joc1bVNaFE28tMp8vtWk61g:1mMvLr:RdKyu9bkFssAiAtSuYabQwDHlzIfxTih8XM44DqP5EE','2021-09-19 16:50:39.153493'),('4xvdj722fcli6y2hc8vh0yfdcqi7otab','.eJxVjEsOgkAQRO8yazOhez40LN1zAmNIz3QrqIGEz8p4dyFhocuqevXepuV16dp11qntxdQGzOm3S5yfOuyDPHi4jzaPwzL1ye6IPdbZNqPo63ywf4KO5257o2b0QtFVhYuUsIDsFVQK8kQ-CErCMkDAiKKExEDh5kABnUuxxE2a1oUzm_piwNOWwVfm-vkC5Eo8Og:1nuzC4:NUfMx_uo52ApQOYu0vkrwEJTsruZ8-EZytRC-BRqirA','2022-06-11 16:21:36.730022'),('h06ir659vorh4fk57o6tmznhmovbdn8l','.eJxVjDsOwjAQRO_iGln4F9uU9DmDtd5dcADZUpxUiLuTSCmgG817M2-RYF1KWjvPaSJxEUqcfrsM-OS6A3pAvTeJrS7zlOWuyIN2OTbi1_Vw_w4K9LKtz4YsxiFmY9EHFxxjIHTEAVSMNw8B9ZY5mkxWE6FxUemA1qMxamDx-QLtuzgh:1lhDdE:sgPJ-75fBJMTVNpB1wN-hmzrYcvd-zYc7dutG3SpHbM','2021-05-27 15:52:12.370396'),('k3l63nesv7ovqt3um3tdm258c2sm9vcl','.eJxVjMsOwiAQAP-FsyFuWV4evfsNhO2CVA0kpT0Z_92Q9KDXmcm8RYj7VsLe0xoWFhcxidMvozg_Ux2CH7Hem5xb3daF5EjkYbu8NU6v69H-DUrsZWw9ABh2UWVjtAWeks1EHokYZ0waAC2jA8TsHLDNigyBn_TZRFBJfL7PBzdD:1lpqT9:Yg74C3XAROTD667ng6Efmj1mEK0AMjB8ssjvH5mc_-c','2021-06-20 10:57:27.044666'),('k3v92z5rutvktywxvr0tl06xys0yx4m6','.eJxVzDsOwjAQRdG9uEYWk4x_lPSswZrx2CSAEilxKsTeiaUU0L77dN4q0laHuK15iaOoi-rU6XdjSs88tSAPmu6zTvNUl5F1u-ijrvo2S35dj-8fMNA6NDYAgBVPfbHWOJAuu8IckFkwYTYA6AQ9IBbvQVzp2TKEzpwtQZ93lLdKiXbLgPp8AfDWOwc:1mLLlY:64zx9ChJAKQZ6qpCzSOxuQILtbhwZDTVB_XTxIRf-fk','2021-09-15 08:38:40.195342'),('n4p3eat8hscn81coz6ldn4fnmvfx5ehh','.eJxVjrEOgzAMRP8lcxWBwQnp2J1vQHYcN7QVSBCmqv9ekBja9d7d073NQFvJw7amZRjFXE1tLr8ZU3ym6QDyoOk-2zhPZRnZHhV70tX2s6TX7ez-CTKteV8DM6o0MbBS20DlYwyIrquRVFqFugoJJLTK3gEIuOARCYiwo0ZBdylvhSIdF8F8vhyIO8Q:1ltopK:RgNbdR362suwVuB9kPuhJTUC7sv6HIN6ZUrL-anKCpE','2021-07-01 10:00:46.622614'),('r5qgvszr3med9uz9jvh0eukzufxpxry5','.eJxVjDsOwjAQRO_iGln4F9uU9DmDtd5dcADZUpxUiLuTSCmgG817M2-RYF1KWjvPaSJxEUqcfrsM-OS6A3pAvTeJrS7zlOWuyIN2OTbi1_Vw_w4K9LKtz4YsxiFmY9EHFxxjIHTEAVSMNw8B9ZY5mkxWE6FxUemA1qMxamDx-QLtuzgh:1lmxWJ:hsRHKrE-YhxIVIqHciUlPYfDskIyNKiHDnBDDNSRJgU','2021-06-12 11:52:47.154824'),('vkhpyi9ehjqwnvp4b36i631ecqns9he6','.eJxVjMsOwiAQAP-FsyFuWV4evfsNhO2CVA0kpT0Z_92Q9KDXmcm8RYj7VsLe0xoWFhcxidMvozg_Ux2CH7Hem5xb3daF5EjkYbu8NU6v69H-DUrsZWw9ABh2UWVjtAWeks1EHokYZ0waAC2jA8TsHLDNigyBn_TZRFBJfL7PBzdD:1lshxP:oqzzwPHxCfeWkijjoAcihybgQCpF1bYjXos-B8qcPdc','2021-06-28 08:28:31.487374'),('xm08m4vt3ebajfy6ucvxqzd6eendj3ux','.eJxVjDEOgzAMRe-SuYrAxIF07M4ZkB3HhbYCiZCp6t0LEkO7_vf-e5uByjYOJad1mMRcTW0uvxtTfKb5APKg-b7YuMzbOrE9FHvSbPtF0ut2un-BkfK4v4EZVZoYWMk1ULUxBkTf1UgqTqGuQgIJTrn1AAI-tIgERNhRo6B7lMtGkfZW8ObzBRy0O9A:1m1uh7:TClD6HVK-YpftL1Esuo-G9HeXFsmfIHMXZEQwPaq1rg','2021-07-23 17:53:45.540660'),('y9q16g1yd7qrp8q18dfwbe57wv5lhemm','.eJxVjMsOwiAQRf-FtSE8CgMu3fsNZIBBqgaS0q6M_65NutDtPefcFwu4rTVsg5YwZ3Zmkp1-t4jpQW0H-Y7t1nnqbV3myHeFH3Twa8_0vBzu30HFUb81CNQmyawUafA0xaLAeSXRatAq2ggC0NhU3EQRpHPC2VyENIWy8gjs_QHGwTdN:1lXmdi:L7ZMKlet2Z_INxwtokF6toUVv1frPOWaFclmw7NQuNU','2021-05-01 15:13:42.006434');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_butaca`
--

DROP TABLE IF EXISTS `gestio_cine_butaca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_butaca` (
  `id_butaca` int(11) NOT NULL AUTO_INCREMENT,
  `num_butaca` int(11) NOT NULL,
  `id_fila_id` int(11) NOT NULL,
  PRIMARY KEY (`id_butaca`),
  KEY `gestio_cine_butaca_id_fila_id_94140010_fk_gestio_ci` (`id_fila_id`),
  CONSTRAINT `gestio_cine_butaca_id_fila_id_94140010_fk_gestio_ci` FOREIGN KEY (`id_fila_id`) REFERENCES `gestio_cine_fila` (`id_fila`)
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_butaca`
--

LOCK TABLES `gestio_cine_butaca` WRITE;
/*!40000 ALTER TABLE `gestio_cine_butaca` DISABLE KEYS */;
INSERT INTO `gestio_cine_butaca` VALUES (1,1,4),(2,2,4),(3,3,4),(4,4,4),(5,5,4),(6,6,4),(7,7,4),(8,8,4),(9,9,5),(10,10,5),(11,11,5),(12,12,5),(13,13,5),(14,14,5),(15,15,5),(16,16,5),(17,17,6),(18,18,6),(19,19,6),(20,20,6),(21,21,6),(22,22,6),(23,23,6),(24,24,6),(25,25,7),(26,26,7),(27,27,7),(28,28,7),(29,29,7),(30,30,7),(31,31,7),(32,32,7),(33,33,8),(34,34,8),(35,35,8),(36,36,8),(37,37,8),(38,38,8),(39,39,8),(40,40,8),(41,41,9),(42,42,9),(43,43,9),(44,44,9),(45,45,9),(46,46,9),(47,47,9),(48,48,9),(49,1,10),(50,2,10),(51,3,10),(52,4,10),(53,5,10),(54,6,10),(55,7,10),(56,8,10),(57,9,11),(58,10,11),(59,11,11),(60,12,11),(61,13,11),(62,14,11),(63,15,11),(64,16,11),(65,17,12),(66,18,12),(67,19,12),(68,20,12),(69,21,12),(70,22,12),(71,23,12),(72,24,12),(73,25,13),(74,26,13),(75,27,13),(76,28,13),(77,29,13),(78,30,13),(79,31,13),(80,32,13),(81,33,14),(82,34,14),(83,35,14),(84,36,14),(85,37,14),(86,38,14),(87,39,14),(88,40,14),(89,41,15),(90,42,15),(91,43,15),(92,44,15),(93,45,15),(94,46,15),(95,47,15),(96,48,15),(112,1,16),(113,2,16),(114,3,16),(115,4,16),(116,5,16),(117,6,16),(118,7,16),(119,8,16),(120,9,17),(121,10,17),(122,11,17),(123,12,17),(124,13,17),(125,14,17),(126,15,17),(127,16,17),(128,17,18),(129,18,18),(130,19,18),(131,20,18),(132,21,18),(133,22,18),(134,23,18),(135,24,18),(136,25,19),(137,26,19),(138,27,19),(139,28,19),(140,29,19),(141,30,19),(142,31,19),(143,32,19),(144,33,20),(145,34,20),(146,35,20),(147,36,20),(148,37,20),(149,38,20),(150,39,20),(151,40,20),(152,41,21),(153,42,21),(154,43,21),(155,44,21),(156,45,21),(157,46,21),(158,47,21),(159,48,21),(160,1,22),(161,2,22),(162,3,22),(163,4,22),(164,5,22),(165,6,22),(166,7,22),(167,8,22),(168,9,23),(169,10,23),(170,11,23),(171,12,23),(172,13,23),(173,14,23),(174,15,23),(175,16,23),(176,17,24),(177,18,24),(178,19,24),(179,20,24),(180,21,24),(181,22,24),(182,23,24),(183,24,24),(184,25,25),(185,26,25),(186,27,25),(187,28,25),(188,29,25),(189,30,25),(190,31,25),(191,32,25),(192,33,26),(193,34,26),(194,35,26),(195,36,26),(196,37,26),(197,38,26),(198,39,26),(199,40,26),(200,41,27),(201,42,27),(202,43,27),(203,44,27),(204,45,27),(205,46,27),(206,47,27),(207,48,27),(208,1,28),(209,2,28),(210,3,28),(211,4,28),(212,5,28),(213,6,28),(214,7,28),(215,8,28),(216,9,29),(217,10,29),(218,11,29),(219,12,29),(220,13,29),(221,14,29),(222,15,29),(223,16,29),(224,17,30),(225,18,30),(226,19,30),(227,20,30),(228,21,30),(229,22,30),(230,23,30),(231,24,30),(232,25,31),(233,26,31),(234,27,31),(235,28,31),(236,29,31),(237,30,31),(238,31,31),(239,32,31),(240,33,32),(241,34,32),(242,35,32),(243,36,32),(244,37,32),(245,38,32),(246,39,32),(247,40,32),(248,41,33),(249,42,33),(250,43,33),(251,44,33),(252,45,33),(253,46,33),(254,47,33),(255,48,33),(304,1,34),(305,2,34),(306,3,34),(307,4,34),(308,5,34),(309,6,34),(310,7,34),(311,8,34),(312,9,35),(313,10,35),(314,11,35),(315,12,35),(316,13,35),(317,14,35),(318,15,35),(319,16,35),(320,17,36),(321,18,36),(322,19,36),(323,20,36),(324,21,36),(325,22,36),(326,23,36),(327,24,36),(328,25,37),(329,26,37),(330,27,37),(331,28,37),(332,29,37),(333,30,37),(334,31,37),(335,32,37),(336,33,38),(337,34,38),(338,35,38),(339,36,38),(340,37,38),(341,38,38),(342,39,38),(343,40,38),(344,41,39),(345,42,39),(346,43,39),(347,44,39),(348,45,39),(349,46,39),(350,47,39),(351,48,39),(352,1,40),(353,2,40),(354,3,40),(355,4,40),(356,5,40),(357,6,40),(358,7,40),(359,8,40),(360,9,41),(361,10,41),(362,11,41),(363,12,41),(364,13,41),(365,14,41),(366,15,41),(367,16,41),(368,17,42),(369,18,42),(370,19,42),(371,20,42),(372,21,42),(373,22,42),(374,23,42),(375,24,42),(376,25,43),(377,26,43),(378,27,43),(379,28,43),(380,29,43),(381,30,43),(382,31,43),(383,32,43),(384,33,44),(385,34,44),(386,35,44),(387,36,44),(388,37,44),(389,38,44),(390,39,44),(391,40,44),(392,41,45),(393,42,45),(394,43,45),(395,44,45),(396,45,45),(397,46,45),(398,47,45),(399,48,45),(400,1,46),(401,2,46),(402,3,46),(403,4,46),(404,5,46),(405,6,46),(406,7,46),(407,8,46),(408,9,47),(409,10,47),(410,11,47),(411,12,47),(412,13,47),(413,14,47),(414,15,47),(415,16,47),(416,17,48),(417,18,48),(418,19,48),(419,20,48),(420,21,48),(421,22,48),(422,23,48),(423,24,48),(424,25,49),(425,26,49),(426,27,49),(427,28,49),(428,29,49),(429,30,49),(430,31,49),(431,32,49),(432,33,50),(433,34,50),(434,35,50),(435,36,50),(436,37,50),(437,38,50),(438,39,50),(439,40,50),(440,41,51),(441,42,51),(442,43,51),(443,44,51),(444,45,51),(445,46,51),(446,47,51),(447,48,51);
/*!40000 ALTER TABLE `gestio_cine_butaca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_butaca_reserves`
--

DROP TABLE IF EXISTS `gestio_cine_butaca_reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_butaca_reserves` (
  `id_butaca_reserves` int(11) NOT NULL AUTO_INCREMENT,
  `id_butaca_id` int(11) NOT NULL,
  `id_reserva_id` int(11) NOT NULL,
  `id_sessio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_butaca_reserves`),
  KEY `gestio_cine_butaca_r_id_butaca_id_e1627db0_fk_gestio_ci` (`id_butaca_id`),
  KEY `gestio_cine_butaca_r_id_reserva_id_eeeaf635_fk_gestio_ci` (`id_reserva_id`),
  KEY `gestio_cine_butaca_r_id_sessio_id_4855b194_fk_gestio_ci` (`id_sessio_id`),
  CONSTRAINT `gestio_cine_butaca_r_id_butaca_id_e1627db0_fk_gestio_ci` FOREIGN KEY (`id_butaca_id`) REFERENCES `gestio_cine_butaca` (`id_butaca`),
  CONSTRAINT `gestio_cine_butaca_r_id_reserva_id_eeeaf635_fk_gestio_ci` FOREIGN KEY (`id_reserva_id`) REFERENCES `gestio_cine_reserva` (`id_reserva`),
  CONSTRAINT `gestio_cine_butaca_r_id_sessio_id_4855b194_fk_gestio_ci` FOREIGN KEY (`id_sessio_id`) REFERENCES `gestio_cine_sessio` (`id_sessio`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_butaca_reserves`
--

LOCK TABLES `gestio_cine_butaca_reserves` WRITE;
/*!40000 ALTER TABLE `gestio_cine_butaca_reserves` DISABLE KEYS */;
INSERT INTO `gestio_cine_butaca_reserves` VALUES (56,49,76,9),(57,20,77,4),(58,60,78,9),(59,96,79,10),(60,76,80,9),(61,1,81,4),(62,29,82,11),(63,8,83,11),(64,18,84,11),(65,8,85,4),(66,13,86,11),(67,12,87,4),(68,48,88,11),(69,50,89,9),(70,16,90,11),(71,49,91,10),(72,71,92,9),(73,51,93,10),(74,53,94,9),(75,61,95,10),(76,74,96,10),(77,14,97,4),(78,48,98,4),(79,48,99,4),(80,47,100,4),(81,56,101,10),(82,73,102,9),(83,2,103,11),(84,3,104,11),(85,51,105,9),(86,6,106,11),(87,1,107,11),(88,40,108,11),(89,5,109,11),(90,42,110,11),(91,10,111,11),(92,4,112,11),(93,32,114,11),(106,5,177,4),(107,6,177,4),(108,25,178,4),(109,26,178,4),(110,9,179,4),(111,10,179,4),(112,2,180,4),(113,3,181,4),(114,4,182,4),(115,7,183,4),(116,11,184,4),(117,13,184,4),(118,15,185,4),(119,16,185,4),(120,23,186,4),(121,24,186,4),(122,17,187,4),(123,18,187,4),(124,19,188,4),(125,21,188,4),(126,27,189,4),(127,28,189,4),(128,29,189,4),(129,30,189,4),(130,22,190,4),(131,31,190,4),(132,52,191,10),(133,53,191,10),(134,54,191,10),(135,32,193,4),(136,33,194,4),(137,34,194,4),(138,35,195,4),(139,36,195,4),(140,37,195,4),(141,38,195,4),(142,11,196,11),(143,12,196,11),(144,57,197,10),(145,58,197,10),(146,50,198,10),(147,7,199,11),(148,56,200,9),(149,55,201,10),(150,59,202,10),(151,57,203,9),(152,58,203,9),(153,14,204,11),(154,15,204,11),(155,9,205,11),(156,41,206,4),(157,42,206,4),(158,43,206,4),(159,60,207,10),(160,63,208,10),(161,52,209,9),(162,23,210,11),(163,23,211,11),(164,24,211,11),(165,54,212,9),(166,55,213,9),(167,17,214,11),(168,59,215,9),(169,39,216,4),(170,61,217,9),(171,62,218,9),(172,63,219,9),(173,40,220,4),(174,44,220,4),(175,64,221,9),(176,64,222,9),(177,65,222,9),(178,66,222,9),(179,67,223,9),(180,68,223,9),(181,69,224,9),(182,70,225,9),(183,72,226,9),(184,74,227,9),(185,75,227,9),(186,62,228,10),(187,64,228,10),(188,65,229,10),(189,66,229,10),(190,77,230,9),(191,78,230,9),(192,79,231,9),(193,80,231,9),(194,81,232,9),(195,82,232,9),(196,83,233,9),(197,84,233,9),(198,85,234,9),(199,86,234,9),(200,85,235,9),(201,86,235,9),(202,87,236,9),(203,88,236,9),(204,89,237,9),(205,90,237,9),(206,91,238,9),(207,92,238,9),(208,93,239,9),(209,94,239,9),(210,95,239,9),(211,96,239,9),(212,67,240,10),(213,68,240,10),(214,19,241,11),(215,20,241,11),(216,21,241,11),(217,69,242,10),(218,70,242,10),(219,22,243,11),(220,112,244,12),(221,71,245,10),(222,187,246,14),(223,188,246,14),(224,234,247,15),(225,235,247,15),(226,236,247,15),(227,304,248,17),(228,351,248,17),(229,352,249,18),(230,399,249,18),(231,400,250,19),(232,447,250,19),(233,148,251,12),(234,149,251,12);
/*!40000 ALTER TABLE `gestio_cine_butaca_reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_comentari`
--

DROP TABLE IF EXISTS `gestio_cine_comentari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_comentari` (
  `id_comentari` int(11) NOT NULL AUTO_INCREMENT,
  `comentari` longtext NOT NULL,
  `data` date NOT NULL,
  `id_pelicula_id` int(11) NOT NULL,
  `id_usuari_id` int(11) NOT NULL,
  PRIMARY KEY (`id_comentari`),
  KEY `gestio_cine_comentar_id_pelicula_id_5741f96d_fk_gestio_ci` (`id_pelicula_id`),
  KEY `gestio_cine_comentar_id_usuari_id_f2f60d6b_fk_gestio_ci` (`id_usuari_id`),
  CONSTRAINT `gestio_cine_comentar_id_pelicula_id_5741f96d_fk_gestio_ci` FOREIGN KEY (`id_pelicula_id`) REFERENCES `gestio_cine_pelicula` (`id_pelicula`),
  CONSTRAINT `gestio_cine_comentar_id_usuari_id_f2f60d6b_fk_gestio_ci` FOREIGN KEY (`id_usuari_id`) REFERENCES `gestio_cine_usuari` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_comentari`
--

LOCK TABLES `gestio_cine_comentari` WRITE;
/*!40000 ALTER TABLE `gestio_cine_comentari` DISABLE KEYS */;
INSERT INTO `gestio_cine_comentari` VALUES (4,'Bona pel·lícula, entretinguda','2021-06-17',23,2),(6,'Feia molta por!','2021-08-26',27,1),(7,'9/10','2022-05-28',23,1);
/*!40000 ALTER TABLE `gestio_cine_comentari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_fila`
--

DROP TABLE IF EXISTS `gestio_cine_fila`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_fila` (
  `id_fila` int(11) NOT NULL AUTO_INCREMENT,
  `num_fila` int(11) NOT NULL,
  `id_sala_id` int(11) NOT NULL,
  PRIMARY KEY (`id_fila`),
  KEY `gestio_cine_fila_id_sala_id_b4fe80aa_fk_gestio_cine_sala_id_sala` (`id_sala_id`),
  CONSTRAINT `gestio_cine_fila_id_sala_id_b4fe80aa_fk_gestio_cine_sala_id_sala` FOREIGN KEY (`id_sala_id`) REFERENCES `gestio_cine_sala` (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_fila`
--

LOCK TABLES `gestio_cine_fila` WRITE;
/*!40000 ALTER TABLE `gestio_cine_fila` DISABLE KEYS */;
INSERT INTO `gestio_cine_fila` VALUES (4,1,7),(5,2,7),(6,3,7),(7,4,7),(8,5,7),(9,6,7),(10,1,8),(11,2,8),(12,3,8),(13,4,8),(14,5,8),(15,6,8),(16,1,9),(17,2,9),(18,3,9),(19,4,9),(20,5,9),(21,6,9),(22,1,10),(23,2,10),(24,3,10),(25,4,10),(26,5,10),(27,6,10),(28,1,11),(29,2,11),(30,3,11),(31,4,11),(32,5,11),(33,6,11),(34,1,12),(35,2,12),(36,3,12),(37,4,12),(38,5,12),(39,6,12),(40,1,13),(41,2,13),(42,3,13),(43,4,13),(44,5,13),(45,6,13),(46,1,14),(47,2,14),(48,3,14),(49,4,14),(50,5,14),(51,6,14);
/*!40000 ALTER TABLE `gestio_cine_fila` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_generes`
--

DROP TABLE IF EXISTS `gestio_cine_generes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_generes` (
  `id_genere` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genere`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_generes`
--

LOCK TABLES `gestio_cine_generes` WRITE;
/*!40000 ALTER TABLE `gestio_cine_generes` DISABLE KEYS */;
INSERT INTO `gestio_cine_generes` VALUES (1,'Acció'),(2,'Aventura'),(3,'Animació'),(4,'Thriller'),(5,'Drama'),(6,'Comèdia'),(7,'Terror');
/*!40000 ALTER TABLE `gestio_cine_generes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_pelicula`
--

DROP TABLE IF EXISTS `gestio_cine_pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_pelicula` (
  `id_pelicula` int(11) NOT NULL AUTO_INCREMENT,
  `titol` varchar(80) NOT NULL,
  `sinopsis` longtext NOT NULL,
  `duracio` int(11) NOT NULL,
  `director` varchar(30) NOT NULL,
  `actors` varchar(100) NOT NULL,
  `puntuacio` double NOT NULL,
  `qualificacio` int(11) NOT NULL,
  `imatge` varchar(100) DEFAULT NULL,
  `id_genere_id` int(11) NOT NULL,
  `preu` double NOT NULL,
  PRIMARY KEY (`id_pelicula`),
  KEY `gestio_cine_pelicula_id_genere_id_ce91243a_fk_gestio_ci` (`id_genere_id`),
  CONSTRAINT `gestio_cine_pelicula_id_genere_id_ce91243a_fk_gestio_ci` FOREIGN KEY (`id_genere_id`) REFERENCES `gestio_cine_generes` (`id_genere`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_pelicula`
--

LOCK TABLES `gestio_cine_pelicula` WRITE;
/*!40000 ALTER TABLE `gestio_cine_pelicula` DISABLE KEYS */;
INSERT INTO `gestio_cine_pelicula` VALUES (23,'Tom y Jerry','Una de las rivalidades más populares de la historia se dispara cuando Jerry se muda al mejor hotel de Nueva York en vísperas de \"la boda del siglo\". En Tom y Jerry, la película de Tim Story, la llegada del ratón obliga a la desesperada organizadora del evento a contratar a Tom para deshacerse de él. La batalla entre el gato y el ratón amenaza con destruir su carrera, la boda y puede que todo el hotel. Pero poco después surge un problema aún mayor. Se trata de un miembro del personal diabólicamente ambicioso que conspira contra los tres.',100,'Tim Story','Chloe Grace Moretz , Michael Peña , Rob Delaney , Colin Jost',6.5,3,'tom_y_jerry.jpg',6,6),(24,'El Señor de los Anillos: La Comunidad del Anillo','Frodo Bolsón (Elijah Wood) es un hobbit al que su tío Bilbo (Ian Holm) hace portador del poderoso Anillo Único con una finalidad: destruirlo para liberar a los habitantes de la Tierra Media de la tiranía de esta pieza de orfebrería, capaz de otorgar un poder ilimitado al que la posea. Para completar con éxito su misión, Frodo se une a la Comunidad del Anillo, un variopinto grupo de héroes de distintas razas provinentes de la Tierra Media. Hay humanos, como Aragorn (Viggo Mortensen) o Boromir (Sean Bean), magos como Gandalf (Ian McKellen), hobbits como el propio Frodo, Pippin (Billy Boyd), Merry (Dominic Monaghan) o Sam (Sean Astin), enanos como Gimli (John Rhys-Davies), o elfos como Legolas (Orlando Bloom). Juntos emprenderán un largo y peligroso viaje.',200,'Peter Jackson','Alan Howard, Elijah Wood, Noel Appleby, Sala Baker, Sean Astin, Sean Bean',10,7,'cartelera.jpg',2,6),(25,'Wonder Woman 1984','Son los años 80. Un futuro muy distinto al que había conocido, y en el que Diana Prince (Gal Gadot) echa en falta a compañeros del pasado. En este nuevo capítulo, la princesa de Themyscira entablará amistad con Barbara Ann Minerva (Kristen Wiig), una arqueóloga que trabaja para Max Lord (Pedro Pascal), megalómano empeñado en recopilar artefactos antiguos con la creencia de que estos le harán tan poderosos como un Dios. Cuando de forma sorprendente e inesperada Steve Trevor (Chris Pine) vuelva a la vida, Diana deberá hacer frente a Minerva, que se ha convertido en la peligrosa villana Cheetah tras vender su alma a una poderosa deidad. Esta segunda entrega de las aventuras de Wonder Woman, la superheroína de DC Comics creada por William Moulton Marston, es la continuación de la película Wonder Woman (2017).',151,'Patty Jenkins','Gal Gadot, Chris Pine, Kristen Wiig, Pedro Pascal, Connie Nielsen, Robin Wright',6.5,13,'ww84.jpg',1,6),(26,'Mortal Kombat','En \'Mortal Kombat\' Cole Young, el luchador de MMA (Artes Marciales Mixtas), acostumbrado a recibir palizas por dinero, desconoce su ascendencia, y tampoco sabe por qué el emperador Shang Tsung de Outworld ha enviado a su mejor guerrero, Sub-Zero, un Cryomancer sobrenatural, para darle caza.\r\n\r\nCole teme por la seguridad de su familia y busca a Sonya Blade siguiendo las indicaciones de Jax, un comandante de las Fuerzas Especiales que tiene la misma extraña marca de dragón con la que nació Cole. No tarda en llegar al templo de Lord Raiden, un Dios Anciano y el protector de Earthrealm, que ofrece refugio a los que llevan la marca.\r\n\r\nAllí, Cole entrena con los experimentados guerreros Liu Kang, Kung Lao y el mercenario rebelde Kano, mientras se prepara para enfrentarse a los mayores campeones de la Tierra contra los enemigos de Outworld (El Mundo Exterior) en una batalla de enorme envergadura por el universo.\r\n\r\nVeremos si los esfuerzos de Cole se ven recompensados y consigue desbloquear su arcana -ese inmenso poder que surge del interior de su alma- a tiempo de salvar no solo a su familia, sino para detener Outworld de una vez por todas.',110,'Simon Mcquoid','Joe Taslim, Lewis Tan, Ludi Lin, Mehcad Brooks, Sisi Stringer, Tadanobu Asano',7,18,'mortal_kombat.jpg',1,6),(27,'Ruega por nosotros','\'Ruega por nosotros\' cuenta la historia de Alice, una joven con discapacidad auditiva que después de una supuesta visitación de la Virgen María, es inexplicablemente capaz de escuchar, hablar y curar a los enfermos. Mientras se corre la voz y gente de todos los lugares acude en masa para presenciar los milagros, un periodista desacreditado (Jeffrey Dean Morgan), con la esperanza de revivir su carrera, visita la pequeña ciudad de Nueva Inglaterra para investigar. Cuando empiezan a suceder sucesos aterradores por todas partes, él comienza a cuestionarse si estos fenómenos son obra de la Virgen María o algo mucho más siniestro.',99,'Evan Spiliotopoulos','Cary Elwes, Christine Adams, Diogo Morgado, Jeffrey Dean Morgan, Katie Aselton, William Sadler',7,16,'ruega_por_nosotros.jpg',7,6),(34,'Raya y el último dragón','A través de un viaje emocionante, \'Raya y el último dragón\' nos transporta al mundo de fantasía de Kumandra, donde humanos y dragones vivieron juntos hace mucho tiempo en perfecta armonía. Pero cuando unas fuerzas del mal amenazaron el territorio, los dragones se sacrificaron para salvar a la humanidad.\r\n\r\nAhora, 500 años después, esas mismas fuerzas malignas han regresado y Raya, una guerrera solitaria, tendrá que encontrar al último y legendario dragón para reconstruir un mundo destruido y volver a unir a su pueblo. Sin embargo, a lo largo de su aventura, comprenderá que se necesita algo más que la magia de un dragón para salvar al mundo: También necesitará confianza en sí misma y trabajo de equipo.',114,'Carlos López Estrada, Don Hall','Awkwafina, Benedict Wong, Daniel Dae Kim, Gemma Chan, Izaac Wang, Kelly Marie Tran',8.4,3,'raya.jpg',3,6),(35,'La Abeja Maya y el Orbe dorado','Maya y Willy se embarcan en una nueva aventura ultrasecreta, donde se encuentran al cuidado de un orbe sagrado. Maya y Willy se unirán a sus amigos Arnie y Barney para llevar a su destino al misterioso Orbe, pero cuando el orbe se quiebra Maya y Willy se enfrentan a la responsabilidad más grande sus vidas: cuidar de una pequeña y juguetona hormiga princesa.\r\n\r\nLa aventura resulta ser mucho más importante de lo que imaginaban y deberán trabajar juntos, atravesando terrenos peligrosos y enfrentarse a bichos cazadores, para llevar sana y salva a la princesa de regreso a la montaña a la que pertenece.\r\n\r\nWilly descubrirá un lado que nunca imaginó que tenía y se dará cuenta de que proteger a la pequeña princesa es un reto más grande de lo que pensaba.',88,'Noel Cleary','Benson Jack Anthony, Christian Charisiou, Frances Berry, Justine Clarke, Noel Cleary',7.4,3,'maya.jpg',3,6),(36,'Cruella','Historia que pretende explorar los orígenes de una villana amante de las pieles de animales. Ambientada en la década de 1980 con un ambiente punk, la película contestará a la pregunta: ¿Quién era Cruella antes de que Pongo, Perdita y el resto de los dálmatas se cruzaran en su camino?',134,'Craig Gillespie','Emily Beecham, Emma Stone, Emma Thompson, Joel Fry, Kirby Howell-baptiste, Paul Walter Hauser',7.5,7,'cartelera_NRovuKH.jpg',2,6);
/*!40000 ALTER TABLE `gestio_cine_pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_producte`
--

DROP TABLE IF EXISTS `gestio_cine_producte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_producte` (
  `id_producte` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `preu` double NOT NULL,
  `imatge` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_producte`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_producte`
--

LOCK TABLES `gestio_cine_producte` WRITE;
/*!40000 ALTER TABLE `gestio_cine_producte` DISABLE KEYS */;
INSERT INTO `gestio_cine_producte` VALUES (2,'Crispetes grans',6.95,'crispetes_grans.png'),(4,'Hot Dog',4.75,'hot_dog.png'),(5,'Xuxes',2.55,'chuches.jpg'),(6,'Crispetes petites',3.95,'crispetes_petites.png');
/*!40000 ALTER TABLE `gestio_cine_producte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_reserva`
--

DROP TABLE IF EXISTS `gestio_cine_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_reserva` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_sessio_id` int(11) NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `gestio_cine_reserva_id_sessio_id_348c5319_fk_gestio_ci` (`id_sessio_id`),
  CONSTRAINT `gestio_cine_reserva_id_sessio_id_348c5319_fk_gestio_ci` FOREIGN KEY (`id_sessio_id`) REFERENCES `gestio_cine_sessio` (`id_sessio`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_reserva`
--

LOCK TABLES `gestio_cine_reserva` WRITE;
/*!40000 ALTER TABLE `gestio_cine_reserva` DISABLE KEYS */;
INSERT INTO `gestio_cine_reserva` VALUES (36,4),(38,4),(40,4),(41,4),(44,4),(45,4),(46,4),(47,4),(48,4),(49,4),(50,4),(51,4),(52,4),(53,4),(54,4),(57,4),(58,4),(59,4),(60,4),(61,4),(62,4),(63,4),(64,4),(65,4),(66,4),(67,4),(68,4),(69,4),(70,4),(73,4),(74,4),(75,4),(77,4),(81,4),(85,4),(87,4),(97,4),(98,4),(99,4),(100,4),(125,4),(126,4),(127,4),(128,4),(129,4),(130,4),(131,4),(132,4),(133,4),(134,4),(135,4),(136,4),(137,4),(138,4),(139,4),(140,4),(141,4),(142,4),(143,4),(144,4),(145,4),(146,4),(147,4),(148,4),(149,4),(150,4),(151,4),(152,4),(153,4),(154,4),(155,4),(156,4),(157,4),(158,4),(159,4),(160,4),(161,4),(162,4),(163,4),(164,4),(165,4),(166,4),(167,4),(168,4),(169,4),(170,4),(171,4),(172,4),(173,4),(174,4),(175,4),(176,4),(177,4),(178,4),(179,4),(180,4),(181,4),(182,4),(183,4),(184,4),(185,4),(186,4),(187,4),(188,4),(189,4),(190,4),(193,4),(194,4),(195,4),(206,4),(216,4),(220,4),(37,9),(39,9),(42,9),(43,9),(55,9),(56,9),(71,9),(76,9),(78,9),(80,9),(89,9),(92,9),(94,9),(102,9),(105,9),(200,9),(203,9),(209,9),(212,9),(213,9),(215,9),(217,9),(218,9),(219,9),(221,9),(222,9),(223,9),(224,9),(225,9),(226,9),(227,9),(230,9),(231,9),(232,9),(233,9),(234,9),(235,9),(236,9),(237,9),(238,9),(239,9),(72,10),(79,10),(91,10),(93,10),(95,10),(96,10),(101,10),(191,10),(192,10),(197,10),(198,10),(201,10),(202,10),(207,10),(208,10),(228,10),(229,10),(240,10),(242,10),(245,10),(82,11),(83,11),(84,11),(86,11),(88,11),(90,11),(103,11),(104,11),(106,11),(107,11),(108,11),(109,11),(110,11),(111,11),(112,11),(113,11),(114,11),(196,11),(199,11),(204,11),(205,11),(210,11),(211,11),(214,11),(241,11),(243,11),(244,12),(251,12),(246,14),(247,15),(248,17),(249,18),(250,19);
/*!40000 ALTER TABLE `gestio_cine_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_sala`
--

DROP TABLE IF EXISTS `gestio_cine_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_sala` (
  `id_sala` int(11) NOT NULL AUTO_INCREMENT,
  `num_sala` int(11) NOT NULL,
  `id_pelicula_id` int(11) NOT NULL,
  `detalls` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `gestio_cine_sala_id_pelicula_id_19a3ef1a_fk_gestio_ci` (`id_pelicula_id`),
  CONSTRAINT `gestio_cine_sala_id_pelicula_id_19a3ef1a_fk_gestio_ci` FOREIGN KEY (`id_pelicula_id`) REFERENCES `gestio_cine_pelicula` (`id_pelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_sala`
--

LOCK TABLES `gestio_cine_sala` WRITE;
/*!40000 ALTER TABLE `gestio_cine_sala` DISABLE KEYS */;
INSERT INTO `gestio_cine_sala` VALUES (7,1,23,NULL),(8,2,27,NULL),(9,3,24,NULL),(10,4,25,NULL),(11,5,26,NULL),(12,6,34,NULL),(13,7,35,NULL),(14,8,36,NULL);
/*!40000 ALTER TABLE `gestio_cine_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_sessio`
--

DROP TABLE IF EXISTS `gestio_cine_sessio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_sessio` (
  `id_sessio` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `hora` time(6) NOT NULL,
  `id_pelicula_id` int(11) NOT NULL,
  `id_sala_id` int(11) NOT NULL,
  PRIMARY KEY (`id_sessio`),
  KEY `gestio_cine_sessio_id_pelicula_id_21865776_fk_gestio_ci` (`id_pelicula_id`),
  KEY `gestio_cine_sessio_id_sala_id_2058eabe_fk_gestio_ci` (`id_sala_id`),
  CONSTRAINT `gestio_cine_sessio_id_pelicula_id_21865776_fk_gestio_ci` FOREIGN KEY (`id_pelicula_id`) REFERENCES `gestio_cine_pelicula` (`id_pelicula`),
  CONSTRAINT `gestio_cine_sessio_id_sala_id_2058eabe_fk_gestio_ci` FOREIGN KEY (`id_sala_id`) REFERENCES `gestio_cine_sala` (`id_sala`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_sessio`
--

LOCK TABLES `gestio_cine_sessio` WRITE;
/*!40000 ALTER TABLE `gestio_cine_sessio` DISABLE KEYS */;
INSERT INTO `gestio_cine_sessio` VALUES (4,'2021-05-03','20:30:00.000000',23,7),(9,'2021-06-08','22:00:00.000000',27,8),(10,'2021-06-05','00:00:00.000000',27,8),(11,'2021-07-11','16:30:00.000000',23,7),(12,'2022-06-15','18:00:00.000000',24,9),(13,'2022-06-15','21:00:00.000000',24,9),(14,'2022-06-20','19:00:00.000000',25,10),(15,'2022-06-13','17:30:00.000000',26,11),(16,'2022-06-13','18:30:00.000000',23,7),(17,'2022-06-11','17:30:00.000000',34,12),(18,'2022-06-09','16:30:00.000000',35,13),(19,'2022-06-10','18:00:00.000000',36,14),(20,'2022-06-20','22:00:00.000000',25,10),(21,'2022-06-18','19:00:00.000000',26,11),(22,'2022-06-18','19:00:00.000000',34,12),(23,'2022-06-23','18:00:00.000000',35,13),(24,'2022-06-23','20:30:00.000000',36,14);
/*!40000 ALTER TABLE `gestio_cine_sessio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestio_cine_usuari`
--

DROP TABLE IF EXISTS `gestio_cine_usuari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gestio_cine_usuari` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_email_verified` tinyint(1) NOT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestio_cine_usuari`
--

LOCK TABLES `gestio_cine_usuari` WRITE;
/*!40000 ALTER TABLE `gestio_cine_usuari` DISABLE KEYS */;
INSERT INTO `gestio_cine_usuari` VALUES (1,'pbkdf2_sha256$260000$2ci1gGBJpFrxnKUwaI7NoQ$APBBiH5uzPj+tGlB80xArp2JFK/lJYHtClYbrxSNzpI=','x.anaya@sapalomera.cat','xanaya','Xavier','Anaya','2021-06-05 06:00:04.928457','2022-05-27 16:08:30.318052',1,1,1,1,1,'tom_y_jerry.jpg'),(2,'pbkdf2_sha256$260000$DrtGx0GBBDcnUzpSnY3v5K$262k9nqpsox8AaH3m2LshWj6YJOnswiIHykdqxYfwiU=','ppi@sapa.cat','ppi','Pere','Pi','2021-06-05 08:29:01.403098','2021-08-22 11:21:23.520283',0,1,0,0,1,NULL),(3,'pbkdf2_sha256$260000$9uHpUE09JEpbi9Vr7tlgyV$morSpQvFnedIikgorWUT88VJhYxRj0te3Bwa/N/76/A=','mmas@sapa.cat','mmas','Marta','Mas','2021-06-05 09:17:29.238638','2021-06-16 17:46:52.041547',0,1,0,0,1,NULL),(29,'pbkdf2_sha256$260000$h41NqUsPFkFeatpXj5OaIa$IPZD4nYA6v+gtVh0ACr3UYyY4XY1zXzIpKGd/QaBqR0=','sapaxavi5@gmail.com','sapaXavi','SapaXavi','Anaya','2021-08-28 18:46:24.722322','2021-08-28 18:46:48.696606',0,1,0,0,1,''),(32,'pbkdf2_sha256$260000$mTkBUhTkW1aXjNQLsrlaut$ON8VuUm59mpUvnIZ4PfdQdqxThtZmnFbFohnjRNg4qw=','xevixg@gmail.com','xanaya2','Xavier2','Anaya2','2022-03-28 17:57:54.873326','2022-03-28 18:06:49.284999',0,1,0,0,1,'');
/*!40000 ALTER TABLE `gestio_cine_usuari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cinema_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29 15:05:23
