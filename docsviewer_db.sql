-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 28, 2026 at 08:27 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docsviewer_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int NOT NULL,
  `titre` varchar(255) NOT NULL,
  `auteur` varchar(100) NOT NULL,
  `contenu` text,
  `nom_fichier` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `titre`, `auteur`, `contenu`, `nom_fichier`) VALUES
(8, 'Jakarta EE', 'Benito HIIPS', 'Apprendre la programmation web avec Jakarta EE', 'PROGRAMMATION AVANCEE.pdf'),
(9, 'Bases du NoSQL 2', 'Benoît H. GUENKAN', 'Apprendre le NoSQL - Partie 2', 'Chapitre 2 les modeles de données.pdf'),
(10, 'Bases du NoSQL 3', 'Benoît H. GUENKAN', 'Apprendre le NoSQL - Partie 3', 'Chapitre 3 Plus de détails sur les modeles.pdf'),
(11, 'Modelisation Orienté objet', 'Sacha AFIBA', 'Apprendre les concepts orienté objet avec UML', 'Concepts OO avec UML.pdf'),
(12, 'Systèmes d\'exploitation', 'Hermann TCHEFFO', 'Comprendre les processus des systèmes d\'exploitation', 'CH01.pdf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
