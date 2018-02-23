<!DOCTYPE html>
<html>
  <!--Header-->
  <?php include("partials/header.html"); ?>

  <!--NavBar-->
  <?php include("partials/navbar.html"); ?>

  <body>

    <div class="contenido">
      <div class="container">
        <h3 class="center-align"><strong>EJERCICIO</strong></h3>
        <p class="center-align">
          Antes que nada, sería bueno que crearas una cuenta.
        </p>
        <br>
        <br>
        <br>
        <?php include("partials/modalRegister.html"); ?>
        <br>
        <br>
        <br>
        <br>
        <br>
      </div>
    </div>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <script src="js/init.js"></script>
  </body>

  <!--Footer-->
  <?php include("partials/footer.html"); ?>

</html>
