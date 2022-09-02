
const prompt = require("prompt-sync")({sigint: true})

const saludarUsuario = (usuario)=> {
    return  `hola ${usuario}, como estas?`
}
// alt+96= ` 
const saludarUsuarioEdad = (edad)=> {
    return  `Pero mirá vos, asi que tenes ${edad} pirulos.`
}


let saludoFinal = saludarUsuario( prompt("Su nombre es: ") )
console.log( saludoFinal)

let saludoEdad = saludarUsuarioEdad( prompt("Cuantos años tenes? ") )
console.log( saludoEdad)