let cero=0
let uno=1
let i=1
let resultado1=0
const proximos = (x) => {
    console.log(cero)        
    console.log(uno)        
    resultado2=cero+uno        
    while (i<x){
        suma = resultado2 + resultado1                
        console.log(suma)
        resultado1 = resultado2
        resultado2 = suma
        i++
    }            
}
proximos(10)

//0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55…


//let fibonacci = [];
//fibonacci[0] = 0;
//fibonacci[1] = 1;
//for (let i = 2; i < 10; i++) {
//  fibonacci[i] = fibonacci[i - 2] + fibonacci[i - 1];
//}
//console.log(fibonacci);