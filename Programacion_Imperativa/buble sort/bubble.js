//A partir de él siguiente array de edades nos solicitan realizar lo siguiente
// 
const edades = [33, 27, 34, 30, 34, 25];

// 
//
//Desarrollar una función que ordene internamente de forma ascendente las edades, la misma deberá retornar él array ordenado , es decir deberíamos obtener resultado como él siguiente.
//[25, 27, 30, 33, 34, 34]
//
//Desarrollar una función que ordene internamente de forma descendente las edades, la misma deberá retornar él array ordenado , es decir deberíamos obtener resultado como él siguiente.
//[34, 34, 33, 30, 27, 25]

function ordenarASC   (arr, ASC) {
    let aux

    for (let i = 0; i < arr.length; i++) {
        
        for (let j = 0; j < arr.length-1; j++) { // -1 porque al ultimo no lo voy a evaluar
            if (ASC) {
                if (arr[j] > arr[j+1]) {
                    aux= arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = aux
                }
            }
            else {
                if (arr[j] < arr[j+1]) {
                    aux= arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = aux
                }
            }
            

        }
        
    }
}
//console.log(edades)
//ordenarASC(edades, false)
//console.log(edades)





//Dado un array de strings:
const letras = ['C', 'A', 'D', 'E', 'H', 'Z', 'J', 'L']
//
//¿Cómo pudieras ordenar el array anterior, alfabéticamente?
function ordenar(arr, ASC) {
    let aux
    for (let i = 0; i < arr.length; i++) {        
        for (let j = 0; j < arr.length-1; j++) { // -1 porque al ultimo no lo voy a evaluar
            if (ASC) {
                if (arr[j] > arr[j+1]) {
                    aux= arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = aux
                }
            }
            else {
                if (arr[j] < arr[j+1]) {
                    aux= arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = aux
                }
            }
        }        
    }
}
// console.log(letras)
// ordenar(letras, false)
// console.log(letras)


//3. A partir del siguiente array de Objetos Literales se solicita realizar lo siguiente:
const arrayCuentas =
    [
        {
            titular: "Arlene Barr",
            estaHabilitada: false,
            saldo: 3253.40,
            edadTitular: 33,
            tipoCuenta: "sueldo"
        },
        {
            titular: "Roslyn Torres",
            estaHabilitada: false,
            saldo: 3229.45,
            edadTitular: 27,
            tipoCuenta: "sueldo"
        },
        {
            titular: "Cleo Lopez",
            estaHabilitada: true,
            saldo: 1360.19,
            edadTitular: 34,
            tipoCuenta: "corriente"
        },
        {
            titular: "Daniel Malone",
            estaHabilitada: false,
            saldo: 3627.12,
            edadTitular: 30,
            tipoCuenta: "sueldo"
        },
        {
            titular: "Ethel Leon",
            estaHabilitada: true,
            saldo: 1616.52,
            edadTitular: 34,
            tipoCuenta: "sueldo"
        },
        {
            titular: "Harding Mitchell",
            estaHabilitada: true,
            saldo: 1408.68,
            edadTitular: 25,
            tipoCuenta: "corriente"
        }
    ]



//    Desarrollar una función que ordene internamente de forma ascendente según él saldo de cada cuenta, la misma deberá retornar él array ordenado .
//
//    Desarrollar una función que ordene internamente de forma ascendente según la edad del titular de cada cuenta, la misma deberá retornar él array ordenado.
//    
//    
//    Ayuda: Utilizá Bubble Sort para todos los ejercicios.  

function ordena2(arr, propiedad) {
    let aux
    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr.length - 1; j++) { // -1 porque al ultimo no lo voy a evaluar

            if (arr[j][propiedad] > arr[j + 1][propiedad]) {
                aux = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = aux
            }
        }
    }

}
console.log('***************ORDENADO POR SALDOS****************')

ordena2(arrayCuentas,'saldo')
console.table(arrayCuentas)
console.log('*******************************')
console.log('*******************************')
console.log('*******************************')
console.log('*******************************')
console.log('***************ORDENADO POR EDADES****************')
ordena2(arrayCuentas,'edadTitular')
console.table(arrayCuentas)
