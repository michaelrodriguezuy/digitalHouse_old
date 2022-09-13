/*
Guia de Ejercicios Prácticos.

Tomando como referencia la base de datos de bibliotecas, realizar los siguientes ejercicios.
En primera instancia, resolver las consultas sin realizar uniones entre tablas. Devolviendo los
campos solicitados, y en caso de corresponderse con un “ID” de referencia, devolver dicho ID.

Una vez finalizados los 20 ejercicios, en el punto 21 volverán a realizar todos los ejercicios
aplicando ahora si las uniones de tablas donde corresponde para obtener los datos reales.

Ejercicios:
1- Obtener un listado de todos los articulos.
*/
select * from articulos;
/*
2- Obtener el nombre junto con el autor, código y año de los libros publicados entre 1990 y 2000.
*/
select articulos.nombre as Articulo, autores.nombre as Autor, cod_articulo, ano from articulos
join autores ON articulos.autor_id=autores.id
where ano between 1990 and 2000;
/*
3- Obtener el nombre junto con el autor, código, tipo y año de los articulos de tipo libro
publicados después del año 2000 o del tipo pelicula con una duración mayor a 120 minutos.
*/
select articulos.nombre as Articulo, autores.nombre as Autor, cod_articulo, tipo, duracion, ano from articulos
join autores ON articulos.autor_id=autores.id
where (tipo='Libro' and ano>2000) or (tipo='Pelicula' and duracion>120);
/*
4- Obtener el articulo, tipo y año de los articulos publicados en el año 1991, 1998, 2017 y 2020.
*/
select cod_articulo, tipo, ano from articulos
where ano=1991 or ano=1998 or ano=2017 or ano=2020;
/*
5- Obtener el articulo, tipo, año y duracion de los articulos que no fueron publicados en 1999,
2004 y 2017 o cuya duracion sea de 200 o más. Eliminar duplicados.
*/
select distinct tipo, ano, duracion from articulos
where ano!=1999 and ano!=2004 and ano<>2017 or duracion>=200;
/*
6- Obtener todos los autores cuyo pais de origen tenga la palabra "Bretaña".
*/
select * from autores
where pais like '%Bretaña%';
/*
7- Obtener todos los préstamos que no hayan sido devueltos todavía.
*/
select * from prestamos
where fecha_devolucion is null;

select prestamos.id, articulos.nombre, socios.nombre, fecha_prestamo, fecha_tope, fecha_devolucion from prestamos
join socios ON prestamos.socio_id = socios.id
join articulos ON prestamos.articulo_id = articulos.id
where fecha_devolucion is null;
/*
8- Obtener todos los préstamos que se realizaron en el año 2020.
*/
select * from prestamos
where date_format(fecha_prestamo, '%Y') = 2020;

select prestamos.id, articulos.nombre as Articulo, socios.nombre as Socio, fecha_prestamo, fecha_tope, fecha_devolucion from prestamos
join socios ON prestamos.socio_id = socios.id
join articulos ON prestamos.articulo_id = articulos.id
where date_format(fecha_prestamo, '%Y') = 2020;
/*
9- Validar si se ha prestado el articulo 49 alguna vez, y si su fecha de devolucion fue anterior a la fecha tope.
*/
select * from prestamos
where articulo_id=23 and fecha_devolucion<fecha_tope;
/*
10- Obtener todos los socios que han devuelto un préstamo posteriormente a la fecha tope.
*/
select socio_id from prestamos
where fecha_devolucion<fecha_tope;

select socios.nombre as Socio from prestamos
join socios ON prestamos.socio_ID = socios.id
where fecha_devolucion<fecha_tope;
/*
11- Obtener cuantas veces se ha prestado cada articulo que ya haya sido devuelto.
*/
select articulo_id, count(*) as Prestado from prestamos
where fecha_devolucion is null
group by articulo_id;
select articulos.nombre as Articulo, count(*) as Prestado from prestamos
join articulos ON prestamos.articulo_id = articulos.id
where fecha_devolucion is null
group by articulo_id;
/*
12- Obtener los articulos que han sido prestados 3 veces o más.
*/
select articulo_id, count(*) as Prestado from prestamos
group by articulo_id
having Prestado>=3;
/*
13- Obtener el total de minutos (duracion) de todas las peliculas que tenemos en la biblioteca.
*/
select sum(duracion) as 'Total minutos' from articulos
where tipo='Pelicula';
/*
14- Obtener el promedio de paginas (duracion) de los libros.
*/
select avg(duracion) as 'Promedio paginas' from articulos
where tipo='Libro';
/*
15- Obtener cuantas copias de cada articulo poseo.
*/
select nombre, count(*) as Copias from articulos
group by nombre;
/*
15- Obtener cuantos articulos de cada tipo tengo cuyo año de publicación sea el mismo.
******************************************************************************************************/
select tipo, count(*) as Cantidad from articulos
group by tipo;

