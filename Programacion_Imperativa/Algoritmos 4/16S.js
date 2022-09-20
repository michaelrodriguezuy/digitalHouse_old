/*
Escribir un programa que muestre en pantalla los números del 1 al 100,
sustituyendo los múltiplos de 3 por la palabra “fizz”, los múltiplos de 5 por
“buzz” y los múltiplos de ambos, es decir, los múltiplos de 3 y 5 —o de 15—,
por la palabra “fizzbuzz”. Visiten este sandbox
https://codesandbox.io/s/fizzbuzz-3e9uc?file=/src/index.js para realizar
el ejercicio ahí. Recuerden desplegar la consola para ver sus resultados, y
utilicen la función console.log para mostrar datos en la misma.
*/

//function multiplos() {
//    for (let i=1; i<101; i++) {
//        if ((i % 5 === 0) && (i % 3 === 0)) {
//            console.log('fizzbuzz')
//        }
//        else if (i % 3 === 0) {
//            console.log('fizz')
//        }
//        else if (i % 5 === 0) {
//            console.log('buzz')
//        } else {
//            console.log(i)
//        }
//    }
//}
//
//multiplos()

/**Escriban una función que reciba dos parámetros: un array y un índice. La
función deberá de mostrar por consola el valor del elemento según el
índice dado. Por ejemplo, dada la siguiente array e índice, la función
imprimirá '6'. let array =
[3,6,67,6,23,11,100,8,93,0,17,24,7,1,33,45,28,33,23,12,99,100]; var index = 1;
Visiten este sandbox para escribir su código. */

//let array = ['pocho', 'casa', 'perro', 'futbol', 'netflix']
//
//const devuelveValor = (arreglo, indice) => {
//    for (let i=0; i<arreglo.length;i++) {
//        if (i==indice) {
//            return arreglo[i]
//        }
//    }
//}
//
//let resultado=devuelveValor(array,4)
//
//console.log(resultado)

/**
 *3 Escribir una función que, dado un número de mes, devuelva la cantidad
de días de ese mes —suponiendo que no es un año bisiesto—.
 */

function devuelveDias(mes, anio) {
    //let dias = new Date(anio, mes, 0).getdate()
    console.log (`El mes ${mes} en el año ${anio} fue de ${new Date(anio, mes, 0).getDate()} días.`)
}
//devuelveDias(6,2022)

/**
* 4) Escribir una función de JavaScript que invierta un número. Por ejemplo,
si x = 32443, la salida debería ser 34423.
*/

const invierteNumero = numero => {
    let nuevoNumero=numero.toString() //lo paso a string
    let resultado=''
    for (let i=0; i<nuevoNumero.length; i++) {
        
         resultado+= nuevoNumero[nuevoNumero.length-i-1]
    }
    return resultado
}
let resultado = invierteNumero(12345)
// console.log(`El resultado es ${resultado}`)

/**
*5) Escribir una función que reciba una array y solo imprima los valores que se repiten. Por ejemplo, dada la siguiente array e índice, la función imprimirá '6,23,33,100'. let array =
[3,6,67,6,23,11,100,8,93,0,17,24,7,1,33,45,28,33,23,12,99,100];
*/

let arreglo = [3,6,6,6,23,11,100,8,93,0,17,24,7,1,33,45,28,33,23,12,99,100]

const devuelveRepetidos = arr => {    
    let arrRepetidos=[]    
    let contador=0
    let arrTemporal=[]
for (let i = 0; i < arr.length; i++) {   

    for (let j = 0; j < arr.length; j++) {
        if (arr[i] == arr[j]) {
            contador+=1
        }                       
    }            
    if (contador>1) {
        arrTemporal.push(arr[i]) 
    }    
    contador=0    
}
//depurar
for (let i = 0; i < arrTemporal.length; i++) {
    for (let j = 0; j < arrTemporal.length; j++) {
        if (arrTemporal[i] == arrRepetidos[j]) {
            contador=1
        }
    }
    if (contador==0) {
        arrRepetidos.push(arrTemporal[i]) 
    }
    contador=0    
}
return arrRepetidos
}

let resultado2 = devuelveRepetidos(arreglo)
console.log (resultado2)
