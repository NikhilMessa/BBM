/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 5.6.17 : Database - blood_bank
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blood_bank` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `blood_bank`;

/*Table structure for table `blood_contact` */

DROP TABLE IF EXISTS `blood_contact`;

CREATE TABLE `blood_contact` (
  `blood_contact_id` int(100) NOT NULL AUTO_INCREMENT,
  `contact_fk` int(100) DEFAULT NULL,
  `blood_fk` int(100) DEFAULT NULL,
  PRIMARY KEY (`blood_contact_id`),
  KEY `contact_fk` (`contact_fk`),
  KEY `blood_fk` (`blood_fk`),
  CONSTRAINT `blood_contact_ibfk_1` FOREIGN KEY (`contact_fk`) REFERENCES `contact` (`contact_id`) ON UPDATE CASCADE,
  CONSTRAINT `blood_contact_ibfk_2` FOREIGN KEY (`blood_fk`) REFERENCES `blood_group` (`blood_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blood_contact` */

/*Table structure for table `blood_donor_group` */

DROP TABLE IF EXISTS `blood_donor_group`;

CREATE TABLE `blood_donor_group` (
  `blood_donor_group_id` int(100) NOT NULL AUTO_INCREMENT,
  `donor_fk` int(100) DEFAULT NULL,
  `blood_fk` int(100) DEFAULT NULL,
  PRIMARY KEY (`blood_donor_group_id`),
  KEY `donor_fk` (`donor_fk`),
  KEY `blood_fk` (`blood_fk`),
  CONSTRAINT `blood_donor_group_ibfk_1` FOREIGN KEY (`donor_fk`) REFERENCES `donor` (`donor_id`) ON UPDATE CASCADE,
  CONSTRAINT `blood_donor_group_ibfk_2` FOREIGN KEY (`blood_fk`) REFERENCES `blood_group` (`blood_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blood_donor_group` */

/*Table structure for table `blood_group` */

DROP TABLE IF EXISTS `blood_group`;

CREATE TABLE `blood_group` (
  `blood_id` int(100) NOT NULL AUTO_INCREMENT,
  `blood_group` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`blood_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `blood_group` */

insert  into `blood_group`(`blood_id`,`blood_group`) values 
(3,'sd'),
(5,'D#');

/*Table structure for table `blood_request_group` */

DROP TABLE IF EXISTS `blood_request_group`;

