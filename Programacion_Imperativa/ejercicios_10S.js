//1. let numbers =[22, 33, 54, 66, 72]
//console.log(numbers[numbers.length])

//let numbers = [22, 33, 54, 66, 72]
//console.log(numbers [numbers.length] )

//2. let grupoDeAmigos = [ "Harry", "Ron", "Hermione", "Spiderman", "Hulk","Ironman","Penélope Glamour", "Pierre Nodoyuna","Patán" ]
//console.log(grupoDeAmigos[5])

//3. let str = "www.labiblia&elcalefon.com"
//let arrayAleatorio= ["Digital", "House", "true", "string", "123","false", "54", str ]
//console.log(arrayAleatorio[arrayAleatorio.length -1])

/*********************************************************************************************** */
/***************************Colecciones de películas******************************************************************** */

//1) Crear la estructura adecuada para guardar las siguientes películas:
//"star wars", "totoro", "rocky", "pulp fiction", "la vida es bella"
//Importante: verificá que todo funciona correctamente accediendo a alguna de
//las películas una vez creada la estructura correspondiente.

//let peliculas = ['star wars', "totoro", "rocky", "pulp fiction", "la vida es bella"];

//2) Más tarde, de producción dieron el aviso de que las películas deberían estar todas
//en mayúsculas. Para esto solicitan que crees una función que reciba por
//parámetro un array y convierta el contenido de cada elemento a mayúsculas.
//Pista: revisá qué hace el método de strings .toUpperCase().

//const pasaAmayus = ( arreglo ) =>{    
//    let pelisEnMayus=[]
//
//    for (let i = 0; i < arreglo.length; i++){
//        pelisEnMayus.push( arreglo[i].toUpperCase())
//         
//    }
//    return pelisEnMayus
//}

//console.log (pasaAmayus(peliculas))

/*********************************************************************************************** */

//3. Mientras trabajabas en el feature anterior, se dio el aviso de que también hay que
//crear otra estructura similar a la primera, pero con las siguientes películas
//animadas:
//"toy story", "finding Nemo", "kung-fu panda", "wally", "fortnite"
//Por lo tanto, te piden crear una función que reciba dos arrays como parámetros,
//para poder agregar los elementos contenidos en el segundo array dentro del
//primero, y así retornar un solo array con todas las películas como sus elementos.
//Importante: las películas animadas también deberían convertirse a mayúsculas.

//let peliculas = ['star wars', "totoro", "rocky", "pulp fiction", "la vida es bella"];
//let animadas = ["toy story", "finding Nemo", "kung-fu panda", "wally", "fortnite"];
//
//let pelisEnMayus=[]
//
//const unificaArreglos = ( arreglo1, arreglo2 ) =>{            
//        for (let i=0; i<arreglo2.length;i++) {
//            arreglo1.push(arreglo2[i])
//        }
//     return arreglo1
//}
//const pasaMayus = ( arreglo ) =>{    
//    //    let pelisEnMayus=[]
//    for (let i = 0; i < arreglo.length; i++){
//        pelisEnMayus.push( arreglo[i].toUpperCase() )     
//    }
//    return pelisEnMayus
//}
//
//console.log(pasaMayus(unificaArreglos(peliculas,animadas)))

/*********************************************************************************************** */

//4. Durante el proceso, uno de los desarrolladores advierte que el último elemento del
//array de películas animadas es un videojuego. Ahora tenés que editar el código y
//modificarlo de manera que puedas eliminar ese último elemento antes de migrar el
//contenido al array que contenga todas las películas.
//PD: por precaución, guardá el elemento que vas a eliminar en una variable.

//let peliculas = ['star wars', "totoro", "rocky", "pulp fiction", "la vida es bella"];
//let animadas = ["toy story", "finding Nemo", "kung-fu panda", "wally", "fortnite"];
//let pelisEnMayus=[]
//let noPertenece= animadas.pop()
//
//const unificaArreglos = ( arreglo1, arreglo2 ) =>{            
//        for (let i=0; i<arreglo2.length;i++) {
//            arreglo1.push(arreglo2[i])
//        }
//     return arreglo1
//}
//const pasaMayus = ( arreglo ) =>{    
//    //    let pelisEnMayus=[]
//    for (let i = 0; i < arreglo.length; i++){
//        pelisEnMayus.push( arreglo[i].toUpperCase() )     
//    }
//    return pelisEnMayus
//}
//
//let arregloParaElSiguienteEjercicio = pasaMayus(unificaArreglos(peliculas,animadas))
//console.log(pasaMayus(unificaArreglos(peliculas,animadas)))
//console.log("No pertenece a peliculas: "+noPertenece)

