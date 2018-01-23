//Funciones para hacer un boton de refresh
function buttonRefresh(){
  location.reload();
}

function homeButtonDisplay(){
  document.writeln('<br><button onclick="buttonRefresh()">Regresar</button>');
}


function ejercicio1(){
  var input = prompt("test");
  input = parseInt(input);
  for(var n = 1; n <= input; n++){
    document.writeln(n+" - ");
    document.writeln(n*n+"<br>");

  }
  homeButtonDisplay();
}


function ejercicio2(){

  var r1 = Math.floor((Math.random() * 10) + 1);
  var r2 = Math.floor((Math.random() * 10) + 1);
  var d1 = new Date();
  var input = prompt(r1+" + "+r2+" ?");
  var d2 = new Date();
  if(parseInt(input) == (r1+r2)){
    document.writeln("CORRECTO!"+"<br>");
  }
  else{
    document.writeln("INCORRECTO"+"<br>");
  }
  document.writeln("Tiempo de respuesta: "+((d2.getTime()-d1.getTime())/1000)+" segundos");
  homeButtonDisplay();
}

function contador(){
  var neg = 0;
  var pos = 0;
  var neu = 0;
  var arreglo = [];
  var n = 50;
  while(n > 0){
    arreglo.push((Math.floor((Math.random() * 10) + 1))*(Math.round(Math.random()) * 2 - 1));
    n--;
  }
  for (x in arreglo){
    document.writeln(""+arreglo[x]);
    if(arreglo[x] < 0){
      neg++;
    }
    else if(arreglo[x] > 0){
      pos++;
    }
    else{
      neu++;
    }
  }
  document.writeln("<br> Positivos: "+pos);
  document.writeln("<br> Negativos: "+neg);
  document.writeln("<br> Neutros: "+neu);
  homeButtonDisplay();
}

function promedios(){


  homeButtonDisplay();
}
