let estudiantes = [
  {
    nombre: 'Alvaro',
    promedio : 9,
    curso : 'Android',
  },
  {
    nombre: 'Daniel',
    promedio : 6,
    curso : 'Full Stack',
  },
  {
    nombre: 'Alexis',
    promedio : 3,
    curso : 'iOS',
  },
];

//const estudiante1 = {nombre : 'Juan', promedio : 2, curso :'iOS'};
//const estudiante2 = {nombre : 'Miguel', promedio : 5, curso: 'Android'};

estudiantes.push({nombre:'Juan', promedio:2,curso:'iOS'}, {nombre:'Miguel',promedio:5,curso:'Android'});

//console.log(estudiantes);

/**
 * 
 */
let frase = 'Breaking bad rules!'

//console.log(frase.slice(9,12))
//console.log(frase.slice(13))
console.log(frase.slice(11))
console.log(frase.length)