/*********************************************************************************************** */

//5. Finalmente, te envían dos arrays con calificaciones que hacen distintos usuarios
//del mundo sobre las películas con el siguiente formato:
//const asiaScores = [8, 10, 6, 9, 10, 6, 6, 8, 4];
//const euroScores = [8, 10, 6, 8, 10, 6, 7, 9, 5];
//Te piden crear una función que compare las calificaciones e indique si son iguales
//o diferentes. Te confirman que están en el orden adecuado y que solo traen
//valores numéricos del 1 al 10.
//PD: los elementos de los scores tanto de Asia como de Europa corresponden en
//orden al del array resultante de combinar películas con películas animadas. Es
//decir, el primer elemento del array de películas general corresponde al primer
//elemento de asiaScores y al primer elemento de euroScores, y así sucesivamente.
//Para verificar que hasta acá viene todo bien, te recomendamos probar cada una de las
//funciones y testear su correcto funcionamiento.
//Si llegaste hasta este punto y está todo bien, el tech leader del equipo debe estar
//extremadamente alegre con tu trabajo y desempeño. ¡Buen trabajo!

//const asiaScores = [8, 10, 6, 9, 10, 6, 6, 8, 4]
//const euroScores = [8, 10, 6, 8, 10, 6, 7, 9, 5]
//
//const compara = (arreglo1, arreglo2) => {
//    for (let i = 0; i< arreglo2.length; i++)  {
//        if (arreglo2[i] == arreglo1[i]) {
//            console.log(`${arregloParaElSiguienteEjercicio[i]} - la calificacion es similar `)
//        }
//        else {
//            console.log(`${arregloParaElSiguienteEjercicio[i]} - la calificacion es diferente `)
//        }
//    }
//}
//compara(asiaScores,euroScores)


/**EXTRAS */
// Array inverso
// 1. Creá la función imprimirInverso que tome un array como argumento y que imprima en la consola cada elemento en orden inverso (no tenés que invertir el array).
//const imprimirInverso = array => {
//    for (let i=array.length-1; i>=0; i--) {
//        console.log(array[i])
//    }
//}
//
//imprimirInverso([1,2,3,4,5,6,15,20,50,54,87])

// 2. Creá la función inversor que tome un array como argumento y devuelva uno nuevo invertido.
//const imprimirInverso = array => {
//    let nuevoArray=[]
//    for (let i=array.length-1; i>=0; i--) {
//        nuevoArray.push(array[i])
//          console.log(i)
//    }
//    return nuevoArray
//}
//
//console.log(imprimirInverso([1,2,3,4,5,6,15,20,50,54,87]))

/**sumaArray() 
 En este ejercicio, deberás crear una función sumaArray() que acepte un arreglo de
números (3 elementos) y devuelva la suma de todos ellos. Ejemplo:
● sumArray([1,2,3]) // 6
● sumArray([10, 3, 10]) // 23
● sumArray([-5,100, 19]) // 114
*/


//const sumaArray = array => {
//    let resultado=0
//    for(let i=0; i<array.length; i++){
//        resultado += array[i]
//    }
//    return resultado;
//}
//
//console.log(sumaArray([-5,100,19]))



/**
 *Simulación Array.join()
En este ejercicio deberás crear una función llamada join() que reciba un arreglo de
strings de 4 elementos y simule el comportamiento del método Array.join().
Importante: no podés usar el método Array.join() original.
Ejemplo:
● join(["h","o","l","a"]) debe retornar el string "hola".
● join(["c","h","a,"u"]) debe retornar el string "chau".
 */

const sumaArray = array => {
    let resultado=''

    //console.log(array.indexOf('c')) -> muestra la primer posicion de C
    //console.log(array.lastIndexOf('c')) -> muestra la ultima posicion de C
console.log(array.join())

    for(let i=0; i<array.length; i++){
        resultado += array[i]
    }
    return resultado;
}

console.log(sumaArray(['m','i','c','h','a','e','l']));


