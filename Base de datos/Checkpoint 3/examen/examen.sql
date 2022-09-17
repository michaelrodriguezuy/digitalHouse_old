/*
1. Listar los servicios básicos de la habitación número 25.
*/
select habitacion_x_servicio_basico.habitacion_numero, servicio_basico.nombre from habitacion_x_servicio_basico
join servicio_basico ON habitacion_x_servicio_basico.servicio_basico_id= servicio_basico.id
where habitacion_numero=25;
/*
2. Listar absolutamente todos los servicios básicos y la cantidad de habitaciones en
las que están instalados. Mostrar sólo el nombre del servicio básico y cantidad.
*/
select servicio_basico.nombre, count(*) as Cantidad from servicio_basico 
join habitacion_x_servicio_basico ON servicio_basico.id = habitacion_x_servicio_basico.servicio_basico_id
group by servicio_basico.nombre;
/*
3. Listar todos los huéspedes que tengan tres o más check-in. Mostrar el número
de huésped, apellido y nombre separado por un espacio dentro de una misma
columna denominada "Cliente" y, la cantidad de check-in que posee.
*/
SELECT checkin.huesped_id, CONCAT(huesped.apellido,' ', huesped.nombre) AS Cliente, COUNT(*) AS Checkins FROM checkin														
INNER JOIN huesped ON checkin.huesped_id = huesped.id
group by checkin.huesped_id
HAVING Checkins >= 3;
/*
4. Listar todos los huéspedes que no tengan un check-in. Mostrar el número de
huésped, apellido y nombre en mayúsculas dentro de una misma columna
denominada "huésped sin check-in".
*/
SELECT Hu.id , CONCAT(Hu.apellido,' ', Hu.nombre) AS 'Huesped sin check-in' FROM checkin 
RIGHT JOIN huesped AS Hu ON checkin.huesped_id = hu.id 
WHERE checkin.huesped_id IS NULL
GROUP BY checkin.huesped_id;
/*
5. Listar todos los huéspedes que tengan al menos un check-in que corresponda a
la habitación de clase 'Classic'. Se debe mostrar el número de huésped, apellido,
nombre, número de habitación y la clase.
*/
SELECT COUNT(*) AS Cantidad, Hu.id AS 'Numero de Huesped' , CONCAT(Hu.apellido,' ', Hu.nombre) AS 'Huesped con check-in', Hab.numero, cla.nombre
FROM checkin 
JOIN huesped AS Hu ON checkin.huesped_id = Hu.id 
JOIN habitacion AS Hab ON checkin.habitacion_numero = Hab.numero
JOIN clase AS cla ON Hab.clase_id = cla.id
WHERE cla.nombre = 'Classic'
GROUP BY checkin.huesped_id
HAVING Cantidad >= 1;
/*
6. Listar los huéspedes que tengan una o más reservas y que en la segunda letra de
su apellido contenga una "u". Se debe mostrar el número de huésped, apellido,
nombre, nombre del servicio.
*/
select huesped.id, huesped.apellido, huesped.nombre, servicio_extra.nombre as Servicio,count(*) as Cantidad from reserva
join huesped ON reserva.huesped_id = huesped.id
join servicio_extra ON reserva.servicio_extra_id = servicio_extra.id
where huesped.apellido like '_u%'
group by huesped.id
having Cantidad>=1;

/*
7. Listar absolutamente todos los países y la cantidad de huéspedes que tengan.
*/
select count(*) as Cantidad, pais.nombre 
from pais
right join huesped ON huesped.pais_id = pais.id
group by pais.nombre;

