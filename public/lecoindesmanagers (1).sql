-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 19 oct. 2021 à 10:30
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
-- Structure de la table `category_forum`
--

DROP TABLE IF EXISTS `category_forum`;
CREATE TABLE IF NOT EXISTS `category_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name_category` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6D18F184727ACA70` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_forum`
--

INSERT INTO `category_forum` (`id`, `parent_id`, `name_category`, `slug`) VALUES
(1, 9, 'Général', 'general'),
(2, NULL, 'Vos carrières', 'vos-carrieres'),
(3, 9, 'Tactiques et entrainements', 'tactiques-et-entrainements'),
(4, 7, 'Vos meilleurs Newgen', 'vos-meilleurs-newgen'),
(5, NULL, 'bla bla en vrac', 'bla-bla-en-vrac'),
(6, 8, 'Entraide', 'entraide'),
(7, NULL, 'FM 19', 'fm-19'),
(8, NULL, 'FM 20', 'fm-20'),
(9, NULL, 'FM 21', 'fm-21'),
(10, NULL, 'FM 22', 'fm-22');

-- --------------------------------------------------------

--
-- Structure de la table `comments_news`
--

DROP TABLE IF EXISTS `comments_news`;
CREATE TABLE IF NOT EXISTS `comments_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `content_comment_news` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at_comment_news` datetime NOT NULL,
  `rgpd` tinyint(1) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9902B4F7B5A459A0` (`news_id`),
  KEY `IDX_9902B4F767B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments_news`
--

INSERT INTO `comments_news` (`id`, `news_id`, `content_comment_news`, `active`, `created_at_comment_news`, `rgpd`, `users_id`) VALUES
(1, 2, 'commentaire test de la news test 1', 0, '2021-10-11 08:54:04', 1, NULL),
(2, 3, 'commentaire testttt', 0, '2021-10-11 09:55:21', 1, NULL),
(3, 2, 'vfresgj rht k', 0, '2021-10-11 09:58:39', 1, NULL);

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
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1DD3995067B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `news`
--

INSERT INTO `news` (`id`, `title_news`, `content_news`, `img_news`, `creation_date_news`, `modification_date_news`, `users_id`, `slug`) VALUES
(2, 'news de test 1', 'yreyheue(u', 'Capture-615c1a89f2a97.jpg', '2021-10-05 09:27:37', '2021-10-05 09:27:37', 1, ''),
(3, 'news de test 2', 'contenu test 2 2 2 2 2 2 2 22', 'accueil-616402caad2d6.jpg', '2021-10-11 09:24:26', '2021-10-11 09:24:26', 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `post_forum`
--

DROP TABLE IF EXISTS `post_forum`;
CREATE TABLE IF NOT EXISTS `post_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `category_forum_id` int(11) NOT NULL,
  `title_post` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_post` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1230322267B3B43D` (`users_id`),
  KEY `IDX_123032229EB63EAB` (`category_forum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post_forum`
--

INSERT INTO `post_forum` (`id`, `users_id`, `category_forum_id`, `title_post`, `slug`, `content_post`, `created_at`, `active`) VALUES
(1, 1, 2, 'Fc Nantes le rachat !', 'fc-nantes-le-rachat', 'qsgvfsfnhtgjfy jyjyjyjrftj', '2021-10-14 11:40:48', 0),
(2, 1, 3, 'Tactique Sampaoli - Marseille', 'tactique-sampaoli-marseille', 'bvhjhtjdtd jtjyfjfftjjtfjhutfh', '2021-10-14 12:38:28', 0),
(3, 1, 3, 'Tactique Tiki-Taka Barça', 'tactique-tiki-taka-barca', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut semper ipsum magna, ut malesuada orci commodo eget. Mauris eget libero nunc. Phasellus malesuada velit sit amet diam sodales, a euismod arcu imperdiet. Integer aliquet interdum mi. Phasellus id consequat nibh. Nam aliquam, sem id vestibulum aliquet, erat metus rhoncus ligula, non convallis mauris nunc at ante. Mauris massa quam, fermentum quis viverra at, imperdiet et augue. Quisque facilisis massa et aliquet semper. Phasellus imperdiet ornare pretium. Aliquam sit amet nibh venenatis, auctor massa eget, maximus neque. In ut faucibus eros. Quisque sit amet mollis est. Nullam vel urna a nunc tincidunt eleifend ac ac sapien.', '2021-10-19 09:33:29', 0),
(4, 1, 3, 'Tactique Ajax - Johan Cruyff', 'tactique-ajax-johan-cruyff', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam imperdiet venenatis turpis in bibendum. Suspendisse pharetra sem sed nisl rhoncus ornare. Quisque bibendum lectus vel blandit maximus. Aenean pulvinar ornare molestie. Sed quis porta metus. Donec gravida, dui sed dapibus hendrerit, ligula tellus dictum eros, a tincidunt ligula purus ac diam. Etiam a orci pretium, eleifend sapien quis, posuere ligula. Nulla congue pharetra ipsum eu sodales. Nullam enim ipsum, maximus non feugiat in, pellentesque vitae risus. Pellentesque auctor porta accumsan. Ut posuere rutrum consectetur. Aliquam tincidunt ante in mauris bibendum, at dapibus est ornare. Donec convallis fringilla risus, in egestas tortor rhoncus at. Donec consectetur ornare orci, quis efficitur sapien dictum vel. Morbi egestas arcu interdum, vulputate elit non, pharetra diam.', '2021-10-19 10:10:53', 0),
(5, 1, 3, 'Tactique Liverpool - Jürgen Klopp', 'tactique-liverpool-jurgen-klopp', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam imperdiet venenatis turpis in bibendum. Suspendisse pharetra sem sed nisl rhoncus ornare. Quisque bibendum lectus vel blandit maximus. Aenean pulvinar ornare molestie. Sed quis porta metus. Donec gravida, dui sed dapibus hendrerit, ligula tellus dictum eros, a tincidunt ligula purus ac diam. Etiam a orci pretium, eleifend sapien quis, posuere ligula. Nulla congue pharetra ipsum eu sodales. Nullam enim ipsum, maximus non feugiat in, pellentesque vitae risus. Pellentesque auctor porta accumsan. Ut posuere rutrum consectetur. Aliquam tincidunt ante in mauris bibendum, at dapibus est ornare. Donec convallis fringilla risus, in egestas tortor rhoncus at. Donec consectetur ornare orci, quis efficitur sapien dictum vel. Morbi egestas arcu interdum, vulputate elit non, pharetra diam.', '2021-10-19 10:11:54', 0),
(6, 1, 1, 'Tactique Inter Milan - 2010', 'tactique-inter-milan-2010', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam imperdiet venenatis turpis in bibendum. Suspendisse pharetra sem sed nisl rhoncus ornare. Quisque bibendum lectus vel blandit maximus. Aenean pulvinar ornare molestie. Sed quis porta metus. Donec gravida, dui sed dapibus hendrerit, ligula tellus dictum eros, a tincidunt ligula purus ac diam. Etiam a orci pretium, eleifend sapien quis, posuere ligula. Nulla congue pharetra ipsum eu sodales. Nullam enim ipsum, maximus non feugiat in, pellentesque vitae risus. Pellentesque auctor porta accumsan. Ut posuere rutrum consectetur. Aliquam tincidunt ante in mauris bibendum, at dapibus est ornare. Donec convallis fringilla risus, in egestas tortor rhoncus at. Donec consectetur ornare orci, quis efficitur sapien dictum vel. Morbi egestas arcu interdum, vulputate elit non, pharetra diam.', '2021-10-19 10:12:36', 0),
(7, 1, 3, 'Tactique Inter Milan - 2010', 'tactique-inter-milan-2010-1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam imperdiet venenatis turpis in bibendum. Suspendisse pharetra sem sed nisl rhoncus ornare. Quisque bibendum lectus vel blandit maximus. Aenean pulvinar ornare molestie. Sed quis porta metus. Donec gravida, dui sed dapibus hendrerit, ligula tellus dictum eros, a tincidunt ligula purus ac diam. Etiam a orci pretium, eleifend sapien quis, posuere ligula. Nulla congue pharetra ipsum eu sodales. Nullam enim ipsum, maximus non feugiat in, pellentesque vitae risus. Pellentesque auctor porta accumsan. Ut posuere rutrum consectetur. Aliquam tincidunt ante in mauris bibendum, at dapibus est ornare. Donec convallis fringilla risus, in egestas tortor rhoncus at. Donec consectetur ornare orci, quis efficitur sapien dictum vel. Morbi egestas arcu interdum, vulputate elit non, pharetra diam.', '2021-10-19 10:13:00', 0);

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
(3, 'charley.leberre@gmail.com', '[\"ROLE_USER\", \"ROLE_MEMBER\"]', '$2y$13$sHIuxVaysA3.wuasT03RQuCCy.rGsnOa/k9kmXdy05GdglNLU3VpS', 1, 'Zizou98', '2021-10-05 10:17:09', '2021-10-05 10:17:09');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category_forum`
--
ALTER TABLE `category_forum`
  ADD CONSTRAINT `FK_6D18F184727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category_forum` (`id`);

--
-- Contraintes pour la table `comments_news`
--
ALTER TABLE `comments_news`
  ADD CONSTRAINT `FK_9902B4F767B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_9902B4F7B5A459A0` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);

--
-- Contraintes pour la table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `FK_1DD3995067B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `post_forum`
--
ALTER TABLE `post_forum`
  ADD CONSTRAINT `FK_1230322267B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_123032229EB63EAB` FOREIGN KEY (`category_forum_id`) REFERENCES `category_forum` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
