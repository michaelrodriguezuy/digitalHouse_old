/**
 * Declara una variable que contenga una matriz
 * de 5x5 llena de puros numeros enteros y positivos
 */

/**
 * Luego, escribe un algoritmo para sumar todos
 * los numeros en la matriz.
 */



/**
 * 2) Crear una función que genere una matriz de 10x10. Cada fila debe tener solo 10
números. La matriz debe verse así:
 */

let matrices = []
let contador=1

function nuevaMatriz() {

    for (let i = 0; i < 10; i++) {
        matrices[i] = []
        for (let j = 0; j < 10; j++) {            
            matrices[i][j] = (contador);                
            contador++
        }        
    }
    return matrices    
}
console.table(nuevaMatriz())


/**
 * 3) Por último, vamos a generar dos funciones:
a) Una va a sumar los valores en la diagonal marcada en rojo.
b) La otra va a marcar los valores de la diagonal marcada en verde.
Ambas funciones deben devolver un resultado único.

Rojo: 505
Verde 505
Trabajar en el mismo sandbox del ejercicio 2.

 */

function sumaDiagonal1() {
    let resultado1=0
    for (let i = 0; i < matrices.length; i++) {        
        for (let j = 0; j < matrices[i].length; j++) {
            if (i==j){
                resultado1 += matrices[i][j]
                console.log(resultado1)
            }
        }
        
    }
    return resultado1
}

//console.log(`La suma de la diagonal 1 es ${sumaDiagonal1()}`)

function sumaDiagonal2() {
    let resultado2=0
    for (let i = 0; i < matrices.length; i++) {        
        for (let j = 0; j < matrices[i].length; j++) {            
            if (i+j==9){
                resultado2 += matrices[i][j]
                console.log(resultado2)
            }
        }
        
    }
    return resultado2
}

//console.log(`La suma de la diagonal 2 es ${sumaDiagonal2()}`)