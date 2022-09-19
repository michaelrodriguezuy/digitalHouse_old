//Dada una matriz, recorrer sus valores y sumar solo los números que estén por encima o sean iguales a 10, pero menores que 1000.

let laMatriz= [
    [10, 30, 20, 10, 40, 70],
    [50, 50, 10, 100, 40],
    [50, 100, 10, 2000, 40], //170+125 +114 =
    [50, 50, 5000, 100, 40]
  ];  

function recorreMatriz(matriz) {
    let contador=0
    for (let fila = 0; fila < matriz.length; fila++) {
        for (let columna = 0; columna < matriz[fila].length; columna++) {
            // if (matriz[fila][columna]!= undefined) {
                if ((matriz[fila][columna]>=10) && (matriz[fila][columna]<1000)) {
                    contador+=matriz[fila][columna]
                }
            //}                    
        }

    }
    return contador
}

console.log(recorreMatriz(laMatriz))