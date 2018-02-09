<!DOCTYPE html>
<html>

  <head>
    <meta charset="UTF-8">
    <title>A01207543 - Dante Flores - LAB9</title>
    <link rel="stylesheet" type=text/css href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
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
            sort($input);
            printList($input);
            promedio($input);

          }

          function printList($list){
            echo "<ul>";
            for ($x = 0; $x < count($list); $x++) {
                echo "<li>";
                echo $list[$x];
                echo "</li>";
            }
            echo "</ul>";
            echo "<p>Quizá no se vea como lista, pero el css remueve los puntos de cada elemento de la lista. Si inspeccionan el archivo se puede notar.</p>";
          }

          function promedio($list){
            $sum = 0;
            for ($x = 0; $x < count($list); $x++) {
              $sum += $list[$x];
            }
            echo "<br>";
            echo "Promedio: ";
            echo $sum / count($list);
            echo "<br>";
          }
          /*
          function mediana($list){
            if (count($list) % 2 !== 0){
              return $list[count($list)/2];
            }else{

            }
          }
          */


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
