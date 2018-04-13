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


//Tabla de alumnos
function getAlumno(){
    $conn = connectDB();
    $sql = "SELECT * FROM alumnos";
    $result = mysqli_query($conn, $sql);
    disconnectDb($conn);

    if(mysqli_num_rows($result) > 0){
      echo '<table class="striped responsive-table">';
      echo '<thead><tr>';
        echo '<th>Nombre</th>';
        echo '<th>Carrera</th>';
        echo '<th>Deuda</th>';
      echo '</tr></head>';
      echo '<tbody>';
      while($row = mysqli_fetch_assoc($result)){
        echo "<tr>";
        echo "<td>" . $row["nombreA"] . "</td>";
        echo "<td>" . $row["carreraA"] . "</td>";
        echo "<td>$" . $row["deuda"] . "</td>";
        echo "</tr>";
      }
      echo '</tbody>';
      echo "</table>";
    }
}

function insertAlumno($nombre,$carrera,$deuda){
  $db = connectDB();
        if ($db != NULL) {

            // insert command specification
            $query='INSERT INTO alumnos (nombreA,carreraA,deuda) VALUES (?,?,?) ';
            mysqli_query($db, $query);
            // Preparing the statement
            if (!($statement = $db->prepare($query))) {
                die("Preparation failed: (" . $db->errno . ") " . $db->error);
            }
            // Binding statement params
            if (!$statement->bind_param("ssi", $nombre, $carrera, $deuda)) {
                die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
            }
             // Executing the statement
             if (!$statement->execute()) {
                die("Execution failed: (" . $statement->errno . ") " . $statement->error);
              }
            //mysqli_free_result($result);
            disconnectDB($db);
            return true;
        }
        return false;
}



?>
