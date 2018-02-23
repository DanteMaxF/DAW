<form class="col s12" action="logged.php" method="POST">


    <input name="nombre" id="nombre" type="hidden" class="validate" value="<?php echo $_POST["nombre"]; ?>" required>
    <input name="apellido" id="apellido" type="hidden" class="validate" value="<?php echo $_POST["apellido"]; ?>" required>
    <input name="apellido" id="apellido" type="hidden" class="validate" value="<?php echo $_POST["mail"]; ?>" required>
    <input name="apellido" id="apellido" type="hidden" class="validate" value="<?php echo $_POST["pass"]; ?>" required>




  <div class="col s6">
    <button class="btn waves-effect waves-light grey darken-4" type="submit" name="action">Iniciar sesión

    </button>
  </div>

</form>
