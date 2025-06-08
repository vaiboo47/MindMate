/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - loneliness
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`loneliness` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `loneliness`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add counselling_staff',7,'add_counselling_staff'),
(26,'Can change counselling_staff',7,'change_counselling_staff'),
(27,'Can delete counselling_staff',7,'delete_counselling_staff'),
(28,'Can view counselling_staff',7,'view_counselling_staff'),
(29,'Can add course',8,'add_course'),
(30,'Can change course',8,'change_course'),
(31,'Can delete course',8,'delete_course'),
(32,'Can view course',8,'view_course'),
(33,'Can add department',9,'add_department'),
(34,'Can change department',9,'change_department'),
(35,'Can delete department',9,'delete_department'),
(36,'Can view department',9,'view_department'),
(37,'Can add login',10,'add_login'),
(38,'Can change login',10,'change_login'),
(39,'Can delete login',10,'delete_login'),
(40,'Can view login',10,'view_login'),
(41,'Can add staff',11,'add_staff'),
(42,'Can change staff',11,'change_staff'),
(43,'Can delete staff',11,'delete_staff'),
(44,'Can view staff',11,'view_staff'),
(45,'Can add tutor',12,'add_tutor'),
(46,'Can change tutor',12,'change_tutor'),
(47,'Can delete tutor',12,'delete_tutor'),
(48,'Can view tutor',12,'view_tutor'),
(49,'Can add student',13,'add_student'),
(50,'Can change student',13,'change_student'),
(51,'Can delete student',13,'delete_student'),
(52,'Can view student',13,'view_student'),
(53,'Can add schedule',14,'add_schedule'),
(54,'Can change schedule',14,'change_schedule'),
(55,'Can delete schedule',14,'delete_schedule'),
(56,'Can view schedule',14,'view_schedule'),
(57,'Can add motivation',15,'add_motivation'),
(58,'Can change motivation',15,'change_motivation'),
(59,'Can delete motivation',15,'delete_motivation'),
(60,'Can view motivation',15,'view_motivation'),
(61,'Can add feedback',16,'add_feedback'),
(62,'Can change feedback',16,'change_feedback'),
(63,'Can delete feedback',16,'delete_feedback'),
(64,'Can view feedback',16,'view_feedback'),
(65,'Can add diary',17,'add_diary'),
(66,'Can change diary',17,'change_diary'),
(67,'Can delete diary',17,'delete_diary'),
(68,'Can view diary',17,'view_diary'),
(69,'Can add complaint',18,'add_complaint'),
(70,'Can change complaint',18,'change_complaint'),
(71,'Can delete complaint',18,'delete_complaint'),
(72,'Can view complaint',18,'view_complaint'),
(73,'Can add booking',19,'add_booking'),
(74,'Can change booking',19,'change_booking'),
(75,'Can delete booking',19,'delete_booking'),
(76,'Can view booking',19,'view_booking'),
(77,'Can add chat',20,'add_chat'),
(78,'Can change chat',20,'change_chat'),
(79,'Can delete chat',20,'delete_chat'),
(80,'Can view chat',20,'view_chat'),
(81,'Can add chatbot',21,'add_chatbot'),
(82,'Can change chatbot',21,'change_chatbot'),
(83,'Can delete chatbot',21,'delete_chatbot'),
(84,'Can view chatbot',21,'view_chatbot'),
(85,'Can add attendance',22,'add_attendance'),
(86,'Can change attendance',22,'change_attendance'),
(87,'Can delete attendance',22,'delete_attendance'),
(88,'Can view attendance',22,'view_attendance'),
(89,'Can add progress',23,'add_progress'),
(90,'Can change progress',23,'change_progress'),
(91,'Can delete progress',23,'delete_progress'),
(92,'Can view progress',23,'view_progress'),
(93,'Can add questionnaire',24,'add_questionnaire'),
(94,'Can change questionnaire',24,'change_questionnaire'),
(95,'Can delete questionnaire',24,'delete_questionnaire'),
(96,'Can view questionnaire',24,'view_questionnaire'),
(97,'Can add emotion',25,'add_emotion'),
(98,'Can change emotion',25,'change_emotion'),
(99,'Can delete emotion',25,'delete_emotion'),
(100,'Can view emotion',25,'view_emotion');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(22,'myapp','attendance'),
(19,'myapp','booking'),
(20,'myapp','chat'),
(21,'myapp','chatbot'),
(18,'myapp','complaint'),
(7,'myapp','counselling_staff'),
(8,'myapp','course'),
(9,'myapp','department'),
(17,'myapp','diary'),
(25,'myapp','emotion'),
(16,'myapp','feedback'),
(10,'myapp','login'),
(15,'myapp','motivation'),
(23,'myapp','progress'),
(24,'myapp','questionnaire'),
(14,'myapp','schedule'),
(11,'myapp','staff'),
(13,'myapp','student'),
(12,'myapp','tutor'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2025-01-19 05:59:43.636757'),
(2,'auth','0001_initial','2025-01-19 05:59:44.128382'),
(3,'admin','0001_initial','2025-01-19 05:59:44.222154'),
(4,'admin','0002_logentry_remove_auto_add','2025-01-19 05:59:44.234092'),
(5,'admin','0003_logentry_add_action_flag_choices','2025-01-19 05:59:44.237853'),
(6,'contenttypes','0002_remove_content_type_name','2025-01-19 05:59:44.305990'),
(7,'auth','0002_alter_permission_name_max_length','2025-01-19 05:59:44.341937'),
(8,'auth','0003_alter_user_email_max_length','2025-01-19 05:59:44.379349'),
(9,'auth','0004_alter_user_username_opts','2025-01-19 05:59:44.379349'),
(10,'auth','0005_alter_user_last_login_null','2025-01-19 05:59:44.422001'),
(11,'auth','0006_require_contenttypes_0002','2025-01-19 05:59:44.426619'),
(12,'auth','0007_alter_validators_add_error_messages','2025-01-19 05:59:44.429508'),
(13,'auth','0008_alter_user_username_max_length','2025-01-19 05:59:44.464974'),
(14,'auth','0009_alter_user_last_name_max_length','2025-01-19 05:59:44.504903'),
(15,'auth','0010_alter_group_name_max_length','2025-01-19 05:59:44.538347'),
(16,'auth','0011_update_proxy_permissions','2025-01-19 05:59:44.552861'),
(17,'auth','0012_alter_user_first_name_max_length','2025-01-19 05:59:44.584344'),
(18,'myapp','0001_initial','2025-01-19 05:59:45.374536'),
(19,'sessions','0001_initial','2025-01-19 05:59:45.404266'),
(20,'myapp','0002_chat','2025-01-23 08:05:26.088045'),
(21,'myapp','0003_auto_20250129_1200','2025-01-29 06:30:17.589737'),
(22,'myapp','0004_chat_student','2025-01-29 06:30:56.602127'),
(23,'myapp','0005_attendance_progress','2025-01-29 08:46:41.978963'),
(24,'myapp','0006_questionnaire','2025-03-11 05:45:26.735389'),
(25,'myapp','0007_emotion','2025-03-11 10:20:53.377014');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('10jgqe7jis5g0tkfn7ojfqgyhshts3w9','eyJsaWQiOjEsImhlYWRpbmciOiJWSUVXIENPTVBMQUlOVCJ9:1taHDB:EDxqkciPuekxfBRQARzSHAkw-lkWx0i72jllWeenDTs','2025-02-04 16:34:45.628417'),
('1nesuof6bq5wozjuegc5oy1fgw31o1ho','eyJsaWQiOjQsImhlYWRpbmciOiJQUkVWSU9VUyBCT09LSU5HUyJ9:1td7PV:WbX9ndBCCJ_jFvjqHj0qNmMropHMMgcUN8bwiVuIK8A','2025-02-12 12:43:13.190783'),
('34necm7gf4anxipzm8mh8ej4bdqtmool','eyJsaWQiOjQsImhlYWRpbmciOiJVUERBVEUgQk9PS0lORyJ9:1u0Gov:JflIFHb-SBrB3ZhGV0UXMAk886RLrdNU0O_zW4rG8Vs','2025-04-17 09:25:09.089511'),
('795yhu3gslrct3r9m8vw8942bh4vtc1z','eyJsaWQiOjQsImhlYWRpbmciOiJTRU5EIEZFRURCQUNLIn0:1u0H3b:RVd_t9aJBx08Uj_BSwP3xQJp_A0-tPh6EG3HH_PWB4I','2025-04-17 09:40:19.089487'),
('8yk4x0e1yur9983xfod0gzq3tzfnxj3w','.eJyrVsrJTFGyMtZRykhNTMnMS1eyUgrzdA1X8PUP8QxzDPH091PSUSoBqTGEqAEqCA4JdXH1C1Hw9AtxDXJ0BilSCPcM8VBw9nAMcfIPAeooBelQMlSqBQBPERsL:1tdPia:0zP0ra9Hmqr8biqNBl6Oe8owYZPathaYexGI5yROcfA','2025-02-13 08:16:08.405156'),
('9eua0id0rzai40bqqay083mdqyf42spu','eyJsaWQiOjMsInRpZCI6MSwiaGVhZGluZyI6IlZJRVcgUFJPRklMRSJ9:1u0H76:ilqSUO8ge81fvpjRbCaZqHPeyEfygXPWdD-ZeGjg7R4','2025-04-17 09:43:56.553403'),
('avd2zx22gw9sxp00d71bv1un876m9mtv','eyJsaWQiOjMsImhlYWRpbmciOiJDSEFUIiwidGlkIjoxLCJ1aWQiOiIxIn0:1tsef4:0wGeGjVUiCsEvZZKzojjK8jRaB9KQkqG6mi9UobRrJA','2025-03-27 09:15:30.071298'),
('iivy3vfn0e44bj4dn5t1tbuqa886rczs','eyJsaWQiOjQsInRpZCI6MSwiaGVhZGluZyI6IlZJRVcgU0NIRURVTEUifQ:1tdLh1:PtbUyAcWiGGD5spcBPU-vgA4kaZHWIRk9CFbu5Hos4Q','2025-02-13 03:58:15.332589'),
('j4wv5d7oqcczqghkieza29ry5ypq4jr5','eyJsaWQiOjQsInRpZCI6MSwiaGVhZGluZyI6IkFERCBNT1RJVkFUSU9OIn0:1td9oP:e4jl5dNf3cJB0GHSUrty18wjKHMLgAMwVym740fRWpY','2025-02-12 15:17:05.211362'),
('vf49ezsotwn1b2u2vfrpxnevi6k99glu','eyJsaWQiOjMsImhlYWQiOiJDSEFUIiwidWlkIjoiMSIsInRpZCI6MX0:1tat8Y:lLg-caVchEx6K7RR7aQwriGCPpnoTwMU1LSuKdBxYbI','2025-02-06 09:04:30.982036'),
('zec6gt6t94jgg8lwu69d5vgu29vy7l0j','eyJsaWQiOjQsImhlYWRpbmciOiJWSUVXIFNDSEVEVUxFIiwidGlkIjoxLCJ1aWQiOiIxIn0:1u0H8H:bpwXlCoGqPRkx2G5ofzsIlWpvC_GbXGmmqIxMR7DSmc','2025-04-17 09:45:09.435475');

/*Table structure for table `myapp_attendance` */

DROP TABLE IF EXISTS `myapp_attendance`;

CREATE TABLE `myapp_attendance` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `BOOKING_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_attendance_BOOKING_id_073e5d17_fk_myapp_booking_id` (`BOOKING_id`),
  CONSTRAINT `myapp_attendance_BOOKING_id_073e5d17_fk_myapp_booking_id` FOREIGN KEY (`BOOKING_id`) REFERENCES `myapp_booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_attendance` */

insert  into `myapp_attendance`(`id`,`status`,`BOOKING_id`) values 
(1,'Absent',1),
(2,'Present',2);

/*Table structure for table `myapp_booking` */

DROP TABLE IF EXISTS `myapp_booking`;

CREATE TABLE `myapp_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `booked_on` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `meet_link` varchar(100) NOT NULL,
  `STUDENT_id` bigint(20) NOT NULL,
  `TEAM_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_booking_STUDENT_id_9298f9e5_fk_myapp_student_id` (`STUDENT_id`),
  KEY `myapp_booking_TEAM_id_ca6918c9_fk_myapp_counselling_staff_id` (`TEAM_id`),
  CONSTRAINT `myapp_booking_STUDENT_id_9298f9e5_fk_myapp_student_id` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student` (`id`),
  CONSTRAINT `myapp_booking_TEAM_id_ca6918c9_fk_myapp_counselling_staff_id` FOREIGN KEY (`TEAM_id`) REFERENCES `myapp_counselling_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_booking` */

insert  into `myapp_booking`(`id`,`booked_on`,`date`,`time`,`status`,`meet_link`,`STUDENT_id`,`TEAM_id`) values 
(1,'2025-01-23','2025-01-23','14:15','Completed','https://meet.google.com/sem-siyz-mti',1,1),
(2,'2025-01-29','2025-01-30','10:00','Completed','http://www.google.com',1,1),
(3,'2025-01-30','pending','pending','pending','Not available',1,1),
(4,'2025-01-30','pending','pending','pending','Not available',1,1),
(5,'2025-01-30','pending','pending','pending','Not available',1,1),
(6,'2025-03-13','2025-03-14','15:19','Scheduled','https://meet.google.com/sem-siyz-mti',1,1),
(7,'2025-04-03','2025-04-04','10:00','Scheduled','https://meet.google.com/uzb-ewus-mbs',1,1);

/*Table structure for table `myapp_chat` */

DROP TABLE IF EXISTS `myapp_chat`;

CREATE TABLE `myapp_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `chat` varchar(300) NOT NULL,
  `type` varchar(300) NOT NULL,
  `TUTOR_id` bigint(20) NOT NULL,
  `STUDENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_chat_TUTOR_id_5860ab60_fk_myapp_tutor_id` (`TUTOR_id`),
  KEY `myapp_chat_STUDENT_id_559e9122_fk_myapp_student_id` (`STUDENT_id`),
  CONSTRAINT `myapp_chat_STUDENT_id_559e9122_fk_myapp_student_id` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student` (`id`),
  CONSTRAINT `myapp_chat_TUTOR_id_5860ab60_fk_myapp_tutor_id` FOREIGN KEY (`TUTOR_id`) REFERENCES `myapp_tutor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_chat` */

insert  into `myapp_chat`(`id`,`date`,`chat`,`type`,`TUTOR_id`,`STUDENT_id`) values 
(1,'2025-01-23','hi','student',1,1),
(2,'2025-01-23','','tutor',1,1),
(3,'2025-01-23','hellooo','tutor',1,1),
(4,'2025-01-23','hiiiii','tutor',1,1),
(5,'2025-01-23','hyy','student',1,1),
(6,'2025-01-23','hi','tutor',1,1),
(7,'2025-01-23','hiii','student',1,1),
(8,'2025-01-23','hiii','student',1,1),
(9,'2025-01-30','hi','tutor',1,1),
(10,'2025-01-30','hello','student',1,1),
(11,'2025-01-30','hi','tutor',1,1),
(12,'2025-01-30','hey there','student',1,1),
(13,'2025-03-13','where are you','tutor',1,1),
(14,'2025-04-03','hi','student',1,1),
(15,'2025-04-03','hi','student',1,1),
(16,'2025-04-03','hi','student',1,1),
(17,'2025-04-03','hello','student',1,1),
(18,'2025-04-03','hloo','tutor',1,1);

/*Table structure for table `myapp_chatbot` */

DROP TABLE IF EXISTS `myapp_chatbot`;

CREATE TABLE `myapp_chatbot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `chat` varchar(300) NOT NULL,
  `type` varchar(300) NOT NULL,
  `STUDENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_chatbot_STUDENT_id_3e3e1b4b_fk_myapp_student_id` (`STUDENT_id`),
  CONSTRAINT `myapp_chatbot_STUDENT_id_3e3e1b4b_fk_myapp_student_id` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_chatbot` */

insert  into `myapp_chatbot`(`id`,`date`,`chat`,`type`,`STUDENT_id`) values 
(1,'2025-01-29','hi','student',1),
(2,'2025-01-29','Hi :)','chatbot',1),
(3,'2025-01-29','','student',1),
(4,'2025-01-29','ok','chatbot',1),
(5,'2025-01-29','details about anxiety','student',1),
(6,'2025-01-29','Anxiety is a feeling of unease, such as worry or fear, that can be mild or severe. It\'s a natural response to stress, but when it becomes overwhelming and persistent, it might be a sign of an anxiety disorder. Symptoms can include constant worry, restlessness, difficulty concentrating, and physical ','chatbot',1),
(7,'2025-01-29','lack of sleep','student',1),
(8,'2025-01-29','Improving sleep when you\'re feeling anxious can be challenging, but there are a few strategies that might help: try establishing a bedtime routine, limit caffeine intake, practice relaxation techniques like deep breathing, and avoid screen time before bed. Creating a calming environment, like dimmin','chatbot',1),
(9,'2025-01-29','i feel stressed','student',1),
(10,'2025-01-29','Okay, Good bye!!','chatbot',1),
(11,'2025-01-29','what to do when feeling stressed ','student',1),
(12,'2025-01-29','Managing stress can be done through several techniques, such as deep breathing exercises, mindfulness, physical exercise, and setting aside time to relax. It\'s also helpful to organize your tasks and take breaks when needed. Finding healthy ways to cope with stress, like talking to someone you trust','chatbot',1),
(13,'2025-01-29','feels stress','student',1),
(14,'2025-01-29','Managing stress can be done through several techniques, such as deep breathing exercises, mindfulness, physical exercise, and setting aside time to relax. It\'s also helpful to organize your tasks and take breaks when needed. Finding healthy ways to cope with stress, like talking to someone you trust','chatbot',1),
(15,'2025-01-29','feel stres','student',1),
(16,'2025-01-29','Hello','chatbot',1),
(17,'2025-01-30','how can I improve my sleep','student',1),
(18,'2025-01-30','Improving sleep when you\'re feeling anxious can be challenging, but there are a few strategies that might help: try establishing a bedtime routine, limit caffeine intake, practice relaxation techniques like deep breathing, and avoid screen time before bed. Creating a calming environment, like dimmin','chatbot',1),
(19,'2025-01-30','how can I imrove sleep','student',1),
(20,'2025-01-30','Improving sleep when you\'re feeling anxious can be challenging, but there are a few strategies that might help: try establishing a bedtime routine, limit caffeine intake, practice relaxation techniques like deep breathing, and avoid screen time before bed. Creating a calming environment, like dimmin','chatbot',1),
(21,'2025-01-30','','student',1),
(22,'2025-01-30','Hi :)','chatbot',1),
(23,'2025-03-13','hi','student',1),
(24,'2025-03-13','Hi there','chatbot',1),
(25,'2025-03-13','hi','student',1),
(26,'2025-03-13','','student',1),
(27,'2025-03-13','Hello','chatbot',1),
(28,'2025-03-13','Hi there','chatbot',1),
(29,'2025-03-13','hi','student',1),
(30,'2025-03-13','Hi there','chatbot',1),
(31,'2025-03-13','','student',1),
(32,'2025-03-13','Hi :)','chatbot',1),
(33,'2025-03-13','can you help me?','student',1),
(34,'2025-03-13','can you help me?','student',1),
(35,'2025-03-13','My pleasure','chatbot',1),
(36,'2025-03-13','Any time!','chatbot',1),
(37,'2025-03-13','im not feeling well','student',1),
(38,'2025-03-13','Improving sleep when you\'re feeling anxious can be challenging, but there are a few strategies that might help: try establishing a bedtime routine, limit caffeine intake, practice relaxation techniques like deep breathing, and avoid screen time before bed. Creating a calming environment, like dimmin','chatbot',1),
(39,'2025-04-03','im not feeling well','student',1),
(40,'2025-04-03','Improving sleep when you\'re feeling anxious can be challenging, but there are a few strategies that might help: try establishing a bedtime routine, limit caffeine intake, practice relaxation techniques like deep breathing, and avoid screen time before bed. Creating a calming environment, like dimmin','chatbot',1);

/*Table structure for table `myapp_complaint` */

DROP TABLE IF EXISTS `myapp_complaint`;

CREATE TABLE `myapp_complaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `complaint` varchar(100) NOT NULL,
  `reply` varchar(100) NOT NULL,
  `STUDENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_complaint_STUDENT_id_06b7b3d6_fk_myapp_student_id` (`STUDENT_id`),
  CONSTRAINT `myapp_complaint_STUDENT_id_06b7b3d6_fk_myapp_student_id` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_complaint` */

insert  into `myapp_complaint`(`id`,`date`,`complaint`,`reply`,`STUDENT_id`) values 
(1,'2025-01-23','server crashes frequently','we will fix it soon',1);

/*Table structure for table `myapp_counselling_staff` */

DROP TABLE IF EXISTS `myapp_counselling_staff`;

CREATE TABLE `myapp_counselling_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_counselling_staff_LOGIN_id_dc41126e_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_counselling_staff_LOGIN_id_dc41126e_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_counselling_staff` */

insert  into `myapp_counselling_staff`(`id`,`name`,`email`,`phone_number`,`LOGIN_id`) values 
(1,'Rajesh','rajesh@gmail.com','9988776655',4),
(3,'Priya Santhosh','priya@gmail.com','8710293644',13);

/*Table structure for table `myapp_course` */

DROP TABLE IF EXISTS `myapp_course`;

CREATE TABLE `myapp_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crs_name` varchar(100) NOT NULL,
  `DEPARTMENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_course_DEPARTMENT_id_9a598a92_fk_myapp_department_id` (`DEPARTMENT_id`),
  CONSTRAINT `myapp_course_DEPARTMENT_id_9a598a92_fk_myapp_department_id` FOREIGN KEY (`DEPARTMENT_id`) REFERENCES `myapp_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_course` */

insert  into `myapp_course`(`id`,`crs_name`,`DEPARTMENT_id`) values 
(1,'compiler',1),
(2,'chemistry',1),
(3,'Design',6),
(4,'computer graphics',1);

/*Table structure for table `myapp_department` */

DROP TABLE IF EXISTS `myapp_department`;

CREATE TABLE `myapp_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_department` */

insert  into `myapp_department`(`id`,`dep_name`) values 
(1,'CS'),
(2,'AI'),
(5,'MECH'),
(6,'CSD'),
(7,'aid'),
(8,'ece');

/*Table structure for table `myapp_diary` */

DROP TABLE IF EXISTS `myapp_diary`;

CREATE TABLE `myapp_diary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `time` varchar(100) NOT NULL,
  `content` varchar(500) NOT NULL,
  `emotion` varchar(100) NOT NULL,
  `STUDENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_diary_STUDENT_id_a2a040e7_fk_myapp_student_id` (`STUDENT_id`),
  CONSTRAINT `myapp_diary_STUDENT_id_a2a040e7_fk_myapp_student_id` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_diary` */

insert  into `myapp_diary`(`id`,`date`,`time`,`content`,`emotion`,`STUDENT_id`) values 
(10,'2025-01-29','10:46','it was a good day with friends ','joy',1),
(15,'2025-01-29','10:55','we lost the match','sadness',1),
(16,'2025-01-29','11:01','dandeeps father died yesterday','Fear',1),
(18,'2025-01-29','17:43','Sandeep died today','Fear',1),
(21,'2025-01-29','17:45','oh my god he passed all exams','Surprise',1),
(22,'2025-01-29','17:54','shop is open','Fear',1),
(23,'2025-01-29','17:55','i love in kenya','joy',1),
(24,'2025-01-29','17:55','god is great','joy',1),
(26,'2025-01-30','10:07','I feel restless, a mix of anxious and hopeful. There’s joy, but also frustration and emptiness. I feel loved yet vulnerable, sometimes insecure. My emotions shift, but I accept and embrace them.\n\n','sadness',2),
(27,'2025-01-30','13:41','oh my god today was happy','joy',1),
(28,'2025-04-03','13:09','i am sad','sadness',1),
(29,'2025-04-03','13:09','i am sad','sadness',1),
(30,'2025-04-03','13:10','my friend died yesterday ','joy',1),
(31,'2025-04-03','13:10','my friend died yesterday ','joy',1),
(32,'2025-04-03','13:11','i got an award','Neutral',1),
(33,'2025-04-03','13:11','accident','Neutral',1),
(36,'2025-04-03','13:12','i failed exam','Neutral',1),
(37,'2025-04-03','13:12','my cat died','Fear',1),
(38,'2025-04-03','14:18','my cat died yesterday ','sadness',1),
(39,'2025-04-03','14:19','my friend died yesterday','sadness',1),
(40,'2025-04-03','14:19','we lost the match','sadness',1),
(41,'2025-04-03','14:19','i cleared my exams','joy',1),
(42,'2025-04-03','14:19','my friend died yesterday ','sadness',1),
(43,'2025-04-03','14:20','iam about to die','sadness',1),
(44,'2025-04-03','14:21','i may fail in my last exams','sadness',1),
(45,'2025-04-03','14:22','he ruined my exam. i would have killed him if he was here','anger',1),
(46,'2025-04-03','14:28','my friend died yesterday ','sadness',1),
(47,'2025-04-03','14:28','i failed in exam','sadness',1);

/*Table structure for table `myapp_emotion` */

DROP TABLE IF EXISTS `myapp_emotion`;

CREATE TABLE `myapp_emotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `time` varchar(300) NOT NULL,
  `emotion` varchar(300) NOT NULL,
  `STUDENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_emotion_STUDENT_id_faeae5c2_fk_myapp_student_id` (`STUDENT_id`),
  CONSTRAINT `myapp_emotion_STUDENT_id_faeae5c2_fk_myapp_student_id` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `myapp_emotion` */

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `feedback` varchar(100) NOT NULL,
  `STAFF_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_STAFF_id_f161e7f4_fk_myapp_staff_id` (`STAFF_id`),
  CONSTRAINT `myapp_feedback_STAFF_id_f161e7f4_fk_myapp_staff_id` FOREIGN KEY (`STAFF_id`) REFERENCES `myapp_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`date`,`feedback`,`STAFF_id`) values 
