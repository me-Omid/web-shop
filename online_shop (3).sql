-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Feb 2025 um 23:41
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `online_shop`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellung`
--

CREATE TABLE `bestellung` (
  `PK_Bestellung_ID` int(11) NOT NULL,
  `Bestelldatum` date NOT NULL,
  `Lieferadresse_Strasse_nr` varchar(45) NOT NULL,
  `Lieferadresse_PLZ_Ort` varchar(45) NOT NULL,
  `Gesampreis` float NOT NULL,
  `FK_Kunde_ID` int(11) NOT NULL,
  `FK_Produkt_ID` int(11) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `bestellung`
--

INSERT INTO `bestellung` (`PK_Bestellung_ID`, `Bestelldatum`, `Lieferadresse_Strasse_nr`, `Lieferadresse_PLZ_Ort`, `Gesampreis`, `FK_Kunde_ID`, `FK_Produkt_ID`, `status`) VALUES
(43, '2025-02-08', 'Bahnhof str. 34', '31785 Hameln', 0, 1, 76, ''),
(44, '2025-02-08', 'Bahnhof str. 34', '31785 Hameln', 0, 1, 79, ''),
(45, '2025-02-08', 'Bahnhof str. 34', '31785 Hameln', 0, 1, 93, ''),
(46, '2025-02-08', 'Bahnhof str. 34', '31785 Hameln', 0, 1, 66, ''),
(47, '2025-02-08', 'Deister str 52', '31785 Hameln', 0, 9, 94, ''),
(48, '2025-02-08', 'Deister str 52', '31785 Hameln', 0, 9, 97, ''),
(49, '2025-02-08', 'Bahnhof str. 34', '31785 Hameln', 0, 1, 97, ''),
(50, '2025-02-08', 'Deister str 52', '31785 Hameln', 0, 15, 55, ''),
(51, '2025-02-09', 'Bahnhof str. 34', '31785 Hameln', 0, 1, 100, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kategorie`
--

