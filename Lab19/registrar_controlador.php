<?php

  session_start();
  require_once("util.php");

  if(isset($_SESSION["user"]) ) {

      $nombre = $_POST['nombreA'];
      $carrera = $_POST['carreraA'];
      $deuda = $_POST['deuda'];

      if(strlen($nombre) > 0 && strlen($nombre) < 41
         && strlen($carrera) > 0 && strlen($carrera) < 6
         && is_numeric($deuda)){
        if(insertAlumno($nombre,$carrera,$deuda)){
          $_SESSION["registroA"] = "Registro de: ".$nombre." realizado exitosamente";
        }else{
          $_SESSION["registroA"] = "Error en el registro";
        }
      }
      else{
        $_SESSION["registroA"] = "Error en los parámetros de registro";
      }
      header("location: index.php");

  }else{
    $_SESSION["error"] = "Tienes que iniciar sesión";
    header("location: index.php");
  }

?>
