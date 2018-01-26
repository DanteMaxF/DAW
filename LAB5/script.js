//JAVASCRIPT DANTE FLORES MORENO A01207543


var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
    modal.style.display = "block";
}
span.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function verPass(){
  var verificacion = 1;
  var uppercase = 0;
  var input1 = document.getElementById("entrada1").value;
  var input2 = document.getElementById("entrada2").value;
  console.log(input1);
  console.log(input2);

  if(input1.length < 6){
    alert("Debe ser de al menos 6 caracteres");
    verificacion = 0;
  }
  for (n in input1){
    if(input1[n] == input1[n].toUpperCase()){
      uppercase = 1;
    }
  }
  if(uppercase == 0){
    alert("Debe tener una mayúscula");
    verificacion = 0;
  }
  if(input1 != input2 && verificacion == 1){
    alert("No coincide con la confirmación");
    verificacion = 0;
  }

  if(verificacion == 1){
    alert("Validado");
  }
}

function calcDayan(){
  console.log(document.getElementById("dayanInput").value);
}

var dayan = 257;
var yongjun = 257;
var yuxin = 257;
