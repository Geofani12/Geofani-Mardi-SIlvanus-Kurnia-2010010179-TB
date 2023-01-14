/*
 Navicat Premium Data Transfer

 Source Server         : xampp
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : db_kepegawaian

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 08/01/2023 12:41:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cuti
-- ----------------------------
DROP TABLE IF EXISTS `cuti`;
CREATE TABLE `cuti`  (
  `id_cuti` int NOT NULL AUTO_INCREMENT,
  `tanggal_cuti` date NULL DEFAULT NULL,
  `lama_cuti` int NULL DEFAULT NULL,
  `jenis_cuti` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fk_pegawai` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_cuti`) USING BTREE,
  INDEX `fk_pegawai`(`fk_pegawai`) USING BTREE,
  CONSTRAINT `cuti_ibfk_1` FOREIGN KEY (`fk_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cuti
-- ----------------------------
INSERT INTO `cuti` VALUES (1, '2023-01-08', 4, 'Tahunan', 1);

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan`  (
  `id_jabatan` int NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_jabatan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jabatan
-- ----------------------------
INSERT INTO `jabatan` VALUES (2, 'Sub Bagian Tata Usaha');
INSERT INTO `jabatan` VALUES (3, 'Seksi Statistik Sosial');
INSERT INTO `jabatan` VALUES (4, 'Seksi Statistik Distribusi');
INSERT INTO `jabatan` VALUES (5, 'Seksi Statistik Produksi');
INSERT INTO `jabatan` VALUES (6, 'Seksi Neraca Wilayah Dan Analisis Statistik');
INSERT INTO `jabatan` VALUES (7, 'Seksi Integrasi Pengolahan Dan Diseminasi Statistik');
INSERT INTO `jabatan` VALUES (8, 'Pejabat Fungsional');
INSERT INTO `jabatan` VALUES (9, 'Kepala Badan Pusat Statistik Kota Banjarbaru');

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai`  (
  `id_pegawai` int NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_pegawai` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tempat_lahir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `jenis_kelamin` enum('Laki - Laki','Perempuan','Lainnya') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Laki - Laki',
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `fk_jabatan` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`) USING BTREE,
  UNIQUE INDEX `nik`(`nip`) USING BTREE,
  INDEX `FK_tb_narapidana_tb_kabupaten`(`fk_jabatan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pegawai
-- ----------------------------
INSERT INTO `pegawai` VALUES (1, '196912312009011034', 'Lilik Dwi Suharyanto SE', 'BANJARMASIN', '1969-12-31', 'Laki - Laki', 'Jln A.Yani Km 21 Landasan Ulin Barat', 3);
INSERT INTO `pegawai` VALUES (3, '198903131986112001', 'Muthiyana Cantya Puspita S S T', 'JAWA BARAT', '1989-03-13', 'Perempuan', 'Jln A.Yani Km. 23 Landasan Ulin Barat', 7);
INSERT INTO `pegawai` VALUES (4, '197201151998021003', 'Saefudin Zuhri S.Pt', 'JAWA TIMUR', '1972-01-15', 'Laki - Laki', 'Jln A.Yani Km. 33.5 Loktabat Utara', 5);
INSERT INTO `pegawai` VALUES (5, '197517041906102001', 'Damayanti Indah Nuswantari S S T', 'JAKARTA', '1975-04-17', 'Perempuan', 'Jln Karang Sawo, Loktabat Utara', 6);
INSERT INTO `pegawai` VALUES (6, '197667101019880310', 'Raisul Islamy SH', 'BANJARMASIN', '1976-10-10', 'Laki - Laki', 'Guntung Manggis, Landasan Ulin Kota Banjarbaru', 4);
INSERT INTO `pegawai` VALUES (7, '198007062012121002', 'Riza Apriyandi', 'BANJARBARU', '1977-03-12', 'Laki - Laki', 'Jln Melati No. 33 Komet Banjarbaru', 8);
INSERT INTO `pegawai` VALUES (8, '196305261995031002', 'Sri Wahyuni SE', 'JAWA TENGAH', '1972-05-26', 'Perempuan', 'Jln. Purnawirawan No.59 Palam Cempaka Banjarbaru', 2);
INSERT INTO `pegawai` VALUES (9, '198011222009031003', 'Ahmad Fadliansyah SE', 'MARTAPURA', '1980-11-22', 'Laki - Laki', 'Jln Guntung Harapan, Guntung Manggis Landasan Ulin Banjarbaru', 4);
INSERT INTO `pegawai` VALUES (10, '198810122009041001', 'Nopiyanto S S T', 'MARTAPURA', '1988-12-10', 'Laki - Laki', 'Jln Sekumpul Ujung, Sungai Paring, Martapura', 7);
INSERT INTO `pegawai` VALUES (11, '198010032009032004', 'Kumalawati S.AP', 'BANJARBARU', '1980-03-10', 'Laki - Laki', 'Jln A.Yani Km 33,5, Loktabat Selatan Banjarbaru', 3);
INSERT INTO `pegawai` VALUES (12, '198103312003122003', 'Norma Erwanty S.Sos', 'BANJARBARU', '1981-03-31', 'Perempuan', 'Guntung Payung, Landasan Ulin, Banjarbaru', 3);
INSERT INTO `pegawai` VALUES (13, '198809252020121003', 'Novita S S T', 'JAKARTA', '1988-09-25', 'Perempuan', 'Liang Anggang, Landasan Ulin, Banjarbaru', 7);
INSERT INTO `pegawai` VALUES (14, '089538413650308953', 'Zaki Assegaf', 'Banjarbaru', '2002-02-26', 'Laki - Laki', '-', 3);

-- ----------------------------
-- Table structure for produk
-- ----------------------------
DROP TABLE IF EXISTS `produk`;
CREATE TABLE `produk`  (
  `IDProduk` int NOT NULL AUTO_INCREMENT,
  `KodeProduk` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `NamaProduk` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Satuan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `Harga` int NULL DEFAULT NULL,
  `Stok` int NULL DEFAULT NULL,
  `CreateDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`IDProduk`) USING BTREE,
  UNIQUE INDEX `KodeProduk`(`KodeProduk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of produk
-- ----------------------------
INSERT INTO `produk` VALUES (3, 'G-001', 'telur ayam edit', 'Kg', 22000, 100, '2023-01-07 18:31:09');

SET FOREIGN_KEY_CHECKS = 1;
