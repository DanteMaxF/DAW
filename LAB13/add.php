<?php
    session_start();

    if(isset($_SESSION["user"]) ) {
        include("partials/header.html");
        include("partials/NavBar.html");

        include("partials/imageForm.html");

    } else {
        header("location:index.php");
    }
?>
