-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: localhost
-- Timp de generare: iun. 22, 2024 la 12:17 PM
-- Versiune server: 10.4.28-MariaDB
-- Versiune PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `ReFi`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(128) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Eliminarea datelor din tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `is_admin`) VALUES
(1, 'denisd', 'denis@cloud.com', '$2y$10$5n.Cgb.bXC0KvHPkhxOcE.EbJdQXBeW2QfYPKX6jSsu14FKXTy4eW', 0),
(2, 'a', 'a@a.a', '$2y$10$2QgYskM6455w5Z5BAu8fp.wwXeeH7PGIvz3FqoYDMpG8kZLPcCN8i', 0),
(3, 'new.asm', 'test@gmail.com', '$2y$10$/iYgh7If.dD/tk6IHDVWB.jjMT.8AbmVanttAMTxt3UY8OUhlZVPK', 0),
(4, 'log', 'log@log.io', '$2y$10$rg27WrLeShyFsYcXSUQpmevCMd/cfFqZ8Ugy6os9iYz4uINOe5Wo6', 0),
(5, 'user', 'user@user.com', '$2y$10$ORz9titqYpRuHg4efNdFhuBETdwi.MxWdWyaJgdtG4YhrmETeXoQ6', 0),
(6, 'denis', 'roca@gmial.c', '$2y$10$ffK.JNCHyyxr4VFP8lH82OBZ066tK4JF6qdKHTRBrwzb3Va/2aFDu', 0),
(7, 'a', 'a@a.b', '$2y$10$lJ6Fk9rbSkgta0rTjuE.Je3ueUb8xH.WRrZELw3zniFvovo8W4smO', 0),
(8, 'a', 'd@d.a', '$2y$10$RWFPbUNFvf0yFQdEonsMweSsjynHK0apW7nbTQDm35PPTe.3a3bL2', 0),
(9, 'b', 'b@b.b', '$2y$10$QrVDzktTvXkNaFMRJyPOvenzjEHjMJi/QTOEEt./ZrmEoUSJ0rzyS', 0),
(10, 'c', 'c@c.c', '$2y$10$PHIn0BiY0A9lnDUAq7zJ0emH6uvAuOa/EYYvjiqiCZBeGCnRBFBW2', 0),
(11, 'c', 'c@c.a', '$2y$10$JPXFUqwJctbfTPDuRcHxceuWomtHXY9RNMoGeLxYbF2JbfvqSfKqS', 0),
(12, 'c', 'c@c.b', '$2y$10$Wau.AcsyDWoyRKvB5N1oFOB2QLf3FArf6eEaHpPCKXAreWBsu52Z.', 0),
(13, 'b', 'b@b.a', '$2y$10$fElGjG7JvqKJoHot5EsggOXlcuCpY7AIQGCLSLcETT0ZQ2q3Lljbu', 0),
(14, 'new.js', 'user@user.co', '$2y$10$ADfrJcxKwHF9lU2umia2/uc65Vo35Fxln/zspyGXXP0FglvDkRry6', 0),
(15, 'a', 'a@a.c', '$2y$10$yRDYRB5os98jQUNyivN5L.PlYWC6aw7suSerBDXddk6EFtpedrfH2', 0),
(16, 'denis', 'denis@test.co', '$2y$10$FN2.hcH0V/NKX40e2LcOTuWvRcXaFvCTUZIgYF5TnEM3/xLDRagVi', 0),
(17, 'admin', 'admin@refi.ro', '$2y$10$5FD25ecq2Vjuqx8hGP.YhOmDIOx3Rxj.OiixM06/NRcH9LAd9Cj16', 1);

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
