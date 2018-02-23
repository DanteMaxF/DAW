<!DOCTYPE html>
<html>
  <!--Header-->
  <?php include("partials/header.html"); ?>

  <!--NavBar-->
  <?php include("partials/navbar.html"); ?>

  <body>

    <div class="contenido">
      <div class="container">
        <h3 class="center-align"><strong>AHORA INICIA SESION</strong></h3>
        <p class="center-align">
          Inicia sesión con los datos que ingresaste en el registro.
        </p>

        <?php include("partials/loginForm.php"); ?>

      </div>
    </div>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script src="js/init.js"></script>
  </body>

  <!--Footer-->
  <?php include("partials/footer.html"); ?>

</html>
