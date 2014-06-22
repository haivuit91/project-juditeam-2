CREATE DATABASE  IF NOT EXISTS `db_math` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `db_math`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: db_math
-- ------------------------------------------------------
-- Server version	5.5.38

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
-- Table structure for table `tb_res_attach`
--

DROP TABLE IF EXISTS `tb_res_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_res_attach` (
  `resAttachID` int(11) NOT NULL AUTO_INCREMENT,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `resourceID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`resAttachID`,`resourceID`),
  KEY `fk_tb_res_attach_tlb_resource1_idx` (`resourceID`),
  CONSTRAINT `fk_tb_res_attach_tlb_resource1` FOREIGN KEY (`resourceID`) REFERENCES `tlb_resource` (`resourceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_res_attach`
--

LOCK TABLES `tb_res_attach` WRITE;
/*!40000 ALTER TABLE `tb_res_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_res_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_attach`
--

DROP TABLE IF EXISTS `tbl_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_attach` (
  `attachID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` text COLLATE utf8_unicode_ci,
  `postID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`attachID`,`postID`),
  KEY `fk_tbl_attach_tbl_post1_idx` (`postID`),
  CONSTRAINT `fk_tbl_attach_tbl_post1` FOREIGN KEY (`postID`) REFERENCES `tbl_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attach`
--

