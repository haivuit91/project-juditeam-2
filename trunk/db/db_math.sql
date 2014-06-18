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
-- Table structure for table `tbl_baitap`
--

DROP TABLE IF EXISTS `tbl_baitap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_baitap` (
  `baiTapID` int(11) NOT NULL AUTO_INCREMENT,
  `baiTap` text COLLATE utf8_unicode_ci NOT NULL,
  `postID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`baiTapID`,`postID`),
  KEY `fk_tbl_baitap_tbl_post1_idx` (`postID`),
  CONSTRAINT `fk_tbl_baitap_tbl_post1` FOREIGN KEY (`postID`) REFERENCES `tbl_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_baitap`
--

LOCK TABLES `tbl_baitap` WRITE;
/*!40000 ALTER TABLE `tbl_baitap` DISABLE KEYS */;
INSERT INTO `tbl_baitap` VALUES (1,'DẠNG Phương trình với biến số (u, m, t, …)\r\na) 2t + 1 = 3t – 2 (Phương trình với biến số là t)\r\nb) 3 – 2m = 1 + 5(3m – 7) (Phương trình với biến số là m)',5,''),(3,'Khảo sát sự biến thiên và vẽ đồ thị (C) của hàm số y = - x4 - x2 + 6',1,''),(4,'1. Cho phương trình: x^2 - 2(m - 1)x + m - 5 = 0\r\nXác định m để phương trình có 1 nghiệm x = -1;\r\nTìm m để phương trình có 2 nghiệm sao cho |x_1 - x_2| = 3.',3,''),(5,'Bài tập phương trình Logarit\r\nT.S Nguyễn Phú Khánh - Đà Lạt',2,''),(6,'Ví dụ:  Tính tích phân sau:\r\na) I=\\int\\limits_0^1{x^2\\sqrt{x^3+5}dx}\r\nb) J=\\int\\limits_0^{\\frac{\\pi }{2}} {\\left({\\sin^4 x+1}\\right)\\cos x}dx',4,'');
/*!40000 ALTER TABLE `tbl_baitap` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Cấu trúc đề thi',''),(2,'Dạng bài tập',''),(3,'Lý thuyết',''),(4,'Đề thi','');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` VALUES (1,'Bài viết hay','2014-06-13',5,1,''),(2,'Tk','2014-06-13',1,1,''),(3,'Bài viết kém','2014-06-13',1,1,''),(4,'allo','2014-06-15',5,5,''),(5,'ấ','2014-06-15',4,2,'');
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_huongdan`
--

DROP TABLE IF EXISTS `tbl_huongdan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_huongdan` (
  `huongDanID` int(11) NOT NULL AUTO_INCREMENT,
  `huongDan` text COLLATE utf8_unicode_ci NOT NULL,
  `postID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`huongDanID`,`postID`),
  KEY `fk_tbl_huongdan_tbl_post1_idx` (`postID`),
  CONSTRAINT `fk_tbl_huongdan_tbl_post1` FOREIGN KEY (`postID`) REFERENCES `tbl_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_huongdan`
--

LOCK TABLES `tbl_huongdan` WRITE;
/*!40000 ALTER TABLE `tbl_huongdan` DISABLE KEYS */;
INSERT INTO `tbl_huongdan` VALUES (1,'Quy tắc chuyển vế :\r\ntrong một phương trình, ta có thể chuyển một hạng tử từ vế này sang vế kia và đổi dấu hạng tử đó.\r\nQuy tắc nhân với một số :\r\ntrong một phương trình, ta có thể nhân (chia) cả hai vế với cùng một số khác 0.',5,''),(2,'Khảo sát sự biến thiên và vẽ đồ thị của hàm số y = f(x)\r\n    + Tập xác định của hàm số\r\n    + Sự biến thiên:\r\n         - Chiều biến thiên\r\n                Tính đạo hàm cấp 1 và tìm nghiệm của đạo hàm (nếu có) \r\n                Kết luận tính đơn điệu của hàm số\r\n         - Cực trị của hàm số\r\n         - Giới hạn của hàm số và đường tiệm cận (nếu có) của đồ thị hàm số\r\n    + Lập bảng biến thiên\r\n    + Vẽ đồ thị ',1,''),(3,'Câu a\r\n\r\nx=−1⇒1+2(m−1)+m−5=0⇒m=2\r\n\r\ncâu b \r\n\r\nΔ′=(m−1)2−(m−5)=m2−3m+6>0∀mx1+2=2(m−1),x1x2=m−5|x1−x2|=3⇒(x1−x2)2=9⇒(x1+x2)2−4x1x2=94(m−1)2−4(m−5)=9⇒vô−nghiệm',3,''),(4,'Giải từng bước nhỏ nhất',2,''),(5,'Giải từ cái nhỏ nhất',4,''),(6,'sâs',5,'');
/*!40000 ALTER TABLE `tbl_huongdan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_kinhnghiem`
--

DROP TABLE IF EXISTS `tbl_kinhnghiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_kinhnghiem` (
  `kinhNghiemID` int(11) NOT NULL AUTO_INCREMENT,
  `kinhNghiem` text COLLATE utf8_unicode_ci NOT NULL,
  `postID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`kinhNghiemID`,`postID`),
  KEY `fk_tbl_kinhnghiem_tbl_post1_idx` (`postID`),
  CONSTRAINT `fk_tbl_kinhnghiem_tbl_post1` FOREIGN KEY (`postID`) REFERENCES `tbl_post` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_kinhnghiem`
--

LOCK TABLES `tbl_kinhnghiem` WRITE;
/*!40000 ALTER TABLE `tbl_kinhnghiem` DISABLE KEYS */;
INSERT INTO `tbl_kinhnghiem` VALUES (1,'Khả năng giải quyết bài toán cơ bản',5,''),(2,'Làm các bước nhỏ trước',1,''),(3,'Bình tĩnh tự tinh để làm bài',3,''),(4,'Bình tỉnh giải bài',2,''),(6,'Bình tĩnh, tự tin để giải bài',4,'');
/*!40000 ALTER TABLE `tbl_kinhnghiem` ENABLE KEYS */;
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
  `datePost` date DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`postID`,`userID`,`categoryID`),
  KEY `fk_tbl_post_tbl_category1_idx` (`categoryID`),
  KEY `fk_tbl_post_tbl_user1_idx` (`userID`),
  CONSTRAINT `fk_tbl_post_tbl_category1` FOREIGN KEY (`categoryID`) REFERENCES `tbl_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_post_tbl_user1` FOREIGN KEY (`userID`) REFERENCES `tbl_user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_post`
