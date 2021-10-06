-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 06 oct. 2021 à 10:08
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `lecoindesmanagers`
--

-- --------------------------------------------------------

--
-- Structure de la table `comments_news`
--

DROP TABLE IF EXISTS `comments_news`;
CREATE TABLE IF NOT EXISTS `comments_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `content_comment_news` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at_comment_news` datetime NOT NULL,
  `rgpd` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9902B4F7B5A459A0` (`news_id`),
  KEY `IDX_9902B4F7727ACA70` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210930085604', '2021-09-30 13:27:32', 58),
('DoctrineMigrations\\Version20210930092939', '2021-09-30 13:27:32', 47),
('DoctrineMigrations\\Version20210930101709', '2021-09-30 13:27:32', 64),
('DoctrineMigrations\\Version20210930115438', '2021-09-30 13:27:32', 30);

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_news` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_news` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_news` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date_news` datetime NOT NULL,
  `modification_date_news` datetime NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1DD3995067B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `news`
--

INSERT INTO `news` (`id`, `title_news`, `content_news`, `img_news`, `creation_date_news`, `modification_date_news`, `users_id`) VALUES
(2, 'news de test 1', 'yreyheue(u', 'Capture-615c1a89f2a97.jpg', '2021-10-05 09:27:37', '2021-10-05 09:27:37', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `roles`, `password`, `is_verified`, `pseudo`, `created_at`, `modified_at`) VALUES
(1, 'c.leberre@hotmail.fr', '[\"ROLE_USER\", \"ROLE_ADMIN\", \"ROLE_EDITOR\", \"ROLE_MODERATOR\", \"ROLE_MEMBER\"]', '$2y$13$ujETC/m6dQ2b2HC3peQZSeHcTRSWrENwW2Zt21UB0IKOy80RjNTc6', 1, 'Charley22', '2021-09-30 13:38:03', '2021-09-30 13:38:03'),
(3, 'charley.leberre@gmail.com', '[\"ROLE_USER\", \"ROLE_EDITOR\", \"ROLE_MODERATOR\", \"ROLE_MEMBER\"]', '$2y$13$sHIuxVaysA3.wuasT03RQuCCy.rGsnOa/k9kmXdy05GdglNLU3VpS', 1, 'Zizou98', '2021-10-05 10:17:09', '2021-10-05 10:17:09');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comments_news`
--
ALTER TABLE `comments_news`
  ADD CONSTRAINT `FK_9902B4F7727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `comments_news` (`id`),
  ADD CONSTRAINT `FK_9902B4F7B5A459A0` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);

--
-- Contraintes pour la table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK_1DD3995067B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
