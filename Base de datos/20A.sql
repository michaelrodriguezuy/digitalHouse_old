select * from actor;

select customer_id as Cliente, count(*) as 'Cantidad de pagos', sum(amount) as Total from payment
where customer_id=10;

select count(*) from customer
where active is false;

/*
1. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
que más dinero gastan y en cuantos alquileres lo hacen?
*/
select concat(customer.first_name,' ',customer.last_name) as Cliente, sum(amount) as total, count(*) as 'Cantidad de alquileres'from payment
join customer ON payment.customer_id= customer.customer_id
group by payment.customer_id
order by total DESC
limit 10;

/*
2. Generar un reporte que indique: el id del cliente, la cantidad de alquileres y
el monto total para todos los clientes que hayan gastado más de 150 dólares
en alquileres.
*/
select concat(customer.first_name,' ',customer.last_name) as Cliente, count(*) as 'Total alquileres', sum(amount) as Monto from payment
join customer ON payment.customer_id= customer.customer_id
group by payment.customer_id
having Monto>150
order by Monto Desc;

/*
3. Generar un reporte que responda a la pregunta: ¿cómo se distribuyen la
cantidad y el monto total de alquileres en los meses pertenecientes al año
2005? (tabla payment).
*/
select count(*) as Alquileres, sum(amount) as Total, date_format(payment_date, '%M') as Meses from payment
where date_format(payment_date, '%Y')=2005
group by Meses;

/*
4. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios
más alquilados? (columna inventory_id en la tabla rental) Para cada una de
ellas, indicar la cantidad de alquileres.
*/
select film.title, count(*) as total  from rental
join inventory ON rental.inventory_id=inventory.inventory_id
join film ON inventory.film_id=film.film_id
group by film.description
order by total desc
limit 5;

/*
Parte 2:
1. Generar un reporte que responda a la pregunta: Para cada tienda
(store), ¿cuál es la cantidad de alquileres y el monto total del dinero
recaudado por mes?
*/
-- select * from payment;
select store.store_id, date_format(payment_date, '%M') as Mes,count(*) as Alquileres, sum(amount) as MTotal from payment
join customer ON payment.customer_id= customer.customer_id
join store ON customer.store_id= store.store_id
group by store.store_id, Mes;
/*
2. Generar un reporte que responda a la pregunta: ¿cuáles son las 10 películas
que generan más ingresos? ¿ Y cuáles son las que generan menos ingresos?
Para cada una de ellas indicar la cantidad de alquileres.
*/
 select film.title as Pelicula, film.film_id,sum(payment.amount) as Total, count(*) as 'Cantidad de alquileres' from payment
 join rental ON payment.rental_id = rental.rental_id
 join inventory ON rental.inventory_id = inventory.inventory_id
 join film ON inventory.film_id = film.film_id
 group by film.title
 order by Total ASC
 limit 10
/*
3. ¿Existen clientes que no hayan alquilado películas?
4. Nivel avanzado: El jefe de stock quiere discontinuar las películas (film) con
menos alquileres (rental). ¿Qué películas serían candidatas a discontinuar?
Recordemos que pueden haber películas con 0 (Cero) alquileres.
*/