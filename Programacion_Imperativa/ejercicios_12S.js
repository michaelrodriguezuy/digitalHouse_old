

let alicia = [ 10, 80, 75 ]
let bob = [ 90, 20, 25]

let concurso = {
    ganador: '',
    etapas: [],
    encontrarGanador: function (arreglo1, arreglo2) {
        let puntosAlicia=0
        let puntosBob=0
        
            for (let i = 0; i< arreglo2.length; i++)  {
                if (arreglo2[i] > arreglo1[i]) {
                    puntosBob+=1

                    this.etapas.push('Bob')
                }
                else if (arreglo2[i] < arreglo1[i]) {
                    puntosAlicia+=1
                    this.etapas.push('Alicia')
                }
            }
        
            if (puntosAlicia>puntosBob) {
                this.ganador='Alicia'
            }
            else if (puntosAlicia<puntosBob) {
                this.ganador='Bob'
            }    
    },
}


concurso.encontrarGanador(alicia,bob)

console.log(`El desarrollo por etapas se dió de la siguiente manera [${concurso.etapas.join(' - ')}]`)
console.log(`EL GANADOR ES... ${concurso.ganador}!!`)