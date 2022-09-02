// EJERCICIO 1
let retorno=-1
const paresImpares = (numero1, numero2) => {
    if (numero1!=0 && numero2 !=0) {
        if (numero1 % 2===0 && numero2 % 2===0) {
            retorno =  numero1+numero2        
        }
        else if (numero1 % 2!==0 && numero2 % 2!==0) {
            retorno= numero1*numero2        
        }        
    }
    return retorno
}
let resultado = paresImpares(3,101)
console.log (resultado)

// EJERCICIO 2 A
let persona = {
    nombre: 'Pepe',
    apellido: 'Argento',
    edad: 16,
    esArgentino: false
}

// EJERCICIO 2 B
const consultaObjeto = (objeto) => {
    if (objeto.edad>=18 && objeto.esArgentino) {
        return `${objeto.nombre} ${objeto.apellido} vive en Argentina y es mayor de edad.`        
    }
    else if (objeto.edad>18 && !objeto.esArgentino ){
        return `${objeto.nombre} ${objeto.apellido} NO vive en Argentina y es mayor de edad.`     
    }
    else if (objeto.edad<18 && objeto.esArgentino ){
        return `${objeto.nombre} ${objeto.apellido} vive en Argentina y NO es mayor de edad.`     
    }
    else if (objeto.edad<18 && !objeto.esArgentino ){
        return `${objeto.nombre} ${objeto.apellido} NO vive en Argentina y NO es mayor de edad.`     
    }
}
let resultadoConsulta = consultaObjeto(persona)
console.log (resultadoConsulta)

// EJERCICIO 3
let perros = [
    {
        nombre : "Mora",
        raza : "Pinsher",
        color : ["Naranja"]
    },
    {
        nombre : "Firulais",
        raza : "pug",
        color : ["Blanco","Marron"]
    },
    {
        nombre : "Dave",
        raza : "Golden",
        color : ["Dorado"]
    },
    {
        nombre : "Milaneso",
        raza : "salchicha",
        color : ["Marron"]
    },
   
]

const agregaColor = (arr) => {
    for (let i=0; i<arr.length;i++) {
        arr[i].color.push('Negro')
    }
}
console.log(perros)
agregaColor(perros)
console.log(perros)