/*
8. Calcular el importe total y la cantidad de reservas realizadas en el mes de marzo
por cada huésped. Mostrar el apellido del huésped, importe total y cantidad de
reservas.
*/
select huesped.apellido, sum(importe) as Total, count(*) as 'Cantidad de reservas' from reserva
join huesped ON reserva.huesped_id = huesped.id
where date_format(fecha, '%M')='March'
group by huesped_id;
/*
9. Calcular el importe total recaudado por mes (fecha de entrada) para la
habitación número 22. Mostrar el número de habitación, nombre de la
decoración, clase, nombre del mes y el importe total.
*/
select habitacion_numero as Habitacion, decoracion.nombre as Decoracion, clase.nombre as Clase, date_format(fecha_entrada, '%M') as Mes, 
sum(importe) as Recaudado from checkin
join habitacion ON checkin.habitacion_numero = habitacion.numero
join decoracion ON habitacion.decoracion_id = decoracion.id
join clase ON habitacion.clase_id = clase.id
where checkin.habitacion_numero=22
group by Mes;
/*
10. Determinar la recaudación total por país para las habitaciones número 5, 10 y 22. 
Mostrar nombre del país, número de habitación y el total recaudado.
*/
select pais.nombre as Pais, habitacion_numero as Habitacion, sum(importe) as Recaudado from checkin
join habitacion ON checkin.habitacion_numero = habitacion.numero
join huesped ON checkin.huesped_id = huesped.id
join pais ON huesped.pais_id = pais.id
where checkin.habitacion_numero=5 OR checkin.habitacion_numero=10 or checkin.habitacion_numero=22
group by pais.nombre;
/*
11. Calcular la recaudación total de cada forma de pago para las reservas. Mostrar la
forma de pago y el total.
*/
select forma_pago.nombre, SUM(importe) as Total from reserva
join forma_pago ON reserva.forma_pago_id = forma_pago.id
group by forma_pago.nombre;
/*
12. Listar los empleados del sector 'administración' que su país de origen sea
'Argentina'. Mostrar el número de legajo, apellido, la primera inicial del primer
nombre y un punto, nombre de su país de origen y el nombre del sector.
*/
select legajo, apellido, concat(SUBSTRING(empleado.nombre, 1, 1), '.') as Inicial, pais.nombre, sector.nombre from empleado
join sector ON empleado.sector_id = sector.id 
join pais ON empleado.pais_id = pais.id
where sector.nombre = 'administracion' AND pais.nombre = 'Argentina';
/*
13. Listar todos los servicios básicos que tienen las habitaciones (desde la 20 hasta
la 24) y su clase. Mostrar número de habitación, clase y el nombre de los
servicios básicos. Ordenar por número de habitación y servicio.
*/
select habitacion.numero as Habitacion, clase.nombre as clase, servicio_basico.nombre as servicio from habitacion
join habitacion_x_servicio_basico ON habitacion.numero = habitacion_x_servicio_basico.habitacion_numero
join servicio_basico ON habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
join clase ON habitacion.clase_id = clase.id
where habitacion.numero Between 20 and 24
order by Habitacion, servicio;
/*
14. Listar las decoraciones que no están aplicadas en ninguna habitación.
*/
select * from decoracion
left join habitacion ON decoracion.id = habitacion.decoracion_id 
where habitacion.decoracion_id is null;
/*
15. Listar todos los empleados categorizándolos por edad. Las categorías son:
'junior' (hasta 35 años), 'semi-senior' (entre 36 a 40 años) y 'senior' (más de 40).
Mostrar el apellido, nombre, edad, categoría y ordenar por edad.
*/
select apellido, nombre, (YEAR(curdate())-YEAR(empleado.fecha_nacimiento)) AS edad,
case
	when (YEAR(curdate())-YEAR(empleado.fecha_nacimiento)) <= 35 then 'Junior'
    when (YEAR(curdate())-YEAR(empleado.fecha_nacimiento)) >= 36 and (YEAR(curdate())-YEAR(empleado.fecha_nacimiento)) <= 40 then 'semi-senior'
    when (YEAR(curdate())-YEAR(empleado.fecha_nacimiento)) > 40 then 'senior'
end As categoria
from empleado
order by edad;
/*
16. Calcular la cantidad y el promedio de cada forma de pago para los check-in.
Mostrar la forma de pago, cantidad y el promedio formateado con dos
decimales.
*/
select * from checkin;
select forma_pago.nombre, count(*) as Cantidad, format(avg(importe),2,'de_DE') as Promedio from checkin
join forma_pago ON checkin.forma_pago_id = forma_pago.id
group by forma_pago.nombre;
/*
17. Calcular la edad de los empleados de Argentina. Mostrar el apellido, nombre y la
edad del empleado.
*/
select apellido, empleado.nombre, YEAR(curdate())-YEAR(empleado.fecha_nacimiento) as Edad from empleado
join pais ON empleado.pais_id = pais.id
where pais.nombre = 'Argentina'
order by apellido;
/*
18. Calcular el importe total para los check-in realizados por el huésped 'Mercado
Joel'. Mostrar apellido, nombre, importe total y el país de origen.
*/
select huesped.apellido, huesped.nombre, (importe) as Total, pais.nombre from checkin
join huesped ON checkin.huesped_id=huesped.id
join pais ON huesped.pais_id = pais.id
where huesped.apellido ='Mercado' and huesped.nombre= 'Joel';
/*
19. Listar la forma de pago empleada por cada servicio extra. Se debe mostrar el
nombre del servicio extra, nombre de la forma de pago y calcular la cantidad y
total recaudado.
*/
select servicio_extra.nombre as ServicioE, forma_pago.nombre as FormaPago, count(*) as Cantidad,sum(checkin.importe) as Total from checkin
join forma_pago ON checkin.forma_pago_id= forma_pago.id
join reserva ON forma_pago.id = reserva.forma_pago_id
join servicio_extra ON reserva.servicio_extra_id = servicio_extra.id 
group by servicio_extra.nombre;
/*
20. Listar la forma de pago empleada para el servicio extra 'Sauna' y los huéspedes
correspondientes. Se debe mostrar el nombre del servicio extra, nombre de la
forma de pago, número del cliente e importe total.
*/
select servicio_extra.nombre as ServicioE, forma_pago.nombre as FormaPago, huesped.pasaporte, sum(checkin.importe) as Total from checkin
join forma_pago ON checkin.forma_pago_id=forma_pago.id
join reserva ON forma_pago.id = reserva.forma_pago_id
join servicio_extra ON reserva.servicio_extra_id = servicio_extra.id
join huesped ON checkin.huesped_id = huesped.id
where servicio_extra.nombre = 'Sauna'
group by huesped.pasaporte;













