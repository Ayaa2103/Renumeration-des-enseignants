-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2023 at 06:19 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(127) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(127) NOT NULL,
  `lname` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `fname`, `lname`) VALUES
(1, 'admin', '$2y$10$H7obJEdmLzqqcPy7wQWhsOLUvrgzC8f1Y1or2Gxaza5z1PT0tvLy6', 'Aya', 'Belhou');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `grade`, `section`) VALUES
(2, 1, 1),
(3, 3, 3),
(4, 2, 1),
(7, 1, 6),
(8, 7, 1),
(9, 1, 2),
(10, 7, 3),
(11, 7, 2),
(12, 1, 3),
(13, 2, 2),
(14, 2, 6),
(15, 3, 1),
(16, 3, 2),
(17, 3, 6),
(18, 4, 1),
(19, 4, 2),
(20, 4, 3),
(21, 4, 6),
(22, 7, 6),
(23, 8, 1),
(24, 8, 2),
(25, 8, 3),
(26, 8, 6),
(27, 1, 7),
(28, 2, 7),
(29, 3, 7),
(30, 4, 7),
(31, 7, 7),
(32, 8, 7),
(33, 8, 8),
(34, 7, 8),
(35, 4, 8),
(36, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `grade` varchar(31) NOT NULL,
  `grade_code` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `grade`, `grade_code`) VALUES
(1, 'Tronc commun', 'Lycée'),
(2, '1année bac', 'Lycée'),
(3, '2eme année bac', 'Lycée'),
(4, '3eme collège', 'collège'),
(7, '2eme collège', 'collège'),
(8, '1ère année college', 'Lycée');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender_full_name` varchar(100) NOT NULL,
  `sender_email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `sender_full_name`, `sender_email`, `message`, `date_time`) VALUES
(1, 'John doe', 'es@gmail.com', 'Hello, world', '2023-02-17 23:39:15'),
(2, 'John doe', 'es@gmail.com', 'Hi', '2023-02-17 23:49:19'),
(3, 'John doe', 'es@gmail.com', 'Hey, ', '2023-02-17 23:49:36'),
(4, 'Aya belhou', 'aya.belhou@gmail.com', 'Merci !', '2023-06-07 14:04:09'),
(5, 'Aya belhou', 'aya.belhou@gmail.com', 'bonjour&', '2023-06-07 15:40:27');

-- --------------------------------------------------------

--
-- Table structure for table `registrar_office`
--

CREATE TABLE `registrar_office` (
  `r_user_id` int(11) NOT NULL,
  `username` varchar(127) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(31) NOT NULL,
  `lname` varchar(31) NOT NULL,
  `address` varchar(31) NOT NULL,
  `employee_number` int(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `phone_number` varchar(31) NOT NULL,
  `qualification` varchar(31) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `date_of_joined` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrar_office`
--

INSERT INTO `registrar_office` (`r_user_id`, `username`, `password`, `fname`, `lname`, `address`, `employee_number`, `date_of_birth`, `phone_number`, `qualification`, `gender`, `email_address`, `date_of_joined`) VALUES
(1, 'aya', '$2y$10$b6eq4SB.NfwO6o5Y8ZdL.e453H1T8fEjak2BPEcCfOlZ5hNGVfT3.', 'Aya', 'Belhou', 'maroc, kenitra', 2103, '1991-02-05', '+212658435145', 'Master', 'Female', 'aya.b@ou.ma', '2022-10-23 01:03:25');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(6, 'D'),
(7, 'E'),
(8, 'F');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `current_year` int(11) NOT NULL,
  `current_semester` varchar(11) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `slogan` varchar(300) NOT NULL,
  `about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `current_year`, `current_semester`, `school_name`, `slogan`, `about`) VALUES
(1, 2023, 'II', 'G.S enseignants', 'est une plateforme en ligne spécialement conçue pour les administrations des écoles privées afin de gérer la rémunération de leurs enseignants.', 'G.S enseignants est une application Web qui permet aux écoles privées, enseignants et personnels administratifs d’éditer, consulter, imprimer, modifier toutes les informations et rénumerer tous les enseignants d’un établissement scolaire en ligne à travers Internet.');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(31) NOT NULL,
  `subject_code` varchar(31) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject`, `subject_code`, `grade`) VALUES
(1, 'Anglais', 'An', 1),
(2, 'Physique', 'Phy', 2),
(3, 'Science de la vie et de terre', 'SVT', 1),
(4, 'Mathematiques', 'Maths', 1),
(5, 'Chimie', 'ch', 1),
(6, 'Science Ingenieurie', 'S.I', 3),
(7, 'Java', 'java', 1),
(8, 'informatique', 'info', 2);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `username` varchar(127) NOT NULL,
  `password` varchar(255) NOT NULL,
  `class` varchar(31) NOT NULL,
  `fname` varchar(127) NOT NULL,
  `lname` varchar(127) NOT NULL,
  `subjects` varchar(31) NOT NULL,
  `address` varchar(31) NOT NULL,
  `employee_number` int(11) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` varchar(31) NOT NULL,
  `qualification` varchar(127) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `date_of_joined` datetime NOT NULL DEFAULT current_timestamp(),
  `number_of_hours` int(225) NOT NULL,
  `salary` int(255) NOT NULL,
  `taux_horaire` int(255) NOT NULL,
  `nombre_absence` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `username`, `password`, `class`, `fname`, `lname`, `subjects`, `address`, `employee_number`, `date_of_birth`, `phone_number`, `qualification`, `gender`, `email_address`, `date_of_joined`, `number_of_hours`, `salary`, `taux_horaire`, `nombre_absence`) VALUES
