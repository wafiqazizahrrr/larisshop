-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2020 at 06:16 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laris`
--

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

create database laris;

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(3, 'Rizadja', 'sa,kfhuiwefk', '2020-11-08 22:42:21', '2020-09-11 22:42:21'),
(4, '3barang', 'jeding', '2020-11-08 23:17:40', '2020-09-11 23:17:40'),
(5, 'testmane', 'wefed', '2020-11-08 23:20:08', '2020-09-11 23:20:08'),
(8, 'RIza', 'iowadhh', '2020-11-09 10:55:38', '2020-10-11 10:55:38');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `nama_kategori`) VALUES
(1, 'Sneakers'),
(2, 'Oxfords'),
(3, 'Anu\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `kurir_id` int(11) NOT NULL,
  `nama_kurir` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kurir`
--

INSERT INTO `kurir` (`kurir_id`, `nama_kurir`) VALUES
(1, 'JNE'),
(2, 'JNT'),
(3, 'Tiki'),
(4, 'SiCepat'),
(5, 'Pos Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `pesanan_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`pesanan_id`, `invoice_id`, `produk_id`, `nama_produk`, `jumlah`, `harga`, `user_id`) VALUES
(1, 3, 4, 'Sandal', 1, 932874, 0),
(2, 3, 2, 'OUTLINE PRISM MID GTX', 1, 2000, 0),
(3, 4, 4, 'Sandal', 1, 932874, 0),
(4, 4, 2, 'OUTLINE PRISM MID GTX', 1, 2000, 0),
(5, 4, 6, 'Sepatuae', 1, 4657567, 0),
(6, 5, 10, 'keranjang', 1, 989778, 0),
(7, 5, 7, 'testere', 1, 34343, 0),
(8, 5, 5, 'Sepatu ya sepatuku', 1, 211111111, 0),
(10, 7, 2, 'OUTLINE PRISM MID GTX', 2, 2000, 0),
(11, 8, 3, 'Sandale', 1, 10293, 0),
(12, 8, 2, 'OUTLINE PRISM MID GTX', 1, 2000, 0);

--
-- Triggers `pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `pesanan` FOR EACH ROW BEGIN
	UPDATE produk SET stok = stok-NEW.jumlah
    WHERE produk_id = NEW.produk_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `produk_img` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(20) NOT NULL,
  `stok` int(11) NOT NULL,
  `kategori_id` int(3) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `nama_produk`, `merk`, `produk_img`, `deskripsi`, `harga`, `stok`, `kategori_id`, `user_id`) VALUES
(1, 'MEN’S CHILKAT 400 II', 'The North Face', 'tnf1.png', 'Sepatu', 10000, 10, 1, 2),
(2, 'OUTLINE PRISM MID GTX', 'Salomon', 'salomon1.jpg', 'dfs', 2000, 4, 2, 2),
(3, 'Sandale', 'Salomon', 'hands-306713_960_720.png', 'asd', 10293, 2, 2, 3),
(4, 'Sandal', 'Sundik', 'prau.png', '', 932874, 90, 1, 2),
(5, 'Sepatu ya sepatuku', 'Apa lolo', 'IMG_20190115_115305.jpg', 'sembarangang', 211111111, 80, 1, 2),
(6, 'Sepatuae', 'AE', '5-daftar-gunung-di-indonesia-yang-ditutup-pendakiannya-sementara-y7yQriWvUO.jpg', '', 4657567, 23, 3, 2),
(7, 'testere', 'asfs', 'sunset-giraffe-rhino-silhouette.jpg', 'sfsd', 34343, 45, 1, 2),
(10, 'keranjang', 'ask', '1441.png', 'asfsdfsfsdfsdsdjsakfbshjvfsjv jasvfshevfhs fsdhfbehfvehdfv dsjfvsfjsvfje', 989778, 43, 2, 2),
(11, 'hasjhsd', 'rtertea', 'colorful-52106_960_720.jpg', 'asfdsf', 10000, 32, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `name_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name_role`) VALUES
(1, 'Admin'),
(2, 'Penjual'),
(3, 'Pembeli');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_img` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `user_img`, `email`, `password`, `role`, `is_active`, `date_created`) VALUES
(1, 'Riza A', 'default.jpg', 'rizarx3@gmail.com', '$2y$10$.w6BZfTrM9gAQtlKb4gSg./RKNA.r/S5vdakP08DrGF2CADLxhjX6', 1, 1, '1604478775'),
(2, 'Rizky', 'default.jpg', 'rizarx4@gmail.com', '$2y$10$IbgMZrQRnQNEKOANFoy2CeexVIhJktOCGioM772U.xeordtcpdPRy', 2, 1, '1604480797'),
(3, 'luki', 'default.jpg', 'rizarx5@gmail.com', '$2y$10$O3gBw6lDGrG2PWvmn1wP.e06DV3qQLjG6WLjKG0LlmyRQE8cQCa3W', 2, 1, '1604481951'),
(4, 'Bukan Admin', 'default.jpg', 'rizarx6@gmail.com', '$2y$10$bdjjqsVwVFm3M2clpJPRmu9VkgKuKsTCKl4DRwOOCtbAb8uX9iqFe', 3, 1, '1604521802'),
(5, 'Azir', 'default.jpg', 'rizarx7@gmail.com', '$2y$10$bliZ6CiXtmYyMrgY/aa4X.ZwcbMuCWwL6aWdMKDV0TGhKUxRxur5K', 1, 1, '1604525863'),
(6, 'Azir M', 'default.jpg', 'rizarx8@gmail.com', '$2y$10$OP2MNqqyLmTPRt6AICoDKuT8uH/CHkVPkNCjJvJnbXUQE9EOYkmLe', 1, 1, '1604525956'),
(8, 'sndkfdn', '', 'pembeli@gmail.com', '$2y$10$uONRFAtOFfokio0M/H/7muCzVgTsXGKY5G8oDpEy5b8NET9Lmdqa6', 3, 1, '1604721891'),
(9, 'ini fullname', '', 'pedagang@dagang.com', '$2y$10$AODxmn5xl/1OmUR1OmL81.13XM/nBN5qNlmnzEr2WBPnfZ/rLYBVe', 2, 1, '1604735387');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`kurir_id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`pesanan_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `kurir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `pesanan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
