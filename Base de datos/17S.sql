/*
Clientes

1. Crear una vista con los siguientes datos de los clientes: ID, contacto, y el
Fax. En caso de que no tenga Fax, colocar el teléfono, pero aclarándolo. Por
ejemplo: “TEL: (01) 123-4567”.
2. Se necesita listar los números de teléfono de los clientes que no tengan
fax. Hacerlo de dos formas distintas:
a. Consultando la tabla de clientes.
b. Consultando la vista de clientes.
*/
SELECT ClienteID, Compania, replace(Fax,'', concat('Tel: '&Telefono)) as 'Fax/Tel' FROM clientes;
SELECT ClienteID, Compania, coalesce(Fax, ' - ') FROM clientes;

SELECT ClienteID, Compania, Telefono FROM clientes
where Fax ='';

create view view_clientes as 
SELECT ClienteID, Compania, Telefono FROM clientes
where Fax ="";

select * from view_clientes;



/*
Proveedores
1. Crear una vista con los siguientes datos de los proveedores: ID,
contacto, compañía y dirección. Para la dirección tomar la dirección,
ciudad, código postal y país.
2. Listar los proveedores que vivan en la calle Americanas en Brasil. Hacerlo
de dos formas distintas:
a. Consultando la tabla de proveedores.
b. Consultando la vista de proveedores.
*/

-- 1
create view view_proveedores as
select proveedores.ProveedorID, proveedores.Compania, concat(proveedores.Direccion, ' - ', ciudad, ' - ', codigoPostal, ' - ', pais ) as Direccion from proveedores;

select * from view_proveedores;

-- 2
select * from proveedores 
where Direccion like '%Americanas%' and pais='Brazil';

select * from view_proveedores
where Direccion like '%Americanas%' and Direccion like '%Brazil%';


/*
Vistas - Parte II
1. Crear una vista de productos que se usará para control de stock. Incluir el ID
y nombre del producto, el precio unitario redondeado sin decimales, las
unidades en stock y las unidades pedidas. Incluir además una nueva
columna PRIORIDAD con los siguientes valores:
■ BAJA: si las unidades pedidas son cero.
■ MEDIA: si las unidades pedidas son menores que las unidades
en stock.
■ URGENTE: si las unidades pedidas no duplican el número de
unidades.
■ SUPER URGENTE: si las unidades pedidas duplican el número
de unidades en caso contrario.

2. Se necesita un reporte de productos para identificar problemas de stock.
Para cada prioridad indicar cuántos productos hay y su precio promedio.
No incluir las prioridades para las que haya menos de 5 productos.
*/

create view view_control_stock as 
select productoID, ProductoNombre, round(PrecioUnitario) as PrecioUnitario, UnidadesStock, UnidadesPedidas,
case
	when unidadesPedidas = 0 then 'Baja'
    when unidadesPedidas < UnidadesStock then 'Media'
    when unidadesPedidas < unidadesStock*2 then 'Urgente'
    ELSE 'Super urgente'
end as Prioridad from productos;

select * from view_control_stock;

select Prioridad, SUM(unidadesStock) as Stock, concat('$ ',round(avg(PrecioUnitario))) as 'Precio promedio' from view_control_stock
group by Prioridad
having Stock>=5