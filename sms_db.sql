-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 18 juin 2023 à 00:58
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sms_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(127) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(127) NOT NULL,
  `lname` varchar(127) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`admin_id`, `username`, `password`, `fname`, `lname`) VALUES
(1, 'admin', '$2y$10$H7obJEdmLzqqcPy7wQWhsOLUvrgzC8f1Y1or2Gxaza5z1PT0tvLy6', 'Aya', 'Belhou');

-- --------------------------------------------------------

--
-- Structure de la table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `class`
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
-- Structure de la table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `grade` varchar(31) NOT NULL,
  `grade_code` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `grades`
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
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender_full_name` varchar(100) NOT NULL,
  `sender_email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`message_id`, `sender_full_name`, `sender_email`, `message`, `date_time`) VALUES
(1, 'John doe', 'es@gmail.com', 'Hello, world', '2023-02-17 23:39:15'),
(2, 'John doe', 'es@gmail.com', 'Hi', '2023-02-17 23:49:19'),
(3, 'John doe', 'es@gmail.com', 'Hey, ', '2023-02-17 23:49:36'),
(4, 'Aya belhou', 'aya.belhou@gmail.com', 'Merci !', '2023-06-07 14:04:09'),
(5, 'Aya belhou', 'aya.belhou@gmail.com', 'bonjour&', '2023-06-07 15:40:27');

-- --------------------------------------------------------

--
-- Structure de la table `registrar_office`
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
-- Déchargement des données de la table `registrar_office`
--

INSERT INTO `registrar_office` (`r_user_id`, `username`, `password`, `fname`, `lname`, `address`, `employee_number`, `date_of_birth`, `phone_number`, `qualification`, `gender`, `email_address`, `date_of_joined`) VALUES
(1, 'ahmed', '$2y$10$b6eq4SB.NfwO6o5Y8ZdL.e453H1T8fEjak2BPEcCfOlZ5hNGVfT3.', 'ahmed', 'belazri', 'maroc, kenitra', 1011, '1972-01-26', '+12328324092', 'l', 'Male', 'james@j.com', '2022-10-23 01:03:25');

-- --------------------------------------------------------

--
-- Structure de la table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `section`
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
-- Structure de la table `setting`
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
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `current_year`, `current_semester`, `school_name`, `slogan`, `about`) VALUES
(1, 2023, 'II', 'G.S enseignants', 'est une plateforme en ligne spécialement conçue pour les administrations des écoles privées afin de gérer la rémunération de leurs enseignants.', 'G.S enseignants est une application Web qui permet aux écoles privées, enseignants et personnels administratifs d’éditer, consulter, imprimer, modifier toutes les informations et rénumerer tous les enseignants d’un établissement scolaire en ligne à travers Internet.');

-- --------------------------------------------------------

--
-- Structure de la table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `username` varchar(127) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(127) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `grade` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `address` varchar(31) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_joined` timestamp NULL DEFAULT current_timestamp(),
  `parent_fname` varchar(127) NOT NULL,
  `parent_lname` varchar(127) NOT NULL,
  `parent_phone_number` varchar(31) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `students`
--

INSERT INTO `students` (`student_id`, `username`, `password`, `fname`, `lname`, `grade`, `section`, `address`, `gender`, `email_address`, `date_of_birth`, `date_of_joined`, `parent_fname`, `parent_lname`, `parent_phone_number`) VALUES
(1, 'john', '$2y$10$xmtROY8efWeORYiuQDE3SO.eZwscao20QNuLky1Qlr88zDzNNq4gm', 'John', 'Doe', 1, 1, 'California,  Los angeles', 'Male', 'abas55@ab.com', '2012-09-12', '2019-12-11 14:16:44', 'Doe', 'Mark', '09393'),
(3, 'abas', '$2y$10$KLFheMWgpLfoiqMuW2LQxOPficlBiSIJ9.wE2qr5yJUbAQ.5VURoO', 'Abas', 'A.', 2, 1, 'Berlin', 'Male', 'abas@ab.com', '2002-12-03', '2021-12-01 14:16:51', 'dsf', 'dfds', '7979'),
(4, 'jo', '$2y$10$pYyVlWg9jxkT0u/4LrCMS.ztMaOvgyol1hgNt.jqcFEqUC7yZLIYe', 'John3', 'Doe', 1, 1, 'California,  Los angeles', 'Female', 'jo@jo.com', '2013-06-13', '2022-09-10 13:48:49', 'Doe', 'Mark', '074932040'),
(5, 'jo2', '$2y$10$lRQ58lbak05rW7.be8ok4OaWJcb9znRp9ra.qXqnQku.iDrA9N8vy', 'Jhon', 'Doe', 1, 1, 'UK', 'Male', 'jo@jo.com', '1990-02-15', '2023-02-12 18:11:26', 'Doe', 'Do', '0943568654');

-- --------------------------------------------------------

--
-- Structure de la table `student_score`
--

CREATE TABLE `student_score` (
  `id` int(11) NOT NULL,
  `semester` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `results` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `student_score`
--

INSERT INTO `student_score` (`id`, `semester`, `year`, `student_id`, `teacher_id`, `subject_id`, `results`) VALUES
(1, 'II', 2021, 1, 1, 1, '10 15,15 20,10 10,10 20,30 35'),
(2, 'II', 2023, 1, 1, 4, '15 20,4 5'),
(3, 'I', 2022, 1, 1, 5, '10 20,50 50');

-- --------------------------------------------------------

--
-- Structure de la table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject` varchar(31) NOT NULL,
  `subject_code` varchar(31) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `subjects`
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
-- Structure de la table `teachers`
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
  `taux_horaire` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `username`, `password`, `class`, `fname`, `lname`, `subjects`, `address`, `employee_number`, `date_of_birth`, `phone_number`, `qualification`, `gender`, `email_address`, `date_of_joined`, `number_of_hours`, `salary`, `taux_horaire`) VALUES
