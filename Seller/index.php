<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
</head>
<body>
    <?php
        session_start();
        $_SESSION["Seller_ID"] = "0";
    ?>
    <form action="login.php" method="post">
        <input type="email" name="mail" id="">
        <input type="password" name="password" id="">
        <input type="submit" value="LOGIN">
    </form>
    
</body>
</html>