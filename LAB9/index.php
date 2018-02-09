<!DOCTYPE html>
<html>

  <head>
    <meta charset="UTF-8">
    <title>A01207543 - Dante Flores - LAB9</title>
    <link rel="stylesheet" type=text/css href="styles.css">
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">-->
  </head>

  <header>
    <h1>Dante Flores Moreno</h1>
    <h1>Lab 9</h1>
  </header>

  <body>
    <!--NAVBAR-->
    <nav>
      <div class="nav-wrapper grey darken-2">
         <ul class="left">
           <li class="active"><a href="index.php">Home</a></li>

         </ul>
       </div>
    </nav>

    <div class="contenido">
      <div class="container">
        <h3><strong>HOME</strong></h3>
        <p>
          Bienvenidos a mi laboratorio 9
        </p>
        <p>
          Disfrutenlo :D
        </p>

        <h4>Ejercicio 1: promedio</h4>
        <p>Ingrese un arreglo de numeros separados por comas</p>

        <form method="post">
            <input type="text" name="prom" /><br />
            <input type="submit" name="submit"/>
        </form>

        <?php
          if(count($_POST) > 0){
            $input = explode(',', $_POST["prom"]);
            echo "<ul>";
              echo "<li>"; echo "Promedio: ";  echo promedio($input);   echo "</li>";       //Promedio
              echo "<li>"; echo "Mediana: ";  echo mediana($input);     echo "</li>";       //Mediana
              echo "<li> Ascendente"; printListAscendent($input);       echo "</li>";       //Ordenar de manera ascendente
              echo "<li> Descendente"; printListDescendent($input);     echo "</li>";       //Ordenar de manera descendente
            echo "</ul>";
            printTable($input);

          }

          function printListAscendent($list){
            $auxList = $list;
            sort($auxList);
            echo "<ul>";
            for ($x = 0; $x < count($auxList); $x++) {
                echo "<li>";
                echo $auxList[$x];
                echo "</li>";
            }
            echo "</ul>";
          }

          function printListDescendent($list){
            $auxList = $list;
            rsort($auxList);
            echo "<ul>";
            for ($x = 0; $x < count($auxList); $x++) {
                echo "<li>";
                echo $auxList[$x];
                echo "</li>";
            }
            echo "</ul>";
          }

          function promedio($list){
            $sum = 0;
            for ($x = 0; $x < count($list); $x++) {
              $sum += $list[$x];
            }
            return $sum / count($list);
          }

          function mediana($list){
            $auxList = $list;
            sort($auxList);
            if (count($auxList) % 2 != 0){
              return $auxList[count($auxList)/2];
            }else{
              return ($auxList[count($auxList)/2] + $auxList[count($auxList)/2 + 1] ) /2;
            }
          }

          function printTable($list){
            $auxList = $list;
            $maxNum = 0;
            sort($auxList);
            echo "<table>";
              for ($y = 0; $y < count($auxList); $y++) {
                $maxNum = $auxList[$y];
              }
              echo "MAX: ";
              echo $maxNum;
              for ($x = 1; $x <= $maxNum; $x++) {
                echo "<tr>";
                  echo "<td>";
                    echo $x;
                  echo "</td>";
                  echo "<td>";
                    echo $x * $x;
                  echo "</td>";
                  echo "<td>";
                    echo $x * $x * $x;
                  echo "</td>";
                echo "</tr>";
              }
            echo "<table>";
          }
        ?>



      </div>
    </div>


    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/materialize.min.js"></script>

  </body>

  <footer>
    <p>Editor HTML: <a href="https://atom.io/">Atom</a></p>
    <p>Materialize. (n.d.). Materialize [Online]. Disponible en: <a href="http://materializecss.com/">http://materializecss.com/</a><p>

  </footer>

</html>
