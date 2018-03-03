<?php
    session_start();
    if(isset($_SESSION["user"]) ) {
        header("location: login.php");
    } else {
        include("partials/header.html");
        include("partials/navbar.html");
        include("partials/loginForm.html");
        include("partials/scripts.html");
        include("partials/footer.html");
    }
?>
