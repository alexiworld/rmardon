-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: core-services
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `group_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `per_day` double DEFAULT NULL,
  `per_month` double DEFAULT NULL,
  `per_week` double DEFAULT NULL,
  `per_year` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3D2B86CD863FD6C5` (`role_id`),
  KEY `FK3D2B86CD2B6A9AA5` (`user_id`),
  KEY `FK3D2B86CD6F2EC5EF` (`group_id`),
  CONSTRAINT `FK3D2B86CD2B6A9AA5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK3D2B86CD6F2EC5EF` FOREIGN KEY (`group_id`) REFERENCES `usergroup` (`id`),
  CONSTRAINT `FK3D2B86CD863FD6C5` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `business_name` varchar(255) NOT NULL,
  `business_number` varchar(255) NOT NULL,
  `incorporated_name` varchar(255) NOT NULL,
  `industry` varchar(255) NOT NULL,
  `tax_number` varchar(14) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `business_name` (`business_name`),
  UNIQUE KEY `business_number` (`business_number`),
  UNIQUE KEY `incorporated_name` (`incorporated_name`),
  UNIQUE KEY `tax_number` (`tax_number`),
  UNIQUE KEY `group_id` (`group_id`),
  KEY `FKBBA4BFC06F2EC5EF` (`group_id`),
  CONSTRAINT `FKBBA4BFC06F2EC5EF` FOREIGN KEY (`group_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_request`
--

DROP TABLE IF EXISTS `change_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `event_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB8FEFD0061798C0F` (`event_id`),
  CONSTRAINT `FKB8FEFD0061798C0F` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_request`
--

LOCK TABLES `change_request` WRITE;
/*!40000 ALTER TABLE `change_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `source_type` varchar(255) NOT NULL,
  `start_time` datetime NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `assignment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5C6729A2B6A9AA5` (`user_id`),
  KEY `FK5C6729A6F2EC5EF` (`group_id`),
  KEY `FK5C6729AA2629F25` (`assignment_id`),
  CONSTRAINT `FK5C6729A2B6A9AA5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK5C6729A6F2EC5EF` FOREIGN KEY (`group_id`) REFERENCES `usergroup` (`id`),
  CONSTRAINT `FK5C6729AA2629F25` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1188 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `bytes` longblob NOT NULL,
  `file` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership`
--

DROP TABLE IF EXISTS `membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `membership_status` varchar(255) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB01D87D62B6A9AA5` (`user_id`),
  KEY `FKB01D87D66F2EC5EF` (`group_id`),
  CONSTRAINT `FKB01D87D62B6A9AA5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKB01D87D66F2EC5EF` FOREIGN KEY (`group_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership`
--

LOCK TABLES `membership` WRITE;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_request`
--

DROP TABLE IF EXISTS `membership_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `confirmation_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_request`
--

LOCK TABLES `membership_request` WRITE;
/*!40000 ALTER TABLE `membership_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `opened` tinyint(1) DEFAULT NULL,
  `recipient_visible` tinyint(1) DEFAULT NULL,
  `sender_visible` tinyint(1) DEFAULT NULL,
  `message_content_id` bigint(20) NOT NULL,
  `recipient_user_id` bigint(20) NOT NULL,
  `sender_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38EB00076BF88A7F` (`recipient_user_id`),
  KEY `FK38EB0007276B569B` (`sender_user_id`),
  KEY `FK38EB0007BDE31F56` (`message_content_id`),
  CONSTRAINT `FK38EB0007276B569B` FOREIGN KEY (`sender_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK38EB00076BF88A7F` FOREIGN KEY (`recipient_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK38EB0007BDE31F56` FOREIGN KEY (`message_content_id`) REFERENCES `message_content` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'2013-11-11 19:07:15','1',NULL,NULL,NULL,3,0,0,1,1,1,2),(2,'2013-11-11 19:07:15','1',NULL,NULL,NULL,3,0,0,1,2,1,2);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_backup`
--

DROP TABLE IF EXISTS `message_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_backup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `description` longtext,
  `end_time` datetime DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38EB00072B6A9AA5` (`user_id`),
  CONSTRAINT `FK38EB00072B6A9AA5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_backup`
--

LOCK TABLES `message_backup` WRITE;
/*!40000 ALTER TABLE `message_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_content`
--

DROP TABLE IF EXISTS `message_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `body` longtext,
  `channel` longtext,
  `subject` varchar(64) DEFAULT NULL,
  `msgtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_content`
--

LOCK TABLES `message_content` WRITE;
/*!40000 ALTER TABLE `message_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repeatable_event`
--

DROP TABLE IF EXISTS `repeatable_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repeatable_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `day_of_week` int(11) NOT NULL,
  `end_time` time NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` time NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDEEDA7502B6A9AA5` (`user_id`),
  CONSTRAINT `FKDEEDA7502B6A9AA5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repeatable_event`
--

LOCK TABLES `repeatable_event` WRITE;
/*!40000 ALTER TABLE `repeatable_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `repeatable_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `group_id` bigint(20) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `per_day` double DEFAULT NULL,
  `per_month` double DEFAULT NULL,
  `per_week` double DEFAULT NULL,
  `per_year` double DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3580766F2EC5EF` (`group_id`),
  CONSTRAINT `FK3580766F2EC5EF` FOREIGN KEY (`group_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `take_over_event`
--

DROP TABLE IF EXISTS `take_over_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `take_over_event` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `end_time` datetime NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `take_over_request_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBCD0FA272B6A9AA5` (`user_id`),
  KEY `FKBCD0FA27DFBAEBC7` (`take_over_request_id`),
  CONSTRAINT `FKBCD0FA272B6A9AA5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKBCD0FA27DFBAEBC7` FOREIGN KEY (`take_over_request_id`) REFERENCES `take_over_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `take_over_event`
--

LOCK TABLES `take_over_event` WRITE;
/*!40000 ALTER TABLE `take_over_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `take_over_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `take_over_request`
--

DROP TABLE IF EXISTS `take_over_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `take_over_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `accepted_time` datetime DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `taken_by_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5FD5CADC6F2EC5EF` (`group_id`),
  KEY `FK5FD5CADC2474AFD1` (`taken_by_user`),
  CONSTRAINT `FK5FD5CADC2474AFD1` FOREIGN KEY (`taken_by_user`) REFERENCES `user` (`id`),
  CONSTRAINT `FK5FD5CADC6F2EC5EF` FOREIGN KEY (`group_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `take_over_request`
--

LOCK TABLES `take_over_request` WRITE;
/*!40000 ALTER TABLE `take_over_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `take_over_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `agreement_version` int(11) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `date_time_zone` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `is_temp_password` tinyint(1) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_agreement`
--

DROP TABLE IF EXISTS `user_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_agreement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `text` longtext,
  `text_version` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_agreement`
--

LOCK TABLES `user_agreement` WRITE;
/*!40000 ALTER TABLE `user_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_confirmation`
--

DROP TABLE IF EXISTS `user_confirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_confirmation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `confirmation_time` datetime DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `registration_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_confirmation`
--

LOCK TABLES `user_confirmation` WRITE;
/*!40000 ALTER TABLE `user_confirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_confirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_usergroup`
--

DROP TABLE IF EXISTS `user_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_usergroup` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  KEY `FK721496202B6A9AA5` (`user_id`),
  KEY `FK72149620483B3D23` (`user_id`),
  KEY `FK72149620525E2371` (`group_id`),
  KEY `FK721496206F2EC5EF` (`group_id`),
  CONSTRAINT `FK721496206F2EC5EF` FOREIGN KEY (`group_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_usergroup`
--

LOCK TABLES `user_usergroup` WRITE;
/*!40000 ALTER TABLE `user_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `create_user` varchar(64) DEFAULT NULL,
  `context` varchar(255) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `update_user` varchar(64) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `deactivated_date` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `on_board_date` datetime DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `top_id` bigint(20) DEFAULT NULL,
  `short_name` varchar(8) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK14ACB1941D430359` (`top_id`),
  KEY `FK14ACB194CC66FFE4` (`parent_id`),
  CONSTRAINT `FK14ACB1941D430359` FOREIGN KEY (`top_id`) REFERENCES `usergroup` (`id`),
  CONSTRAINT `FK14ACB194CC66FFE4` FOREIGN KEY (`parent_id`) REFERENCES `usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroup`
--

LOCK TABLES `usergroup` WRITE;
/*!40000 ALTER TABLE `usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-01 13:49:32
