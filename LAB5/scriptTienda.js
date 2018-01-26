//JAVASCRIPT DANTE FLORES MORENO A01207543
function calcDayan(){
  var cantidad = parseInt(document.getElementById("entradaDayan").value);
  if(cantidad > 0 && cantidad < 6){
    alert("El precio por comprar "+cantidad+" elementos del producto es de $"+((cantidad*dayan)+((cantidad*dayan)*.15))+" (IVA incluido 15%)");
  }
  else{
    alert("Cantidad no disponible");
  }
}

function calcYongJun(){
  var cantidad = parseInt(document.getElementById("entradaYong").value);
  if(cantidad > 0 && cantidad < 21){
    alert("El precio por comprar "+cantidad+" elementos del producto es de $"+((cantidad*yongjun)+((cantidad*yongjun)*.15))+" (IVA incluido 15%)");
  }
  else{
    alert("Cantidad no disponible");
  }
}

function calcYuxin(){
  var cantidad = parseInt(document.getElementById("entradaYuxin").value);
  if(cantidad > 0 && cantidad < 51){
    alert("El precio por comprar "+cantidad+" elementos del producto es de $"+((cantidad*yongjun)+((cantidad*yongjun)*.15))+" (IVA incluido 15%)");
  }
  else{
    alert("Cantidad no disponible");
  }
}

var dayan = 257;
var yongjun = 120;
var yuxin = 140;
