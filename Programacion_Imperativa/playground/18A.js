// Ejercicio
// Se está realizando el desarrollo de una aplicación para control de gastos. Cada día, el usuario ingresa sus gastos cotidianos.
// La idea es solo registrar el total de los gastos, al finalizar la jornada.
// Para simplificar, vamos a considerar que todos los meses tienen cuatro semanas.
// Los gastos estarán en una matriz de 4x7, cada fila representa una semana y cada columna un día. Es decir fila 0, semana 1, fila 1, semana 2, etc. Columna 0, dia 1, 
// columna 1, dia 2, etcétera. 
// a)  Lo que nos solicitan es dar el total de gastos en una semana. Recordemos que cada fila representa una semana, es decir, si nos indican semana 2 tenemos que sumar la 
// fila 1 de la matriz. Recordar que las matrices comienzan siempre en posición 0. 
// b) La aplicación también tendrá una parte de estadísticas, para esto nos solicitan dar el total de un día en particular, por ejemplo del día 3, acá también tengamos en 
// cuenta lo que ocurre con las filas, ya que las columnas también comienzan en 0.
// c) Por último, es necesario tener el total de gastos realizados en el mes.
// Pregunta para pensar, ¿es lo mismo recorrer por filas o por columnas para resolver este último punto?
// Opcional
// d) Obtener cuál fue la semana que más gastos se realizaron. Indicar el día que más gastos se realizaron.
// Posibles matrices para comprobar los resultados. 

//         Semana 1    Semana 2    Semana 3    Semana 4
// Día 1   1135        1750        1700        800
// Día 2   2500        1890        1150        1250
// Día 3   900         1900        1690        1430
// Día 4   1600        1300        1900        2100
// Día 5   2800        898         1770        1980
// Día 6   3650        1750        4500        1270
// Día 7   1100        2800        2560        950

GastosxMes = [
    [1135, 2500, 900, 1600, 2800, 3650, 1100],
    [1750, 1890, 1900, 1300, 898, 1750, 2800],
    [1700, 1150, 1690, 1900, 1770, 4500, 2560],
    [800, 1250, 1430, 2100, 1980, 1270, 950]
 ]

 const sumaTotalesxSemana = matriz => {
    let suma=0
    for (let fila = 0; fila < matriz.length; fila++) {
        for (let columna = 0; columna < matriz[fila].length; columna++) {
            suma+=matriz[fila][columna]
        }
        console.log(`El total gastado en la semana ${fila+1} es de $${suma}`)
        suma=0
    }
 }
// let resutlado = sumaTotalesxSemana(GastosxMes)

 const sumaTotalxDia= (matriz, dia) => {
    let suma=0
    for (let fila = 0; fila < matriz.length; fila++) {        
        if (matriz[fila][dia-1]) {
            suma+=matriz[fila][dia-1]
        }                            
    }
    console.log(`El total gastado para el dia ${dia} es de $${suma}`)
 }

//let resultado2= sumaTotalxDia(GastosxMes,3)

 const sumaTotalesxMes = matriz => {
    let suma=0
    for (let fila = 0; fila < matriz.length; fila++) {
        for (let columna = 0; columna < matriz[fila].length; columna++) {
            suma+=matriz[fila][columna]
        }     
    }
    return suma
 }

 //let resultado3= sumaTotalesxMes(GastosxMes)
 //console.log(`El total gastado en el mes es de $${resultado3}`)
function obtenerSemanaMasVenta(matriz) {
    let suma=0, semana=0, aux =0
    for (let fila = 0; fila < matriz.length; fila++) {
        for (let columna = 0; columna < matriz[fila].length; columna++) {
            suma+=matriz[fila][columna]
        }        
        if(suma>aux){
            aux=suma
            semana=fila+1
//            console.log(semana)
        }
        suma=0
    }
    return semana    
}

// let resultado4= obtenerSemanaMasVenta(GastosxMes)
// console.log(`La semana que mas venta tuvo fue la ${resultado4}`)

const obtenerDiaMasVenta= (matriz) => {
    let suma=0, aux =0   
    let elDiaD
    
        for (let i = 0; i < matriz[2].length; i++) {               
            for (let j = 0; j < matriz.length; j++) {
                if (matriz[j][i] != undefined){
                    suma+=matriz[j][i]
                }  
            }           
           // console.log(suma)
            if(suma>aux){
                aux=suma
                elDiaD= i+1                
            }
            suma=0
            
        }                
        
    return `${elDiaD} con $${aux}`
 }

let resultado5= obtenerDiaMasVenta(GastosxMes)
console.log(`El dia que mas venta tuvo fue el dia ${resultado5}`)