(1,'2025-04-03','good app',1);

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`username`,`password`,`usertype`) values 
(1,'admin@gmail.com','admin','admin'),
(2,'vaibo7@gmail.com','2632','student'),
(3,'suvu34@gmail.com','4533','staff'),
(4,'rajesh@gmail.com','9195','team'),
(5,'goku@gmail.com','9494','student'),
(6,'nihara@gmail.com','4703','staff'),
(7,'Marco100@gmail.com','6054','staff'),
(8,'rahul@gmail.com','4477','student'),
(9,'sandeep@gmail.com','3245','student'),
(10,'surya@gmail.com','9872','student'),
(11,'malu@gmail.com','2836','student'),
(12,'sandesh@gmail.com','6622','student'),
(13,'priya@gmail.com','9220','team');

/*Table structure for table `myapp_motivation` */

DROP TABLE IF EXISTS `myapp_motivation`;

CREATE TABLE `myapp_motivation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(100) NOT NULL,
  `STAFF_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_motivation_STAFF_id_2b8481b1_fk_myapp_staff_id` (`STAFF_id`),
  CONSTRAINT `myapp_motivation_STAFF_id_2b8481b1_fk_myapp_staff_id` FOREIGN KEY (`STAFF_id`) REFERENCES `myapp_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_motivation` */

insert  into `myapp_motivation`(`id`,`date`,`title`,`content`,`STAFF_id`) values 
(2,'2025-01-23','M2','/static/contents/20250123_140921.mp4',1);

/*Table structure for table `myapp_progress` */

DROP TABLE IF EXISTS `myapp_progress`;

CREATE TABLE `myapp_progress` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `progress` varchar(100) NOT NULL,
  `BOOKING_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_progress_BOOKING_id_5b5a1beb_fk_myapp_booking_id` (`BOOKING_id`),
  CONSTRAINT `myapp_progress_BOOKING_id_5b5a1beb_fk_myapp_booking_id` FOREIGN KEY (`BOOKING_id`) REFERENCES `myapp_booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_progress` */

insert  into `myapp_progress`(`id`,`date`,`progress`,`BOOKING_id`) values 
(1,'','He was found really stressed',1),
(2,'','he was found better',2);

/*Table structure for table `myapp_questionnaire` */

DROP TABLE IF EXISTS `myapp_questionnaire`;

CREATE TABLE `myapp_questionnaire` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `score` varchar(300) NOT NULL,
  `condition` varchar(300) NOT NULL,
  `STUDENT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_questionnaire_STUDENT_id_bc1b6e12_fk_myapp_student_id` (`STUDENT_id`),
  CONSTRAINT `myapp_questionnaire_STUDENT_id_bc1b6e12_fk_myapp_student_id` FOREIGN KEY (`STUDENT_id`) REFERENCES `myapp_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_questionnaire` */

insert  into `myapp_questionnaire`(`id`,`date`,`score`,`condition`,`STUDENT_id`) values 
(1,'2025-03-11','11','Moderate depression',1),
(2,'2025-03-12','13','Moderate depression',1),
(4,'2025-04-03','0','Healthy',1),
(5,'2025-04-03','0','Healthy',4);

/*Table structure for table `myapp_schedule` */

DROP TABLE IF EXISTS `myapp_schedule`;

CREATE TABLE `myapp_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `from_time` varchar(100) NOT NULL,
  `to_time` varchar(100) NOT NULL,
  `TEAM_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_schedule_TEAM_id_c570cc38_fk_myapp_counselling_staff_id` (`TEAM_id`),
  CONSTRAINT `myapp_schedule_TEAM_id_c570cc38_fk_myapp_counselling_staff_id` FOREIGN KEY (`TEAM_id`) REFERENCES `myapp_counselling_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_schedule` */

