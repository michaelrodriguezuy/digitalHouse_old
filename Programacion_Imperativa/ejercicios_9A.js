const prompt = require("prompt-sync")({sigint: true})

//const min = 1;
//const max = 10;
//
//let numero = Math.floor(Math.random()*(max-min+1)+min);
//
//let entrada = prompt("Ingresa un numero: ")
//
//let adivino= entrada==numero ? 'Felicitaciones,ese era!' : `Lo siento, intenta nuevamente, el correcto era ${numero}`
//
//console.log(adivino)

/** *  */

//let paresAl100 = () => {
//    for (let i=0; i<101;i++) {
//        if (i%2==0) {
//            console.log(i)
//        }        
//    }
//}
//
//console.log(paresAl100())

/** eje 8 */

//let numero = prompt('ingrese un numero: ')
//
//let porcentaje = numero>500 ? `El 18% de ${numero} es ${numero*0.18}` : `El numero debe ser mayor a 500` 
//
//console.log(porcentaje)

//9) Escribí una función llamada elemento que recibe un arreglo como parámetro. La función debe devolver el valor que se encuentra en la tercera posición. 
//   Si el arreglo no tiene al menos 3 elementos deberá retornar -1.
//const elemento = arreglo =>{
//    if (arreglo.length>2) {
//        for (let i=0; i<arreglo.length;i++) {
//            return arreglo[2]
//        }
//    }
//    else {return (-1)}   
//    
//}
//
//console.log(elemento([1,2,'hola',3,2,6,100]))

/** */
//10) Se ingresa por teclado un número natural de hasta 2 cifras, si tiene una cifra que muestre lo mínimo que le falta para ser un número de 2 cifras; 
//de lo contrario, que muestre lo mínimo que le falta para ser un número de 3 cifras. Considerar que el usuario ingresa números de hasta dos cifras.
//const cifrasDoble = numero => {
//    if (numero.length=1) {
//        //return 10-numero
//        return numero.length
//    }
//    else if (numero.length=2) {
//        return 100-numero
//    }
//    else {return numero }
//}
//
//console.log (cifrasDoble(3))


/** */
//11) Hacer un algoritmo que muestre el promedio de varias notas o de N notas ingresadas, se debe definir el valor de N para conocer la cantidad de notas 
//a ingresar.
//let prom=0
//const promedio = arrNotas => {
//    
//    for (let i=0; i<arrNotas.length;i++) {
//        prom= prom+arrNotas[i]
//    }
//    return prom / arrNotas.length
//    
//}
//console.log(promedio([5,6,4,3,9,9,2]))

/** */
//12) Hacer un programa que calcule la suma de los N primeros números naturales, dónde N es el número límite ingresado por teclado.
let resultado=0
const sumaNaturales = numLimite => {
    for (let i=1; i<=numLimite; i++) {
        resultado+= i
    }
    return resultado
}

console.log (sumaNaturales(4))