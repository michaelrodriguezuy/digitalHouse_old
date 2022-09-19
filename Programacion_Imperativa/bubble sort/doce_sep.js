// A partir de él siguiente array de edades nos solicitan realizar lo siguiente
 
const edades = [33, 27, 34, 30, 34, 25];
 
// Desarrollar una función que ordene internamente de forma ascendente las edades, la misma deberá retornar él array ordenado , es decir deberíamos obtener resultado como él siguiente.
// [25, 27, 30, 33, 34, 34]

function ordenarAsc(arr){
    let aux;
    for(let x=0; x<arr.length; x++){
        for (let y = 0; y < arr.length-1; y++) {
            if(arr[y]>arr[y+1]){
                aux=arr[y];
                arr[y]=arr[y+1];
                arr[y+1]=aux;
            }          
        }
    }
}

ordenarAsc(edades);
console.log(edades);

// Desarrollar una función que ordene internamente de forma descendente las edades, la misma deberá retornar él array ordenado , es decir deberíamos obtener resultado como él siguiente.
// [34, 34, 33, 30, 27, 25]

function ordenarDesc(arr){
    let aux;
    for(let x=0; x<arr.length; x++){
        for (let y = 0; y < arr.length-1; y++) {
            if(arr[y]<arr[y+1]){
                aux=arr[y];
                arr[y]=arr[y+1];
                arr[y+1]=aux;
            }          
        }
    }
}

ordenarDesc(edades);
console.log(edades);

const letras = ['C', 'A', 'D', 'E', 'H', 'Z', 'J', 'L'];

//¿Cómo pudieras ordenar el array anterior, alfabéticamente?

ordenarAsc(letras);
console.log(letras);

const arrayCuentas = [
    {
        titular: "Arlene Barr",
        estaHabilitada: false,
        saldo: 3253.40,
        edadTitular: 33,
        tipoCuenta: "sueldo"
    },
    {
        titular: "Roslyn Torres",
        estaHabilitada: false,
        saldo: 3229.45,
        edadTitular: 27,
        tipoCuenta: "sueldo"
    },
    {
        titular: "Cleo Lopez",
        estaHabilitada: true,
        saldo: 1360.19,
        edadTitular: 34,
        tipoCuenta: "corriente"
    },
    {
        titular: "Daniel Malone",
        estaHabilitada: false,
        saldo: 3627.12,
        edadTitular: 30,
        tipoCuenta: "sueldo"
    },
    {
        titular: "Ethel Leon",
        estaHabilitada: true,
        saldo: 1616.52,
        edadTitular: 34,
        tipoCuenta: "sueldo"
    },
    {
        titular: "Harding Mitchell",
        estaHabilitada: true,
        saldo: 1408.68,
        edadTitular: 25,
        tipoCuenta: "corriente"
    }
];

function ordenarObj(arr,parm){
    let aux;
    for(let x=0; x<arr.length; x++){
        for (let y = 0; y < arr.length-1; y++) {
            if(arr[y][parm]>arr[y+1][parm]){
                aux=arr[y];
                arr[y]=arr[y+1];
                arr[y+1]=aux;
            }          
        }
    }
}




// Desarrollar una función que ordene internamente de forma ascendente según él saldo de cada cuenta,
// la misma deberá retornar él array ordenado .

ordenarObj(arrayCuentas,'saldo');
console.table(arrayCuentas);
// Desarrollar una función que ordene internamente de forma ascendente según la edad del titular de cada cuenta,
//la misma deberá retornar él array ordenado.

ordenarObj(arrayCuentas,'edadTitular');
console.table(arrayCuentas)