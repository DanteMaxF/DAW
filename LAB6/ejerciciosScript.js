var GLOBALOUTPUT1 = "[________]";
var GLOBALOUTPUT2 = "[________]";

let t1 = document.getElementById("texto1");
t1.onmouseover = function(){
  t1.style.color = "red";
  t1.innerHTML = GLOBALOUTPUT1;
}
t1.onmouseout = function(){
  t1.style.color = "black";
  t1.innerHTML = "[PASA EL MOUSE PARA VER EL TEXTO ENCRIPTADO]";
}


let t2 = document.getElementById("texto2");
t2.onmouseover = function(){
  t2.style.color = "red";
  t2.innerHTML = GLOBALOUTPUT2;
}
t2.onmouseout = function(){
  t2.style.color = "black";
  t2.innerHTML = "[PASA EL MOUSE PARA VER EL TEXTO DESENCRIPTADO]";
}





function nextChar(c) {
    return String.fromCharCode(c.charCodeAt(0) + 1);
}
function prevChar(c) {
    return String.fromCharCode(c.charCodeAt(0) - 1);
}

function encriptar(){
  var input = document.getElementById("entrada1").value;
  var output = [];
  input = input.toUpperCase();
  for (x in input){
    output += nextChar(input[x]);
  }
  t1.innerHTML = "[PASA EL MOUSE PARA VER EL TEXTO ENCRIPTADO]"
  GLOBALOUTPUT1 = output;
}

function desencriptar(){
  var input = document.getElementById("entrada2").value;
  var output = [];
  input = input.toUpperCase();
  for (x in input){
    output += prevChar(input[x]);
  }
  t2.innerHTML = "[PASA EL MOUSE PARA VER EL TEXTO DESENCRIPTADO]"
  GLOBALOUTPUT2 = output;
}







function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}



function anuncio() {
    var popup = document.getElementById("myPopup");
    popup.classList.toggle("show");
}

function anuncio2() {
    var popup = document.getElementById("myPopup2");
    popup.classList.toggle("show");
}