--

LOCK TABLES `tbl_post` WRITE;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` VALUES (1,'Dạng bài tập hàm số','Hàm số','Nội dung này thường chiếm 2 điểm trong đề thi, câu hỏi dạng này gồm 2 ý . Ý thứ nhất là khảo sát và vẽ đồ thị hàm số, ý này mặc định trong đề thi và là ý dễ hầu hết các em đều làm được. Ý thứ hai gọi là câu hỏi phụ khảo sát hàm số. Để làm được ý này các em cần đọc kỹ câu hỏi  sau đó chia câu hỏi thành các ý hỏi nhỏ và giải quyết từng ý hỏi một, đúng đến đâu các em có điểm đến đó.','2014-06-13',1,1,''),(2,'Dạng bài tập nội dung phương trình, bất phương trình, hệ phương trình mũ Logarit','phương trình, bất phương trình, hàm số mũ\', \'Với nội dung trong bài phương trình, bất phương trình, hệ phương trình mũ Logarit, học sinh nếu học theo dạng bài tập thì số lượng dạng bài tập nhiều, khi vào làm bài thi các em rất khó để nhớ ra dạng bài tập. Do vậy, học sinh nên lưu ý và giải chung theo các bước sau: tìm điều kiện; biến đổi các biểu thức mũ về các biểu thức mũ có số mũ chung; biến đổi các biểu thức mũ về cùng cơ số; nếu không đưa được cùng cơ số thì chia cả hai vế cho một biểu thức mũ có cơ số lớn nhất hoặc nhỏ nhất.','phương trình, bất phương trình, hàm số mũ\', \'Với nội dung trong bài phương trình, bất phương trình, hệ phương trình mũ Logarit, học sinh nếu học theo dạng bài tập thì số lượng dạng bài tập nhiều, khi vào làm bài thi các em rất khó để nhớ ra dạng bài tập. Do vậy, học sinh nên lưu ý và giải chung theo các bước sau: tìm điều kiện; biến đổi các biểu thức mũ về các biểu thức mũ có số mũ chung; biến đổi các biểu thức mũ về cùng cơ số; nếu không đưa được cùng cơ số thì chia cả hai vế cho một biểu thức mũ có cơ số lớn nhất hoặc nhỏ nhất.','2014-06-13',2,2,''),(3,'phương trình, bất phương trình, hàm số mũ\', \'Với nội dung trong bài phương trình, bất phương trình','hệ phương trình, mũ Logarit','Với nội dung trong bài phương trình, bất phương trình, hệ phương trình mũ Logarit, học sinh nếu học theo dạng bài tập thì số lượng dạng bài tập nhiều, khi vào làm bài thi các em rất khó để nhớ ra dạng bài tập. Do vậy, học sinh nên lưu ý và giải chung theo các bước sau: tìm điều kiện; biến đổi các biểu thức mũ về các biểu thức mũ có số mũ chung; biến đổi các biểu thức mũ về cùng cơ số; nếu không đưa được cùng cơ số thì chia cả hai vế cho một biểu thức mũ có cơ số lớn nhất hoặc nhỏ nhất.','2014-06-13',1,3,''),(4,'Nguyên hàm, tích phân và ứng dụng','Nguyên hàm, tích phân','Ngoài việc lắm chắc công thức các em cần chú ý có 2 phương pháp chính thường xuyên sử dụng là phương pháp từng phần và phương pháp đổi biến số. Phương pháp từng phần thường được sử dụng với bài toán tính nguyên hàm và tích phân mà hàm dưới dấu nguyên hàm tích phân là tích của hai hàm số hoặc hàm dưới dấu nguyên hàm tích phân là hàm lnu, lnn u.','2014-06-13',1,3,''),(5,'Phương trình bậc 1','PTB1','Phương trình một ẩn x có dạng : A(x) = B(x). ta gọi A(x) là vế trái, B(x) là vế phải hai biểu thức của cùng một biến x.','2014-06-13',2,3,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'tuan','21232f297a57a5a743894a0e4a801fc3','Thanh tuấn','','1991-06-06','tuan@gmail.com','Đà nẵng',1,''),(2,'thanh','21232f297a57a5a743894a0e4a801fc3','Thanh','','1991-09-09','thanh@gmail.com','Bình Định',1,''),(3,'duy','21232f297a57a5a743894a0e4a801fc3','Ngọc duy','','1991-05-05','duy@gmail.com','Đà nẵng',2,''),(4,'cong','21232f297a57a5a743894a0e4a801fc3','Công','','1991-04-04','cong@gmail.com','Thanh hóa',2,''),(5,'admin','21232f297a57a5a743894a0e4a801fc3','Administrator','','1991-04-04','admin@gmail.com','Đà nẵng',1,''),(6,'tessssst','21232f297a57a5a743894a0e4a801fc3','','','2014-06-06','email','address',1,'');
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-18  9:52:53
