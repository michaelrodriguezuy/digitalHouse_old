// let num1 = 43;
// let num2 = 12;
// let num3 = 140;

// Crea un algoritmo que te permita identificar
// el numero mayor. Utiliza condicionales como el
// if, else, o else if.

// Escribe tu código debajo de estas lineas,
// y observa los resultados por la consola.
// especificamente para este conjunto de datos
// deberias ver por consola el numero 78,
// adicional, cambia los valores de num1, num2 y num3
// para verificar que tu algoritmo funcione con
// cualquiera 3 valores.

function retornaMayor (num1, num2, num3) {
    if (num1>num2) {
        if (num1>num3){
            return num1
        } 
        else return num3
    }
    else if (num2>num3) {
        return num2
    }
    else return num3
}

// console.log(retornaMayor(num1, num2, num3))

let num1 = 13000;
let num2 = 1663;
let num3 = 363;
let num4 = 4000;
// agrega una variable mas, llamada num4
// con un valor numerico

// Crea un algoritmo que te permita identificar
// el numero mayor de los 4 anteriores.

// Escribe tu código debajo de esta linea,
// y observa los resultados por la consola.
// Adicional, cambia los valores de los 4 numeros
// para ver que algoritmo funciona con cualquier
// conjunto de 4 numeros.

function retornaMayor2 (num1, num2, num3, num4) {
    let mayor=0
    if (num1>num2) {
        if (num1>num3){
            mayor=num1
        }  
        else mayor=num3
    }
    else if (num2>num3) {
        mayor=num2
    }
    else mayor=num3

    if(mayor<num4) {
        mayor=num4
    }

    return mayor
}

// console.log(retornaMayor2(num1, num2, num3, num4))

/**
 * Extra: que puedes hacer para identificar
 * el numero mayor de una lista de numeros,
 * como la siguiente? Utiliza Javascript.
 *
 * Tip: es valido buscar en google :)
 *
 * Adicional: al terminar tu algoritmo,
 * cambia los valores de la lista, bien sea
 * agregando o removiendo, y asegurate
 * que tu algoritmo funcione con cualquier lista
 * de numeros
 */

 const numeros = [5, 12, 2, 40, 33, 2, 8];


 function ordena(arr) {
    let aux
    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr.length - 1; j++) { // -1 porque al ultimo no lo voy a evaluar

            if (arr[j] > arr[j + 1]) {
                aux = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = aux
            }
        }
    }

}
ordena(numeros)
console.table (numeros)