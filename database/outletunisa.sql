-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Creato il: Set 18, 2018 alle 21:26
-- Versione del server: 5.6.25
-- Versione PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `outletunisa`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `cod_ordine` int(6) DEFAULT NULL,
  `cod_prodotto` int(8) DEFAULT NULL,
  `size` char(3) DEFAULT NULL,
  `quant` int(7) DEFAULT NULL,
  `immagine` varchar(20) NOT NULL,
  `nome_prodotto` varchar(30) DEFAULT NULL,
  `prezzo` double(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `compra`
--

INSERT INTO `compra` (`cod_ordine`, `cod_prodotto`, `size`, `quant`, `immagine`, `nome_prodotto`, `prezzo`) VALUES
(2, 1, 'M', 1, 'camc.jpeg', 'Camicia di lino bianca', 60.00),
(13, 1, 'M', 2, 'camc.jpeg', 'Camicia di lino bianca', 60.00),
(1, 1, 'S', 1, 'camc.jpeg', 'Camicia di lino bianca', 60.00),
(3, 12, 'S', 1, 'camc.jpeg', 'camicia moda positano', 99.00),
(6, 1, 'S', 1, 'gonna.jpeg', 'gonna a fiori', 20.00),
(14, 18, 'M', 1, 'panta.jpg', 'pantalone beje ', 30.28),
(15, 18, 'L', 1, 'panta.jpg', 'pantalone beje ', 30.28),
(15, 19, 'L', 1, 'maglia.jpeg', 't shirt', 23.30),
(15, 1, 'M', 4, 'camc.jpeg', 'Camicia di lino bianca', 60.00),
(16, 18, 'M', 1, 'panta.jpg', 'pantalone beje ', 30.28),
(17, 6, 'L', 2, 'gonna.jpeg', 'gonna a fiori', 20.00),
(17, 7, 'XL', 1, 'moc.jpg', 'mocassino', 99.99),
(18, 1, 'M', 1, 'camc.jpeg', 'Camicia di lino bianca', 60.00),
(19, 1, 'M', 1, 'camc.jpeg', 'Camicia di lino bianca', 60.00),
(20, 7, 'M', 1, 'moc.jpg', 'mocassino', 99.99),
(21, 18, 'M', 1, 'panta.jpg', 'pantalone beje ', 30.28),
(21, 7, 'M', 1, 'moc.jpg', 'mocassino', 99.99),
(21, 7, 'M', 2, 'moc.jpg', 'mocassino', 99.99),
(21, 12, 'M', 1, 'camc.jpeg', 'camicia moda positano', 99.00),
(22, 6, 'L', 1, 'gonna.jpeg', 'gonna a fiori', 20.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `divide`
--

CREATE TABLE IF NOT EXISTS `divide` (
  `cod` int(8) NOT NULL,
  `quant` int(5) NOT NULL,
  `size` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `divide`
--

INSERT INTO `divide` (`cod`, `quant`, `size`) VALUES
(1, 0, 'L'),
(1, 5, 'S'),
(1, 6, 'XL'),
(1, 16, 'M'),
(6, 2, 'M'),
(6, 3, 'L'),
(6, 3, 'XL'),
(6, 7, 'S'),
(7, -1, 'M'),
(7, 0, 'L'),
(7, 0, 'S'),
(7, 5, 'XL'),
(9, 2, 'M'),
(9, 7, 'L'),
(9, 10, 'S'),
(9, 15, 'XL'),
(12, 0, 'XL'),
(12, 2, 'M'),
(12, 4, 'L'),
(12, 6, 'S'),
(18, 0, 'XL'),
(18, 1, 'M'),
(18, 2, 'S'),
(18, 4, 'L'),
(19, 0, 'M'),
(19, 0, 'XL'),
(19, 2, 'L'),
(19, 3, 'S'),
(21, 1, 'XL'),
(21, 2, 'L'),
(21, 2, 'S'),
(21, 3, 'M'),
(22, 0, 'L'),
(22, 1, 'M'),
(22, 1, 'S'),
(22, 1, 'XL');

-- --------------------------------------------------------

--
-- Struttura della tabella `fornitore`
--

CREATE TABLE IF NOT EXISTS `fornitore` (
  `p_iva` char(11) NOT NULL,
  `email` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `fornitore`
--

INSERT INTO `fornitore` (`p_iva`, `email`) VALUES
('267tfbrf3e', 'rafilucc@oiboo.it'),
('12345567891', 'toni@out.com');

-- --------------------------------------------------------

--
-- Struttura della tabella `ordine`
--

CREATE TABLE IF NOT EXISTS `ordine` (
  `cod_ordine` int(6) NOT NULL,
  `dat` date NOT NULL,
  `ora` time NOT NULL,
  `quant` int(3) NOT NULL,
  `email` varchar(30) NOT NULL,
  `prezzo_totale` double NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `ordine`
--

INSERT INTO `ordine` (`cod_ordine`, `dat`, `ora`, `quant`, `email`, `prezzo_totale`) VALUES
(1, '2018-08-02', '11:33:27', 2, 'topolino@disney', 23),
(2, '2018-08-09', '05:00:00', 1, 'topolino@disney', 60),
(3, '2018-08-22', '06:20:00', 1, 'rafilucc@oiboo.it', 30),
(6, '2018-08-11', '13:12:49', 1, 'mario.santoro94@outlook.it', 60),
(13, '2018-08-11', '14:02:34', 1, 'mario.santoro94@outlook.it', 60),
(14, '2018-08-13', '20:32:35', 1, 'mario.santoro94@outlook.it', 30.28),
(15, '2018-08-14', '10:23:45', 1, 'toni@out.com', 293.58),
(16, '2018-08-14', '10:50:47', 1, 'toni@out.com', 30.28),
(17, '2018-08-14', '18:25:44', 1, 'rafilucc@oiboo.it', 139.99),
(18, '2018-08-14', '18:29:09', 1, 'rafilucc@oiboo.it', 60),
(19, '2018-08-14', '18:40:38', 1, 'rafilucc@oiboo.it', 60),
(20, '2018-08-14', '19:12:55', 1, 'toni@out.com', 99.99),
(21, '2018-09-18', '11:53:39', 1, 'aa@aa.it', 429.25),
(22, '2018-09-18', '11:54:44', 1, 'aa@aa.it', 20);

-- --------------------------------------------------------

--
-- Struttura della tabella `prodotto`
--

CREATE TABLE IF NOT EXISTS `prodotto` (
  `cod` int(8) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `prezzo` double(4,2) NOT NULL,
  `marca` char(15) DEFAULT NULL,
  `img` varchar(50) NOT NULL,
  `descrizione` varchar(250) DEFAULT NULL,
  `tipologia` varchar(20) NOT NULL,
  `sottocategoria` varchar(20) NOT NULL,
  `p_iva` char(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prodotto`
--

INSERT INTO `prodotto` (`cod`, `nome`, `prezzo`, `marca`, `img`, `descrizione`, `tipologia`, `sottocategoria`, `p_iva`) VALUES
(1, 'Camicia di lino bianca', 60.00, 'Guess', 'camc.jpeg', 'bella sta camicia di lino fresca fresca', 'Uomo', 'Camicie', '267tfbrf3e'),
(6, 'gonna a fiori', 20.00, 'benetton', 'gonna.jpeg', 'bella gonna', 'Donna', 'Gonne', '267tfbrf3e'),
(7, 'mocassino', 99.99, 'Guess', 'moc.jpg', 'marrone', 'Uomo', 'Scarpe', '267tfbrf3e'),
(9, 'camicia lino coreana rosa', 30.00, 'made in italy', 'camc.jpeg', 'estate 2018', 'Uomo', 'Camicie', '267tfbrf3e'),
(12, 'camicia moda positano', 99.00, 'levi', 'camc.jpeg', 'moda positano estate', 'Uomo', 'Camicie', '267tfbrf3e'),
(18, 'pantalone beje ', 30.28, 'Alcott', 'panta.jpg', 'pantalone elegante da uomo invernale', 'Uomo', 'Pantaloni', '267tfbrf3e'),
(19, 't shirt', 23.30, 'Levis', 'maglia.jpeg', 'maglia maniche corte', 'Bambino', 'Maglieria', '12345567891'),
(21, 'Giacca Grigia', 69.99, 'Levis', 'giacca.jpeg', 'giacca autunno-inverno', 'Uomo', 'Giacche e Cappotti', '12345567891'),
(22, 'Mario', 22.00, 'Alcott', 'giacca.jpeg', 'asasa', 'Uomo', 'Camicie', '267tfbrf3e');

-- --------------------------------------------------------

--
-- Struttura della tabella `sottocategoria`
--

CREATE TABLE IF NOT EXISTS `sottocategoria` (
  `nome` char(20) NOT NULL,
  `tipologia` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `sottocategoria`
--

INSERT INTO `sottocategoria` (`nome`, `tipologia`) VALUES
('Accessori', 'Bambino'),
('Maglieria', 'Bambino'),
('Pantaloni', 'Bambino'),
('Scarpe', 'Bambino'),
('Accessori', 'Donna'),
('Giacche e Cappotti', 'Donna'),
('Gonne', 'Donna'),
('Pantaloni', 'Donna'),
('Scarpe', 'Donna'),
('Vestiti', 'Donna'),
('Accessori', 'Uomo'),
('Camicie', 'Uomo'),
('Giacche e Cappotti', 'Uomo'),
('Pantaloni', 'Uomo'),
('Scarpe', 'Uomo');

-- --------------------------------------------------------

--
-- Struttura della tabella `taglia`
--

CREATE TABLE IF NOT EXISTS `taglia` (
  `size` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `taglia`
--

INSERT INTO `taglia` (`size`) VALUES
('L'),
('M'),
('S'),
('XL');

-- --------------------------------------------------------

--
-- Struttura della tabella `utente`
--

CREATE TABLE IF NOT EXISTS `utente` (
  `email` varchar(30) NOT NULL,
  `via` varchar(30) NOT NULL,
  `CAP` int(5) NOT NULL,
  `n_civico` int(3) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `is_admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `utente`
--

INSERT INTO `utente` (`email`, `via`, `CAP`, `n_civico`, `nome`, `cognome`, `password`, `is_admin`) VALUES
('aa@aa.it', 'aa aa', 12345, 12, 'Michele', 'aaa', 'aaaaaa', 0),
('mario.santoro94@outlook.it', 'madonna di fatima', 84127, 36, 'Mario', 'Santoro', 'mario94', 0),
('outletunisa@gmail.com', 'via univerista''', 84100, 32, 'admin', 'admin', 'admin', 1),
('rafilucc@oiboo.it', 'ciampa di cavallo', 84100, 3, 'Raffaele', 'Marino', '1222', 0),
('toni@out.com', 'madonna di fatima', 84127, 36, 'Toni', 'Santoro', 'toni65', 0),
('topolino@disney', 'disneyland', 20, 3, 'topo', 'disney', 'chissa', 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `compra`
--
ALTER TABLE `compra`
  ADD KEY `cod_ordine` (`cod_ordine`),
  ADD KEY `cod_prodotto` (`cod_prodotto`),
  ADD KEY `size` (`size`);

--
-- Indici per le tabelle `divide`
--
ALTER TABLE `divide`
  ADD PRIMARY KEY (`cod`,`quant`,`size`),
  ADD KEY `size` (`size`),
  ADD KEY `cod` (`cod`),
  ADD KEY `cod_2` (`cod`);

--
-- Indici per le tabelle `fornitore`
--
ALTER TABLE `fornitore`
  ADD PRIMARY KEY (`p_iva`),
  ADD KEY `email` (`email`);

--
-- Indici per le tabelle `ordine`
--
ALTER TABLE `ordine`
  ADD PRIMARY KEY (`cod_ordine`),
  ADD KEY `email` (`email`);

--
-- Indici per le tabelle `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `tipologia` (`tipologia`,`sottocategoria`),
  ADD KEY `sottocategoria` (`sottocategoria`),
  ADD KEY `p_iva` (`p_iva`),
  ADD KEY `p_iva_2` (`p_iva`);

--
-- Indici per le tabelle `sottocategoria`
--
ALTER TABLE `sottocategoria`
  ADD PRIMARY KEY (`nome`,`tipologia`),
  ADD KEY `tipologia` (`tipologia`);

--
-- Indici per le tabelle `taglia`
--
ALTER TABLE `taglia`
  ADD PRIMARY KEY (`size`);

--
-- Indici per le tabelle `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `ordine`
--
ALTER TABLE `ordine`
  MODIFY `cod_ordine` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `cod` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cod_ordine`) REFERENCES `ordine` (`cod_ordine`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`cod_prodotto`) REFERENCES `prodotto` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`size`) REFERENCES `taglia` (`size`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `divide`
--
ALTER TABLE `divide`
  ADD CONSTRAINT `divide_ibfk_1` FOREIGN KEY (`cod`) REFERENCES `prodotto` (`cod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `divide_ibfk_2` FOREIGN KEY (`size`) REFERENCES `taglia` (`size`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `fornitore`
--
ALTER TABLE `fornitore`
  ADD CONSTRAINT `fornitore_ibfk_1` FOREIGN KEY (`email`) REFERENCES `utente` (`email`);

--
-- Limiti per la tabella `ordine`
--
ALTER TABLE `ordine`
  ADD CONSTRAINT `ordine_ibfk_1` FOREIGN KEY (`email`) REFERENCES `utente` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `prodotto`
--
ALTER TABLE `prodotto`
  ADD CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`sottocategoria`) REFERENCES `sottocategoria` (`nome`),
  ADD CONSTRAINT `prodotto_ibfk_2` FOREIGN KEY (`tipologia`) REFERENCES `sottocategoria` (`tipologia`),
  ADD CONSTRAINT `prodotto_ibfk_3` FOREIGN KEY (`p_iva`) REFERENCES `fornitore` (`p_iva`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
