<?php 

    $id = $_GET["id"];

    echo($id);

    $servername = "localhost"; // Server-Adresse (z. B. 127.0.0.1)
    $username = "root";        // Benutzername der Datenbank
    $password = "";            // Passwort (bei XAMPP oft leer)
    $database = "talahon_shop";      // Name der Datenbank

    $sql = "DELETE FROM `produkt` WHERE (`PK_Produkt_ID` = '$id');";
    $conn = new mysqli($servername, $username, $password, $database);

    if ($conn->connect_error) {
        die("Verbindung fehlgeschlagen: " . $conn->connect_error);
        header("Location: index.php");
    }
    $result = $conn->query($sql); // SQL-Abfrage ausführen
    header("Location: ./seller.php");

?>