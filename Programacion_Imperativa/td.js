const prompt = require("prompt-sync")({sigint: true})

let frase = prompt("Ingrese su frase para convertir: ")

const convierteFrase = () => {return `!!${frase}¡¡, andas perdido...`}

console.log(convierteFrase())


//al declarar la variable ya guardo el valor que necesita el usuario
//en la funcion flecha, modifico el valor ingresado por el usuario
//con el console.log muestro lo que me retorna la funcion