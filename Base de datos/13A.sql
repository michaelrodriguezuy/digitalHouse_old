select * from clientes
where pais = "Brazil";

select count(*) as "Cantidad de canciones", id_genero as Genero from canciones
group by id_genero;

select sum(total) from facturas;

select avg(milisegundos) as Milisegundos, id_album from canciones
group by id_album; -- album 4

SELECT min(bytes) FROM musimundos.canciones;

select sum(total) as Total, id_cliente from facturas
group by id_cliente
having Total > 45


