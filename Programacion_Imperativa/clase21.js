//1
//Desarrollar una función que reciba un array e indique si se encuentran ordenados de menor a mayor o no. 
//si están ordenados retornar true
//caso contrario retorna false
//ejemplos de arrays
let arr1=  [4,9,2,5,6,7,1,2] // false
let arr2 = [1,2,3,4,5,6,7,8] // true

const verificar = (arr)=>{    
    for (let i = 0; i < arr.length; i++) {
        if( arr[i] > arr[i + 1] ){ //ASC
             return false
        }        
    }    
    return true
}

// console.log(verificar(arr2))

//*****************************************************************************************************************

//2
//Desarrollar una función que genere una matriz, deberá recibir por parámetros la cantidad de filas y columnas y retornar con valores secuenciales numéricos.

let matrices2 = []
let contador=1

function nuevaMatriz(fila, columna) {
    for (let i = 0; i < fila; i++) {
        matrices2[i] = []
        for (let j = 0; j < columna; j++) {            
            matrices2[i][j] = (contador);                
            contador++
        }        
    }
    return matrices2    
}
// console.table(nuevaMatriz(5,5))

//*****************************************************************************************************************

// 3
// Dado él siguiente array de personas 
const personas =
[
    {
      nombre: "Arlene Barr",
      legajo: 3955,
      edad: 33,
    },
    {
      nombre: "Roslyn Torres",
      legajo: 3925,
      edad: 27,
    },
    {
      nombre: "Cleo Lopez",
      legajo: 1965,
      edad: 34,
    },
    {
      nombre: "Daniel Malone",
      legajo: 3925,
      edad: 30,
    },
    {
      nombre: "Ethel Leon",
      legajo: 1915,
      edad: 34,
    },
    {
      nombre: "Harding Mitchell",
      legajo: 1905,
      edad: 25,
    }
]

// -Desarrollar una función llamada orderAscLegajo que reciba por parámetro él array de personas y realice un ordenamiento de forma ascendente
function orderAscLegajo(arr, propiedad) {
    let aux
    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr.length-1; j++) { // -1 porque al ultimo no lo voy a evaluar            
            //console.log(arr[j].legajo)
            if (arr[j][propiedad]  > arr[j+1][propiedad] ) {
                aux= arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = aux
            }            
        }        
    }
}
//console.log('*****ORDEN POR DEFECTO*****')
//console.table(personas)
//orderAscLegajo(personas, 'legajo')
//console.log('*****ORDEN ASC X LEGAJO*****')
//console.table(personas)
//*****************************************************************************************************************

// -Desarrollar una función llamada orderDescLegajo que reciba por parámetro él array de personas y realice un ordenamiento de forma descendente
function orderDescLegajo(arr, propiedad) {
    let aux
    for (let i = 0; i < arr.length; i++) {        
        for (let j = 0; j < arr.length-1; j++) { // -1 porque al ultimo no lo voy a evaluar            
                if (arr[j][propiedad] < arr[j+1][propiedad]) {
                    aux= arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = aux
                }
        }        
    }
}
//orderDescLegajo(personas,'legajo')
//console.log('*****ORDEN DESC X LEGAJO*****')
//console.table(personas)

//*****************************************************************************************************************

// -Pensar de qué forma se puede realizar los dos ítems anteriores en una sola función
function ordenar(arr, propiedad, ASC) {
    let aux
    for (let i = 0; i < arr.length; i++) {        
        for (let j = 0; j < arr.length-1; j++) { // -1 porque al ultimo no lo voy a evaluar
            if (ASC) { // si true orden ascendente
                if (arr[j][propiedad] > arr[j+1][propiedad]) {
                    aux= arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = aux
                }                
            }
            else { // si false orden descendente
                if (arr[j][propiedad] < arr[j+1][propiedad]) {
                    aux= arr[j]
                    arr[j] = arr[j+1]
                    arr[j+1] = aux
                }                
            }
        }        
    }
}

// ordenar(personas,'legajo', 0) //1=true = ASC // 0=false=DESC
// console.log('*****ORDEN por PARAMETROS*****')
// console.table(personas)

// ************************************************************************

//4
// Teniendo 3 arrays:
fila1 = [4,9,2]
fila2 = [3,5,7]
fila3 = [8,1,60]
// 
// Realiza las siguientes tareas:
// Crea una matriz con esta forma:
// 4 9 2
// 3 5 7
// 8 1 6

let matrices = []

function creaMatrizDesdeArr(arr1, arr2, arr3) {
    matrices.push(arr1,arr2,arr3)      
}
creaMatrizDesdeArr(fila1, fila2, fila3)
console.table(matrices)

//Luego, a partir de esta matriz, desarrollar una función que reciba la matriz por parámetro y retorne lo solicitado:
//
//Función que reciba por parámetro la fila y retornar la suma de la misma.
const sumaFila = (mat,fila) => {
    let suma=0
    for (let i = 0; i < mat.length; i++) {
               suma+=mat[fila][i] 
    }
    return `El resultado de la suma en la fila ${fila} es ${suma}`
}

let resultado = sumaFila(matrices,2)
//console.log(resultado)
//Función que retorne en un array la suma de las diagonales [15 , 15], sumando él centro las dos veces
const sumaDiagonales = mat => {
    let sumaDiagonal1=0
    let sumaDiagonal2=0
    for (let i = 0; i < mat.length; i++) {
            sumaDiagonal1+= mat[i][i]
            sumaDiagonal2+= mat[i][mat.length-1-i]
    }
    return [sumaDiagonal1,sumaDiagonal2]
}
let resultado2 = sumaDiagonales(matrices)
//console.table(`la suma de sus respectivas diagonales es ${resultado2}`)

/* Función que retorne en un array los elementos pares ejemplo [4, 2, 8, 6] */
const retornaPares = mat => {
    let newArr=[]
    for (let i = 0; i < mat.length; i++) {
        for (let j = 0; j < mat[i].length; j++) {
            if (mat[i][j] % 2==0) { //tomo solo los pares
                newArr.push(mat[i][j])
            }
        }
        
    }
    return newArr
}
let resultado3=retornaPares(matrices)
// console.table(resultado3)

/*  Función que retorne en un array los elementos mayores a 5 */
const retornaMayoresA5 = mat => {
    let newArr=[]
    for (let i = 0; i < mat.length; i++) {
        for (let j = 0; j < mat[i].length; j++) {
            if (mat[i][j]>5) {
                newArr.push(mat[i][j])
            }
        }
        
    }
    return newArr
}
let resultado4=retornaMayoresA5(matrices)
//  console.table(resultado4)

/* Función que retorne un objeto literal con dos propiedades
pares : [4, 2, 8, 6], // array de pares
impares : [9, 3, 5, 7, 1], // array de impares
*/
const retornaParesEimpares = mat => {
    
    let objeto = {
        pares:[],
        impares:[]
    }

    for (let i = 0; i < mat.length; i++) {
        for (let j = 0; j < mat[i].length; j++) {
            if (mat[i][j] % 2==0) { //tomo solo los pares
                objeto.pares.push(mat[i][j])
            }
            else {
                objeto.impares.push(mat[i][j])
            }
        }
        
    }

    return objeto
}
let resultado5=retornaParesEimpares(matrices)
console.table(resultado5)

