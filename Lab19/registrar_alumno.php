<?php
  session_start();
  require_once("util.php");

  if(isset($_SESSION["user"]) ) {
      include("partials/header.html");
      include("partials/navbar.html");
      $user = $_SESSION["user"];

      include("partials/alumno_form.html");

      include("partials/scripts.html");
      include("partials/footer.html");

  }else{
    $_SESSION["error"] = "Tienes que iniciar sesión";
    header("location: index.php");
  }

?>
