<?php
    session_start();
    require_once("util.php");

    if(isset($_SESSION["user"]) ) {
        include("partials/header.html");
        include("partials/navbar.html");
        $user = $_SESSION["user"];

        include("partials/home.html");

        
        include("partials/footer.html");

    }else if (login($_POST["user"], $_POST["password"]) ) {
        unset($_SESSION["error"]);
        $_SESSION["user"] = $_POST["user"];
        $user = $_SESSION["user"];
        include("partials/header.html");
        include("partials/navbar.html");

        include("partials/home.html");

        include("partials/footer.html");
    }else{
        $_SESSION["error"] = "Usuario y/o contraseña incorrectos";
        header("location: index.php");
    }

?>
