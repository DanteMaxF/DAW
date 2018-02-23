<form class="col s12" action="logged.php" method="POST">

    <!--AQUI SE GUARDAN LAS VARIABLES DEL REGISTRO EN LO QUE APRENDO BASES DE DATOS-->
    <input name="nombre" id="nombre" type="hidden" class="validate" value="<?php echo $_POST["nombre"]; ?>" required>
    <input name="apellido" id="apellido" type="hidden" class="validate" value="<?php echo $_POST["apellido"]; ?>" required>
    <input name="mail" id="mail" type="hidden" class="validate" value="<?php echo $_POST["mail"]; ?>" required>
    <input name="pass" id="pass" type="hidden" class="validate" value="<?php echo $_POST["pass"]; ?>" required>

    <!-- forma para iniciar sesion-->
    <div class="row">
      <div class="input-field col s12">
        <input placeholder="ejemplo@gmail.com" name="maillogin" id="maillogin" type="email" class="validate" required>
        <label for="mail">Email</label>
      </div>
    </div>

    <div class="row">
      <div class="input-field col s12">
        <input name="passlogin" id="passlogin" type="password" class="validate" required>
        <label for="pass">Contraseña</label>
      </div>
    </div>



  <div class="col s6 center-align">
    <button class="btn waves-effect waves-light grey darken-4" type="submit" name="action">Iniciar sesión

    </button>
  </div>

</form>
