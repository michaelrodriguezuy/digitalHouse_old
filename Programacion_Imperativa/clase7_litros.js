let precioPorLitrosConsumidos = 0
const totalAPagar = (vehiculo, litrosConsumidos) => {
    switch (vehiculo) {
        case "coche":
            precioPorLitrosConsumidos = 86 * litrosConsumidos
            return litrosConsumidos < 25 ? precioPorLitrosConsumidos + 50 : precioPorLitrosConsumidos + 25
        case "moto":
            precioPorLitrosConsumidos = 70 * litrosConsumidos
            return litrosConsumidos < 25 ? precioPorLitrosConsumidos + 50 : precioPorLitrosConsumidos + 25
        case "autobús":
            precioPorLitrosConsumidos = 55 * litrosConsumidos
            return litrosConsumidos < 25 ? precioPorLitrosConsumidos + 50 : precioPorLitrosConsumidos + 25
    }
}
let muestraPrecioPorLitrosConsumidos = totalAPagar("moto", 20)
console.log(muestraPrecioPorLitrosConsumidos)