LOCK TABLES `tbl_attach` WRITE;
/*!40000 ALTER TABLE `tbl_attach` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cat_resource`
--

DROP TABLE IF EXISTS `tbl_cat_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_cat_resource` (
  `catResourceID` int(11) NOT NULL AUTO_INCREMENT,
  `catResourceName` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`catResourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cat_resource`
--

LOCK TABLES `tbl_cat_resource` WRITE;
/*!40000 ALTER TABLE `tbl_cat_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cat_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Bài tập',''),(2,'Lý thuyết','');
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_comment` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `dateComment` date DEFAULT NULL,
  `postID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`commentID`,`postID`,`userID`),
  KEY `fk_tbl_comment_tbl_user1_idx` (`userID`),
  KEY `fk_tbl_comment_tbl_post1_idx` (`postID`),
  CONSTRAINT `fk_tbl_comment_tbl_post1` FOREIGN KEY (`postID`) REFERENCES `tbl_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_comment_tbl_user1` FOREIGN KEY (`userID`) REFERENCES `tbl_user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_post`
--

DROP TABLE IF EXISTS `tbl_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_post` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `shortTitle` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `summary` text COLLATE utf8_unicode_ci,
  `datePost` date DEFAULT NULL,
  `link` text COLLATE utf8_unicode_ci,
  `userID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`postID`,`userID`,`categoryID`),
  KEY `fk_tbl_post_tbl_category1_idx` (`categoryID`),
  KEY `fk_tbl_post_tbl_user1_idx` (`userID`),
  CONSTRAINT `fk_tbl_post_tbl_category1` FOREIGN KEY (`categoryID`) REFERENCES `tbl_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_post_tbl_user1` FOREIGN KEY (`userID`) REFERENCES `tbl_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_post`
--

LOCK TABLES `tbl_post` WRITE;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` VALUES (85,'test anh','ta','<ol>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			<img alt=\"\" src=\"image/post/D6obr9Rg.jpg\" style=\"width: 150px; height: 189px; float: left;\" />dsdsdsds</h3>\r\n	</li>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			dsdsdsdsdsd</h3>\r\n	</li>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			dsdsds</h3>\r\n	</li>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			dsdsds</h3>\r\n	</li>\r\n	<li>\r\n		<h3 style=\"color:blue;\">\r\n			dsdsds</h3>\r\n	</li>\r\n</ol>\r\n',NULL,'2014-06-22','',1,1,''),(86,'bài biết đầu tiên','bbđt','<p>\r\n	<img alt=\"\" src=\"image/post/Yadt95Hs.jpg\" style=\"height: 126px; width: 100px;\" />dsdsdsdsdsdsds</p>\r\n<h3 style=\"color:red;\">\r\n	dsdsdsdsdsdsd</h3>\r\n',NULL,'2014-06-22','',1,1,''),(87,'vnexpress.nt','v','<div class=\"short_intro txt_666\" style=\"margin: 0px; padding: 0px 0px 10px; color: rgb(68, 68, 68); font-weight: 700; font-size: 14px; line-height: 18px; font-family: arial; width: 480.015625px; float: left;\">\r\n	Trung Quốc cho rằng c&aacute;c tranh chấp h&agrave;ng hải trong khu vực chỉ n&ecirc;n được giải quyết th&ocirc;ng qua đ&agrave;m ph&aacute;n trực tiếp với c&aacute;c nước li&ecirc;n quan v&agrave; b&aacute;c bỏ sự can thiệp của một b&ecirc;n thứ ba.&nbsp;</div>\r\n<div class=\"relative_new\" style=\"margin: 0px; padding: 0px 0px 5px; width: 480.015625px; float: left; color: rgb(0, 0, 0); font-family: arial;\">\r\n	<ul class=\"list_news_dot_3x3_300\" style=\"margin: 0px; padding-right: 0px; padding-left: 0px; list-style-type: none; width: 480.015625px; float: left; border: none; color: rgb(102, 102, 102);\">\r\n		<li style=\"margin: 0px; padding: 0px 0px 5px 10px; list-style-type: none; background: url(http://st.f3.vnecdn.net/responsive/c/v37/images/graphics/bg_dot_gray_3x3.gif) 0px 6px no-repeat;\">\r\n			<a href=\"http://vnexpress.net/tin-tuc/thoi-su/hoc-gia-nuoc-ngoai-phe-phan-hanh-dong-cua-trung-quoc-3007402.html\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none; outline: none; font-weight: 700; line-height: 16px;\">Học giả nước ngo&agrave;i ph&ecirc; ph&aacute;n h&agrave;nh động của Trung Quốc</a>&nbsp; / &nbsp;<a href=\"http://vnexpress.net/tin-tuc/the-gioi/trung-quoc-dung-nhieu-gian-khoan-de-lan-nhung-buoc-dai-3007237.html\" style=\"margin: 0px; padding: 0px; color: rgb(102, 102, 102); text-decoration: none; outline: none; font-weight: 700; line-height: 16px;\">Trung Quốc d&ugrave;ng nhiều gi&agrave;n khoan để lấn những bước d&agrave;i</a></li>\r\n	</ul>\r\n</div>\r\n<div id=\"left_calculator\" style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: arial;\">\r\n	<div class=\"fck_detail width_common\" style=\"margin: 0px; padding: 0px 0px 10px; width: 480.015625px; float: left; overflow: hidden; font-size: 14px; color: rgb(51, 51, 51);\">\r\n		<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" class=\"tplCaption\" style=\"margin: 0px auto 10px; padding: 0px; max-width: 100%; width: 480px;\">\r\n			<tbody style=\"margin: 0px; padding: 0px;\">\r\n				<tr style=\"margin: 0px; padding: 0px;\">\r\n					<td style=\"margin: 0px; padding: 0px; line-height: 0;\">\r\n						<img alt=\"Tàu kiểm ngư 767 bị tàu hải cảnh Trung Quốc áp sát mạn, phun vòi rồng.&nbsp;\" data-natural-=\"\" data-pwidth=\"480\" data-width=\"500\" src=\"http://m.f29.img.vnecdn.net/2014/06/22/bien-dong1-5024-1403413788.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 480px;\" /></td>\r\n				</tr>\r\n				<tr style=\"margin: 0px; padding: 0px;\">\r\n					<td style=\"margin: 0px; padding: 0px; line-height: 0;\">\r\n						<p class=\"Image\" style=\"margin: 0px; padding: 10px; line-height: normal; font-size: 12px; background: rgb(245, 245, 245);\">\r\n							T&agrave;u kiểm ngư Việt Nam&nbsp;bị t&agrave;u hải cảnh Trung Quốc &aacute;p s&aacute;t mạn, phun v&ograve;i rồng tại v&ugrave;ng biển gần nơi hạ đặt tr&aacute;i ph&eacute;p&nbsp;gi&agrave;n khoan Hải Dương 981. Ảnh:<em style=\"margin: 0px; padding: 0px;\">&nbsp;Nguyễn Đ&ocirc;ng</em></p>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n		<p class=\"Normal\" style=\"margin: 0px 0px 1em; padding: 0px; line-height: 18px;\">\r\n			<span style=\"margin: 0px; padding: 0px;\">Ph&aacute;t biểu tại Diễn đ&agrave;n H&ograve;a b&igrave;nh Thế giới ở Bắc Kinh cuối tuần qua, Ủy vi&ecirc;n Quốc vụ viện Trung ',NULL,'2014-06-22','',1,1,'');
/*!40000 ALTER TABLE `tbl_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_role` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (1,'Giáo viên',''),(2,'Học sinh','');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fullName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gender` bit(1) DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`userID`,`roleID`),
  KEY `fk_tblUser_tblRole_idx` (`roleID`),
  CONSTRAINT `fk_tblUser_tblRole` FOREIGN KEY (`roleID`) REFERENCES `tbl_role` (`roleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','','','2014-06-06','email','address',1,'');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlb_resource`
--

DROP TABLE IF EXISTS `tlb_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlb_resource` (
  `resourceID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpload` date NOT NULL,
  `userID` int(11) NOT NULL,
  `catResourceID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`resourceID`,`userID`,`catResourceID`),
  KEY `fk_tlb_resource_tbl_user1_idx` (`userID`),
  KEY `fk_tlb_resource_tbl_cat_resource1_idx` (`catResourceID`),
  CONSTRAINT `fk_tlb_resource_tbl_cat_resource1` FOREIGN KEY (`catResourceID`) REFERENCES `tbl_cat_resource` (`catResourceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tlb_resource_tbl_user1` FOREIGN KEY (`userID`) REFERENCES `tbl_user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlb_resource`
--

LOCK TABLES `tlb_resource` WRITE;
/*!40000 ALTER TABLE `tlb_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlb_resource` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-22 20:24:33
