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


function getTabla() {
      $db = connectDB();
      if ($db != NULL) {

          //Specification of the SQL query
          $query='SELECT * FROM alumnos';
          $query;
           // Query execution; returns identifier of the result group
          $results = $db->query($query);
           // cycle to explode every line of the results

         $html = '<table class="striped">';
         $html .= '<thead>';
         $html .= '<tr>';
         $columnas = $results->fetch_fields();
         for($i=0; $i<count($columnas); $i++) {
              $html .= '<th>'.$columnas[$i]->name.'</th>';
         }
         $html .= '</tr>';
         $html .= '</thead>';

         $html .= '<tbody>';
        /* while ($fila = mysqli_fetch_array($results, MYSQLI_BOTH)) {
                                              // Options: MYSQLI_NUM to use only numeric indexes
                                              // MYSQLI_ASSOC to use only name (string) indexes
                                              // MYSQLI_BOTH, to use both
                  $html .= '<tr>';
                  for($i=0; $i<count($fila); $i++) {
                      // use of numeric index
                      $html .= '<td>'.$fila[$i].'</td>';

                  }
                  $html .= '</tr>';
          }*/
          $html .= '</tbody></table>';
          // it releases the associated results
          mysqli_free_result($results);
          disconnectDB($db);
          return $html;
      }
      $html .= "<p>huehuehue</p>";
      return false;
    }


?>
