var auxButtonId = "empezar";


let empezar = document.getElementById("empezar");
empezar.onclick = function(){
  setInterval(function(){juego()}, 500);
}

function juego(){
  document.getElementById(String(auxButtonId)).style.visibility = "hidden";
  let x = Math.floor((Math.random() * 7) + 1);
  console.log(x);
  auxButtonId = x;
  document.getElementById(String(x)).style.visibility = "visible";
}

function finalizar(){
  alert("FELICIDADES, ATRAPASTE EL BOTON! :D");
  location.reload();
}
