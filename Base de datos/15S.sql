/*
Realizar los siguientes informes:
1. Listar las canciones cuya duración sea mayor a 2 minutos.
*/
select * from canciones
where milisegundos>120000;
/*
2. Listar las canciones cuyo nombre comience con una vocal.
*/
select * from canciones
where nombre like 'a%' or nombre like 'e%' or nombre like 'i%' or nombre like 'o%' or nombre like 'u%';
/*
3. Listar las canciones ordenadas por compositor en forma descendente, y luego
por nombre en forma ascendente. Incluir únicamente aquellas canciones que
tengan compositor.
*/
select * from canciones
where compositor is not null
order by compositor desc, nombre asc;

/*
4. a) Listar la cantidad de canciones de cada compositor.
*/
select compositor, count(*) as cantidad from canciones
group by compositor
order by cantidad desc;
/*
b) Modificar la consulta para incluir únicamente los compositores que tengan
más de 10 canciones.
*/
select compositor, count(*) as cantidad from canciones
group by compositor
having cantidad>10
order by cantidad desc;
/*
5. a) Listar el total facturado agrupado por ciudad.
*/
select pais_de_facturacion, ciudad_de_facturacion, sum(total) as Total from facturas
group by ciudad_de_facturacion;
/*
b) Modificar el listado del punto (a) mostrando únicamente las ciudades de
Canadá.
*/
-- select * from facturas;
select pais_de_facturacion, ciudad_de_facturacion, sum(total) as Total from facturas
where pais_de_facturacion='Canada'
group by ciudad_de_facturacion;
/*
c) Modificar el listado del punto (a) mostrando únicamente las ciudades con una
facturación mayor a 38.
*/
select pais_de_facturacion, ciudad_de_facturacion, sum(total) as TotalFacturado from facturas
group by ciudad_de_facturacion
having TotalFacturado>38;

/*
d) Modificar el listado del punto (a) agrupando la facturación por país, y luego
por ciudad.
*/
select pais_de_facturacion, ciudad_de_facturacion, sum(total) as Total from facturas
group by pais_de_facturacion, ciudad_de_facturacion
order by pais_de_facturacion, ciudad_de_facturacion;
/*
6. a) Listar la duración mínima, máxima y promedio de las canciones.
*/
select min(milisegundos) as 'Duración minima', max(milisegundos) as 'Duración máxima', 
avg(milisegundos) as 'Duración promedio' from canciones;
/*
b) Modificar el punto (a) mostrando la información agrupada por género.
*/
select id_genero, min(milisegundos) as 'Duración minima', max(milisegundos) as 'Duración máxima', 
avg(milisegundos) as 'Duración promedio' from canciones
group by id_genero;

-- DE YAPA
select generos.nombre, min(milisegundos) as 'Duración minima', max(milisegundos) as 'Duración máxima', 
avg(milisegundos) as 'Duración promedio' from canciones
join generos ON canciones.id_genero = generos.id
group by generos.nombre