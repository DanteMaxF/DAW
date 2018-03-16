<?php
//CONECTAR CON BASE DE DATOS (USAR EN CADA FUNCION)
function connectDB(){
  $mysql = mysqli_connect("localhost","root","","dawlab14");
  $mysql->set_charset("utf8");
  return $mysql;
}

//DESCONECTAR CON BASE DE DATOS (USAR EN CADA FUNCION)
function disconnectDB($mysql){
  mysqli_close($mysql);
}

//FUNCION PARA VERIFICAR EL LOGIN
function login($user, $passwd) {
  $db = connectDB();
  if ($db != NULL) {

    //Specification of the SQL query
    $query='SELECT nombre FROM usuarios WHERE nombre="'.$user.
        '" AND pass="'.$passwd.'"';
    $query;
     // Query execution; returns identifier of the result group
    $results = $db->query($query);
     // cycle to explode every line of the results

    if (mysqli_num_rows($results) > 0)  {
      // it releases the associated results
      mysqli_free_result($results);
      disconnectDB($db);
      return true;
    }
    return false;
  }
  return false;
}


//FUNCION PARA BUSCAR UN ALUMNO
function findAlumno($user) {
  $db = connectDB();
  $res = "";
  if ($db != NULL) {
    //Guardar query en una variable
    $query = 'SELECT deuda FROM alumnos WHERE nombreA="'.$user.'"';
    //Ejecutar query y guardar en $results
    $results = mysqli_query($db,$query);
    disconnectDB($db);

    //Verificar que el query encontro resultados
    if (mysqli_num_rows($results) > 0)  {
      //Guardar resultados en un string
      if($row = mysqli_fetch_assoc($results)){
        $res ="".$row["deuda"]."";
      }else{
        $res = "-1";
      }
    }
    //Liberar resultados del query
    mysqli_free_result($results);
  }
  //Devolver nombre del usuario
  return $res;
}



?>