insert  into `myapp_schedule`(`id`,`date`,`from_time`,`to_time`,`TEAM_id`) values 
(1,'2025-01-24','15:00','16:00',1),
(2,'2025-04-01','9:00','10:00',3);

/*Table structure for table `myapp_staff` */

DROP TABLE IF EXISTS `myapp_staff`;

CREATE TABLE `myapp_staff` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `DEPARTMENT_id` bigint(20) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_staff_DEPARTMENT_id_1ae2ea1b_fk_myapp_department_id` (`DEPARTMENT_id`),
  KEY `myapp_staff_LOGIN_id_73bde0f5_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_staff_DEPARTMENT_id_1ae2ea1b_fk_myapp_department_id` FOREIGN KEY (`DEPARTMENT_id`) REFERENCES `myapp_department` (`id`),
  CONSTRAINT `myapp_staff_LOGIN_id_73bde0f5_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_staff` */

insert  into `myapp_staff`(`id`,`name`,`email`,`phone_number`,`qualification`,`experience`,`DEPARTMENT_id`,`LOGIN_id`) values 
(1,'Suvarna','suvu34@gmail.com','9387575767','M.tech','Mid-Level',1,3),
(2,'Niharika','nihara@gmail.com','8909786545','M Tech','2',1,6),
(3,'Marco','Marco100@gmail.com','7678879076','Phd','4',2,7);

/*Table structure for table `myapp_student` */

DROP TABLE IF EXISTS `myapp_student`;

CREATE TABLE `myapp_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `house_name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `sem` varchar(100) NOT NULL,
  `COURSE_id` bigint(20) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_student_COURSE_id_5fe98c90_fk_myapp_course_id` (`COURSE_id`),
  KEY `myapp_student_LOGIN_id_d3327a2f_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_student_COURSE_id_5fe98c90_fk_myapp_course_id` FOREIGN KEY (`COURSE_id`) REFERENCES `myapp_course` (`id`),
  CONSTRAINT `myapp_student_LOGIN_id_d3327a2f_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_student` */

