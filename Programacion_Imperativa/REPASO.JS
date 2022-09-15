
let array = [[1], "abc", [[2], [4]]]

// console.log(array[2][1][0])

let matrices = [
    [1, 2, 3],
    [4, 5, [6, 7, 8]],
    [7, 8, { elJefe : true }],
]

// console.log(matrices[2][2].elJefe)

// console.log(matrices[1][2][1])

const recorrer = matriz => {

    for (let row = 0; row < matriz.length; row++) {

        // console.log(matriz[row])

        for (let col = 0; col < matriz[row].length; col++) {

            if (matriz[row][col].length == undefined) {
                console.log(matriz[row][col].length )
                //console.log(matriz[row][col])
            }
            else {
                for (let ele = 0; ele < matriz[row][col].length; ele++) {
                console.log(matriz[row][col].length)
                  //  console.log(matriz[row][col][ele])

                }
            }

        }

    }

}

 // recorrer(matrices)


const generarMatriz = (fil, col) => {

    let acumulador = 1
    let matriz = []

    for (let i = 0; i < fil; i++) {

        matriz.push([])

        for (let z = 0; z < col; z++) {

            matriz[i].push(acumulador)

            acumulador += 1

        }
    }
    return matriz

}

let resultado2 = generarMatriz(10,10)

//console.table(resultado2)


const sumarDiagonal = matriz => {

    let totalRojo = 0

    for (let i = 0; i < matriz.length; i++) {

        totalRojo = totalRojo + matriz[i][i]
        
    }

    return totalRojo

}

let resultado3 = sumarDiagonal(resultado2)

// console.log(resultado3)



const sumarDiagonalInvertida = matriz => {

    let totalVerde = 0
    let f = matriz.length

    for (let i = 0; i < f; i++) {

        totalVerde += matriz[i][f-i-1]
        
    }

    return totalVerde

}

let resultado4 = sumarDiagonalInvertida(resultado2)

// console.log(resultado4)



// console.log("ana"==="ana")


let palabra = "Ananas"

const esPalindromo = palabra => {

    let mayus = palabra.toUpperCase()

    let dadaVuelta = ""

    for (let i = 0; i < mayus.length; i++) {
        
        dadaVuelta += mayus[mayus.length-i-1]
        console.log(dadaVuelta)
        
    }

    if (mayus === dadaVuelta) {
        console.log(`La palabra ${palabra} es palindromo.`)
    }
    else
    {
        console.log(`La palabra ${palabra} no es palindromo.`)
    }

}

 esPalindromo(palabra)

