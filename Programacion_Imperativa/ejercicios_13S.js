//Loop de pares
//Deberás crear una función llamada loopDePares que reciba como parámetro un número y haga un loop de 0 a 100 mostrando en la consola cada número del loop. 
//En caso de que el número de la iteración sumado con el número pasado por parámetro sea par, mostrará en la consola: “El número X es par”.

//const loopDePares = (numero) => {
//    let array=[]
//    for (let i=0; i<101;i++) {
//        array.push(i)
//        console.log(array)
//        
//        if ((i+numero)%2==0) {
//            console.log(`El numero ${i+numero} es par`)
//        }
//    }
//    
//}
//
//console.log(loopDePares(3))


//Loop de impares con palabra
//Deberás crear una función llamada loopDeImpares que reciba como parámetro un número y una palabra, y haga un loop de 0 a 100 mostrando en la consola cada //  número del loop. Luego, modificar el código para que, en caso de que ese número sumado con el número pasado por parámetro sea impar, muestre en la consola la palabra //pasada por parámetro.

//   const loopDePares = (numero, palabra) => {
//       let array=[]
//       for (let i=0; i<101;i++) {
//           array.push(i)
//           console.log(array)
//           
//           if ((i+numero)%2!=0) {
//               console.log(`El numero ${i+numero} es impar -> ${palabra}`)
//           }
//       }
//       
//   }
//   
//   loopDePares(3, 'DIGITAL HOUSE')


//Sumatoria
//Deberás crear una función llamada sumatoria que reciba un número como parámetro y que devuelva la sumatoria de todos sus números anteriores, incluso ese mismo. //Ejemplo:
//sumatoria(3) debe retornar 6 porque hace (1+2+3)
//sumatoria(8) debe retornar 36

//  const sumatoria = numero => {
//      let resultado=0
//      for (let i=0; i<=numero; i++) {
//          resultado+=i
//      }   
//      return resultado
//  }
//  
//  console.log (sumatoria(8))



//Nuevo arreglo
//Deberás crear una función llamada nuevoArreglo que reciba un número como parámetro y que devuelva un nuevo arreglo con tantos elementos como el número que le //hayas pasado. Ejemplo:
//nuevoArreglo(5) debe retornar [1,2,3,4,5]
//nuevoArreglo(10) debe retornar [1,2,3,4,5,6,7,8,9,10]


const nuevoArreglo = numero => {
    let arr= []
    for (let i = 1; i <= numero; i++) {
        arr.push(i)        
    }
    return arr
}

//let resultado= nuevoArreglo(3)
//console.log(resultado)

//Similar String.split()
//Deberás crear una función llamada split que reciba un string y simule el comportamiento de la función original. Si no estás seguro de cómo funciona, Google //puede ayudarte. 
//Importante: no podés usar el String.split(). Ejemplo:
//split(“hola”) debe retornar [“h”,”o”,”l”,”a”]
//split(“chau”) debe retornar [“c”,”h”,”a”,”u”]


const split2 = palabra => {
    let arr=[]
    for (let i = 0; i < palabra.length; i++) {
             arr.push(palabra[i])   
    }
    return arr
}

let resultado2= split2('michael')
//console.log(resultado2)


//Manejando dos arreglos
//Deberás crear una función llamada arrayHandler que reciba dos arreglos de igual largo como parámetros y muestre en la consola “Soy {elemento de array 1} y 
//yo //soy {elemento de array 2}”. Ejemplo:
//arrayHandler([1,2,3,4], [“h”,”o”,”l”,”a”]) debe mostrar: 
//Soy 1 y yo soy h
//Soy 2 y yo soy o
//Soy 3 y yo soy l
//Soy 4 y yo soy a

const arrayHandler = (arr1, arr2) => {
    for (let i = 0; i < arr1.length; i++) {        
        console.log(`Soy ${arr1[i]} y yo soy ${arr2[i]}`)                    
    }
}

//let resultado3 = arrayHandler([1,2,3,4],['h','o','l','a'])
//console.log(resultado3)

//Palíndromo
//Deberás crear una función llamada palindromo que indique si una palabra es palíndroma o no. Debe retornar “true” en caso de que lo sea, y “false” en caso de que //no. Ejemplo:
//palindromo(“anilina”) debe retornar true
//palindromo(“Ana”) debe retornar true
//palindromo(“Enrique”) debe retornar false

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

let resutlado5 = esPalindromo('Enrique')