insert  into `myapp_student`(`id`,`name`,`email`,`phone_number`,`house_name`,`place`,`post`,`pin`,`sem`,`COURSE_id`,`LOGIN_id`) values 
(1,'vaibhav','vaibo7@gmail.com','9387575757','presuhome','kannur','thaluk','670002','1',1,2),
(2,'Gokul','goku@gmail.com','9786452341','Godvilla ','Goa','Goa','673546','4',3,5),
(3,'Rahul','rahul@gmail.com','9786452341','Godvilla ','kannur','thaluk','673546','1',1,8),
(4,'Sandeep','sandeep@gmail.com','9087612346','Peace villa','Kannur','Chala east','678678','1',1,9),
(5,'Surya','surya@gmail.com','9912034567','Suryas','Kannur','Thottada','673489','1',1,10),
(6,'Malavika','malu@gmail.com','6710294633','Maloos','Thalassery','Paral','670671','4',3,11),
(7,'Sandesh','sandesh@gmail.com','6102239847','White house','Pinarayi','Pinarayi east','672435','4',3,12);

/*Table structure for table `myapp_tutor` */

DROP TABLE IF EXISTS `myapp_tutor`;

CREATE TABLE `myapp_tutor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sem` varchar(100) NOT NULL,
  `COURSE_id` bigint(20) NOT NULL,
  `STAFF_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_tutor_COURSE_id_ce5e4587_fk_myapp_course_id` (`COURSE_id`),
  KEY `myapp_tutor_STAFF_id_59aceeae_fk_myapp_staff_id` (`STAFF_id`),
  CONSTRAINT `myapp_tutor_COURSE_id_ce5e4587_fk_myapp_course_id` FOREIGN KEY (`COURSE_id`) REFERENCES `myapp_course` (`id`),
  CONSTRAINT `myapp_tutor_STAFF_id_59aceeae_fk_myapp_staff_id` FOREIGN KEY (`STAFF_id`) REFERENCES `myapp_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_tutor` */

insert  into `myapp_tutor`(`id`,`sem`,`COURSE_id`,`STAFF_id`) values 
(1,'1',1,1),
(2,'4',3,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
