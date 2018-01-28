/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.20-log : Database - websystique
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`websystique` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `websystique`;

/*Table structure for table `app_user` */

DROP TABLE IF EXISTS `app_user`;

CREATE TABLE `app_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(255) NOT NULL,
  `FIRST_NAME` varchar(255) NOT NULL,
  `LAST_NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `SSO_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hqk6uc88j3imq8u9jhro36vt3` (`SSO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `app_user` */

insert  into `app_user`(`id`,`EMAIL`,`FIRST_NAME`,`LAST_NAME`,`PASSWORD`,`SSO_ID`) values (1,'samy@xyz.com','Sam','Smith','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm','sam'),(2,'jamal@gmail.com','jamal','jamal','$2a$10$ZiQyQLuv1eLzUpksRx6eLOBdblsNnJMldZK0uINFLR8nKqDIeDkJm','jamal'),(3,'j','j','j','$2a$10$7KJ1uAO9czbOrITdYzqREeasn1rS6qUGBXfbe/BbrFfOjyw2IieVm','j');

/*Table structure for table `app_user_user_profile` */

DROP TABLE IF EXISTS `app_user_user_profile`;

CREATE TABLE `app_user_user_profile` (
  `USER_ID` int(11) NOT NULL,
  `USER_PROFILE_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`,`USER_PROFILE_ID`),
  KEY `FK_gs2lq4vmukguubh36utd4r2cl` (`USER_PROFILE_ID`),
  CONSTRAINT `FK_brmce0t584euix4wb4rursf1q` FOREIGN KEY (`USER_ID`) REFERENCES `app_user` (`id`),
  CONSTRAINT `FK_gs2lq4vmukguubh36utd4r2cl` FOREIGN KEY (`USER_PROFILE_ID`) REFERENCES `user_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `app_user_user_profile` */

insert  into `app_user_user_profile`(`USER_ID`,`USER_PROFILE_ID`) values (3,1),(1,2),(2,2),(3,2),(3,3);

/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `series` varchar(255) NOT NULL,
  `last_used` datetime DEFAULT NULL,
  `TOKEN` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  PRIMARY KEY (`series`),
  UNIQUE KEY `UK_3gq9wkitbp2ave684iu50mhn7` (`TOKEN`),
  UNIQUE KEY `UK_a6c251uovnx2cp2c3vv2dentk` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `persistent_logins` */

/*Table structure for table `user_profile` */

DROP TABLE IF EXISTS `user_profile`;

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cva7m2blp7ekclxworqxau1l7` (`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `user_profile` */

insert  into `user_profile`(`id`,`TYPE`) values (2,'ADMIN'),(3,'DBA'),(1,'USER');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