CREATE TABLE `kategorie` (
  `PK_Kategorie_ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `img_pfad` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kategorie`
--

INSERT INTO `kategorie` (`PK_Kategorie_ID`, `Name`, `img_pfad`) VALUES
(1, 'PC Komponenten', '1.png'),
(2, 'Play Station', '2.png'),
(3, 'Gaming Zubehör', '3.png'),
(4, 'Spiele', '4.png'),
(5, 'Filme & Serien', '5.png'),
(6, 'Sonstiges', '6.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunde`
--

CREATE TABLE `kunde` (
  `PK_Kunde_ID` int(11) NOT NULL,
  `Vorname` varchar(45) NOT NULL,
  `Nachname` varchar(45) NOT NULL,
  `E_Mail` varchar(100) NOT NULL,
  `Passwort` varchar(100) NOT NULL,
  `PLZ_ORT` varchar(45) NOT NULL,
  `Strasse_HausNr` varchar(45) NOT NULL,
  `Telefon Nummer` varchar(15) NOT NULL,
  `IBAN` varchar(22) NOT NULL,
  `profilbild` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kunde`
--

INSERT INTO `kunde` (`PK_Kunde_ID`, `Vorname`, `Nachname`, `E_Mail`, `Passwort`, `PLZ_ORT`, `Strasse_HausNr`, `Telefon Nummer`, `IBAN`, `profilbild`) VALUES
(1, 'Omid', 'Mohammadi', 'Omid@gmail.com', '123', '31785 Hameln', 'Bahnhof str. 34', '1234567890', 'DE31 2342 2345 2353 23', '1.png'),
(9, 'Kevin', 'Bolton', 'Kevin@gmail.com', '123', '31785 Hameln', 'Deister str 52', '1235345233', 'DE31 2342 2345 2353 23', NULL),
(11, 'Risan', 'Sheikh Ismail  Kudur ', 'Risan@gmail.com', '123', '31785 Hameln', 'Deister str 23', '123456783', 'DE31785030293', NULL),
(15, 'Omid', 'Mohammadi', 'Omi4@gmail.com', '123', '31785 Hameln', 'Deister str 52', '123141234', 'DE31 124 234234 121322', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `produkt`
--

CREATE TABLE `produkt` (
  `PK_Produkt_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Beschreibung` varchar(2000) NOT NULL,
  `Preis` float NOT NULL,
  `Lagerbestand` int(11) NOT NULL,
  `Bild_Pfad` varchar(55) DEFAULT NULL,
  `FK_Kategorie_ID` int(11) DEFAULT NULL,
  `FK_Seller_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `produkt`
--

INSERT INTO `produkt` (`PK_Produkt_ID`, `Name`, `Beschreibung`, `Preis`, `Lagerbestand`, `Bild_Pfad`, `FK_Kategorie_ID`, `FK_Seller_ID`) VALUES
(55, 'IPAD 10 Generation', 'Ipad der 10ten Generation ist zurzeit die beste Wahl weil es 400€ Kostet und weil es Design Technisch schon sehr weit ist viel weiter als z.B. die hässliche 9te Generation', 400, 1, '55.webp', 6, 1),
(66, 'Samsung S24', 'Samsung ist besser als Apple weil es Andriod ein Open Source Betriebsystem als Betriebsystem hat da kann man sich wenigstens sicher sein dass man nicht ausspioniert wird.', 750, 1000, '66.jpg', 6, 1),
(76, 'APPLE MacBook Air', 'APPLE MacBook Air (2024), MC8K4D/A, Notebook, mit 13,6 Zoll Display, M3 Prozessor, 16 GB RAM, 256 GB SSD, Mitternacht, macOS', 1900, 10, '76.webp', 6, 1),
(79, 'SONY PlayStation 5', '4K-TV-Gaming\r\nSpiele deine Lieblingsspiele für PS5® auf deinem Fernseher in atemberaubendem 4K.', 400, 10, '79.webp', 2, 1),
(92, 'META Quest 3', 'META Quest 3 512 GB - Mit Batman: Arkham Shadow und 3-monatigem Meta Quest+Probeabo - All-in-One-Headset VR Brille', 700, 100, '92.webp', 3, 1),
(93, 'Gaming Maus', '\r\nDie kabellose Maus basiert auf dem Design der Logitech G502 und wurde mit den neuen Innovationen in der Gaming-Technologie umgestaltet.\r\nDie neue optisch-mechanische Hybridschalter-Technologie sorgt für Geschwindigkeit, Zuverlässigkeit und präzise Betätigung mit schneller Reaktion - für stundenlanges Gaming.', 129, 100, '93.webp', 3, 1),
(94, '2 TB SSD PCI Express', 'Erweitern Sie den Speicher Ihrer Handheld-Spielkonsole oder Ihres M.2-2230-kompatiblen Laptops mit der WD_BLACK SN770M NVMe-SSD mit bis zu 2 TB. Diese M.2-2230-SSD verfügt über PCIe Gen 4.0 für Geschwindigkeiten von bis zu 5.150 MB/s (Modelle mit 1 TB und 2 TB), Western Digital nCache-4.0-Technologie und Microsoft DirectStorage-Unterstützung.', 151, 100, '94.webp', 3, 1),
(95, 'Driving Force', 'LOGITECH G29 Driving Force Rennlenkrad und Bodenpedale für PS5, PS4, PC, Mac + Astro A10 Gen 1 Gaming Headset Rennlenkrad + Kabelgebundenes Headset.', 200, 10, '95.webp', 3, 1),
(96, 'GOOGLE Pixel 9 Pro 128 GB', 'GOOGLE Pixel 9 Pro 128 GB Porcelain Dual SIM Display\r\n\r\nSuper Actua-Display, Corning® Gorilla® Glass Victus®\r\n\r\nAuflösung Breite\r\n\r\n2.856 Pixel\r\n\r\nAuflösung Höhe\r\n\r\n1.280 Pixel\r\n\r\nBildverhältnis\r\n\r\n20:9\r\n\r\nFarbdisplay\r\n\r\nJa\r\n\r\nTouchscreen\r\n\r\nJa\r\n\r\nTouchscreen-Typ\r\n\r\nKapazitiver Touchscreen', 1090, 10, '96.webp', 6, 1),
(97, 'NINTENDO Switch', 'NINTENDO Switch™ – OLED-Modell (weiß) + Mario Kart 8 Deluxe + Nintendo Switch Online – 12-monatige (365-tägige) Einzelmitgliedschaft', 200, 10, '97.webp', 3, 2),
(98, 'APPLE AirPods Pro', 'Die AirPods Pro (2. Generation) mit USB-C liefern bis zu 2x bessere Aktive Geräuschunterdrückung als die vorherige Generation, mit dem Transparenzmodus kannst du dein Umfeld hören und das neue Adaptive Audio passt die Geräuschsteuerung dynamisch an deine Umgebung an. Die Konversationserkennung verringert die Lautstärke deiner Medien und verstärkt die Stimmen vor dir, wenn du mit anderen interagierst. Eine Aufladung liefert bis zu 6 Stunden Batterielaufzeit.', 200, 10, '98.webp', 6, 4),
(99, 'SOLAR Smartwatch', 'Das Beste. Ohne Kompromisse. Die neue Generation der fenix® 7 Pro kommt in drei Größen, mit LED-Taschenlampe sowie Trainings- und Gesundheitsfunktionen - für deine beste Performance.\r\nDas Power Glass™ mit Solar-Ladelinse sorgt für extra Ausdauer - bis zu 37 Tage im Smartwatch-Modus und bis zu 122 Std. im GPS-Modus. Ermittle aus Trainingsbelastung, Erholung, Schlaf und weiteren Gesundheitsdaten deine individuelle Trainingsbereitschaft.', 400, 0, '99.webp', 6, 4),
(100, 'iPhone 16 Pro 5G', 'Betriebssystem\r\n\r\niOS\r\n\r\nProzessor\r\n\r\nA18 Pro Chip, Neue 6‑Core CPU mit 2 Performance-Kernen und 4 Effizienz-Kernen, Neue 6‑Core GPU, Neue 16‑Core Neural Engine\r\n\r\nSpeicherkapazität\r\n\r\n1 TB\r\n\r\nSensoren\r\n\r\nFace ID, LiDAR Scanner, Barometer, Gyrosensor mit großem Dynamikbereich, High-g Beschleunigungssensor, Näherungssensor, Zwei Umgebungslichtsensoren', 2000, 10, '100.webp', 6, 4),
(101, 'PlayStation Portal', 'Deine PS5 in deinen Händen\r\nDer PlayStation Portal™ Remote-Player gibt dir über dein WLAN-Heimnetzwerk Zugriff auf die Spiele auf deiner PS5®-Konsole und lässt dich auf einem wunderschönen 8-Zoll-LCD-Bildschirm mit einer Auflösung von 1080p bei 60 fps direkt ins Spielvergnügen springen, ohne dafür einen Fernseher zu benötigen.', 219, 10, '101.webp', 2, 4),
(102, 'Gaming Headset', 'Das STEELSERIES Arctis Nova 1 Gaming Headset ist dein starker Begleiter für lange Gaming-Sessions. Der starke Frequenzgang von 20 bis 22000 Hz lässt dich tief in eine immersive Klangwelt eintauchen. Das Over-ear-Design sorgt für maximalen Komfort, während das integrierte Mikrofon deine Kommunikation klar und deutlich überträgt. So bist du in hitzigen Multiplayer-Matches für deine Teamkameraden klar verständlich.', 40, 10, '102.webp', 3, 4),
(103, 'PS4 500GB JET BLACK', 'Filme anschauen ist schön. Ein netter Event allein, zu zweit oder mit Freunden. Doch wie wäre es, mitzuspielen und wirklich Teil zu sein von einer großen Mission und phantastischen Bilderwelten? Probieren Sie es aus!\r\n\r\nDiese SONY PlayStation 4 Konsole 500GB CUH-1116A Schwarz unterstreicht mit der bewährten schwarzen Farbgebung Ihre Freude an klassischem Design. Technisch geht es mit dem PlayStation 4-System leistungsstark zu. Spielstände und erreichte Levels löschen müssen? Kommt für Sie nicht in Frage! Mit dieser Variante bekommen Sie 500 GB Speicherplatz und haben ein hochwertiges System. Der Arbeitsspeicher ist 8 GB groß.', 490, 20, '103.webp', 2, 4),
(104, 'APPLE AirPods Max', 'Das ultimative persönliche Over-Ear Hörerlebnis – jetzt in neuen Farben. Die AirPods Max liefern ein beeindruckend detailreiches Hi-Fi Audio für ein einzigartiges Hörerlebnis. Personalisiertes 3D Audio mit dynamischem Head Tracking für Sound, der dich komplett umgibt. Aktive Geräuschunterdrückung auf Pro Level, um unerwünschte Geräusche auszublenden. Transparenzmodus, um dein Umfeld problemlos zu hören. Bis zu 20 Std. Batterielaufzeit mit einer Aufladung. Einfaches Setup und On‑Head Erkennung für ein fast magisches Hörerlebnis. Jetzt mit USB‑C zum einfachen Laden.', 555, 100, '104.webp', 6, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seller`
--

CREATE TABLE `seller` (
  `PK_Seller_ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `E_Mail` varchar(55) NOT NULL,
  `Passwort` varchar(200) NOT NULL,
  `Telefonnummer` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `seller`
--

INSERT INTO `seller` (`PK_Seller_ID`, `Name`, `E_Mail`, `Passwort`, `Telefonnummer`) VALUES
(1, 'Hardware-Deals', 'Omid@gmail.com', '202cb962ac59075b964b07152d234b70', '12345678910'),
(2, 'Hardware-Shop', 'Omi4@gmail.com', '202cb962ac59075b964b07152d234b70', '12345678834'),
(3, 'Talahon-Hardware', 'Risan@gmail.com', '202cb962ac59075b964b07152d234b70', '1234566788'),
(4, 'Alman Hardware', 'Albert@gmail.com', '202cb962ac59075b964b07152d234b70', '1234566788');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  ADD PRIMARY KEY (`PK_Bestellung_ID`);

--
-- Indizes für die Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`PK_Kategorie_ID`);

--
-- Indizes für die Tabelle `kunde`
--
ALTER TABLE `kunde`
  ADD PRIMARY KEY (`PK_Kunde_ID`);

--
-- Indizes für die Tabelle `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`PK_Produkt_ID`);

--
-- Indizes für die Tabelle `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`PK_Seller_ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bestellung`
--
ALTER TABLE `bestellung`
  MODIFY `PK_Bestellung_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT für Tabelle `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `PK_Kategorie_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `kunde`
--
ALTER TABLE `kunde`
  MODIFY `PK_Kunde_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `produkt`
--
ALTER TABLE `produkt`
  MODIFY `PK_Produkt_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT für Tabelle `seller`
--
ALTER TABLE `seller`
  MODIFY `PK_Seller_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
