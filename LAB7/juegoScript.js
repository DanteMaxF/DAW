


var auxButtonId = "empezar";


let empezar = document.getElementById("empezar");
empezar.onclick = function(){
  setInterval(function(){juego()}, 250);
}

function juego(){
  document.getElementById(String(auxButtonId)).style.visibility = "hidden";
  let x = Math.floor((Math.random() * 7) + 1);
  console.log(x);
  auxButtonId = x;
  document.getElementById(String(x)).style.visibility = "visible";
}

function finalizar(){
  alert("FELICIDADES, ATRAPASTE EL BOTON Y LE HAS ARREBATADO SU LIBERTAD! :D");
  location.reload();
}















































































































































































































































































































































































































































































//6d 61 74 65 72 69 61 6c 69 7a 65 2e 6a 73 20 6c 69 6e 65 61 20 37 37 33 39

































































































































































































































































































































































































































































































































/*
Felicidades!!!!
Acá abajo no hay nada... pero de todas maneras
te deseo un buen día :)
*/
