// EJERCICIO EXTRA
//La Siguiente matriz representa un mes calendario, se ncesita determinar los dias trabajados en diferentes sucursales de una empresa, las sucursales pueden ser de tipo shopping o no, esto determina que trabajan todos los dias de la semanas  
// 1 - Representar la matriz para poder manipular en JS
// 2 - Desarrollar una funcion que reciba la matriz y el tipo de sucursal (mes, tipoSuc)
//   - 'shopping'   => trabajan todos los dias de la semana
//   - 'NoShopping' => trabaja de lunes a viernes
// la función deberá retornar la cantidad de dias trabajados, según el tipo de sucursal 

let febrero = [
    [0,0,0,0,1,2,3],
    [4,5,6,7,8,9,10],
    [11,12,13,14,15,16,17],
    [18,19,20,21,22,23,24],
    [25,26,27,28,0,0,0]
]

let marzo = [
    [0,1,2,3,4,5,6],
    [7,8,9,10,11,12,13],
    [14,15,16,17,18,19,20],
    [21,22,23,24,25,26,27],
    [28,29,30,31,0,0,0]
]

const seLabura = (mes, tipoSucursal) => {
    let contador=0
    for (let semana = 0; semana < mes.length; semana++) {
        for (let dia = 0; dia < mes[semana].length; dia++) {
            if (tipoSucursal=='noShopping') { //controlo que no sea sabado ni domingo 1er y ultima columna

                if ((mes[semana][dia]!=0) && (dia != 0 && dia != mes[semana].length-1)) {
                    contador+=1
                }

            }else { //solo controlo que sea <> 0
                if (mes[semana][dia]!=0) {
                    contador+=1
                }
            }
            
        }
        
    }
    return contador
}

let resultado = seLabura(marzo, 'noShopping')
console.table(`Se trabajaron ${resultado} dias en el mes consultado`)