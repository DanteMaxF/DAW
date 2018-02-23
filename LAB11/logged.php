<!DOCTYPE html>
<html>
  <!--Header-->
  <?php include("partials/header.html"); ?>

  <!--NavBar-->
  <?php include("partials/navbar.html"); ?>

  <body>

    <div class="contenido">
      <div class="container">
        <p>
          <?php

          if ($_POST["mail"]==$_POST["maillogin"] && $_POST["pass"]==$_POST["passlogin"] ) {

              echo "<h2> FELICIDADES ".$_POST["nombre"]." ".$_POST["apellido"]."</h2>";
              echo "Has logrado completar el registro e inicio de sesión :D";

          }else{
              echo "Oops! Al parecer insertaste mal tu correo o contraseña";
          }

          ?>
        </p>
      </div>
    </div>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script src="js/init.js"></script>
  </body>

  <!--Footer-->
  <?php include("partials/footer.html"); ?>

</html>
