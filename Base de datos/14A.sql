select canciones.nombre, generos.nombre, compositor from canciones, generos
where compositor="Willie Dixon" AND generos.nombre="Blues"