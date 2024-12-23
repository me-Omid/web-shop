<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Seller.css">
    <title>Seller</title>
</head>
<body>
    <?php
        session_start();
        $seller_ID = $_SESSION["Seller_ID"];

        $servername = "localhost"; // Server-Adresse (z. B. 127.0.0.1)
        $username = "root";        // Benutzername der Datenbank
        $password = "";            // Passwort (bei XAMPP oft leer)
        $database = "talahon_shop";      // Name der Datenbank

        $sql = "SELECT * FROM seller where PK_Seller_ID = '$seller_ID';";
        $sql2 = "SELECT * FROM produkt where FK_Seller_ID = '$seller_ID';";

        $conn = new mysqli($servername, $username, $password, $database);

        if ($conn->connect_error) {
            die("Verbindung fehlgeschlagen: " . $conn->connect_error);
            header("Location: index.php");
        }
        $result = $conn->query($sql); // SQL-Abfrage ausführen
        if($result->num_rows > 0){
            $row = $result->fetch_assoc();
        }
        else{
            header("Location: index.php");
        }
    ?>

    <header id="head">
        <div></div>
        <form action="">
            <input id="suche" type="text" value="">
            <input id="submit" type="submit" value="Suchen">
        </form>
        <div id="pf"><?php echo($row["Name"]); ?> </div>
    </header>
    <main>

        <?php
            $result = $conn->query($sql2); // SQL-Abfrage ausführen
            if($result->num_rows > 0){
                $anzahl_produkte = $result->num_rows;
                $i = 0;
                while($anzahl_produkte > $i){
                    $row = $result->fetch_assoc();
                    $i++;
                    $bild_pfad = $row['Bild_Pfad'];

                    // Sehr Unverständlich
                    echo(
                        "<div style='margin: 2dvw; width: 25dvw; height: 30dvh;border: solid black 1px;'>".
                            "<div style='width:100%; height: 80%; background-color:red;
                            background-image: url(../Bilder/Produkt_Bilder/$bild_pfad)'>".
                            
                            "</div>".
                        $row["Name"]
                        ."</div>"
                    );

                }
                

            }

        ?>
    </main>
</body>
</html>