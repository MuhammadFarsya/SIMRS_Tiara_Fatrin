-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2022 at 01:03 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tiara_fatrin`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` enum('Admin','Dokter','Administrasi','Kasir','Apotik') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `foto`, `username`, `password`, `jabatan`, `created_at`, `updated_at`) VALUES
(11, '36371777_p0.jpg', 'Farsya', 'admin', 'Admin', '2022-01-08 05:51:58', '2022-01-08 05:51:58'),
(12, '67448704_p0.jpg', 'Desy', 'adm', 'Administrasi', '2022-01-08 05:52:24', '2022-01-08 05:52:24'),
(13, '83373885_p0.jpg', 'Pelang', 'dokter', 'Dokter', '2022-01-08 05:52:47', '2022-01-08 05:52:47'),
(14, 'balloon_aerostat_space_129524_800x1280.jpg', 'Galang', 'apotik', 'Apotik', '2022-01-08 05:53:25', '2022-01-08 05:53:25'),
(15, 'brady-rogers-v1E2XFbu7VA-unsplash.jpg', 'Maruli', 'kasir', 'Kasir', '2022-01-08 05:53:40', '2022-01-08 05:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `anamesa`
--

CREATE TABLE `anamesa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `akun_id` bigint(20) UNSIGNED NOT NULL,
  `pasien_id` bigint(20) UNSIGNED NOT NULL,
  `nama_pasien` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tekanan_darah` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gol_darah` enum('A','O','AB','B') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tinggi_badan` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `berat_badan` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suhu_badan` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `denyut_jantung` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nafas` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keluhan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnosa` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `anamesa`
--

INSERT INTO `anamesa` (`id`, `akun_id`, `pasien_id`, `nama_pasien`, `tekanan_darah`, `gol_darah`, `tinggi_badan`, `berat_badan`, `suhu_badan`, `denyut_jantung`, `nafas`, `keluhan`, `diagnosa`, `created_at`, `updated_at`) VALUES
(1, 13, 1, 'Maruli Taher', '120', 'O', '175', '88', '34', '60', '100', 'Pusing Mikirin Codingan', 'Kanker Otak', '2022-01-13 19:27:28', '2022-01-13 19:27:28'),
(2, 13, 2, 'Galang Samudro', '110', 'O', '170', '66', '32', '65', '100', 'Pusing Mikirin Duit', 'Sakit Kepala', '2022-01-13 19:29:05', '2022-01-13 19:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `detail_diagnosa`
--

CREATE TABLE `detail_diagnosa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `diagnosa_id` bigint(20) UNSIGNED NOT NULL,
  `pemeriksaan` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tindakan` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarif` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_diagnosa`
--

INSERT INTO `detail_diagnosa` (`id`, `diagnosa_id`, `pemeriksaan`, `tindakan`, `tarif`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rosen perut', 'IMR', 150000, '2022-01-13 19:31:30', '2022-01-13 19:31:30'),
(2, 1, 'Rosen dada', 'Ronsen', 100000, '2022-01-13 19:31:30', '2022-01-13 19:31:30'),
(3, 2, 'cek darah', 'suntik', 1250000, '2022-01-13 19:34:49', '2022-01-13 19:34:49'),
(4, 2, 'diketok dengkul', 'Ronsen', 100000, '2022-01-13 19:34:49', '2022-01-13 19:34:49');

-- --------------------------------------------------------

--
-- Table structure for table `detail_obat`
--

CREATE TABLE `detail_obat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `obat_pasien_id` bigint(20) UNSIGNED NOT NULL,
  `obat_id` bigint(20) UNSIGNED NOT NULL,
  `merk` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` enum('Botol','Pil','Tablet','Suntik') COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_obat`
--

INSERT INTO `detail_obat` (`id`, `obat_pasien_id`, `obat_id`, `merk`, `satuan`, `harga`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Inzana', 'Tablet', 15000, 5, '2022-01-13 20:19:15', '2022-01-13 20:19:15'),
(2, 1, 5, 'Sanaflu', 'Tablet', 15000, 1, '2022-01-13 20:19:15', '2022-01-13 20:19:15'),
(3, 2, 5, 'Sanaflu', 'Tablet', 15000, 3, '2022-01-13 20:19:59', '2022-01-13 20:19:59');

-- --------------------------------------------------------

--
-- Stand-in structure for view `detail_pembayaran`
-- (See below for the actual view)
--
CREATE TABLE `detail_pembayaran` (
`id` bigint(20) unsigned
,`anamesa_id` bigint(20) unsigned
,`nama_pasien` varchar(100)
,`nama_dokter` varchar(100)
,`tanggal_periksa` date
,`pemeriksaan` varchar(200)
,`tindakan` varchar(200)
,`tarif` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `diagnosa`
--

CREATE TABLE `diagnosa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `akun_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_periksa` date NOT NULL,
  `anamesa_id` bigint(20) UNSIGNED NOT NULL,
  `nama_pasien` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dokter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnosa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resep_obat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diagnosa`
--

INSERT INTO `diagnosa` (`id`, `akun_id`, `tanggal_periksa`, `anamesa_id`, `nama_pasien`, `nama_dokter`, `diagnosa`, `resep_obat`, `created_at`, `updated_at`) VALUES
(1, 13, '2022-01-14', 1, 'Maruli Taher', '4', 'Darah Tinggi', 'kasih dia obat paramex 5 bungkus buat diminum  perhari', '2022-01-13 19:31:30', '2022-01-13 19:31:30'),
(2, 13, '2022-01-15', 2, 'Galang Samudro', '2', 'Sakit Kepala', 'Ampicilin 3jumlah siang dan malam', '2022-01-13 19:34:49', '2022-01-13 19:34:49');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_dokter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_poli` enum('Kebidanan & Penyakit Kandungan','Anak','Anastesi','Penyakit Dalam','Bedah Umum','Dokter Umum') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `pendidikan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `umur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlpn` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nama_dokter`, `nama_poli`, `tempat_lahir`, `tgl_lahir`, `pendidikan`, `umur`, `alamat`, `jenis_kelamin`, `no_tlpn`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Marina, SpOG (K)', 'Kebidanan & Penyakit Kandungan', 'Palembang', '1968-07-16', 'S2', '78', 'Kenten Laut', 'Perempuan', '0813804565802', '2021-11-05 03:33:21', '2021-11-05 03:39:42'),
(2, 'Dr. Wim T Pangemanan, SpOG (K)', 'Kebidanan & Penyakit Kandungan', 'Palembang', '1959-05-13', 'S2', '72', 'Basuki Rahmat', 'Laki Laki', '08804565802', '2021-11-07 21:19:06', '2021-11-07 21:19:06'),
(3, 'Dr. Sari Mulia, SpA (K)', 'Anak', 'Jawa Tengah', '1984-08-15', 'S2', '48', 'Kenten Laut', 'Perempuan', '08804565802', '2021-11-07 21:20:27', '2021-11-07 21:20:27'),
(4, 'Dr. Nizar, SpB, FINACS, FICS', 'Bedah Umum', 'Jawa Barat', '1972-02-09', 'S2', '68', 'Pusri', 'Laki Laki', '08132514565', '2021-11-07 21:22:25', '2021-11-07 21:22:25'),
(5, 'Dr. Hj. Endang Melati Maas, SpAn, KIC', 'Anastesi', 'Palembang', '1983-09-28', 'S2', '37', 'Perumnas', 'Perempuan', '0813569451564', '2021-11-07 21:24:49', '2021-11-07 21:24:49'),
(6, 'Dr. Ariana Deviana', 'Dokter Umum', 'Palembang', '1993-11-19', 'S2', '25', 'Lemabang', 'Perempuan', '089694664754', '2021-11-07 21:26:24', '2021-11-07 21:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_dkr`
--

CREATE TABLE `jadwal_dkr` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `hari_praktek` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal_dkr`
--

INSERT INTO `jadwal_dkr` (`id`, `dokter_id`, `hari_praktek`, `jam_mulai`, `jam_selesai`, `created_at`, `updated_at`) VALUES
(1, 1, 'Senin', '08:30:00', '16:40:00', '2021-11-05 06:37:59', '2021-11-05 06:49:16'),
(2, 4, 'Juma\'at', '09:30:00', '14:30:00', '2021-11-07 21:27:45', '2021-11-07 21:27:45'),
(3, 6, 'Selasa', '11:45:00', '17:20:00', '2021-11-07 21:28:34', '2021-11-07 21:28:34'),
(4, 1, 'Kamis', '07:30:00', '15:35:00', '2021-11-07 21:29:08', '2021-11-07 21:29:08'),
(5, 2, 'Juma\'at', '09:30:00', '16:30:00', '2021-11-07 21:29:35', '2021-11-07 21:29:35'),
(6, 5, 'Senin', '08:30:00', '14:30:00', '2021-11-07 21:30:14', '2021-11-07 21:30:14'),
(7, 3, 'Rabu', '07:30:00', '16:00:00', '2021-11-07 21:30:49', '2021-11-07 21:30:49'),
(8, 2, 'Senin', '09:00:00', '14:00:00', '2021-11-23 23:45:20', '2021-11-23 23:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2021_11_05_094117_create_akuns_table', 1),
(3, '2021_11_05_100651_create_dokters_table', 2),
(4, '2021_11_05_132752_create_jadwal_dkrs_table', 3),
(5, '2021_11_05_135417_create_registrasi_p_s_table', 4),
(6, '2021_11_05_144830_create_pendaftarans_table', 5),
(7, '2021_11_05_151222_create_pasiens_table', 6),
(8, '2021_11_06_042320_create_anamesas_table', 7),
(9, '2021_11_06_045055_create_diagnosas_table', 8),
(10, '2021_11_06_051646_create_rekam_medis_table', 9),
(11, '2021_11_06_144526_create_pasien_lamas_table', 10),
(12, '2021_11_08_010613_create_pendaftaran_lamas_table', 11),
(13, '2021_11_08_013235_create_pendaftaran_lamas_table', 12),
(14, '2021_11_09_020734_create_obats_table', 13),
(15, '2021_11_09_023104_create_obat_masuks_table', 14),
(16, '2021_11_09_032650_create_obat_pasiens_table', 15),
(17, '2021_11_10_042110_create_pembayarans_table', 16),
(18, '2021_12_07_084240_create_detail_diagnosas_table', 17),
(19, '2021_12_09_050910_create_detail_obats_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `akun_id` bigint(20) UNSIGNED NOT NULL,
  `nama_obat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `satuan` enum('Botol','Pil','Tablet','Suntik') COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `akun_id`, `nama_obat`, `satuan`, `merk`, `stok`, `created_at`, `updated_at`) VALUES
(1, 14, 'Decolgen herbal plu', 'Botol', 'Sanaflu', 12, '2022-01-13 19:43:27', '2022-01-13 19:56:53'),
(2, 14, 'OBH combi anak 60ml', 'Botol', 'OBH', 12, '2022-01-13 19:45:52', '2022-01-13 19:57:49'),
(3, 14, 'OBH Combi batuk berdahak 100ml', 'Botol', 'OBH', 24, '2022-01-13 19:45:59', '2022-01-13 20:01:45'),
(4, 14, 'Paramex', 'Tablet', 'Inzana', 10, '2022-01-13 19:46:50', '2022-01-13 20:02:25'),
(5, 14, 'Ampicilin', 'Tablet', 'Sanaflu', 16, '2022-01-13 19:47:01', '2022-01-13 19:52:32'),
(6, 14, 'Bodrex', 'Tablet', 'Sanaflu', 8, '2022-01-13 19:47:18', '2022-01-13 19:56:20'),
(7, 14, 'Promag', 'Tablet', 'Kalbe', 20, '2022-01-13 19:47:41', '2022-01-13 20:03:07'),
(8, 14, 'Vaksin Covid-19', 'Suntik', 'Moderna', 100, '2022-01-13 19:48:01', '2022-01-13 20:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `obat_masuk`
--

CREATE TABLE `obat_masuk` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `akun_id` bigint(20) UNSIGNED NOT NULL,
  `obat_id` bigint(20) UNSIGNED NOT NULL,
  `satuan` enum('Botol','Pil','Tablet','Suntik') COLLATE utf8mb4_unicode_ci NOT NULL,
  `merk` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tahun` date NOT NULL,
  `expiry` date NOT NULL,
  `no_batch` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obat_masuk`
--

INSERT INTO `obat_masuk` (`id`, `akun_id`, `obat_id`, `satuan`, `merk`, `harga`, `jumlah`, `total`, `tahun`, `expiry`, `no_batch`, `created_at`, `updated_at`) VALUES
(1, 14, 5, 'Tablet', 'Sanaflu', 12000, 16, 192000, '2022-01-14', '2023-01-14', '2021-12-14', '2022-01-13 19:52:32', '2022-01-13 19:52:32'),
(2, 14, 6, 'Tablet', 'Sanaflu', 10000, 8, 80000, '2022-01-14', '2023-02-14', '2021-12-18', '2022-01-13 19:56:20', '2022-01-13 19:56:20'),
(3, 14, 1, 'Botol', 'Sanaflu', 18000, 12, 216000, '2021-12-15', '2023-03-15', '2022-01-01', '2022-01-13 19:56:53', '2022-01-13 19:56:53'),
(4, 14, 2, 'Botol', 'OBH', 22000, 12, 264000, '2021-12-01', '2023-01-01', '2021-11-01', '2022-01-13 19:57:49', '2022-01-13 19:57:49'),
(5, 14, 3, 'Botol', 'OBH', 25000, 24, 600000, '2021-12-25', '2023-04-14', '2021-07-15', '2022-01-13 20:01:45', '2022-01-13 20:01:45'),
(6, 14, 4, 'Tablet', 'Inzana', 12000, 10, 120000, '2022-02-05', '2023-02-05', '2021-12-01', '2022-01-13 20:02:25', '2022-01-13 20:02:25'),
(7, 14, 7, 'Tablet', 'Kalbe', 8000, 20, 160000, '2022-02-10', '2023-03-10', '2021-10-01', '2022-01-13 20:03:07', '2022-01-13 20:03:07'),
(8, 14, 8, 'Suntik', 'Moderna', 150000, 100, 15000000, '2022-02-20', '2022-10-01', '2022-01-01', '2022-01-13 20:07:39', '2022-01-13 20:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `obat_pasien`
--

CREATE TABLE `obat_pasien` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `akun_id` bigint(20) UNSIGNED NOT NULL,
  `diagnosa_id` bigint(20) UNSIGNED NOT NULL,
  `nama_pasien` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dokter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasil_diagnosa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resep_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obat_pasien`
--

INSERT INTO `obat_pasien` (`id`, `akun_id`, `diagnosa_id`, `nama_pasien`, `nama_dokter`, `hasil_diagnosa`, `resep_obat`, `created_at`, `updated_at`) VALUES
(1, 14, 1, 'Maruli Taher', 'Dr. Nizar, SpB, FINACS, FICS', 'Darah Tinggi', 'kasih dia obat paramex 5 bungkus buat diminum  perhari', '2022-01-13 20:19:15', '2022-01-13 20:19:15'),
(2, 14, 2, 'Galang Samudro', 'Dr. Wim T Pangemanan, SpOG (K)', 'Sakit Kepala', 'Ampicilin 3jumlah siang dan malam', '2022-01-13 20:19:59', '2022-01-13 20:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `akun_id` bigint(20) UNSIGNED NOT NULL,
  `no_rm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendaftaran_id` bigint(20) UNSIGNED NOT NULL,
  `nama_pasien` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `umur` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlpn` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rumah` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_nikah` enum('DIBAWAH UMUR','BELUM/TIDAK KAWIN','KAWIN','JANDA','DUDA','CERAI','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` enum('ISLAM','KONG HU CU','PROTESTAN','KATHOLIK','HINDU','BUDHA','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan` enum('BUMN','BUMD','PNS','TNI','PENGUSAHA','KARYAWAN SWASTA','PETANI','NELAYAN','BURUH','WIRASWASTA','PELAUT','PELAJAR','MAHASISWA','IBU RUMAH TANGGA','GURU','PENSIUNAN','PENGANGGURAN','POLRI','DOSEN','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendidikan` enum('BELUM SEKOLAH','BELUM/TIdak Tamat SD','Tamat SD','Tamat SMP','Tamat SMA/SMK','AKADEMI/DIPLOMA','PASCA SARJANA','S1','S2','S3','TIDAK SEKOLAH','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ortu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `umur_ortu` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan_ortu` enum('BUMN','BUMD','PNS','TNI','PENGUSAHA','KARYAWAN SWASTA','PETANI','NELAYAN','BURUH','WIRASWASTA','PELAUT','PELAJAR','MAHASISWA','IBU RUMAH TANGGA','GURU','PENSIUNAN','PENGANGGURAN','POLRI','DOSEN','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jadwal_dkr_id` bigint(20) UNSIGNED NOT NULL,
  `nama_poli` enum('Kebidanan & Penyakit Kandungan','Anak','Anastesi','Penyakit Dalam','Bedah Umum','Dokter Umum') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jadwal_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `akun_id`, `no_rm`, `pendaftaran_id`, `nama_pasien`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `umur`, `alamat`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `no_tlpn`, `no_rumah`, `status_nikah`, `agama`, `pekerjaan`, `pendidikan`, `nama_ortu`, `umur_ortu`, `pekerjaan_ortu`, `jadwal_dkr_id`, `nama_poli`, `jadwal_dokter`, `tanggal_daftar`, `created_at`, `updated_at`) VALUES
(1, 12, '000000', 1, 'Maruli Taher', 'Laki Laki', 'Palembang', '1997-03-13', '25', 'Kenten Laut', 'Talang Kelapa', 'Ilir Timur 2', 'Palembang', 'Sumatra Selatan', '08804565802', NULL, 'BELUM/TIDAK KAWIN', 'ISLAM', 'MAHASISWA', 'PASCA SARJANA', 'Mail', '64', 'WIRASWASTA', 2, 'Bedah Umum', 'Juma\'at, 09:30:00 - 14:30:00', '2022-01-14', '2022-01-13 19:21:43', '2022-01-13 19:21:43'),
(2, 12, '000001', 2, 'Galang Samudro', 'Laki Laki', 'Palembang', '1998-02-14', '24', 'Kenten Laut', 'Talang Kelapa', 'Ilir Timur 2', 'Palembang', 'Sumatra Selatan', '08804565802', NULL, 'BELUM/TIDAK KAWIN', 'ISLAM', 'PENGUSAHA', 'Tamat SMA/SMK', 'Agus', '56', 'PENSIUNAN', 5, 'Kebidanan & Penyakit Kandungan', 'Juma\'at, 09:30:00 - 16:30:00', '2022-01-15', '2022-01-13 19:26:01', '2022-01-13 19:26:01');

-- --------------------------------------------------------

--
-- Table structure for table `pasien_lama`
--

CREATE TABLE `pasien_lama` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `akun_id` bigint(20) UNSIGNED NOT NULL,
  `pendaftaran_lama_id` bigint(20) UNSIGNED NOT NULL,
  `nama_pasien` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlpn` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `nama_poli` enum('Kebidanan & Penyakit Kandungan','Anak','Anastesi','Penyakit Dalam','Bedah Umum','Dokter Umum') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jadwal_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `obat_pasien_id` bigint(20) UNSIGNED NOT NULL,
  `nama_pasien` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dokter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hasil_diagnosa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_bayar` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `obat_pasien_id`, `nama_pasien`, `nama_dokter`, `hasil_diagnosa`, `tgl_bayar`, `created_at`, `updated_at`) VALUES
(1, 1, 'Maruli Taher', 'Dr. Nizar, SpB, FINACS, FICS', 'Darah Tinggi', '2022-01-14', '2022-01-13 20:30:18', '2022-01-13 20:30:18');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nik` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pasien` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `umur` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kota` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlpn` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rumah` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_nikah` enum('DIBAWAH UMUR','BELUM/TIDAK KAWIN','KAWIN','JANDA','DUDA','CERAI','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `agama` enum('ISLAM','KONG HU CU','PROTESTAN','KATHOLIK','HINDU','BUDHA','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan` enum('BUMN','BUMD','PNS','TNI','PENGUSAHA','KARYAWAN SWASTA','PETANI','NELAYAN','BURUH','WIRASWASTA','PELAUT','PELAJAR','MAHASISWA','IBU RUMAH TANGGA','GURU','PENSIUNAN','PENGANGGURAN','POLRI','DOSEN','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `pendidikan` enum('BELUM SEKOLAH','BELUM/TIdak Tamat SD','Tamat SD','Tamat SMP','Tamat SMA/SMK','AKADEMI/DIPLOMA','PASCA SARJANA','S1','S2','S3','TIDAK SEKOLAH','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_ortu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `umur_ortu` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pekerjaan_ortu` enum('BUMN','BUMD','PNS','TNI','PENGUSAHA','KARYAWAN SWASTA','PETANI','NELAYAN','BURUH','WIRASWASTA','PELAUT','PELAJAR','MAHASISWA','IBU RUMAH TANGGA','GURU','PENSIUNAN','PENGANGGURAN','POLRI','DOSEN','Lain-Lain') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jadwal_dkr_id` bigint(20) UNSIGNED NOT NULL,
  `nama_poli` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jadwal_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pendaftaran`
--

INSERT INTO `pendaftaran` (`id`, `nik`, `nama_pasien`, `jenis_kelamin`, `tempat_lahir`, `tgl_lahir`, `umur`, `alamat`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `no_tlpn`, `no_rumah`, `status_nikah`, `agama`, `pekerjaan`, `pendidikan`, `nama_ortu`, `umur_ortu`, `pekerjaan_ortu`, `jadwal_dkr_id`, `nama_poli`, `jadwal_dokter`, `tanggal_daftar`, `status`, `created_at`, `updated_at`) VALUES
(1, '1670010005896402', 'Maruli Taher', 'Laki Laki', 'Palembang', '1997-03-13', '25', 'Kenten Laut', 'Talang Kelapa', 'Ilir Timur 2', 'Palembang', 'Sumatra Selatan', '08804565802', NULL, 'BELUM/TIDAK KAWIN', 'ISLAM', 'MAHASISWA', 'PASCA SARJANA', 'Mail', '64', 'WIRASWASTA', 2, 'Kebidanan & Penyakit Kandungan', 'Juma\'at, 09:30:00 - 16:30:00', '2022-01-14', 'Diterima', '2022-01-13 19:17:25', '2022-01-13 19:18:09'),
(2, '1670010012096402', 'Galang Samudro', 'Laki Laki', 'Palembang', '1998-02-14', '24', 'Kenten Laut', 'Talang Kelapa', 'Ilir Timur 2', 'Palembang', 'Sumatra Selatan', '08804565802', NULL, 'BELUM/TIDAK KAWIN', 'ISLAM', 'PENGUSAHA', 'Tamat SMA/SMK', 'Agus', '56', 'PENSIUNAN', 4, 'Bedah Umum', 'Juma\'at, 09:30:00 - 14:30:00', '2022-01-15', 'Diterima', '2022-01-13 19:19:25', '2022-01-13 19:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_lama`
--

CREATE TABLE `pendaftaran_lama` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_rm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_pasien` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_tlpn` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jadwal_dkr_id` bigint(20) UNSIGNED NOT NULL,
  `nama_poli` enum('Kebidanan & Penyakit Kandungan','Anak','Anastesi','Penyakit Dalam','Bedah Umum','Dokter Umum') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jadwal_dokter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_daftar` date NOT NULL,
  `status` enum('Pending','Diterima','Ditolak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pasien_id` bigint(20) UNSIGNED NOT NULL,
  `nama_pasien` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tempat_lahir` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `diagnosa_id` bigint(20) UNSIGNED NOT NULL,
  `nama_dokter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tindakan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `riwayat_penyakit` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure for view `detail_pembayaran`
--
DROP TABLE IF EXISTS `detail_pembayaran`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detail_pembayaran`  AS SELECT `diagnosa`.`id` AS `id`, `diagnosa`.`anamesa_id` AS `anamesa_id`, `diagnosa`.`nama_pasien` AS `nama_pasien`, `diagnosa`.`nama_dokter` AS `nama_dokter`, `diagnosa`.`tanggal_periksa` AS `tanggal_periksa`, `detail_diagnosa`.`pemeriksaan` AS `pemeriksaan`, `detail_diagnosa`.`tindakan` AS `tindakan`, `detail_diagnosa`.`tarif` AS `tarif` FROM (`diagnosa` join `detail_diagnosa`) WHERE `diagnosa`.`id` = `detail_diagnosa`.`diagnosa_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anamesa`
--
ALTER TABLE `anamesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `akun_id` (`akun_id`);

--
-- Indexes for table `detail_diagnosa`
--
ALTER TABLE `detail_diagnosa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagnosa_id` (`diagnosa_id`);

--
-- Indexes for table `detail_obat`
--
ALTER TABLE `detail_obat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_id` (`obat_id`),
  ADD KEY `obat_pasien_id` (`obat_pasien_id`);

--
-- Indexes for table `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `anamesa_id` (`anamesa_id`),
  ADD KEY `dokter_id` (`nama_dokter`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_dkr`
--
ALTER TABLE `jadwal_dkr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokter_id` (`dokter_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obat_masuk`
--
ALTER TABLE `obat_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_id` (`obat_id`),
  ADD KEY `akun_id` (`akun_id`);

--
-- Indexes for table `obat_pasien`
--
ALTER TABLE `obat_pasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diagnosa_id` (`diagnosa_id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pendaftaran_id`),
  ADD KEY `jadwal_dkr_id` (`jadwal_dkr_id`),
  ADD KEY `akun_id` (`akun_id`);

--
-- Indexes for table `pasien_lama`
--
ALTER TABLE `pasien_lama`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftaran_lama_id` (`pendaftaran_lama_id`),
  ADD KEY `akun_id` (`akun_id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `obat_pasien_id` (`obat_pasien_id`);

--
-- Indexes for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pendaftaran_ibfk_1` (`jadwal_dkr_id`);

--
-- Indexes for table `pendaftaran_lama`
--
ALTER TABLE `pendaftaran_lama`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_dkr_id` (`jadwal_dkr_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`),
  ADD KEY `diagnosa_id` (`diagnosa_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `anamesa`
--
ALTER TABLE `anamesa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_diagnosa`
--
ALTER TABLE `detail_diagnosa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_obat`
--
ALTER TABLE `detail_obat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `diagnosa`
--
ALTER TABLE `diagnosa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jadwal_dkr`
--
ALTER TABLE `jadwal_dkr`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `obat_masuk`
--
ALTER TABLE `obat_masuk`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `obat_pasien`
--
ALTER TABLE `obat_pasien`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pasien_lama`
--
ALTER TABLE `pasien_lama`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pendaftaran_lama`
--
ALTER TABLE `pendaftaran_lama`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anamesa`
--
ALTER TABLE `anamesa`
  ADD CONSTRAINT `anamesa_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_diagnosa`
--
ALTER TABLE `detail_diagnosa`
  ADD CONSTRAINT `detail_diagnosa_ibfk_1` FOREIGN KEY (`diagnosa_id`) REFERENCES `diagnosa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_obat`
--
ALTER TABLE `detail_obat`
  ADD CONSTRAINT `detail_obat_ibfk_1` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_obat_ibfk_2` FOREIGN KEY (`obat_pasien_id`) REFERENCES `obat_pasien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD CONSTRAINT `diagnosa_ibfk_1` FOREIGN KEY (`anamesa_id`) REFERENCES `anamesa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_dkr`
--
ALTER TABLE `jadwal_dkr`
  ADD CONSTRAINT `jadwal_dkr_ibfk_1` FOREIGN KEY (`dokter_id`) REFERENCES `dokter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obat_masuk`
--
ALTER TABLE `obat_masuk`
  ADD CONSTRAINT `obat_masuk_ibfk_1` FOREIGN KEY (`obat_id`) REFERENCES `obat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obat_pasien`
--
ALTER TABLE `obat_pasien`
  ADD CONSTRAINT `obat_pasien_ibfk_1` FOREIGN KEY (`diagnosa_id`) REFERENCES `diagnosa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`pendaftaran_id`) REFERENCES `pendaftaran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_2` FOREIGN KEY (`jadwal_dkr_id`) REFERENCES `jadwal_dkr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_ibfk_3` FOREIGN KEY (`akun_id`) REFERENCES `akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasien_lama`
--
ALTER TABLE `pasien_lama`
  ADD CONSTRAINT `pasien_lama_ibfk_2` FOREIGN KEY (`pendaftaran_lama_id`) REFERENCES `pendaftaran_lama` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_lama_ibfk_3` FOREIGN KEY (`akun_id`) REFERENCES `akun` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`obat_pasien_id`) REFERENCES `obat_pasien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `pendaftaran_ibfk_1` FOREIGN KEY (`jadwal_dkr_id`) REFERENCES `jadwal_dkr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pendaftaran_lama`
--
ALTER TABLE `pendaftaran_lama`
  ADD CONSTRAINT `pendaftaran_lama_ibfk_1` FOREIGN KEY (`jadwal_dkr_id`) REFERENCES `jadwal_dkr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`diagnosa_id`) REFERENCES `diagnosa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
