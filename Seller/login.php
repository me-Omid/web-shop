<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php
        $mail = $_POST["mail"];
        $pass = $_POST["password"];

        if($mail == null or $pass == null){
            header("Location: ./index.php");
            echo("Eingabe ist nicht leer");
        }

        $servername = "localhost"; // Server-Adresse (z. B. 127.0.0.1)
        $username = "root";        // Benutzername der Datenbank
        $password = "";            // Passwort (bei XAMPP oft leer)
        $database = "talahon_shop";      // Name der Datenbank

        $sql = "SELECT * FROM seller where E_Mail = '$mail' and Passwort = '$pass';";

        $conn = new mysqli($servername, $username, $password, $database);

        if ($conn->connect_error) {
            die("Verbindung fehlgeschlagen: " . $conn->connect_error);
            echo("!!!!!!!!!Verbindung fehlgeschlagen!!!!!!!");
        }
        $result = $conn->query($sql); //ergebnisse in result speichern
        if($result->num_rows > 0){ // Wenn Anzahl der Ergebnisse größer als 0
            $row = $result->fetch_assoc(); // Die erste reihe in row speichern
            $Seller_ID = $row["PK_Seller_ID"]; // Die Spalte ID in Seller_ID speichern
            session_start(); // Session Starten
            $_SESSION["Seller_ID"] = $Seller_ID; // Die ID in einer Session Speichern
            echo( $_SESSION['Seller_ID']);
            header("Location: ./seller.php");

        }
        else{ // Wenn ergebniss nich vorhanden
            echo("Keine Daten vorhanden");
            header("Location: ./index.php");
        }


    ?>
    
</body>
</html>