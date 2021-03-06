-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: bookit
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chitiethoadon`
--

DROP TABLE IF EXISTS `chitiethoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitiethoadon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hoaDon_id` int NOT NULL,
  `sach_id` int NOT NULL,
  `soLuong` int NOT NULL,
  `donGia` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hoaDon_id` (`hoaDon_id`),
  KEY `sach_id` (`sach_id`),
  CONSTRAINT `chitiethoadon_ibfk_1` FOREIGN KEY (`hoaDon_id`) REFERENCES `hoadon` (`id`),
  CONSTRAINT `chitiethoadon_ibfk_2` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitiethoadon`
--

LOCK TABLES `chitiethoadon` WRITE;
/*!40000 ALTER TABLE `chitiethoadon` DISABLE KEYS */;
INSERT INTO `chitiethoadon` VALUES (23,14,11,1,85),(24,14,16,1,86),(25,14,6,1,50),(26,15,16,1,86),(27,15,3,1,48),(28,15,4,1,53),(29,15,6,1,50),(30,15,9,1,75),(31,16,12,1,72),(32,16,16,1,86),(33,16,9,1,75),(34,17,12,2,72),(35,17,16,1,86),(36,18,11,1,85),(37,19,11,1,85),(38,19,3,1,48),(39,20,11,1,85),(40,20,3,1,48),(41,21,11,1,85),(42,21,16,1,86),(43,22,12,1,72),(44,22,16,1,86);
/*!40000 ALTER TABLE `chitiethoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietphieunhap`
--

DROP TABLE IF EXISTS `chitietphieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chitietphieunhap` (
  `soLuong` int NOT NULL,
  `phieuNhap_id` int NOT NULL,
  `sach_id` int NOT NULL,
  PRIMARY KEY (`phieuNhap_id`,`sach_id`),
  KEY `sach_id` (`sach_id`),
  CONSTRAINT `chitietphieunhap_ibfk_1` FOREIGN KEY (`phieuNhap_id`) REFERENCES `phieunhap` (`id`),
  CONSTRAINT `chitietphieunhap_ibfk_2` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieunhap`
--

