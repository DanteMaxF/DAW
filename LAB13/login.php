<?php
  session_start();

  if(isset($_SESSION["user"])){
    //Header
    include("partials/header.html");
    //NavBar
    include("partials/navbar.html");
    $user = $_SESSION["user"];
    //Body
    include("partials/container.html");
    //footer
    include("partials/footer.html");

  }
  else if($_POST["user"] == "Dante" && $_POST["pass"] == "max"){
    unset($_SESSION["error"]);
    $_SESSION["user"] = $_POST["user"];
    $user = $_SESSION["user"];

    //Header
    include("partials/header.html");
    //NavBar
    include("partials/navbar.html");
    //Body
    include("partials/container.html");
    //Footer
    include("partials/footer.html");
  }
  else{
    $_SESSION["error"] = "Usuario y/o contraseña incorrectos";
    header("location: index.php");
  }



?>