select * from articulos;
/*
16- A la consulta anterior, sumarle que sólo devuelva aquellos de los cuales tengo más de 2.
17- Obtener un listado de todos los socios.
*******************************************************************************************************/
select * from socios;
/*
18- Obtener los primeros 10 socios ordenados alfabeticamente. 
*/
select * from socios
order by nombre aSC
limit 10;
/*
19- Obtener todos los prestamos realizados en el año 2020.
*/
select * from prestamos
where date_format(fecha_prestamo, '%Y')=2020;
/*
20- Obtener todos los articulos de tipo pelicula anteriores al año 2010.
*/
select * from articulos
where tipo='Pelicula' and ano<2010;
/*
21- Volver a realizar todas las consultas, estableciendo donde corresponda las relaciones con
tablas para obtener los datos significativos para los usuarios en vez de los ID de relacion.
Ejemplo: Obtener el nombre del socio que tomo prestado un articulo, o el nombre del articulo
que fue prestado.

LISTO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Guia de Ejercicios N° 2

1. Obtener un listado de socios (Apellido y nombre agrupados en un solo campo) con su correspondiente
sucursal, ciudad y pais.
*/
select concat(socios.nombre, ' ', socios.apellido) as Socio, sucursales.nombre as Sucursal, ciudades.ciudad, paises.pais from socios
join ciudades ON socios.ciudad_id = ciudades.id
join sucursales ON ciudades.id = sucursales.ciudad_id
join paises ON ciudades.pais_id = paises.id
order by paises.pais, ciudades.ciudad;
/*
2. Obtener un listado de articulos por sucursal, ordenados por el pais y la ciudad Ascendente.
*/
select count(*) as 'Cantidad articulos', sucursales.nombre as Sucursal, ciudades.ciudad, paises.pais from articulos
join sucursales ON articulos.sucursal_id = sucursales.id
join ciudades ON sucursales.ciudad_id = ciudades.id
join paises ON ciudades.pais_id = paises.id
group by sucursales.id
order by paises.pais, ciudades.ciudad;
/*
3. Obtener la cantidad de socios con prestamos que no han sido devueltos agrupados por el pais del
articulo.
*/
select count(*) as 'Socios con prestamos activos', paises.pais as "Pais del articulo" from prestamos
join socios ON prestamos.socio_id = socios.id
join articulos ON prestamos.articulo_id = articulos.id
join sucursales ON articulos.sucursal_id = sucursales.id
join ciudades ON sucursales.ciudad_id = ciudades.id
join paises ON ciudades.pais_id = paises.id
where prestamos.fecha_devolucion is null
group by paises.pais;
/*
4. Se solicita obtener la cantidad de articulos de tipo 'libro' por sucursal (Atencion: Existen multiples
sucursales con el mismo nombre pero distinto pais)
*/
select count(*) as 'Cantidad libros', sucursales.nombre as Sucursal, ciudades.ciudad, paises.pais  from articulos
join sucursales ON articulos.sucursal_id=sucursales.id
join ciudades ON sucursales.ciudad_id = ciudades.id
join paises ON ciudades.pais_id = paises.id
where tipo='Libro'
group by sucursal_id
order by paises.pais, ciudades.ciudad,Sucursal;
/*
5. Obtener todos los socios de Colombia cuyo apellido empiece con la letra A, S o P junto con la ciudad a la que pertencen.
*/
select socios.nombre, socios.apellido, ciudades.ciudad, paises.pais from socios
join ciudades ON socios.ciudad_id=ciudades.id
join paises ON ciudades.pais_id=paises.id
where paises.pais='Colombia' And (socios.apellido like 'A%' or socios.apellido like 'S%' or socios.apellido like 'P%');
/*
6. Cuantos prestamos tuvo en total la sucursal 'Blockbuster Centro' de 'Montevideo'
*/
select count(*) as 'Cantidad de prestamos', sucursales.nombre, ciudades.ciudad from prestamos
join articulos ON prestamos.articulo_id = articulos.id
join sucursales ON articulos.sucursal_id = sucursales.id -- ID:10
join ciudades ON sucursales.ciudad_id = ciudades.id -- ID:15
where sucursales.nombre='Blockbuster Centro' and ciudades.ciudad='Montevideo';
/*
7. Que cantidad de empleados por ciudad posee nuestra empresa.
*/
select count(*) as 'Cantidad de empleados', ciudades.ciudad from empleados
join sucursales ON empleados.sucursal_id= sucursales.id
join ciudades ON sucursales.ciudad_id=ciudades.id
group by ciudades.ciudad
order by ciudades.ciudad;
/*
8. Que empleados del sector 'Marketing' tienen un sueldo inferior al promedio para ese sector en todos los
paises.
*/
select empleado, documento, sectores.sector from empleados
join sectores ON empleados.sector_id=sectores.id
where (sectores.sector='Marketing') and (sueldo< (select avg(sueldo) from empleados join sectores ON empleados.sector_id=sectores.id where sectores.sector='Marketing'));
/*
9. Cuanto gasto en sueldos por sector y ciudad?
*/
select sum(sueldo) as 'Total sueldos', sectores.sector, ciudades.ciudad from empleados
join sectores ON empleados.sector_id=sectores.id
join sucursales ON empleados.sucursal_id = sucursales.id
join ciudades ON sucursales.ciudad_id = ciudades.id
group by sectores.sector, ciudades.ciudad
order by ciudades.ciudad;
/*
10. Cual es el pais con mayor número de devoluciones tardías?
*/
select count(*) as Cantidad, paises.pais from prestamos
join articulos ON prestamos.articulo_id = articulos.id
join sucursales ON articulos.sucursal_id = sucursales.id 
join ciudades ON sucursales.ciudad_id = ciudades.id 
join paises ON ciudades.pais_id = paises.id
where prestamos.fecha_devolucion>prestamos.fecha_tope
order by Cantidad desc;
/*
11. Que ciudades tienen más de 10 devoluciones tardías de articulos.
*/
select count(*) as Cantidad, ciudades.ciudad from prestamos
join articulos ON prestamos.articulo_id = articulos.id
join sucursales ON articulos.sucursal_id = sucursales.id 
join ciudades ON sucursales.ciudad_id = ciudades.id 
where prestamos.fecha_devolucion>prestamos.fecha_tope 
group by ciudades.ciudad
having Cantidad>10
order by Cantidad desc;
/*
12. Existen sucursales que no posean aún articulos?
*/
select * from sucursales
left join articulos ON sucursales.id=articulos.sucursal_id
where articulos.sucursal_id is null