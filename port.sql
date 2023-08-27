-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 13 juin 2023 à 15:09
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `port`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` varchar(50) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `Nom`, `Adresse`) VALUES
('1', 'Kely', 'Tana'),
('2', 'Bema', 'Fianara'),
('3', 'Rabe', 'Ambato');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `N_commande` int(11) NOT NULL,
  `Id_produit` varchar(50) NOT NULL,
  `Id_fournisseur` varchar(50) NOT NULL,
  `id_client` varchar(50) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `dateComande` date DEFAULT NULL,
  PRIMARY KEY (`N_commande`),
  KEY `Id_produit` (`Id_produit`),
  KEY `Id_fournisseur` (`Id_fournisseur`,`id_client`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`N_commande`, `Id_produit`, `Id_fournisseur`, `id_client`, `Quantite`, `dateComande`) VALUES
(1, 'p1', 'F1', '1', 12, NULL),
(3, 'p1', 'F1', '1', 5, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `Id_fournisseur` varchar(50) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Ville` varchar(255) NOT NULL,
  `Id_produit` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_fournisseur`),
  KEY `Id_produit` (`Id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`Id_fournisseur`, `Nom`, `Ville`, `Id_produit`) VALUES
('F1', 'Fetra', 'Tana', 'p1'),
('F3', 'Rajao', 'Imerina', 'p1');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `Id_produit` varchar(50) NOT NULL,
  `Design` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `PU` int(11) NOT NULL,
  PRIMARY KEY (`Id_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`Id_produit`, `Design`, `Description`, `PU`) VALUES
('p1', 'vomanga', 'Kely fa ngeza be', 1500),
('p2', 'Voatavo', 'Ngeza sady masaka tsara', 500);

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE IF NOT EXISTS `stocks` (
  `Id_stock` varchar(50) NOT NULL,
  `Niveau` int(11) NOT NULL,
  `Quantite_max` int(11) NOT NULL,
  `Quantte_min` int(11) NOT NULL,
  `Id_produit` varchar(50) NOT NULL,
  `Id_fournisseur` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_stock`),
  KEY `Id_produit` (`Id_produit`),
  KEY `Id_fournisseur` (`Id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stocks`
--

INSERT INTO `stocks` (`Id_stock`, `Niveau`, `Quantite_max`, `Quantte_min`, `Id_produit`, `Id_fournisseur`) VALUES
('S1', 499, 500, 2, 'p1', 'F1');

-- --------------------------------------------------------

--
-- Structure de la table `stocks_entre`
--

DROP TABLE IF EXISTS `stocks_entre`;
CREATE TABLE IF NOT EXISTS `stocks_entre` (
  `id_Entre` int(11) NOT NULL AUTO_INCREMENT,
  `motif` varchar(255) NOT NULL,
  `date_Entre` date NOT NULL,
  `quantite_Entre` int(11) NOT NULL,
  `id_stock` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Entre`),
  KEY `id_stock` (`id_stock`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `stocks_entre`
--

INSERT INTO `stocks_entre` (`id_Entre`, `motif`, `date_Entre`, `quantite_Entre`, `id_stock`) VALUES
(2, 'trano', '2023-06-13', 1, 'S1');

-- --------------------------------------------------------

--
-- Structure de la table `stocks_sortie`
--

DROP TABLE IF EXISTS `stocks_sortie`;
CREATE TABLE IF NOT EXISTS `stocks_sortie` (
  `id_Sortie` int(11) NOT NULL AUTO_INCREMENT,
  `motif` varchar(255) NOT NULL,
  `date_Sortie` date NOT NULL,
  `quantite_Sortie` int(11) NOT NULL,
  `id_stock` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Sortie`),
  KEY `id_stock` (`id_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`Username`, `Password`) VALUES
('antsa', 'antsa');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`Id_fournisseur`) REFERENCES `fournisseur` (`Id_fournisseur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_3` FOREIGN KEY (`Id_produit`) REFERENCES `produit` (`Id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `fournisseur_ibfk_1` FOREIGN KEY (`Id_produit`) REFERENCES `produit` (`Id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`Id_fournisseur`) REFERENCES `fournisseur` (`Id_fournisseur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stocks_ibfk_2` FOREIGN KEY (`Id_produit`) REFERENCES `produit` (`Id_produit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stocks_entre`
--
ALTER TABLE `stocks_entre`
  ADD CONSTRAINT `stocks_entre_ibfk_1` FOREIGN KEY (`id_stock`) REFERENCES `stocks` (`Id_stock`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stocks_sortie`
--
ALTER TABLE `stocks_sortie`
  ADD CONSTRAINT `stocks_sortie_ibfk_1` FOREIGN KEY (`id_stock`) REFERENCES `stocks` (`Id_stock`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
