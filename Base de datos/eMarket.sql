-- Consultas queries XL parte I - GROUP BY

-- Clientes
-- 1) ¿Cuántos clientes existen?
select count(*) as "Cantidad de cliente" from clientes;

-- 2) ¿Cuántos clientes hay por ciudad?
select ciudad, count(*) "cantidad por ciudad" from clientes
group by Ciudad;

-- Facturas
-- 1) ¿Cual es el total de transporte?
-- select * from facturas;
select SUM(Transporte) Total from facturas;

-- 2) ¿Cual es el total de transporte por EnvioVia (empresa de envío)?
select EnvioVia, SUM(Transporte) Total from facturas
group by EnvioVia;

-- 3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
-- cantidad de facturas.
select count(*), ClienteID from facturas
group by ClienteID
order by count(*) desc;

-- 4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
select count(*), ClienteID from facturas
group by ClienteID
order by count(*) desc
limit 5;

-- 5) ¿Cual es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
-- select * from facturas
select count(*), PaisEnvio from facturas
group by PaisEnvio
order by count(*) ASC
limit 1;

-- 6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
-- realizó más operaciones de ventas?
-- select * from facturas
select count(*), EmpleadoID from facturas
group by EmpleadoID
order by count(*) DESC
limit 1;

/*
 Factura detalle
1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle? */
-- select * from facturadetalle

select count(*), ProductoID from facturadetalle
group by ProductoID
order by count(*) desc
limit 1;

/*
2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
cantidad por precio unitario. */
select SUM(PrecioUnitario*Cantidad) as 'total facturado' from facturadetalle;

/*
3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?
*/
select SUM(PrecioUnitario*Cantidad) as 'total facturado' from facturadetalle where ProductoID between 30 AND 50;

/*
4) ¿Cuál es el precio unitario promedio de cada producto?
*/
select avg(PrecioUnitario) "Precio unitario", ProductoID from facturadetalle
group by ProductoID;


-- 5) ¿Cuál es el precio unitario máximo?
select * from facturadetalle
order by PrecioUnitario desc
limit 1;

-- Consultas queries XL parte II - JOINS
-- 1) Generar un listado de todas las facturas del empleado 'Buchanan'.
select * from facturas
join empleados
On empleados.EmpleadoID =facturas.EmpleadoID AND empleados.Apellido='Buchanan';

-- 2) Generar un listado con todos los campos de las facturas del correo 'Speedy
-- Express'.
select * from facturas
join correos
On correos.CorreoID = facturas.EnvioVia AND correos.Compania='Speedy Express';

-- 3) Generar un listado de todas las facturas con el nombre y apellido de los
-- empleados.
select *, empleados.Nombre as 'Nombre del empleado', empleados.Apellido as 'Apellido del empleado' from facturas
join empleados
On empleados.EmpleadoID =facturas.EmpleadoID;

/*
4) Mostrar un listado de las facturas de todos los clientes "Owner" y país de envío
'USA'
*/
select * from facturas
join clientes
On clientes.ClienteID =facturas.ClienteID AND clientes.Titulo='Owner' and PaisEnvio='USA';

/*
5) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
"Leverling" o que incluyan el producto id = "42".
*/
select * from facturas
join empleados On empleados.EmpleadoID =facturas.EmpleadoID 
join facturadetalle On facturadetalle.FacturaID = facturas.FacturaID
where empleados.Apellido='Leverling' or facturadetalle.ProductoID=42;

/*
6) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
“Leverling” y que incluya los producto id = “80” o ”42”.
*/
select * from facturas
join empleados On empleados.EmpleadoID =facturas.EmpleadoID 
join facturadetalle On facturadetalle.FacturaID = facturas.FacturaID
where empleados.Apellido='Leverling' AND (facturadetalle.ProductoID=42 or facturadetalle.ProductoID=80);

/*
7) Generar un listado con los cinco mejores clientes, según sus importes de
compras total (PrecioUnitario * Cantidad).
*/
select clientes.ClienteID, clientes.Compania, SUM(facturadetalle.PrecioUnitario * facturadetalle.Cantidad) as Total from facturas
join clientes On clientes.ClienteID = facturas.ClienteID
join facturadetalle On facturadetalle.FacturaID = facturas.FacturaID
group by facturas.ClienteID
order by Total DESC
limit 5

/*
8) Generar un listado de facturas, con los campos id, nombre y apellido del cliente,
fecha de factura, país de envío, Total, ordenado de manera descendente por
fecha de factura y limitado a 10 filas.
*/
