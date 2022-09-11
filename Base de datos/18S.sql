-- 1. Crear una vista para poder organizar los envíos de las facturas. 
-- Indicar número de factura, 
 -- fecha de la factura 
 -- fecha de envío, ambas en formato dd/mm/yyyy,
-- valor del transporte formateado con dos decimales, y la información del
-- domicilio del destino incluyendo dirección, ciudad, código postal y país, en una
-- columna llamada Destino
CREATE VIEW VISTA_OrganizacionEnvios AS
SELECT FacturaID AS "N° Factura", date_format(FechaFactura, '%d/%m/%Y') AS 'Fecha de Factura', date_format(FechaEnvio, '%d/%m/%Y') AS 'Fecha de Envio', 
FORMAT(Transporte, 2) AS 'Valor Transporte', EnvioVia, CONCAT(DireccionEnvio, '  ',  CiudadEnvio,'  ', CodigoPostalEnvio,'  ', PaisEnvio) AS Destino
FROM Facturas;

SELECT * FROM VISTA_OrganizacionEnvios;

/*
SELECT FacturaID AS nFactura,
date_format(FechaFactura, '%d/%m/%Y') AS 'Fecha de Factura', 
date_format(FechaEnvio, '%d/%m/%Y') AS 'Fecha de Envio',
ROUND(Transporte,2) AS 'Valor Transporte',
EnvioVia,
CASE   													         -- EL QUERY DE LA VISTA
	WHEN DireccionEnvio != NULL 
	AND CiudadEnvio != NULL 
	AND CodigoPostalEnvio != NULL 
	AND PaisEnvio != NULL
	THEN CONCAT(DireccionEnvio, '  ',  CiudadEnvio,'  ', CodigoPostalEnvio,'  ', PaisEnvio)
ELSE CONCAT(DireccionEnvio, '  ',  CiudadEnvio,'  ', CodigoPostalEnvio,'  ', PaisEnvio)
END AS Destino
FROM Facturas;
*/

-- DROP VIEW VISTA_OrganizacionEnvios;








-- 2. Realizar una consulta con todos los correos y el detalle de las facturas que
-- usaron ese correo. Utilizar la vista creada.

SELECT * FROM Correos 
LEFT JOIN VISTA_OrganizacionEnvios ON Correos.CorreoID = VISTA_OrganizacionEnvios.EnvioVia;

-- 3.Qué dificultad o problema encontrás en esta consigna? Proponer alguna
-- alternativa o solución

-- La dificultad de este Ejercicio es que al no haber una 
-- clave foranea en la vista creada hubo que
--  modificar la vista antes de relacionar las tablas.

/*
 Ejercicio 2
1. Crear una vista con un detalle de los productos en stock. Indicar id, nombre del
producto, nombre de la categoría y precio unitario.
2. Escribir una consulta que liste el nombre y la categoría de todos los productos
vendidos. Utilizar la vista creada.
3. ¿Qué dificultad o problema encontrás en esta consigna? Proponer alguna
alternativa o solución.
*/
CREATE VIEW view_prod_stock AS
SELECT ProductoID, productoNombre as Producto, categorias.CategoriaNombre, productos.PrecioUnitario
FROM productos
join categorias ON productos.CategoriaID = categorias.CategoriaID;

select * from view_prod_stock;

select facturas.FacturaID, Producto, CategoriaNombre, facturas.Transporte from view_prod_stock
join facturadetalle ON view_prod_stock.ProductoID = facturadetalle.ProductoID
join facturas ON facturadetalle.FacturaID = facturas.FacturaID

