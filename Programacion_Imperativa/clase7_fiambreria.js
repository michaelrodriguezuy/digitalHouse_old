const prompt = require("prompt-sync")({sigint: true})

let temperatura = prompt("Cual es la temperatura el dia de hoy? ")
let estado = prompt("Esta lloviendo? SI/NO: ")
let apto = false

let domicilio= prompt("Vive en apto o casa? APTO/CASA: ")
let pisoAscensor=0
if (domicilio =="APTO") {        
   pisoAscensor= prompt("En que piso se encuentra el ascensor?: ")
   apto = true
}
let horaActual= prompt("Que hora es?: ")

const ABRE = 8
const CIERRA = 19
let cantidadQueso = 100

const TaFrio = temperatura => {
    return temperatura>20 ? "Hace un calor barbaro" : "Abrigate el pechito"
}
const TaLloviendo = estado => {
    return estado=="SI" ? "llevate un paraguas" : "andá caminando tranquilo que no llueve"
}
const laDire = pisoAscensor => {
    return "Mirá que el ascensor esta en el piso "+pisoAscensor+", tenes que llamarlo"
}

const horario = () => {
    return horaActual>ABRE && horaActual<CIERRA ? `Si queres ir a las ${horaActual}, metele tranqui que esta abierto ` : `Cambio de planes, esta cerrado a esa hora, abre de ${ABRE} a ${CIERRA}.`
}

console.log(`${TaFrio(temperatura)}, ${TaLloviendo(estado)}`)
if (apto) {
    console.log(laDire(pisoAscensor))
}
console.log(horario(horaActual))

let loDeSiempre = prompt("Vas a llevar lo de siempre?: SI/NO ")

if (loDeSiempre=="SI") {
    console.log(`cuchame, todo bien pero me estas debiendo ${cantidadQueso*12}`)
}


