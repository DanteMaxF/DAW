<?php
  session_start();


  if($_POST["user"] == "Dante"){
    $_SESSION["usuario"] = $_POST["user"];
    $_SESSION["contrasena"] = $_POST["pass"];
    
    //Header
    include("partials/header.html");

    //NavBar
    include("partials/navbar.html");

    echo "Hola ".$_SESSION["usuario"];
  }
  else{
    echo "El usuario debe ser Dante";
  }



?>