CREATE TABLE `blood_request_group` (
  `blood_request_group_id` int(100) NOT NULL AUTO_INCREMENT,
  `requester_fk` int(100) DEFAULT NULL,
  `blood_fk` int(100) DEFAULT NULL,
  PRIMARY KEY (`blood_request_group_id`),
  KEY `requester_fk` (`requester_fk`),
  KEY `blood_fk` (`blood_fk`),
  CONSTRAINT `blood_request_group_ibfk_1` FOREIGN KEY (`requester_fk`) REFERENCES `requester` (`requester_id`) ON UPDATE CASCADE,
  CONSTRAINT `blood_request_group_ibfk_2` FOREIGN KEY (`blood_fk`) REFERENCES `blood_group` (`blood_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blood_request_group` */

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `city_id` int(100) NOT NULL AUTO_INCREMENT,
  `city_code` varchar(100) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `donor_fk` int(100) DEFAULT NULL,
  `requester_fk` int(100) DEFAULT NULL,
  `state_fk` int(100) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `donor_fk` (`donor_fk`),
  KEY `requester_fk` (`requester_fk`),
  KEY `state_fk` (`state_fk`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`donor_fk`) REFERENCES `donor` (`donor_id`) ON UPDATE CASCADE,
  CONSTRAINT `city_ibfk_2` FOREIGN KEY (`requester_fk`) REFERENCES `requester` (`requester_id`) ON UPDATE CASCADE,
  CONSTRAINT `city_ibfk_3` FOREIGN KEY (`state_fk`) REFERENCES `state` (`state_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `city` */

insert  into `city`(`city_id`,`city_code`,`city_name`,`description`,`donor_fk`,`requester_fk`,`state_fk`) values 
(3,'CLSs','Thihariyass','Thiahriya town shop',NULL,NULL,36);

/*Table structure for table `contact` */

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `contact_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `member_fk` int(100) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `member_fk` (`member_fk`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`member_fk`) REFERENCES `member` (`member_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contact` */

/*Table structure for table `donor` */

DROP TABLE IF EXISTS `donor`;

CREATE TABLE `donor` (
  `donor_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `body_weight` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `blood_group` varchar(40) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `pincode` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `username_fk` varchar(100) NOT NULL,
  `status` int(12) DEFAULT NULL,
  PRIMARY KEY (`donor_id`,`username_fk`),
  KEY `member` (`username_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `donor` */

insert  into `donor`(`donor_id`,`name`,`father_name`,`gender`,`dob`,`body_weight`,`email`,`blood_group`,`state`,`city`,`address`,`pincode`,`phone`,`image`,`username_fk`,`status`) values 
(11,'Shar','Ahammed','male','03/08/2018','34Kg','admin@gmail.com','O+','Kandyd','Thihariyass','34#','0778650336','Kandy','upload/11_1521639011.jpg','codeprojects',1),
(13,'nizam','nizam','male','03/26/2018','34Kg','codeprojects@gmail.com','B+','Kandyd','Thihariyass','34#','778650336','cxczxcxvxcvc','upload/394839_1521640578.jpg','super admin',1),
(15,'Today','Today','female','03/14/2018','134kg','today@gmail.com','AB+','Kandyd','Thihariyass','4567','0778665443','Amapara','upload/hire-php-developer-mumbai-india-ezeelive-technologies_1521645495.png','today',0),
(17,'Thursday','Thursday','male','03/22/2018','100Kg','Thursday@gmail.com','A+','Kandyd','Thihariyass','TH78','778650336','ThursdayThursday','upload/Asian_Games_logo.svg_1521689309.png','super admin',1);

/*Table structure for table `email_subs` */

DROP TABLE IF EXISTS `email_subs`;

CREATE TABLE `email_subs` (
  `subscribe_id` int(100) NOT NULL AUTO_INCREMENT,
  `email` varchar(160) DEFAULT NULL,
  `member_fk` int(100) DEFAULT NULL,
  PRIMARY KEY (`subscribe_id`),
  KEY `member_fk` (`member_fk`),
  CONSTRAINT `email_subs_ibfk_1` FOREIGN KEY (`member_fk`) REFERENCES `member` (`member_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `email_subs` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `member_id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` int(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `usertype` varchar(100) DEFAULT NULL,
  `profile` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`member_id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `member` */

insert  into `member`(`member_id`,`name`,`username`,`password`,`email`,`phone`,`address`,`usertype`,`profile`) values 
(1,'admin','super admin','admin',NULL,NULL,NULL,'admin','upload/3_1521639658.jpg'),
(2,'cpp','codeprojects','123456',NULL,NULL,NULL,'user','upload/7015951-3d-funny-animal_1521603987.jpg'),
(14,'today','today','today','today',NULL,NULL,'user','upload/vehicle_1521645370.png');

/*Table structure for table `requester` */

DROP TABLE IF EXISTS `requester`;

CREATE TABLE `requester` (
  `requester_id` int(100) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `blood_group` varchar(100) DEFAULT NULL,
  `unit_blood` varchar(100) DEFAULT NULL,
  `hospital_name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `contact_person` varchar(120) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_no` varchar(200) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `member_fk` varchar(100) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`requester_id`),
  KEY `member_fk` (`member_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `requester` */

insert  into `requester`(`requester_id`,`patient_name`,`gender`,`blood_group`,`unit_blood`,`hospital_name`,`date`,`contact_person`,`address`,`email`,`contact_no`,`reason`,`member_fk`,`image`) values 
(6,'markcpp','female','b+','2','Lanka Hospital','0000-00-00','Hamad','Kandy','codeprojects@gmail.com','sdsadsad','Colombo','mhdcpj','upload/7015951-3d-funny-animal_1521728863.jpg');

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `state_id` int(100) NOT NULL AUTO_INCREMENT,
  `state_code` varchar(100) DEFAULT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `state` */

insert  into `state`(`state_id`,`state_code`,`state_name`,`description`) values 
(36,'84603','Kandyd','New data been added'),
(37,'CLM','Western','Province');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
