-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2018 at 04:59 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sukabumi`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `ticket` int(4) UNSIGNED ZEROFILL NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `telephone` varchar(14) NOT NULL,
  `pesan` text NOT NULL,
  `status` enum('Open','Closed') NOT NULL,
  `idatetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`ticket`, `nama`, `email`, `telephone`, `pesan`, `status`, `idatetime`) VALUES
(0001, 'Bambang', 'bbg@mail.com', '0878011244', 'Min tes doang min a', 'Closed', '2018-07-17 18:12:05'),
(0002, 'Asep', 'asep@mail.com', '087321412', 'Min tes dlu min', 'Closed', '2018-07-17 23:46:35'),
(0003, '213', 'da@fasd', 'dsada', 'Message...fdgfd', 'Open', '2018-07-17 15:26:18'),
(0004, 'asdsad', 'da@fasd', '21321', 'sdsad', 'Open', '2018-07-17 15:56:18'),
(0005, '213', 'da@fasd', 'dsada', 'dsadsa', 'Closed', '2018-07-17 23:46:17'),
(0006, 'adit', 'adit@mail.com', '09213091', 'dududud udu du duud ud udd dududud udu du duud ud udddududud udu du duud ud udddududud udu du duud ud udddududud udu du duud ud udd', 'Closed', '2018-07-27 15:26:18'),
(0007, 'agaga', 'adada', '123123', 'asdasdasdasd', 'Closed', '2018-07-17 15:26:18'),
(0008, 'aa', 'adit@mail.com', '12', 'a', 'Open', '2018-07-17 15:43:59'),
(0009, 'asdas', 'asdasd@mail.c', '123123', 'asdasd', 'Closed', '2018-07-17 23:46:24'),
(0010, 'fir', 'fmaulana871@gmail.com', '081344130696', 'tes tes', 'Open', '2018-07-17 21:52:20'),
(0011, 'zxczxc', 'da@fasd', '123123123', 'asdasdasdasdasd', 'Closed', '2018-07-18 14:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('1BlnHm1FWU5jvCJTNoVQLgDSqIZzo-pO', 1532454033, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"user_id\":1,\"FirstName\":\"Aditya\",\"LastName\":\"Nugraha\",\"Email\":\"an@mail.com\",\"Phone\":\"087809898818\",\"Photo\":\"pr.jpg\",\"username_login\":\"aabb\",\"password_login\":\"$2b$10$KNrHFjXBEQKyiVL330viVOIxKYBaBaXz8.IaQu\",\"role\":\"admin\",\"account_created\":\"2018-07-10T08:01:43.000Z\"}}}'),
('7NrULCWO7-plEzbDEFs0dRBgs9hblMlx', 1532506768, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":{\"user_id\":1,\"FirstName\":\"Aditya\",\"LastName\":\"Nugraha\",\"Email\":\"an@mail.com\",\"Phone\":\"087809898818\",\"Photo\":\"pr.jpg\",\"username_login\":\"aabb\",\"password_login\":\"$2b$10$KNrHFjXBEQKyiVL330viVOIxKYBaBaXz8.IaQu\",\"role\":\"admin\",\"account_created\":\"2018-07-10T08:01:43.000Z\"}}}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Photo` varchar(100) NOT NULL,
  `username_login` varchar(45) NOT NULL,
  `password_login` varchar(45) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  `account_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `FirstName`, `LastName`, `Email`, `Phone`, `Photo`, `username_login`, `password_login`, `role`, `account_created`) VALUES
(1, 'Aditya', 'Nugraha', 'an@mail.com', '087809898818', 'pr.jpg', 'aabb', '$2b$10$KNrHFjXBEQKyiVL330viVOIxKYBaBaXz8.IaQu', 'admin', '2018-07-10 08:01:43'),
(2, 'Hafidz', 'Amrulloh', 'hafidzamrulloh97@gmail.com', '', '', 'zendev', '4effca0225e37dc257bc1364233c9a2b', 'user', '2018-05-29 09:29:09');

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `wisata_id` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `descr` text NOT NULL,
  `maps` varchar(300) NOT NULL,
  `images` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`wisata_id`, `name`, `category`, `descr`, `maps`, `images`, `created_at`, `update_at`) VALUES
('asd', 'test test', 'kuliner', 'asdasd', 'asdasd', '1532350962242-wisata-bubur-bunut.jpg', '2018-07-23 04:47:52', '2018-07-23 13:02:59'),
('bandros-ata', 'Bandros Ata', 'kuliner', 'Jika kamu mencari makanan enak di Sukabumi sebagai camilan di malam hari maka kamu harus mencicipi yang  namanya Bandros Ata. Kue ini merupakan makanan khas Sukabumi yang sudah sangat terkenal sejak dulu. Jangan terkecoh dengan penjajanya yang biasa menjual Bandros di lapak kaki lima di pinggir-pinggir jalan karena rasa Bandros Ata ini sudah tidak di ragukan lagi kelezatannya. Bandros Ata bisa kamu temukan di daerah j. Gudang Sukabumi, biasanya para pedagang Bandros mulai berjualan mulai dari jam 7 hingga malam. Kamu juga harus  mengantre karena biasanya jajanan Bandros Ata selalu ramai di serbu oleh pembeli. Satu porsi Bandros Ata bisa kamu nikmati dengan harga Rp. 8000 hingga 10.000 per porsinya.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.7313231576773!2d106.93193691413339!3d-6.922687269680317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e6848382168dded%3A0x5f119c94120a260e!2sBANDROS+ATA!5e0!3m2!1sid!2sid!4v1532361206872', '1532361283547-wisata-Bandros-Ata.jpg', '2018-07-23 15:54:43', '2018-07-23 15:54:43'),
('bolu-pisang', 'Bolu Pisang', 'kuliner', 'kuliner kali ini kamu bisa melanjutkan perjalanan ke arah Jl. Sukaraja untuk mencicipi bolu pisang Sukabumi yang memiliki rasa yang sangat legit. Bolu Pisang Sukabumi yang banyak di jual di sekitar Jl. Sukaraja ini sangat terkenal dengan rasanya yang sangat enak. Kamu juga bisa membeli bolu pisang Sukabumi ini sebagai oleh-oleh karena jika di simpan dengan baik makanan khas Sukabumi yang satu ini bisa bertahan hingga satu minggu. Rasa dari kue bolu pisang inipun sudah beragam, ada yang ditambahkan keju, coklat hingga kacang. Salah satu penjual bolu pisang khas Sukabumi yang sangat terkenal adalah warung Bu Onih yang berada di Gang Mesjid dekat Jl. Sukaraja.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.773603478872!2d106.97123301413333!3d-6.917647969627016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e6848e4efc6a387%3A0xe2df874d6f712de9!2sBolu+Pisang+Ibu+Onih!5e0!3m2!1sid!2sid!4v1532361515354', '1532361614835-wisata-Bolu-Pisang.jpg', '2018-07-23 16:00:14', '2018-07-23 16:00:14'),
('bubur-ayam', 'Bubur Ayam', 'kuliner', 'Bubur ayam Sukabumi juga wajib kamu cicipi jika sedang liburan ke Sukabumi. Kamu bisa menemukannya dengan mudah karena banyak sekali pedagang yang menjajakannya. Salah satu ciri khas dari bubur ayam Sukabumi ini adalah penggunaan ati dan ampela ayam yang telah di bumbui rempah sehingga menciptakan citarasa pedas yang sangat gurih. Bubur ayam ini biasanya di makan bersama dengan taburan bawang goreng dan emping di atasnya, kemudian di siram dengan kuah kaldu. Porsinya cukup untuk mengenyangkan perut saat sarapan di pagi hari. Makanan khas Sukabumi yang satu ini bisa kamu cicipi dengan harga Rp. 10.000 per porsinya.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63458.067801352445!2d106.82853818841869!3d-6.2466950924139875!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f39a8a6a0417%3A0x198b7e7fe473df90!2sBubur+Ayam+Sukabumi!5e0!3m2!1sid!2sid!4v1532359826565', '1532359934917-wisata-Bubur-Ayam.jpg', '2018-07-23 15:32:15', '2018-07-23 15:32:15'),
('bubur-bunut', 'Bubur Bunut', 'kuliner', 'Warisan kuliner yang satu ini harus Anda coba nikmatnya. Udara daerah Sukabumi yang cukup dingin membuat bubur BuNut ini menjadi salah satu menu yang cocok untuk dinikmati. Anda bisa mendapatkan makanan ini mulai dari jam 6 pagi, dan segera dapatkan kalau tidak mau kehabisan.\r\nAnda dapat mencari menu ini di daetah Siliwangi. Rumah makan yang menyediakan menu bubur Bu Nut ini memiliki konsep yang unik karena memadukan unsur modern dan tradisional. Selain itu terdapat ruangan indoor ataupun outdoor yang bisa dijadikan pilihan yang asyik untuk menikmati bubur BuNut khas kota Sukabumi.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.8181495091276!2d106.9327953141333!3d-6.912334669570913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e684835f8512c1f%3A0x38455f5a21925c73!2sBubur+Ayam+Bunut+Siliwangi!5e0!3m2!1sid!2sid!4v1532321965024', '1532322031349-wisata-bubur-bunut.jpg', '2018-07-23 05:00:31', '2018-07-23 05:00:31'),
('curug-cigangsa', 'Curug Cigangsa', 'alam', 'Curug Cigangsa terletak di Dusun Batusuhunan, Desa Surade, Kecamatan Surade, Sukabumi. Katanya, obyek wisata di Sukabumi yang satu ini terbentuk akibat gempa bumi yang cukup kuat hingga terjadi longsor. Curug Cigangsa yang kerap disebut Curug Luhur ini memiliki tiga tingkatan. Debit airnya kecil karena bagian hulunya dibendung untuk keperluan irigasi. Keunikan dari Curug Cigangsa ini adalah dinding batunya yang berwarna kehitaman. Di sekitar curug, terdapat sebuah batu  besar yang dinamain Batu Masigit atau Batu Masjid. Untuk bisa mengunjungi Curug Cigangsa, pengunjung harus naik perahu. ', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3957.242669703198!2d106.54099681413781!3d-7.326618074085299!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68029bce5b3357%3A0x8208ba9dde4a869!2sCurug+Cigangsa!5e0!3m2!1sid!2sid!4v1532320514719', '1532320532854-wisata-curug-cigangsa.jpg', '2018-07-23 04:35:32', '2018-07-23 04:35:32'),
('curug-luhur', 'Curug Luhur', 'alam', 'Bertempat di Kampung Cikawung, Desa Purwasedar, Kecamatan Ciracap, Curug Luhur adalah salah satu tempat yang wajib dikunjungi di daerah Pajampangan. Keistimewaanya yaitu pelangi yang muncul dibawah curug. Pelangi ini merupakan hasil refleksi sorot matahari ke air curug.\r\nCurug luhur tidak sulit dijangkau karena tak jauh dari pusat keramaian Ciracap. Dari kantor Kecamatan Ciracap kurang lebih 5 Kilometer dengan waktu tempuh kurang dari 15 menit saja.\r\nSelain tempatnya yang masih alami, curug ini juga menyimpan banyak sekali nilai sejarah. Ada juga beberapa cerita dan mitos yang dipercaya masyarakat sekitar Curug Luhur ini.\r\nJadi kurang komplit bila berkunjung ke Geopark Ciletuh Palabuanratu bila belum berkunjung ke tempat ini.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.705363227014!2d107.02379051413348!3d-6.92577956971302!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e684f3eea16402f%3A0xa4a5b0c177806cc2!2sWISATA+CURUG+LUHUR!5e0!3m2!1sid!2sid!4v1532366602241', '1532366648849-wisata-Curug-Luhur.jpg', '2018-07-23 17:24:08', '2018-07-23 17:26:50'),
('curug-puncak-jeruk', 'Curug Puncak Jeruk', 'alam', 'Curug Puncak Jeruk ini memiliki keunikan tersendiri, karena terdiri dari dua buah air terjun yang bertingkat, selain itu curug ini memiliki ukuran lebar yang lebih dari air terjun pada umumnya yang ada di Jawa Barat. Air terjun yang pertama memliki lebar 40 Meter dengan tinggi 10 Meter, sedangkan air terjun yang kedua letaknya berada diatas curug ke- satu, atau biasa disebut Curug Puncak Jeruk Dua umpakan, dengan tebing tinggi 15 Meter dan lebar 50 Meter. Jarak umpakan antara air terjun pertama dengan kedua tidak terlalu jauh, yaitu 15 Meter. \r\nUntuk mencapai lokasi wisata alam Curug Puncak Jeruk ini harus melintasi medan jalan yang penuh tantangan sepanjang lima Kilo Meter dari Jalan Raya Walura. Bagi Anda yang akan berkunjung disarankan menggunakan motor trail atau mobil Offroad karena melintasi jalan terjal dan tidak beraspal. Sepanjang perjalanan, pengunjung akan menyusuri perkebunan pinus, perkebunan cengkeh dan pesawahan milik warga yang terhampar luas. ', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3958.238277007311!2d106.55966811413658!3d-7.21363737282643!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e681e75ae9cc585%3A0xa885ea4d4f1c7b24!2sCurug+Puncak+Jeruk!5e0!3m2!1sid!2sid!4v1532366929802', '1532366982686-wisata-Puncakjeruk.jpg', '2018-07-23 17:29:42', '2018-07-23 17:29:42'),
('curug-puncak-manik', 'Curug Puncak Manik', 'alam', 'Curug Puncak Manik adalah aliran air terjun yang terakhir atau paling bawah dari tiga rangkaian air terjun di Ciletuh. Berlokasi di Kampung Pasirceri, Desa Cibenda, Kecamatan Ciemas, Kabupaten Sukabumi .\r\nCurug Puncakmanik berjarak sekitar 600 meter dari Curug Tengah dan masih pada aliran Sungai Ciletuh yang merupakan batas antara Desa Tamanjaya dan desa Cibenda. Akses menuju curug ini dapat ditempuh dengan jalan kaki melalui pematang sawah dan punggungan bukit selama satu jam dari tempat parkir mobil.\r\nPerjalanan menuju ke sana sungguh mengasyikan. Walaupun jalannya kurang bagus, banyak yang berlubang namun pemandangan di sepanjang jalan sangat menyejukkan mata. Disuguhi hamparan sawah yang luas berbentuk terasering. Serta segarnya udara pegunungan membuat perjalanan semakin seru.\r\nCurug Puncak Manik merupakan salah satu kekayaan alam Indonesia yang tersembunyi. Bagaimana tidak, perlu waktu berjam-jam untuk sampai ke curug tertinggi di kawasan Geopark Ciletuh. Namun, semuanya akan terbayar dengan alam yang asri di Puncak Manik.\r\nSebelum menikmati air terjun yang indah beralaskan batu-batuan purba, kita dapat merasakan sensani menuruni tangga yang sangat panjang, yaitu dengan sebutan tangga seribu. Tangga berpagar kayu dan bertiang tembok serta bergambar kujang pusaka lambang tanah pasundan ini kian memikat para wisatawan yang berkunjung.\r\nTebing-tebing dengan tetumbuhan hijau menjadi pelengkap keindahan air terun. Jika beruntung, kita dapat menyaksikan pelangiÂ  yang menyempurnakan air terjun.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3957.8674151354376!2d106.50052371413697!3d-7.255926973295188!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42a7091f2270eb%3A0xbce5a865d997c7cc!2sCurug+Puncak+Manik!5e0!3m2!1sid!2sid!4v1532367115578', '1532367176079-wisata-Puncakmanik.jpg', '2018-07-23 17:32:56', '2018-07-23 17:32:56'),
('curug-sodong', 'Curug Sodong', 'alam', 'Curug Sodong adalah salah satu air terjun yang berada di kawasan Ciletuh Geopark. Air terjun ini memiliki ketinggian sekitar 20 meter. Keunikan dari air terjun ini adalah pemandangan alamnya yang indah, di sekitar air terjun ini tumbuh pepohonan yang hijau dan rindang. Dinamakan “sodong” karena di balik air terjun ini terdapat cekungan yang menyerupai sebuah gua. Dan dalam istilah bahasa sunda, cekungan yang menyerupai gua tersebut sering disebut sebagai “sodong”.\r\nAir terjun ini memiliki nama lain selain Curug Sodong, yaitu Curug Kembar dan Curug Panganten. Nama tersebut disematkan pada air terjun ini karena memiliki aliran yang serupa atau kembar, dan mirip layaknya sepasang pengantin yang saling berpasangan. Keunikan dari air terjun ini lainnya adalah hembusan airnya yang cukup kuat, jadi jika kamu berada tepat didepan air terjunnya, maka bajumu akan cepat basah.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3958.4884916955093!2d106.49584261413628!3d-7.184965372510262!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42a0faf339e0c5%3A0x253366aa610d872d!2sCurug+Sodong+Kembar!5e0!3m2!1sid!2sid!4v1532367300371', '1532367344713-wisata-Sodong.jpg', '2018-07-23 17:35:44', '2018-07-23 17:35:44'),
('curug-tengah', 'Curug Tengah', 'alam', 'Curug Tengah adalah air terjun urutan kedua dari aliran Sungai Ciletuh setelah Curug Awang yang berada di kawasan  Ciletuh Geopark. Curug Tengah ini sedikit berbeda dengan saudaranya Curug Awang, Curug Tengah ini memiliki keunikan yaitu pemandangan alam sekitarnya yang hijau dan danau yang terbentuk dari tumpahan air terjunnya juga sangat luas. Kamu bisa bermain air atau berenang di danau kecil ini, tapi harus berhati-hati karena ada beberapa titik pada danau ini yang memiliki kedalaman yang sangat dalam. Curug Tengah ini memiliki ketinggian sekitar 5 m dan lembahnya yang jauh lebih sempit dibandingkan dengan lembah Curug Awang.\r\nCurug Tengah berjarak sekitar 200 meter dari Curug Awang dan masih pada aliran Sungai Ciletuh yang merupakan perbatasan antara Desa Tamanjaya dan desa Cibenda. Akses menuju curug ini dapat ditempuh dengan jalan kaki melalui pematang sawah selama limabelas menit dari tempat parkir mobil.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3957.8506810240015!2d106.50608901436952!3d-7.2578293947610835!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42a70a58b01bbd%3A0x1b435a6224e5876e!2sCurug+Tengah!5e0!3m2!1sid!2sid!4v1532367503375', '1532367527448-wisata-Tengah.jpg', '2018-07-23 17:38:47', '2018-07-23 17:38:47'),
('goa-buniayu', 'Goa Buniayu', 'alam', 'Tempat wisata di Sukabumi yang satu ini bakalan asyik banget untuk mereka yang memiliki adrenaline tinggi. Goa Buniayu adalah sekumpulan goa alam yang terletak di Cipinang, Kerta Angsana, Nyalindung, Sukabumi. Ada tiga goa alam yang termasuk dalam Goa Buniayu ini adalah Goa Wisata, Goa Landak, dan Goa Kerek. Jika Anda berkunjung saat musim hujan, maka goa yang bisa dimasuki hanyalah Goa Landak dan Goa Kerek. Goa Buniayu ini adalah goa alami yang terbentuk akibat pengangkatan lempeng tektonik berjuta-juta tahun lamanya. Pengangkatan lempeng tektonik ini meninggalkan fosil pada dinding-dinding goa. Bagi Anda yang tertantang untuk menjelajahi Goa Buniayu, Anda sangat dianjurkan untuk menggunakan jasa pemandu. Anda juga harus memiliki ketahanan fisik karena menjelajahi Goa Buniayu ini akan membutuhkan waktu sekitar 5 jam. Anda juga harus melewati medan lumpur, memanjat tebing, melewati tumpukan batu, dan sebagainya. Namun, setiap jerih payah Anda akan terbayar karena Goa Buniayu ini sangat indah! ', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3959.767973349134!2d106.90426721413462!3d-7.036533770894956!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e6838ab578a435b%3A0x5ed86ad146afb148!2sGua+Siluman+Buniayu!5e0!3m2!1sid!2sid!4v1532320295421', '1532320312939-wisata-goa-buniayu.jpg', '2018-07-23 04:31:52', '2018-07-23 04:31:52'),
('goa-laut-kunti', 'Goa Laut Kunti', 'alam', 'Goa laut Kunti terletak di bagian barat Gunung Badak tepatnya di depan Pulau Kunti. Goa ini memiliki ketinggian mencapai 3 meter dan panjang sekitar 4 meter dari garis pantai. Batuannya merupakan batuan campur aduk/bancuh (melange) yang merupakan percampuran dari batuan yang berasal dari kerak benua dan kerak samudra yang diendapkan dalam sebuah palung yang sangat dalam, dan karena proses geologi, kemudian terangkat ke permukaan seperti sekarang.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15833.9817886663!2d106.44249998752957!3d-7.184166721821297!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42a17dd940daf1%3A0x64bcc656225b2ed8!2sPulau+Kunti!5e0!3m2!1sid!2sid!4v1532366372192', '1532366437840-wisata-Gua-Kunti.jpg', '2018-07-23 17:20:37', '2018-07-23 17:20:37'),
('kampung-ciptagelar', 'Kampung Ciptagelar', 'alam', 'Bagi Anda yang jemu dengan kehidupan perkotaan dan butuh pergantian suasana, cobalah berlibur ke Kampung Ciptagelar. Di Kampung Ciptagelar, Anda bisa merasakan kehidupan tradisional lengkap dengan nilai-nilai adat setempat. Kampung Ciptagelar yang terletak di kaki Gunung Halimun, Kabupaten Sukabumi ini, berhasil mempertahankan tradisi adat mereka sejak 600-an tahun yang lalu. Bahkan, pemukimannya pun tidak mengalami perubahan selama 600 tahun ini. Mirip-mirip dengan Suku Baduy. Kita pastinya akan bisa belajar banyak dengan mengunjungi Kampung Ciptagelar ini. Masyarakatnya hidup saling menghormati, saling gotong royong dan bertegur sapa saat bertemu. Berbeda 180 derajat dengan kita orang perkotaan yang cuek dan lebih fokus pada gadget. ', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3961.733923598173!2d106.49844201392459!3d-6.802189080610199!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42807955555555%3A0x5cb656a81e1e5b5c!2sCiptagelar!5e0!3m2!1sid!2sid!4v1532320416639', '1532320432818-wisata-cipta-gelar.jpg', '2018-07-23 04:33:52', '2018-07-23 04:33:52'),
('kue-mochi', 'Kue Mochi', 'kuliner', 'Jika Anda sedang mencari makanan khas Sukabumi yang cocok dijadikan oleh-oleh, maka kue mochi menjadi salah satu jawabannya. Tekstur kue yang kenyal dan rasanya yang gurih menjadi rasa yang sayang untuk dilewatkan jika Anda sedang mengunjungi Sukabumi. Dan tentu Anda pun ingin membagikan kebahagiaan dan kelezatan makanan ini kepada keluarga di rumah bukan?\r\nMaka dari itu, pilih kue mochi sebagai oleh-oleh. Ada banyak warna dan rasa yang dapat dijadikan alternatif pilihan. Namun, satu yang wajib dicoba yakni mochi lampion. Pengolahan mochi ini sudah terjamin dan terbukti keenakan rasanya hingga beberapa waktu dan membuat mereka yang sudah pernah merasakan akan ketagihan.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.8168890431243!2d106.9283272141332!3d-6.912485069572465!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e684834a61ab6b3%3A0xa3a3055e8adaae9d!2sMochi+Kaswari+Lampion!5e0!3m2!1sid!2sid!4v1532327697583', '1532327755349-wisata-kue-mochi.jpg', '2018-07-23 06:35:55', '2018-07-23 06:35:55'),
('kue-surabi', 'Kue Surabi', 'kuliner', 'Surabi adalah kue khas Jawa Barat yang sudah sangat terkenal terutama di daerah Bandung. Tapi ternyata surabi tidak hanya ada di Bandung saja, di Sukabumi juga ada surabi yang memiliki rasa yang tidak kalah enaknya. Makanan khas Sukabumi yang satu ini berbeda dari surabi yang berasal dari daerah lainnya karena salah satu bahan untuk membuatnya adalah durian. Rasa durian yang sangat enak menjadi ciri khas surabi asli Sukabumi ini. Untuk bisa mendapatkan surabi durian Sukabumi kamu bisa menuju ke daerah Jl. Jenderal Sudirman, disepanjang jalan ada banyak pedagang yang menjajakannya.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126742.47485142667!2d106.79241005187201!3d-6.926139708069482!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e6849dadac37a05%3A0x1857f0bd94402fa!2sSurabi+Tasik+Pak+Asep!5e0!3m2!1sid!2sid!4v1532361049900', '1532361116675-wisata-Surabi.jpg', '2018-07-23 15:51:56', '2018-07-23 15:52:10'),
('mie-goreng', 'Mie Goreng', 'kuliner', 'Buat kamu yang menyukai kuliner berbahan dasar mie, maka Sukabumi adalah destinasi yang sangat pas untuk menikmati berbagai olahan mie dengan ciri khas rasa yang cukup unik. Di Sukabumi terdapat banyak sekali kedai yang menjual mie Sukabumi yang bisa kamu pilih. Kamu bisa menemukan kedai yang menjual mie Sukabumi ini di sekitar daerah Jalan Jenderal Ahmad Yani. Salah satu kedai mie Sukabumi yang sangat populer adalah Kedai Mang Udin yang beralamat di Jl. Arif Rahman Hakim. Satu porsi makanan khas Sukabumi yang satu ini bisa kamu nikmati dengan harga 13.000 per porsinya.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7921.520580897835!2d106.9222152342677!3d-6.91923511482794!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68482fbf9681bf%3A0x5965b9c5d7e5d548!2sMie+Goreng+Udin+Nusantara!5e0!3m2!1sid!2sid!4v1532361773582', '1532361842798-wisata-Mie-Goreng-Sukabumi.jpg', '2018-07-23 16:04:02', '2018-07-23 16:04:02'),
('nasi-uduk-ungu', 'Nasi Uduk Ungu', 'kuliner', 'Nasi Uduk Ungu adalah makanan khas Sukabumi yang sangat populer karena keunikannya di bandingkan dengan nasi uduk pada umumnya. Jika biasanya nasi uduk terbuat dari beras sehingga berwarna putih, maka nasi uduk ungu ini benar-benar memiliki warna ungu yang berasal dari buah bit dan ubi ungu sebagai bahan pewarna alaminya. Rasanya juga sangat khas dan gurih. Seperti nasi uduk pada umumnya nasi uduk ungu ini juga di lengkapi dengan berbagai lauk seperti tempe dan tahu goreng, ayam, telur dadar, sayur lalapan dan sambal. Nasi uduk ungu cocok untuk di jadikan menu makan malam di Sukabumi.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9420.330724490554!2d106.91712984941628!3d-6.919120709882524!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e68482ebe6e327b%3A0x8e410a1dec0ae9cf!2sMamih+Ungu!5e0!3m2!1sid!2sid!4v1531237778591', 'Nasi-Uduk-Ungu.jpg', '2018-07-14 09:55:08', '2018-07-18 14:52:37'),
('pantai-cikadal', 'Pantai Cikadal', 'alam', 'Terletak di desa Mandrajaya, dan merupakan muara sungai Cikadal. Akses menuju pantai dapat menggunakan perahu dari pantai Palangpang, atau melalui jalan utama menuju desa Mandrajaya. Pantai putih ini tempat yang paling aman untuk berenang, karena deburan ombak besar terhalang oleh pulau-pulau kecil di hadapannya. Pada saat surut pengunjung dapat berjalan kaki menyebrangi laut yang dangkal menuju pulau Mandra. Akses menuju Gunung Badak dan Pulau Kunti dapat ditempuh berjalan kaki dari pantai ini.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3958.454951147568!2d106.44431971413626!3d-7.188815372552651!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42a17b557971db%3A0x41356a4f397822df!2sPantai+Cikadal!5e0!3m2!1sid!2sid!4v1532365899003', '1532365956753-wisata-Pantai-Cikadal.jpg', '2018-07-23 17:12:36', '2018-07-23 17:12:36'),
('pantai-cikembang', 'Pantai Cikembang', 'alam', 'Pantai indah lainnya yang ada di Sukabumi adalah Pantai Cikembang. Pantai yang berada di Cisolok, Kabupaten Sukabumi ini belum banyak dikunjungi orang sehingga kondisinya masih bersih dan alami. Pantai Cikembang ini suasananya cukup teduh karena ada banyak pohon ketapang di sepanjang pantai.  Pantai Cikembang ini kerap menjadi tempat berselancar para peselancar pemula. Ombaknya cukup aman untuk Anda yang  ingin bermain-main air. Saat mengunjungi Pantai Cikembang ini, Anda dapat melihat aktivitas harian kampung nelayan. Anda juga bisa meminta warga setempat untuk memasakkan seafood bakar dengan bumbu khas setempat. Pantai Cikembang ini relatif mudah untuk dicapai. Anda dapat mencapai pantai ini dengan kendaraan roda dua ataupun roda empat.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9419.490731773205!2d106.42081118629761!3d-6.961104030878421!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e428569141922bd%3A0x7622cd87d5ebfc29!2sPantai+Cikembang!5e0!3m2!1sid!2sid!4v1532320218582', '1532320236394-wisata-Pantai-Cikembang.jpg', '2018-07-23 04:30:36', '2018-07-23 04:30:36'),
('pantai-cikepuh', 'Pantai Cikepuh', 'alam', 'Pantai Cikepuh terletak di desa Mandrajaya, dan ditempuh sekitar 45 menit dengan perahu dari pantai Cikadal. Pantai ini merupakan akses terdekat menuju gua laut Sodong Parat, batu Kura-kura, Sungai Cikepuh. Dari muara Sungai Cikepuh hingga Sodong Parat merupakan lokasi terbaik untuk melihat hubungan antara batuan peridotit, gabro, amfibolit dan plagiogranit', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3958.013109413907!2d106.37899051413682!3d-7.2393426731110155!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42a4920cfb38b9%3A0xe0f01120f8222add!2sPantai+Cikepuh!5e0!3m2!1sid!2sid!4v1532366100947', '1532366153609-wisata-Pantai-Cikepuh.jpg', '2018-07-23 17:15:53', '2018-07-23 17:15:53'),
('pantai-cimaja', 'Pantai Cimaja', 'alam', 'Pantai ini adalah satu-satunya pantai di Sukabumi yang memiliki ombak ganas pantai selatan yang terkenal itu. Pemandangan Pantai Cimaja yang cantik dan ombak yang besar membikin pantai ini menjadi lokasi unggulan bagi para surfer. Kontur pantai yang berbeda dengan pantai pada biasanya, menjadikan Pantai Cimaja sebagai obyek wisata bahari yang sungguh menarik untuk dikunjungi. Hamparan bebatuan kali akan menghiasi pesisir pantai ini yang mampu memberikan pemandangan indah tersendirinya.\r\n\r\nJarak tempuh dari Jakarta ke Pantai Cimaja sekitar ±120 km dan dari Bandung menempuh jarak ±203 km. Hampir tiap akhir pekan, antara Jumat sampai Minggu wilayah pantai ini senantiasa dipenuhi oleh para peselancar dari lokal ataupun luar negeri. Bukan cuma masyarakat sekitar atau atlet asal Jakarta dan Bandung, melainkan juga ekspatriat yang berprofesi di sejumlah kota besar di tanah air dan yang seketika datang dari luar negeri menguji ombak Pantai Cimaja ini. Hal ini pula yang menciptakan Pantai Cimaja mengantongi predikat sebagai Bali-nya Sukabumi.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d47469.90240652408!2d106.48018446477741!3d-6.974491298470067!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e428328d165b7c7%3A0x529d5f019336e981!2sPantai+Cimaja!5e0!3m2!1sid!2sid!4v1532365079632', '1532365212047-wisata-Pantai-Cimaja.jpg', '2018-07-23 17:00:12', '2018-07-23 17:00:12'),
('pantai-citepus', 'Pantai Citepus', 'alam', 'Sukabumi bukan hanya memiliki Pantai Pelabuhan Ratu. Masih ada pantai-pantai lainnya yang juga indah. Salah satunya adalah Pantai Citepus. Pantai Citepus ini terletak di tepi jalan raya Cisolok – Pelabuhan Ratu, tepatnya di Desa Citepus, Kecamatan Palabuhan Ratu. Pantai berpasir putih ini menjadi destinasi wisata favorit warga Sukabumi. Ombaknya relatif besar namun Anda masih bisa berenang di titik-titik tertentu. Selain untuk wisata, Pantai Citepus ini juga menjadi lokasi penangkapan ikan keci oleh penduduk setempat.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d32610.97903180692!2d106.50915703326146!3d-6.970813199590653!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e429d5743e4f645%3A0xfe7c7860376ba30f!2sPantai+Citepus!5e0!3m2!1sid!2sid!4v1532319731838', '1532319748757-wisata-pantai-citepus.jpg', '2018-07-23 04:22:28', '2018-07-23 04:22:28'),
('pantai-ujung-genteng', 'Pantai Ujung Genteng', 'alam', 'Sukabumi juga memiliki Pantai Ujung Genteng yang tak kalah eksotis. Pantai Ujung genteng merupakan salah satu pantai di Sukabumi yang paling menarik. Letaknya ada di bagian selatan Kota Sukabumi dan untuk bisa sampai ke lokasi kamu bisa menempuh perjalanan darat selama kurang lebih 4 jam. Yang paling menarik dari pantai ini adalah bibir pantainya yang memiliki pasir landai berwarna putih bersih. Perairan di sekitar pantai juga sangat jernih dengan ombak yang kecil, sangat cocok buat kamu yang ingin berenang. Jika sedang beruntung, kamu juga mungkin akan berkesempatan untuk melihat penyu-penyu  yang sedang bertelur.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15827.712688692845!2d106.39291561685987!3d-7.361948584086092!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e42aef0721de5c1%3A0xbf289416a955b3a8!2sPantai+Ujung+Genteng!5e0!3m2!1sid!2sid!4v1532365249317', '1532365348396-wisata-Pantai-Ujung-Genteng.jpg', '2018-07-23 17:02:28', '2018-07-23 17:02:28'),
('roti-priangan', 'Roti Priangan', 'kuliner', 'Makanan legendaris asal Sukabumi yang wajib dinikmati selanjutnya adalah roti Priangan. Roti yang memiliki adonan khusus ini sangat diburu para wisatawan dan mereka yang berkunjung ke Sukabumi. Rasa yang enak dan lezat menjadi salah satu pesona yang sulit ditolak untuk memanjakan lidah Anda.\r\nRoti Priangan dengan nama Oey Tjiang Lie yang mulai berdiri sejak 1943 hingga kini adalah bukti betapa banyaknya orang yang tersihir kelezatan roti priangan. Dan Anda pun harus menjadi salah satunya, serta memberikan kenikmatan ini tak lupa untuk keluarga di rumah yang menantikan oleh-oleh khas dari Sukabumi.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.7002350220573!2d106.92005771413343!3d-6.926390269719485!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e684824e957b245%3A0x87c5c1f21278483a!2sRoti+Priangan1!5e0!3m2!1sid!2sid!4v1532327837881', '1532327900721-wisata-roti-priangan.jpg', '2018-07-23 06:38:20', '2018-07-23 06:38:20'),
('sekoteng-singapore', 'Sekoteng Singapore', 'kuliner', 'Nah, kalau tadi disajikan beberapa menu makanan dan rekomendasi buah tangan untuk sanak Saudara yang jadi khas kota Sukabumi, maka kali ini ada menu minuman yang juga sayang untuk dilewatkan.\r\nBiasanya bisa ditemukan pada malam hari, kuliner khas Sukabumi yang konon berasal dari negara tetangga Singapura ini tentu akan memberikan cita rasa berbeda yang bisa Anda nikmati.\r\nAnda dapat menemukan menu sekoteng Singapore ini di kawasan Jenderal Ahmad Yani. Jika dibandingkan dengan sekoteng pada umumnya, yang membedakan menu ini adalah terdapat roti jahe yang merupakan ciri khas Sukabumi yang ikut masuk ke dalam sekoteng.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.7302771483487!2d106.93161221436722!3d-6.922811894998034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e684838246c4473%3A0x6a43ad39544425bd!2sSekoteng+Singapore!5e0!3m2!1sid!2sid!4v1532327983777', '1532328065968-wisata-sekoteng-singapore.jpg', '2018-07-23 06:41:05', '2018-07-23 06:41:05'),
('situ-gunung', 'Situ Gunung', 'alam', 'Salah satu tempat wisata di Sukabumi yang sudah dikenal adalah Situ Gunung. Situ Gunung ini artinya adalah danau di gunung. Sesuai namanya, Situ Gunung ini terletak di kaki gunung di kawasan Taman Nasional Gunung Pangrango pada ketinggian 850 mdpl.  Jaraknya kira-kira 16 km dari pusat kota Sukabumi. Situ Gunung ini dikelilingi hutan pinus dan hawanya pun sangat sejuk. Konon, Situ Gunung ini adalah danau buatan yang dibuat dalam tujuh hari, lho! Selain menikmati indahnya pemandangan indah, di Situ Gunung Anda juga dapat menyewa perahu dan mengelilingi danau. Di kawasan Situ Gunung ini juga sudah terdapat fasilitas outbond, camping ground, losmen dan juga villa. Di kawasan Situ Gunung ini Anda juga dapat menjumpai air terjun yang bernama Curug Sawer.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d10274.716092485281!2d106.90729721365554!3d-6.83717900576273!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e684a7d24eb8f4f%3A0x1e5e0f34bcb62779!2sSitu+Gn.!5e0!3m2!1sid!2sid!4v1532319613719', '1532319667133-wisata-Situ-Gunung.jpg', '2018-07-23 04:21:07', '2018-07-23 04:21:07'),
('situ-sukarame', 'Situ Sukarame', 'alam', 'Tempat wisata di Sukabumi yang keberadaannya sudah cukup lama namun ramai dikunjungi hingga saat ini adalah Situ Sukarame. Situ Sukarame ini terletak di Kampung Parakansalak, Kecamatan Parakansalak, Kabupaten Sukabumi. Pemandangan alam di sini sangatlah indah dan asri. Situ Sukarame ini dikeliling perkebunan teh milik PT Perkebunan The Nusantara VIII. Dengan latar pegunungan dan hawa yang sejuk, Anda pasti akan betah untuk berlama-lama di Situ Sukarame ini. Di sini, Anda bisa berkeliling danau dengan perahu kayu. Ada juga wahana outbond dan flying fox. Situ Sukarame ini juga kerap menjadi lokasi camping bagi pramuka ataupun komunitas lainnya.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3961.7994708857677!2d106.71031331413208!3d-6.794237168335187!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69d2bbffffffff%3A0x37f2d91668cf8fa1!2sSitu+Sukarame!5e0!3m2!1sid!2sid!4v1532320703548', '1532320721121-wisata-situ-sukarame.jpg', '2018-07-23 04:38:41', '2018-07-23 04:38:41'),
('sungai-citarik', 'Sungai Citarik', 'alam', 'Tempat wisata di Sukabumi yang selanjutnya adalah Sungai Citarik. Sama seperti Goa Buniayu, sungai ini juga menawarkan sensasi liburan yang menantang. Jangan samakan Sungai Citarik dengan sungai-sungai lainnya, sungai ini punya aliran air yang sangat deras yang sulit di temukan di sungai lain di daerah Sukabumi. Karena itulah Sungai Citarik menjadi spot paling favorit untuk melakukan arum jeram di Sukabumi. \r\nTidak hanya itu saja, di tempat ini juga sudah di bangun berbagai fasilitas pelengkap dan wahana outbond yang cukup seru untuk di mainkan seperti flying fox, paintball, panjat jaring, team building, dan wahana outbond lainnya. Jangan lewatkan tempat yang satu ini jika kamu sedang jalan jalan ke Sukabumi.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126730.70101614509!2d106.50841015235765!3d-6.969818092220734!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e6828ee94a11e4f%3A0x69f853c74d42366c!2sRafting+Citarik!5e0!3m2!1sid!2sid!4v1532365794808', '1532365862571-wisata-Sungai-Citarik.jpg', '2018-07-23 17:11:02', '2018-07-23 17:11:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ticket`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username_login` (`username_login`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`wisata_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `ticket` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
