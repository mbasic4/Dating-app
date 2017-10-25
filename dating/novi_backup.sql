CREATE DATABASE  IF NOT EXISTS `dating_site` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `dating_site`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dating_site
-- ------------------------------------------------------
-- Server version	5.7.18

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `abbrev_id` varchar(2) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  PRIMARY KEY (`abbrev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AD','Andorra'),('AE','United Arab Emirates'),('AF','Afghanistan'),('AG','Antigua and Barbuda'),('AI','Anguilla'),('AL','Albania'),('AM','Armenia'),('AO','Angola'),('AQ','Antarctica'),('AR','Argentina'),('AS','American Samoa'),('AT','Austria'),('AU','Australia'),('AW','Aruba'),('AX','Åland Islands'),('AZ','Azerbaijan'),('BA','Bosnia and Herzegovina'),('BB','Barbados'),('BD','Bangladesh'),('BE','Belgium'),('BF','Burkina Faso'),('BG','Bulgaria'),('BH','Bahrain'),('BI','Burundi'),('BJ','Benin'),('BL','Saint Barthélemy'),('BM','Bermuda'),('BN','Brunei Darussalam'),('BO','Bolivia, Plurinational State of'),('BQ','Bonaire, Sint Eustatius and Saba'),('BR','Brazil'),('BS','Bahamas'),('BT','Bhutan'),('BV','Bouvet Island'),('BW','Botswana'),('BY','Belarus'),('BZ','Belize'),('CA','Canada'),('CC','Cocos (Keeling) Islands'),('CD','Congo, the Democratic Republic of the'),('CF','Central African Republic'),('CG','Congo'),('CH','Switzerland'),('CI','Côte d\'Ivoire'),('CK','Cook Islands'),('CL','Chile'),('CM','Cameroon'),('CN','China'),('CO','Colombia'),('CR','Costa Rica'),('CU','Cuba'),('CV','Cape Verde'),('CW','Curaçao'),('CX','Christmas Island'),('CY','Cyprus'),('CZ','Czech Republic'),('DE','Germany'),('DJ','Djibouti'),('DK','Denmark'),('DM','Dominica'),('DO','Dominican Republic'),('DZ','Algeria'),('EC','Ecuador'),('EE','Estonia'),('EG','Egypt'),('EH','Western Sahara'),('ER','Eritrea'),('ES','Spain'),('ET','Ethiopia'),('FI','Finland'),('FJ','Fiji'),('FK','Falkland Islands (Malvinas)'),('FM','Micronesia, Federated States of'),('FO','Faroe Islands'),('FR','France'),('GA','Gabon'),('GB','United Kingdom'),('GD','Grenada'),('GE','Georgia'),('GF','French Guiana'),('GG','Guernsey'),('GH','Ghana'),('GI','Gibraltar'),('GL','Greenland'),('GM','Gambia'),('GN','Guinea'),('GP','Guadeloupe'),('GQ','Equatorial Guinea'),('GR','Greece'),('GS','South Georgia and the South Sandwich Islands'),('GT','Guatemala'),('GU','Guam'),('GW','Guinea-Bissau'),('GY','Guyana'),('HK','Hong Kong'),('HM','Heard Island and McDonald Islands'),('HN','Honduras'),('HR','Croatia'),('HT','Haiti'),('HU','Hungary'),('ID','Indonesia'),('IE','Ireland'),('IL','Israel'),('IM','Isle of Man'),('IN','India'),('IO','British Indian Ocean Territory'),('IQ','Iraq'),('IR','Iran, Islamic Republic of'),('IS','Iceland'),('IT','Italy'),('JE','Jersey'),('JM','Jamaica'),('JO','Jordan'),('JP','Japan'),('KE','Kenya'),('KG','Kyrgyzstan'),('KH','Cambodia'),('KI','Kiribati'),('KM','Comoros'),('KN','Saint Kitts and Nevis'),('KP','Korea, Democratic People\'s Republic of'),('KR','Korea, Republic of'),('KW','Kuwait'),('KY','Cayman Islands'),('KZ','Kazakhstan'),('LA','Lao People\'s Democratic Republic'),('LB','Lebanon'),('LC','Saint Lucia'),('LI','Liechtenstein'),('LK','Sri Lanka'),('LR','Liberia'),('LS','Lesotho'),('LT','Lithuania'),('LU','Luxembourg'),('LV','Latvia'),('LY','Libya'),('MA','Morocco'),('MC','Monaco'),('MD','Moldova, Republic of'),('ME','Montenegro'),('MF','Saint Martin (French part)'),('MG','Madagascar'),('MH','Marshall Islands'),('MK','Macedonia, the former Yugoslav Republic of'),('ML','Mali'),('MM','Myanmar'),('MN','Mongolia'),('MO','Macao'),('MP','Northern Mariana Islands'),('MQ','Martinique'),('MR','Mauritania'),('MS','Montserrat'),('MT','Malta'),('MU','Mauritius'),('MV','Maldives'),('MW','Malawi'),('MX','Mexico'),('MY','Malaysia'),('MZ','Mozambique'),('NA','Namibia'),('NC','New Caledonia'),('NE','Niger'),('NF','Norfolk Island'),('NG','Nigeria'),('NI','Nicaragua'),('NL','Netherlands'),('NO','Norway'),('NP','Nepal'),('NR','Nauru'),('NU','Niue'),('NZ','New Zealand'),('OM','Oman'),('PA','Panama'),('PE','Peru'),('PF','French Polynesia'),('PG','Papua New Guinea'),('PH','Philippines'),('PK','Pakistan'),('PL','Poland'),('PM','Saint Pierre and Miquelon'),('PN','Pitcairn'),('PR','Puerto Rico'),('PS','Palestinian Territory, Occupied'),('PT','Portugal'),('PW','Palau'),('PY','Paraguay'),('QA','Qatar'),('RE','Réunion'),('RO','Romania'),('RS','Serbia'),('RU','Russian Federation'),('RW','Rwanda'),('SA','Saudi Arabia'),('SB','Solomon Islands'),('SC','Seychelles'),('SD','Sudan'),('SE','Sweden'),('SG','Singapore'),('SH','Saint Helena, Ascension and Tristan da Cunha'),('SI','Slovenia'),('SJ','Svalbard and Jan Mayen'),('SK','Slovakia'),('SL','Sierra Leone'),('SM','San Marino'),('SN','Senegal'),('SO','Somalia'),('SR','Suriname'),('SS','South Sudan'),('ST','Sao Tome and Principe'),('SV','El Salvador'),('SX','Sint Maarten (Dutch part)'),('SY','Syrian Arab Republic'),('SZ','Swaziland'),('TC','Turks and Caicos Islands'),('TD','Chad'),('TF','French Southern Territories'),('TG','Togo'),('TH','Thailand'),('TJ','Tajikistan'),('TK','Tokelau'),('TL','Timor-Leste'),('TM','Turkmenistan'),('TN','Tunisia'),('TO','Tonga'),('TR','Turkey'),('TT','Trinidad and Tobago'),('TV','Tuvalu'),('TW','Taiwan, Province of China'),('TZ','Tanzania, United Republic of'),('UA','Ukraine'),('UG','Uganda'),('UM','United States Minor Outlying Islands'),('US','United States'),('UY','Uruguay'),('UZ','Uzbekistan'),('VA','Holy See (Vatican City State)'),('VC','Saint Vincent and the Grenadines'),('VE','Venezuela, Bolivarian Republic of'),('VG','Virgin Islands, British'),('VI','Virgin Islands, U.S.'),('VN','Vietnam'),('VU','Vanuatu'),('WF','Wallis and Futuna'),('WS','Samoa'),('YE','Yemen'),('YT','Mayotte'),('ZA','South Africa'),('ZM','Zambia'),('ZW','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `image_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `idUser_UNIQUE` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ivo','Ivic','NZ','M',30,'ivoivic@outlook.com','magicIv','$2a$10$D3mkVbdXO4uZi1D7CXO.CeqP9LHnfJTDXN8ugKK0dE3oE9EBYev1u','I like westerns and football','../profile_photos/HJVlSOH3Z'),(2,'Vanessa','Torres','CR','F',27,'vanessa@yahoo.com','vanessa','$2a$10$WoaYjz099.9gkTw9gQMNju3P.WVnJZzRodfGkxIHY9JP8QmU06pN6',NULL,NULL),(3,'Apinya','Kaya','TH','F',31,'kaya@gmail.com','akaya','$2a$10$tJWM/5cqBLysaGVgWuyMReiJ2EKiRY.7DyrBseavzhZXI4GXLlzbO','I come from Thailand. My hobbies include kitesurfing, yoga and photography. Looking for someone who isn\'t afraid of heights B)',NULL),(6,'Maja','Batur','HR','F',27,'mbatur@yahoo.com','maya_b','$2a$10$eTLfiRyL0e3ahKwE09RvOuL2QMI5PUQ/umH6UfXExVRnknimPJGLe','There is not much to talk about','../profile_photos/HyUaTOSnZ'),(11,'Marko','Novosel','HR','M',27,'marko@hotmail.com','marko','$2a$10$CKGB6k8KfThcHZZImlJ94uXRahqDE/lHrAR9H/pYrRESnLYqOBp3e','I like old movies, drinking beer and watching MMA fights','../profile_photos/HkLf-WHpW'),(12,'Hrvoje','Horvat','HR','M',34,'hrvoje@yahoo.com','hrvoje','$2a$10$1UAKz4mL4/iORNu.Y7cageTNsAfwsIsbkXnR4xIPaBlWitb4uU5/O','I am Hrvoje, and I like sunsets and drinking cocktails in the summer',NULL),(13,'Sasa','Matic','RS','M',46,'sasa@yahoo.com','sasamatic','$2a$10$Xs5N0MXpdtA6GhqBVWFgmuz6msl8s8SkKtyJXC.2n/HFKxLe2PcYa','I like singing and attending concerts',NULL),(14,'Ilma','Hodžić','BA','F',34,'ilma@yahoo.com','ilma','$2a$10$s6CSbhKYSBwfLfzcXcpAkelWo4Y5nIJu4tlL098ZXAysOCGhvH13C','I love reading comic books, and watching films noir','../profile_photos/SJMI4DcpW'),(15,'Julija','Novska','RU','F',29,'julija@yahoo.com','julija','$2a$10$YkyFS99Ai/4BoIBECPXrfOd6rced4hfYCqfP5zSm5GbtGQwySpY/a',NULL,'../profile_photos/ByTZEPqTZ'),(16,'John','Walker','GB','M',40,'john@outlook.com','johnw','$2a$10$qD3OXXB3FXM/Fp4xE08mXe3b8.A7sXyNX2GdQ9rfI8i2b30rVozdW','Come on baby light my fire is my favorite Doors song. Let\'s see if we\'re a good match :)','../profile_photos/SkB0bw5TZ'),(18,'Tomislav','Babić','HR','M',24,'tom@hotmail.com','romtom','$2a$10$zJaPK0GW8zMUgaEvV9fxAuKi9WXDKy/pNxET/freqGrU8gB1pu2ZW','I\'m here just for fun',''),(19,'Martina','Bačić','HR','F',29,'martina@hotmail.com','martina','$2a$10$7Q86.ef5GGoqLG1nI1Nwie9kgrgr32SRSDv3dk0Oy8lC1vEgA9Gmi','I like sleeping and reading books',''),(20,'John','Smith','GB','M',36,'john@yahoo.com','johnsmith','$2a$10$KzOnVYs08vOHI2GZI8FSWudGFPm2Si82nFzOs8Uulm.NJTmMTbhKG','I like adventures, and consider myself an explorer. Looking for someone who can catch up with me','../profile_photos/SyeNh8bnZ'),(21,'Tomislav ','Žagar','ZM','M',24,'raguzhino@hotmail.com','kittehpwner','$2a$10$TA2PAa9JC4RhbAPON8NgBeJ2mIrl7I6rFR5pLiMifQhXFOdwg5Cxy','Bog :)','../profile_photos/SkKB4UU2b'),(22,'Maja','Ercegović','HR','F',27,'maja@yahoo.com','maya','$2a$10$j2S1qLkCMqFOnCGRFDMGM.PUzFAukV3GfxzsyJaaJ8aBiiqOZp5m2','I love climbing, spending time in nature, and going to the movies','../profile_photos/BJFfSDq6b');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dating_site'
--

--
-- Dumping routines for database 'dating_site'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-22 21:14:59
