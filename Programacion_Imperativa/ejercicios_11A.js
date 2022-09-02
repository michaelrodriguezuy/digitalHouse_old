//let arrayCuentas = [
//    {
//      nroCuenta: 5486273622,
//      tipoDeCuenta: "Cuenta Corriente",
//      saldoEnPesos: 27771,
//      titularCuenta: "Abigael Natte",
//    },
//    {
//      nroCuenta: 1183971869,
//      tipoDeCuenta: "Caja de Ahorro",
//      saldoEnPesos: 8675,
//      titularCuenta: "Ramon Connell",
//    },
//    {
//      nroCuenta: 9582019689,
//      tipoDeCuenta: "Caja de Ahorro",
//      saldoEnPesos: 27363,
//      titularCuenta: "Jarret Lafuente",
//    },
//    {
//      nroCuenta: 1761924656,
//      tipoDeCuenta: "Cuenta Corriente",
//      saldoEnPesos: 32415,
//      titularCuenta: "Ansel Ardley",
//    },
//    {
//      nroCuenta: 7401971607,
//      tipoDeCuenta: "Cuenta Unica",
//      saldoEnPesos: 18789,
//      titularCuenta: "Jacki Shurmer",
//    },
//  ];
//
//let banco = {
//    clientes : arrayCuentas,   
//    consultarCliente : function(titular) {
//        let elMasBuscado
//        for (let i=0; i<this.clientes.length;i++) {
//            if (this.clientes[i].titularCuenta==titular) {
//                elMasBuscado= this.clientes[i]
//            }
//        }         
//        //console.log('*******Apareció el cliente buscado********** ')
//        return (elMasBuscado);
//    },
//    deposito : function (titular, monto){
//        let cuentaDeposito = this.consultarCliente(titular)
//        cuentaDeposito.saldoEnPesos+=monto
//        return console.log (`Deposito realizado con exito, su nuevo saldo es $${cuentaDeposito.saldoEnPesos}`)
//    },
//    extraccion : function (titular, monto) {
//        let cuentaExtraccion = this.consultarCliente(titular)        
//        if (cuentaExtraccion.saldoEnPesos==0) {
//            return console.log ('Fondos insuficientes')
//        }        
//        else {
//            cuentaExtraccion.saldoEnPesos-=monto
//            return console.log (`Extracción realizada correctamente, su nuevo saldo es $${cuentaExtraccion.saldoEnPesos}`)
//        }          
//    }
//}
//
//let clienteEncontrado = banco.consultarCliente('Ramon Connell');
//console.log(clienteEncontrado)
//
//let depositaCliente = banco.deposito('Ramon Connell',10000)
//console.log(clienteEncontrado)
//
//let extraeCliente = banco.extraccion('Ramon Connell',10000)
//console.log(clienteEncontrado)


/**
 * BONUS
 */

// let array = [ { nombre: 'Lean', edad: 27 }, { nombre: 'Eze', edad: 49} ]
//
// propiedadUnica = (arreglo, propiedad) => {
//    let nuevoArreglo=[]
//        for (let i=0; i<arreglo.length;i++){          
//
//            if (arreglo.includes(propiedad) ) {                
//                
//                nuevoArreglo.push(arreglo[i][propiedad])            
//            }            
//        }
//        return nuevoArreglo;
// }
//
// function busca(parametro) {
//    return parametro.edad == 27;
//}
//
// //console.log(propiedadUnica(array, 'edad'))
// console.log(array.find(busca))


 /**
  * Calculador de notas
Crear el objeto “alumno”, el cual va a consistir de las siguientes propiedades básicas:
● Nombre
● Número de legajo
● Lista de notas
Nos gustaría calcular el promedio del alumno y si el mismo está aprobado, basado en una
nota de aprobación que le va a ser dada. Para este ejercicio, vamos a dejar que pienses
todos los métodos y propiedades que puedan hacer falta para que el programa funcione
correctamente de la manera solicitada.
  */
const aprobacion=6
let prom=0

const alumno = {
    nombre: 'Pedro',
    numeroLegajo: '1234567890',
    listaNotas: [8,4,6,5,1]
}

const calcularPromedio = notas => {    
    
    for (let i=0; i<notas.length;i++) {
        prom += notas[i]
    }
    prom= prom/notas.length
    return prom
}

const aprobadoSiNo = () => {
    if (prom>=aprobacion) {
        return `Felicitaciones ${alumno.nombre} has aprobado el curso por ${prom-aprobacion} sobre el minimo.`
    }
    else{ 
        return `Cagaste ${alumno.nombre} marchaste por ${aprobacion-prom}. Suerte el proximo año!!`
    }
}

console.log(`Su promedio de notas es de '${calcularPromedio(alumno.listaNotas)}'`)
console.log(aprobadoSiNo())