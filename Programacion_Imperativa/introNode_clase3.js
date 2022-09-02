//esto es un comentario
//importo la libreria prompt-sync

const prompt = require("prompt-sync")({sigint: true})

let Bienvenida = "Hola bienvenido a NodeJS"
console.log(Bienvenida)
console.log("   ***************")


let usuario = prompt("Ingrese su nombre de usuario:")
//console.log( "Hola " + usuario + " como estas?" )

//link template literals (backsticks) -> LO USO PARA CONCATENAR
console.log(`Hola  ${usuario} como estas? todo bien ?`) //escape de backsticks

//Una variable es una caja donde guardamos algo, usa un espacio en memoria
//declararndo variables LET o CONST (escribirleas en mayusculas)
//El nombre de una variable puede estar entre comillas dobles o simples (string)

//en javascript no es necesario usar el ., para finalizar

//Los decimales se escriben con el punto .

//undefined es un tipo de variable que no esta definido, existe pero no tiene un tipo definido

//NaN = not a number -> "a" * 2 da como resultado un NaN

//Operadores matematicos: console.log (10 % 3 = 1) -> % me da el resto de una division 

//Typescript -> se usa como framework para facilitar la codificacion en javascript

//operadores de comparacion -> simples o estrictos
//console.log (num1 === num2) si es igual
//console.log (num1 > num2)
//console.log (num1 !== num2) si es distinto
// == comparacion simple compara el dato
// === compara el dato y el tipo de dato

//operadores logicos
// AND &&
// OR ||

