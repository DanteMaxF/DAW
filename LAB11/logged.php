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
          <?php echo $_POST["nombre"]; ?>
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
