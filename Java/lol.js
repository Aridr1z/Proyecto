var d = document.querySelector('.d');
var con = document.querySelector('.con');


d.innerHTML = "Hola desde JS";
d.style.color = "white";
d.style.backgroundColor = "blue";


var nParrafo = document.createElement('p');
nParrafo.textContent = "Hola soy el nuevo párrafo";
document.body.appendChild(nParrafo);

nParrafo.style.color = "red";
nParrafo.style.fontSize = "18px";
nParrafo.style.marginBottom = "10px";


var lolParrafo = document.createElement('p');
lolParrafo.textContent = "Hola soy el nuevo con";
con.appendChild(lolParrafo); 

lolParrafo.style.color = "darkgreen";
lolParrafo.style.fontSize = "18px";
lolParrafo.style.marginBottom = "10px";





var botoncito = document.createElement('button');
botoncito.className = "botoncito";
botoncito.textContent = "Botón de Clic";
botoncito.style.width = "160px";
botoncito.style.height = "40px";
botoncito.style.margin = "10px auto";
botoncito.style.display = "block";
botoncito.style.fontSize = "16px";

document.body.appendChild(botoncito);

var boton = document.querySelector('.botoncito');
boton.addEventListener('click', () => {
  alert("Haz dado un click");
});


var botonDoble = document.createElement('button');
botonDoble.className = "botonDoble";
botonDoble.textContent = "Doble Click";
botonDoble.style.width = "160px";
botonDoble.style.height = "40px";
botonDoble.style.margin = "10px auto";
botonDoble.style.display = "block";
botonDoble.style.fontSize = "16px";

document.body.appendChild(botonDoble);

var doble = document.querySelector('.botonDoble');
doble.addEventListener('dblclick', () => {
  alert("Haz dado doble click");
});