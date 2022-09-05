const edades = [11, 12, 15, 18, 25, 22, 10, 33, 18, 5];

//Obtener en un nuevo array las edades menores a 18.
let nuevoArr=[]

//a. function recorrer(arr) {
//    for (let i=0; i<arr.length;i++) {
//        if (arr[i]<18) {
//            nuevoArr.push(arr[i])
//        }
//    }
//    return nuevoArr
//}
//let menores18 = recorrer(edades)
//console.log(menores18)

//b. Obtener en un nuevo array las edades mayor o igual a 18.
//function recorrer(arr) {
//    for (let i=0; i<arr.length;i++) {
//        if (arr[i]>=18) {
//            nuevoArr.push(arr[i])
//        }
//    }
//    return nuevoArr
//}
//let mayoresIguales18 = recorrer(edades)
//console.log(mayoresIguales18)

//c. Obtener en un nuevo array las edades igual a 18.
//function recorrer(arr) {
//    for (let i=0; i<arr.length;i++) {
//        if (arr[i]==18) {
//            nuevoArr.push(arr[i])
//        }
//    }
//    return nuevoArr
//}
//let iguales18 = recorrer(edades)
//console.log(iguales18)

//Obtener el menor.
//function recorrer(arr) {
//    let masChico=18
//    for (let i=0; i<arr.length;i++) {
//        if (arr[i]<masChico) {
//            masChico=arr[i]
//        }
//    }
//    return masChico
//}
//let menor = recorrer(edades)
//console.log(menor)

//Obtener el mayor. 
//function recorrer(arr) {
//    let masGrande=18
//    for (let i=0; i<arr.length;i++) {
//        if (arr[i]>masGrande) {
//            masGrande=arr[i]
//        }
//    }
//    return masGrande
//}
//let mayor = recorrer(edades)
//console.log(mayor)

//Obtener el promedio de edades.
//function recorrer(arr) {
//    let promedio=0
//    for (let i=0; i<arr.length;i++) {
//        promedio+=arr[i]  
//    }
//    return promedio/arr.length
//}
//let prom = recorrer(edades)
//console.log(prom)

//Incrementar en 1 todas las edades.
function recorrer(arr) {    
    for (let i=0; i<arr.length;i++) {    
            nuevoArr.push(arr[i]+1)
    }
    return nuevoArr
}
let nuevo = recorrer(edades)
console.log(nuevo)