(9, 'ayoub', '$2y$10$H7obJEdmLzqqcPy7wQWhsOLUvrgzC8f1Y1or2Gxaza5z1PT0tvLy6', '23', 'ayoub', 'Belhou', '1', ' LOT C,kenitra', 3003, '1997-01-11', '0658321234', 'Master', 'Male', 'ayoub.b@gmail.com', '2023-06-08 23:49:22', 120, 23500, 300),
(11, 'hamza', '$2y$10$9ThThKgryT5u0rFj/G3KLOLLchnN5ZGpJXNRJE5WBku0eVDbGoQfy', '34', 'hamza', 'tbaila', '78', 'LOT EL MAJD', 2103, '2001-02-25', '0620939321', 'Doctorat', 'Male', 'hamza.t@gmail.com', '2023-06-09 09:20:20', 10, 0, 0),
(12, 'mohamed', '$2y$10$USds8q6mCbZ1DnoEWDDLEewpJefUy.pwr4BIT.I9Rah9s6nQpqDRW', '24', 'Mohamed', 'el khouzai', '5', 'beni mellal, 12 D, Maroc', 1212, '1977-10-04', '0612131415', 'Licence', 'Male', 'mohamed.k@ou.ma', '2023-06-12 16:15:40', 0, 0, 0),
(13, 'najat', '$2y$10$s7pvKr2WTocMr9Ty8FOm0.Hs37qv3kTNhRiBDCFJTpwP5W1gxbcCu', '2', 'najat', 'ouahidi', '2', 'Kenitra,12 C zone d\'activite Ma', 1313, '1661-01-01', '0661602527', 'Master', 'Female', 'najat.o@ou.ma', '2023-06-12 16:19:02', 0, 0, 0),
(14, 'jihane', '$2y$10$a8WqzmaNcuoXTo5S4Uv7suVuhRO92QL0WnDIDFWlXew3I5iP9ulVq', '7', 'jihane', 'belhou', '1', 'kenitra, maroc', 1414, '1999-03-17', '0611202342', 'Doctorat', 'Female', 'jihane.b@ou.ma', '2023-06-12 16:21:34', 0, 0, 0),
(15, 'karima', '$2y$10$dmlQ9koYehxqOUDRS5EIV.aowZbrE6IRHKr9dwFSSRw2VGJUD5cU.', '8', 'karima', 'allali', '3', 'casablanca,12 D ain sebaa, maro', 1241, '1976-01-02', '0675747372', 'Licence', 'Female', 'karima.allali@ou.ma', '2023-06-12 16:23:24', 0, 0, 0),
(16, 'naouar', '$2y$10$sdhNJ2y/uM4s2csbOPdhPee35cqzwypPOZFkg/Ck8gQs6UlRo0I1C', '27', 'naouar', 'belhou', '1', 'casablanca,Ainsebaa,appt 45', 2121, '1985-12-03', '0656463623', 'Doctorat', 'Female', 'naouar.b@ou.ma', '2023-06-12 16:25:21', 0, 0, 0),
(17, 'adil', '$2y$10$6OtVqK44rdzBq8el8Uh.HOdmVQW5pfyBrqWEMxv0jIjb0tpA1Yt8O', '24', 'adil', 'tbaila', '5', 'Hedkourt, elMajd 115,maroc', 3434, '1987-02-11', '0620304345', 'Doctorat', 'Male', 'adil.t@ou.ma', '2023-06-12 16:27:37', 0, 0, 0),
(18, 'mehdi', '$2y$10$D1G/vQVngcmUIywH5eEqluZ.eHqq5f1QU5NDZqlssg684bhVSb6FS', '48', 'mehdi', 'tbail', '7', 'tantan, 12 D, maroc', 1776, '1993-01-04', '0654535251', 'Master', 'Male', 'mehdi.t@ou.ma', '2023-06-12 16:31:08', 0, 0, 0),
(19, 'brahim', '$2y$10$MTMvF04fiAZBuV1a92Lg1uZrhVty06M8J0HvJwIFQjVHPXMjCKONO', '2', 'brahim', 'belaj', '6', 'sela,132 Azouhour, maroc', 1887, '1996-03-02', '0676757487', 'Licence', 'Male', 'brahim.belaj@ou.ma', '2023-06-12 16:34:53', 0, 0, 0),
(20, 'med', '$2y$10$UV6ZCAH.2UVOZwO0M1Vg3eziV9So0cv/aeM/ZQ5A/soLZUtZIJMsm', '24', 'med', 'qelouli', '6', 'Larache,12 zone C, maroc', 3245, '1967-02-03', '0768795949', 'Licence', 'Male', 'med.q@ou.ma', '2023-06-12 18:48:52', 0, 0, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Index pour la table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Index pour la table `registrar_office`
--
ALTER TABLE `registrar_office`
  ADD PRIMARY KEY (`r_user_id`);

--
-- Index pour la table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `student_score`
--
ALTER TABLE `student_score`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Index pour la table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `registrar_office`
--
ALTER TABLE `registrar_office`
  MODIFY `r_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `student_score`
--
ALTER TABLE `student_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
