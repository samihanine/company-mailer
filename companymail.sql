-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : sam. 01 jan. 2022 à 15:31
-- Version du serveur :  5.7.32
-- Version de PHP : 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `companymail`
--

-- --------------------------------------------------------

--
-- Structure de la table `company`
--

CREATE TABLE `company` (
                           `id` int(11) NOT NULL,
                           `sector_id` int(11) DEFAULT NULL,
                           `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                           `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `company`
--

INSERT INTO `company` (`id`, `sector_id`, `name`, `description`, `address`, `tel`, `img`) VALUES
                                                                                              (1, 1, 'microsoft', 'créateur de windows', '34 rue bidon', '09 70 01 90 90', 'https://cdn.pixabay.com/photo/2013/02/12/09/07/microsoft-80660_960_720.png'),
                                                                                              (2, 1, 'nautilius', 'créé en 2017', '20 rue de la paix', '0782111111', 'https://www.nicepng.com/png/full/43-430761_green-and-blue-nautilus-shell-clip-art-at.png');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
                                               `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
                                               `executed_at` datetime DEFAULT NULL,
                                               `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
                                                                                           ('DoctrineMigrations\\Version20211231001814', '2021-12-31 18:38:45', 184),
                                                                                           ('DoctrineMigrations\\Version20211231124621', '2021-12-31 18:38:45', 54),
                                                                                           ('DoctrineMigrations\\Version20211231140734', '2021-12-31 18:38:45', 33),
                                                                                           ('DoctrineMigrations\\Version20211231144947', '2021-12-31 18:38:45', 21),
                                                                                           ('DoctrineMigrations\\Version20211231145117', '2021-12-31 18:38:45', 81),
                                                                                           ('DoctrineMigrations\\Version20211231184529', '2021-12-31 18:45:36', 56),
                                                                                           ('DoctrineMigrations\\Version20211231190003', '2021-12-31 19:00:18', 81),
                                                                                           ('DoctrineMigrations\\Version20220101010423', '2022-01-01 01:04:31', 218);

-- --------------------------------------------------------

--
-- Structure de la table `mail`
--

CREATE TABLE `mail` (
                        `id` int(11) NOT NULL,
                        `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                        `recipient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                        `date` date NOT NULL,
                        `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mail`
--

INSERT INTO `mail` (`id`, `subject`, `recipient`, `body`, `date`, `user_id`) VALUES
                                                                                 (2, 'oui', 'sami.hanine22@gmail.com', 'coucou', '2022-01-01', 3),
                                                                                 (3, 'bonjour', 'sami.hanine22@gmail.com', 'ceci est un deuxième teste', '2022-01-01', 3);

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

CREATE TABLE `person` (
                          `id` int(11) NOT NULL,
                          `company_id` int(11) DEFAULT NULL,
                          `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `mail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`id`, `company_id`, `name`, `status`, `mail`) VALUES
                                                                        (1, 1, 'Bille Gates', 'CEO', 'sami.hanine22@gmail.com'),
                                                                        (2, 2, 'nom prenom', 'comptable', 'test@gmail.com'),
                                                                        (3, 1, 'poutou', 'responsable RH', 'poutou@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `sector`
--

CREATE TABLE `sector` (
                          `id` int(11) NOT NULL,
                          `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sector`
--

INSERT INTO `sector` (`id`, `name`) VALUES
    (1, 'informatique');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
                        `id` int(11) NOT NULL,
                        `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `roles` json NOT NULL,
                        `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `is_verified` tinyint(1) NOT NULL,
                        `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                        `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `firstname`, `lastname`) VALUES
    (3, 'sami.hanine22@gmail.com', '[]', '$2y$13$sGmBxIV1DRlRdyvVI5J5quilJ4r/MMvBY6ouUqZD0W6jWpcrm7V5W', 1, 'Sami', 'Hanine');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `company`
--
ALTER TABLE `company`
    ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4FBF094FDE95C867` (`sector_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
    ADD PRIMARY KEY (`version`);

--
-- Index pour la table `mail`
--
ALTER TABLE `mail`
    ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5126AC48A76ED395` (`user_id`);

--
-- Index pour la table `person`
--
ALTER TABLE `person`
    ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_34DCD176979B1AD6` (`company_id`);

--
-- Index pour la table `sector`
--
ALTER TABLE `sector`
    ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `company`
--
ALTER TABLE `company`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `mail`
--
ALTER TABLE `mail`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `person`
--
ALTER TABLE `person`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `sector`
--
ALTER TABLE `sector`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `company`
--
ALTER TABLE `company`
    ADD CONSTRAINT `FK_4FBF094FDE95C867` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`id`);

--
-- Contraintes pour la table `mail`
--
ALTER TABLE `mail`
    ADD CONSTRAINT `FK_5126AC48A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `person`
--
ALTER TABLE `person`
    ADD CONSTRAINT `FK_34DCD176979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
