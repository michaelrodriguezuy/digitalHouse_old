/* Ejercicio 1:
Crear un arreglo de objetos donde cada objeto representa un tweet. Cada tweet debe tener las siguientes propiedades:
Id (number)
Texto (string)
Cantidad de likes (number)
Cantidad de retweets  (number)
Es privado (bool)
Tu arreglo debe tener, al menos, 6 tweets.

Declarar una función que reciba el array por parámetro y un id. Debe retornar un booleano indicando si ese tweet es privado o no.
 */

let tweets = [
    {
        id : 1,
        texto : 'Hola, quiero participar del sorteo, como hago ?',
        likes : 4,
        retweets : 2,
        privado : true
    },  
    {
        id : 2,
        texto : 'Hola, quiero participar del sorteo, como hago ?',
        likes : 14,
        retweets : 20,
        privado : true
    },
    {
        id : 3,
        texto : 'Hola, quiero participar del sorteo, como hago ?',
        likes : 15,
        retweets : 3,
        privado : true
    },
    {
        id : 4,
        texto : 'Hola, quiero participar del sorteo, como hago ?',
        likes : 0,
        retweets : 12,
        privado : false
    },
    {
        id : 5,
        texto : 'Hola, quiero participar del sorteo, como hago ?',
        likes : 1,
        retweets : 2,
        privado : false
    },
    {
        id : 6,
        texto : 'Hola, quiero participar del sorteo, como hago ?',
        likes : 8,
        retweets : 12,
        privado : true
    }
]

const esPrivado = (arr, indice) => {
    if (arr.length>1 && indice<=arr.length) {        
        if (arr[indice-1].privado) {
            return true
        }
        else {
            return false
        }        
    }       
    return  `El tweet numero ${indice} no es válido`
}

let resultado = esPrivado(tweets,6)
//console.log(`El tweet es privado?:  ${resultado} `)
// ***************************************************************************************************

/* Ejercicio 2:
Dado el siguiente array:
 */
const autos = [
{
    marca: 'Toyota',
    anio: 2014,
    color: 'rojo'
},
{
    marca: 'Renault',
    anio: 2015,
    color: 'gris'
},
{
    marca: 'Peugeot',
    anio: 2017,
    color: 'rojo'
},
{
    marca: 'Fiat',
    anio: 2019,
    color: 'negro'
}]

// Crear una función que reciba por parámetro el arreglo y lo ordene descendentemente según su año.
const ordenaXano = arr => {    
    let aux
    for (let i = 0; i < arr.length; i++) {
        for (let j = 0; j < arr.length - 1; j++) { 
            if (arr[j].anio < arr[j + 1].anio) {
                aux = arr[j]
                arr[j] = arr[j + 1]
                arr[j + 1] = aux
            }
        }
    }
}

let resultado2 = ordenaXano (autos)
// console.log (autos)
// ***************************************************************************************************



/* Ejercicio 3:
Dada la siguiente matriz: */

let matriz = [
    [3, 21, 3, 1],
    [39, 4, 5, 12],
    [66, 2, 87, 6],
    [66, 72, 87, 16],
    [5, 67, 112, 79]
];

/* 
1- Crear una función que reciba a la matriz por parámetro y devuelva la multiplicación de la segunda fila. (Recordá que las posiciones inician en 0)
*/
const multiplicaFila = (mat,fila) => {
    let contador=1        
    for (let i = 0; i < mat[fila-1].length; i++) {
        contador*= mat[fila-1][i] //39 * 4 * 5 * 12
    }
    return contador
}

let resultado3 = multiplicaFila(matriz,2)
//console.table(resultado3)
/* ******************
2 - Crear una función que reciba a la matriz por parámetro y devuelva un nuevo array con todos los valores de la matriz que sean pares y mayores a 6.
 */

const paresMayoresQue6 = mat => {
    let arr=[]
    for (let i = 0; i < mat.length; i++) {
        for (let j = 0; j < mat[i].length; j++) {
            if (mat[i][j] %2==0 && mat[i][j]>6) {
                arr.push(mat[i][j])
            }
            
        }        
    }
    return arr
}

let resultado4 = paresMayoresQue6(matriz)
console.log(resultado4)