LOCK TABLES `chitietphieunhap` WRITE;
/*!40000 ALTER TABLE `chitietphieunhap` DISABLE KEYS */;
INSERT INTO `chitietphieunhap` VALUES (200,2,1),(200,2,5),(150,5,14);
/*!40000 ALTER TABLE `chitietphieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngayLapHD` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `khachHang_id` int DEFAULT NULL,
  `nhanVien_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `khachHang_id` (`khachHang_id`),
  KEY `nhanVien_id` (`nhanVien_id`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`khachHang_id`) REFERENCES `khachhang` (`id`),
  CONSTRAINT `hoadon_ibfk_3` FOREIGN KEY (`nhanVien_id`) REFERENCES `nhanvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES (14,'2020-12-23 15:32:40',3,NULL,1),(15,'2020-12-23 15:36:01',NULL,1,1),(16,'2020-12-23 16:05:27',3,NULL,1),(17,'2020-12-23 16:05:49',3,NULL,1),(18,'2020-12-23 16:07:08',3,NULL,1),(19,'2020-12-23 21:10:03',3,NULL,1),(20,'2020-12-23 21:10:15',3,NULL,1),(21,'2020-12-23 21:10:52',3,NULL,1),(22,'2020-12-23 21:11:32',3,NULL,1);
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `diaChi` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `dienThoai` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,'Vi Phan Thanh','?????ng Th??p','0776169342','phanvi371@gmail.com'),(2,'Thanh V??','?????ng Th??p','0776169342','phanvi371@gmail.com');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhangno`
--

DROP TABLE IF EXISTS `khachhangno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhangno` (
  `ngayNo` date NOT NULL,
  `soTien` decimal(10,0) NOT NULL,
  `khachHang_id` int NOT NULL,
  PRIMARY KEY (`khachHang_id`),
  CONSTRAINT `khachhangno_ibfk_1` FOREIGN KEY (`khachHang_id`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhangno`
--

LOCK TABLES `khachhangno` WRITE;
/*!40000 ALTER TABLE `khachhangno` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhangno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ngaySinh` date NOT NULL,
  `cmnd` varchar(15) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nhanVien_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nhanVien_id` (`nhanVien_id`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`nhanVien_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Vi','2000-07-31','358642552',1),(2,'Thanh','2000-01-01','254865285',13);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieunhap`
--

DROP TABLE IF EXISTS `phieunhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieunhap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngayNhap` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieunhap`
--

LOCK TABLES `phieunhap` WRITE;
/*!40000 ALTER TABLE `phieunhap` DISABLE KEYS */;
INSERT INTO `phieunhap` VALUES (2,'2020-12-23'),(4,'2020-12-17'),(5,'2020-12-05'),(6,'2020-12-12');
/*!40000 ALTER TABLE `phieunhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuthutienno`
--

DROP TABLE IF EXISTS `phieuthutienno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieuthutienno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ngayThu` date NOT NULL,
  `soTien` decimal(10,0) NOT NULL,
  `khachHang_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `khachHang_id` (`khachHang_id`),
  CONSTRAINT `phieuthutienno_ibfk_1` FOREIGN KEY (`khachHang_id`) REFERENCES `khachhang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuthutienno`
--

LOCK TABLES `phieuthutienno` WRITE;
/*!40000 ALTER TABLE `phieuthutienno` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieuthutienno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quydinh`
--

DROP TABLE IF EXISTS `quydinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quydinh` (
  `id` int NOT NULL,
  `id_user` int NOT NULL,
  `quydinhnhap` int DEFAULT NULL,
  `luongtonlon` int DEFAULT NULL,
  `luongtonnho` int DEFAULT NULL,
  `tienno` decimal(10,0) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  CONSTRAINT `quydinh_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  CONSTRAINT `quydinh_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quydinh`
--

LOCK TABLES `quydinh` WRITE;
/*!40000 ALTER TABLE `quydinh` DISABLE KEYS */;
INSERT INTO `quydinh` VALUES (1,1,150,300,20,20000,0);
/*!40000 ALTER TABLE `quydinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `donGia` decimal(10,0) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `theLoai_id` int NOT NULL,
  `tacGia_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theLoai_id` (`theLoai_id`),
  KEY `tacGia_id` (`tacGia_id`),
  CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`theLoai_id`) REFERENCES `theloai` (`id`),
  CONSTRAINT `sach_ibfk_2` FOREIGN KEY (`tacGia_id`) REFERENCES `tacgia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
INSERT INTO `sach` VALUES (1,'M???t bi???c',50,'image/products/matbiec.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',5,1),(2,'Tr???i hoa v??ng',45,'image/products/traihoavang.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',5,1),(3,'Ng???i kh??c tr??n c??y',48,'image/products/ngoikhoctrencay.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',5,1),(4,'L??m ch??? tu???i 20',53,'image/products/product-10.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',5,1),(5,'Con chim xanh bi???c bay v???',50,'image/products/conchimxanhbiecbayve.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',5,1),(6,'Ph???i l??ng v???i c?? ????n',50,'image/products/product-1.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',4,1),(7,'T??i th??ch b???n th??n n??? l???c h??n',55,'image/products/product-2.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',2,1),(8,'Cho t??i xin m???t v?? ??i tu???i th??',85,'image/products/product-3.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',3,1),(9,'Th??? gi???i ch???ng c?? g?? thay ?????i',75,'image/products/product-4.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',1,1),(10,'S???c n???ng c???a ng??n t???',62,'image/products/product-5.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',5,1),(11,'Tu???i tr??? ????ng gi?? bao nhi??u',85,'image/products/product-6.jpg','Tu???i tr??? ????ng gi?? bao nhi??u l?? cu???n s??ch kh??ng n???ng n??? gi??o ??i???u, kh??ng ch??? tr??ch c???c ??oan, ????n gi???n ch??? l?? nh???ng t??m s??? b??nh d??? c???a ng?????i ??i tr?????c, Rosie Nguy???n mang ?????n cho b???n tr??? nh???ng t?? t?????ng t??ch c???c nh???t ????? m???nh m??? b?????c ch??n v??o ?????i.',3,1),(12,'M???i l???n v???p ng?? l?? m???t l???n tr?????ng th??nh',72,'image/products/product-7.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',3,1),(13,'N???u ch??? c??n m???t ng??y ????? s???ng',52,'image/products/product-8.jpg','N???u cu???c ?????i l?? m???t cu???n s??ch th?? b???n ?????c ng?????c t??? d?????i l??n c??ng s??? ch???ng c?? g?? thay ?????i. H??m nay ch???ng kh??c g?? h??m qua. Ng??y mai c??ng gi???ng h???t ng??y h??m nay. Trong cu???n s??ch v??? cu???c ?????i em, ch????ng n??o c??ng gi???ng h???t ch????ng n??o, cho t???i khi anh xu???t hi???n.',4,1),(14,'T??i th???y hoa v??ng tr??n c??? xanh',63,'image/products/toithayhoavangtrencoxanh.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',3,1),(15,'Thi??n t??i b??n tr??i - k??? ??i??n b??n ph???i',95,'image/products/product-9.png','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',5,1),(16,'Ng??y ng?????i th????ng th????ng m???t ng?????i th????ng kh??c',86,'image/products/product-11.jpg','M???t bi???c ???????c t??c gi??? Nguy???n Nh???t ??nh s??ng t??c v??o n??m 1990. 30 n??m sau, c??u chuy???n ng??y th?? t??nh si ng??y n??o c???a Ng???n v?? H?? Lan cu???i c??ng ???? ???????c l??n m??n ???nh r???ng.',2,1);
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soluongsach`
--

DROP TABLE IF EXISTS `soluongsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soluongsach` (
  `sach_id` int NOT NULL,
  `soLuong` int NOT NULL,
  PRIMARY KEY (`sach_id`),
  CONSTRAINT `soluongsach_ibfk_1` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soluongsach`
--

LOCK TABLES `soluongsach` WRITE;
/*!40000 ALTER TABLE `soluongsach` DISABLE KEYS */;
INSERT INTO `soluongsach` VALUES (1,499),(2,250),(3,299),(4,398),(5,249),(6,254),(7,300),(8,399),(9,598),(10,300),(11,399),(12,249),(13,350),(14,400),(15,700),(16,399);
/*!40000 ALTER TABLE `soluongsach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tacgia`
--

DROP TABLE IF EXISTS `tacgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tacgia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nametg` varchar(55) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tacgia`
--

LOCK TABLES `tacgia` WRITE;
/*!40000 ALTER TABLE `tacgia` DISABLE KEYS */;
INSERT INTO `tacgia` VALUES (1,'Nguy???n Nh???t ??nh'),(2,'Nam Cao');
/*!40000 ALTER TABLE `tacgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theloai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nametl` varchar(55) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloai`
--

LOCK TABLES `theloai` WRITE;
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
INSERT INTO `theloai` VALUES (1,'Truy???n ng???n '),(2,'Thi???u nhi'),(3,'Ng??n t??nh'),(4,'Ti???u thuy???t'),(5,'V??n h???c');
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(55) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `diaChi` varchar(250) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `dienThoai` varchar(15) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `user_role` enum('KH','USER','ADMIN') COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  CONSTRAINT `user_chk_1` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','viou@gmail.com','Dong Thap','0776164258','admin','e10adc3949ba59abbe56e057f20f883e','image/upload/user.jpg',1,'ADMIN'),(2,'vi','vi@ou','tp','0447854785','ou','e10adc3949ba59abbe56e057f20f883e','image/upload/user.jpg',1,'ADMIN'),(3,'Vi Phan Thanh','phanvi371@gmail.com','Th??p M?????i','01226169342','vi1','e10adc3949ba59abbe56e057f20f883e','image/upload/user.jpg',1,'KH'),(10,'Vi Phan Thanh','1851050187vi@ou.edu.vn','Th??p M?????i','0776169342','vi2','202cb962ac59075b964b07152d234b70','image/upload/user.jpg',1,'KH'),(12,'Vi Phan Thanh','vi@PDTMDT',NULL,NULL,'VIDT','e10adc3949ba59abbe56e057f20f883e','image/upload/user.jpg',1,'KH'),(13,'Phan Thanh Vi','18520@gmail',NULL,NULL,'nv1','e10adc3949ba59abbe56e057f20f883e','image/upload/user.jpg',1,'USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-23 21:54:12
