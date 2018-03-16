<?php
  require_once("util.php");
  $input = ($_GET['pattern']);
  $output = findAlumno($input);

  if ($output != "") {
    echo $input," debe ",$output;
  }else{
    echo $input," no existe.";
  }


?>