(11, 'hamza', '$2y$10$5NhRI/gN0z3MY0NSsdHtpu7ZUhZVtZzVyHrVxESs.ldY0ptPVq.bS', '2', 'hamza', 'tbaila', '78', 'LOT EL MAJD', 2103, '2001-02-25', '0620939321', 'Doctorat', 'Male', 'hamza.t@gmail.com', '2023-06-09 09:20:20', 80, 6300, 90, 10),
(12, 'mohamed', '$2y$10$USds8q6mCbZ1DnoEWDDLEewpJefUy.pwr4BIT.I9Rah9s6nQpqDRW', '24', 'Mohamed', 'el khouzai', '5', 'beni mellal, 12 D, Maroc', 1212, '1977-10-04', '0612131415', 'Licence', 'Male', 'mohamed.k@ou.ma', '2023-06-12 16:15:40', 90, 3000, 90, 0),
(13, 'najat', '$2y$10$s7pvKr2WTocMr9Ty8FOm0.Hs37qv3kTNhRiBDCFJTpwP5W1gxbcCu', '2', 'najat', 'ouahidi', '2', 'Kenitra,12 C zone d\'activite Ma', 1313, '1661-01-01', '0661602527', 'Master', 'Female', 'najat.o@ou.ma', '2023-06-12 16:19:02', 70, 4500, 120, 0),
(14, 'jihane', '$2y$10$a8WqzmaNcuoXTo5S4Uv7suVuhRO92QL0WnDIDFWlXew3I5iP9ulVq', '7', 'jihane', 'belhou', '1', 'kenitra, maroc', 1414, '1999-03-17', '0611202342', 'Doctorat', 'Female', 'jihane.b@ou.ma', '2023-06-12 16:21:34', 150, 5500, 150, 0),
(15, 'karima', '$2y$10$dmlQ9koYehxqOUDRS5EIV.aowZbrE6IRHKr9dwFSSRw2VGJUD5cU.', '8', 'karima', 'allali', '3', 'casablanca,12 D ain sebaa, maro', 1241, '1976-01-02', '0675747372', 'Licence', 'Female', 'karima.allali@ou.ma', '2023-06-12 16:23:24', 90, 3000, 90, 0),
(16, 'naouar', '$2y$10$sdhNJ2y/uM4s2csbOPdhPee35cqzwypPOZFkg/Ck8gQs6UlRo0I1C', '27', 'naouar', 'belhou', '1', 'casablanca,Ainsebaa,appt 45', 2121, '1985-12-03', '0656463623', 'Doctorat', 'Female', 'naouar.b@ou.ma', '2023-06-12 16:25:21', 150, 5500, 150, 0),
(17, 'adil', '$2y$10$6OtVqK44rdzBq8el8Uh.HOdmVQW5pfyBrqWEMxv0jIjb0tpA1Yt8O', '24', 'adil', 'tbaila', '5', 'Hedkourt, elMajd 115,maroc', 3434, '1987-02-11', '0620304345', 'Doctorat', 'Male', 'adil.t@ou.ma', '2023-06-12 16:27:37', 150, 5500, 150, 0),
(18, 'mehdi', '$2y$10$D1G/vQVngcmUIywH5eEqluZ.eHqq5f1QU5NDZqlssg684bhVSb6FS', '48', 'mehdi', 'tbail', '7', 'tantan, 12 D, maroc', 1776, '1993-01-04', '0654535251', 'Master', 'Male', 'mehdi.t@ou.ma', '2023-06-12 16:31:08', 70, 6700, 120, 0),
(19, 'brahim', '$2y$10$MTMvF04fiAZBuV1a92Lg1uZrhVty06M8J0HvJwIFQjVHPXMjCKONO', '2', 'brahim', 'belaj', '6', 'sela,132 Azouhour, maroc', 1887, '1996-03-02', '0676757487', 'Licence', 'Male', 'brahim.belaj@ou.ma', '2023-06-12 16:34:53', 60, 3000, 100, 0),
(20, 'med', '$2y$10$UV6ZCAH.2UVOZwO0M1Vg3eziV9So0cv/aeM/ZQ5A/soLZUtZIJMsm', '24', 'med', 'qelouli', '6', 'Larache,12 zone C, maroc', 3245, '1967-02-03', '0768795949', 'Licence', 'Male', 'med.q@ou.ma', '2023-06-12 18:48:52', 90, 3000, 90, 0),
(21, 'mehdis', '$2y$10$WAqIyzhxGhVvdfh7bW.QbuVnBs7Umk5RYzVYSFU5vouPbYvI6vbp.', '29', 'mehdi', 'saalm', '7', 'LOT EL MAJD 2', 1432, '1968-12-03', '0620932435', 'Licence', 'Male', 'mehdi.s@ou.ma', '2023-06-18 15:31:12', 90, 3000, 90, 0),
(22, 'salma', '$2y$10$qr84JUp/Xb3XgDW2CB0ML.50Z4DBWoXqAftaQY/r3ZAeRqLcxjth.', '2', 'salma', 'yamni', '5', 'Kenutra,ville haute', 1554, '1987-04-01', '0678897656', 'Master', 'Female', 'salma.y@ou.ma', '2023-06-18 15:33:43', 70, 4500, 120, 0),
(23, 'fatima', '$2y$10$etexrr7od6xJwBZBjm0Ba.WyQdd8Y2D1SQRsUHiq4.3QzGJJFn.c.', '3', 'fatima', 'ghouila', '2', 'Ourida,kenitra ', 1997, '1992-02-10', '0767854632', 'Master', 'Female', 'fatima.gh@ou.ma', '2023-06-18 15:35:14', 120, 4500, 120, 0),
(24, 'ayoub', '$2y$10$KpfXUq5PgFoiPb.p9QmY/OyC2qEPmizZ2gdglylONi2EEIUMquL0W', '4', 'ayoub', 'belhou', '7', 'Kenitra,maroc', 1653, '1997-01-10', '0620434521', 'Licence', 'Male', 'ayoub.b@ou.ma', '2023-06-18 15:50:12', 0, 3000, 90, 0),
(25, 'ayman', '$2y$10$wEsmHZRzn2onTieoG569i.LvWoTGB/egY8knkbd4Y7fjcTsLgLQvS', '3', 'Ayman', 'chahbi', '6', 'Azzouhour,selaa', 1987, '1987-03-18', '+212687654234', 'Licence', 'Male', 'ayman.ch@ou.ma', '2023-06-20 21:43:13', 0, 4500, 90, 0),
(27, 'fadwa', '$2y$10$hKHeOhSqkUvj9xb0IfNRU.OHCRruEwuao2JO8.EV8.LwTxZB6ABpG', '4', 'Fadwa', 'sennouni', '3', 'Kenitra, maroc', 1854, '1987-12-11', '+212687654232', 'Master', 'Female', 'fadwa.se@ou.ma', '2023-06-20 21:58:22', 0, 5000, 120, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `registrar_office`
--
ALTER TABLE `registrar_office`
  ADD PRIMARY KEY (`r_user_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registrar_office`
--
ALTER TABLE `registrar_office`
  MODIFY `r_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
