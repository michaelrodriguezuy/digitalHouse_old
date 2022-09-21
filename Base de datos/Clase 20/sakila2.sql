/*
1. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes que más dinero gastan y en cuantos alquileres lo hacen?
*/
-- MI SOLUCION
SELECT concat(customer.first_name, ' ',customer.last_name) as Cliente, sum(amount) as Total, count(*) as Cantidad FROM sakila.payment
join customer ON payment.customer_id= customer.customer_id
group by Cliente
order by Total Desc
limit 10;

-- RESUELTO DE DISCORD
SELECT CONCAT(c.first_name, ' ', c.last_name) AS Cliente, COUNT(r.rental_id) Cantidad, SUM(p.amount) AS Total FROM customer c
INNER JOIN rental r ON r.customer_id = c.customer_id
INNER JOIN payment p ON p.rental_id = r.rental_id
GROUP BY c.customer_id
ORDER BY Total DESC
LIMIT 10;
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

SELECT c.customer_id AS ClienteID, COUNT(r.rental_id) AS Cantidad, SUM(p.amount) Monto_Total FROM customer c
INNER JOIN rental r ON r.customer_id = c.customer_id
INNER JOIN payment p ON p.rental_id = r.rental_id
GROUP BY c.customer_id
HAVING Monto_Total > 150;
/*
3. Generar un reporte que responda a la pregunta: ¿cómo se distribuyen la
cantidad y el monto total de alquileres en los meses pertenecientes al año
2005? (tabla payment).
*/
select count(*) as Alquileres, sum(amount) as Total, date_format(payment_date, '%M') as Meses from payment
where date_format(payment_date, '%Y')=2005
group by Meses;

SELECT MONTH(p.payment_date) AS Mes, COUNT(p.rental_id) AS Cantidad, SUM(p.amount) As Total FROM payment p
INNER JOIN rental r ON r.rental_id = p.rental_id
WHERE YEAR(p.payment_date) = 2005
GROUP BY Mes;

select * from payment
left join rental ON payment.rental_id = rental.rental_id
where isnull(rental.rental_id);
/*
4. Generar un reporte que responda a la pregunta: ¿cuáles son los 5 inventarios
más alquilados? (columna inventory_id en la tabla rental) Para cada una de
ellas, indicar la cantidad de alquileres.
*/
-- discord
SELECT i.inventory_id, COUNT(r.rental_id) AS Cantidad FROM rental r
INNER JOIN inventory i ON i.inventory_id =r.inventory_id
GROUP BY r.inventory_id
ORDER BY Cantidad DESC
LIMIT 5;

-- micha
select film.title, count(*) as total  from rental
join inventory ON rental.inventory_id=inventory.inventory_id
join film ON inventory.film_id=film.film_id
group by film.description
order by total desc
limit 5;

select inventory.inventory_id, count(*) as cantidad from rental
join inventory ON rental.inventory_id=inventory.inventory_id
group by inventory_id
order by cantidad desc
limit 5;
/*
1. Generar un reporte que responda a la pregunta: Para cada tienda
(store), ¿cuál es la cantidad de alquileres y el monto total del dinero
recaudado por mes?
*/
-- micha
select store.store_id, date_format(payment_date, '%M') as Mes,count(*) as Alquileres, sum(amount) as MTotal from payment
join customer ON payment.customer_id = customer.customer_id
join store ON customer.store_id = store.store_id
group by store.store_id, Mes;

-- discord
SELECT s.store_id AS TiendaID, MONTH(p.payment_date) AS Mes, COUNT(r.rental_id) AS Cantidad, SUM(p.amount) AS Total FROM store s
INNER JOIN staff ON staff.staff_id = s.manager_staff_id
INNER JOIN rental r ON r.staff_id = staff.staff_id
INNER JOIN payment p ON p.rental_id = r.rental_id
GROUP BY TiendaID, Mes;
/*2. Generar un reporte que responda a la pregunta: 
a - ¿cuáles son las 10 películas que generan más ingresos? */

-- micha
select film.title as Pelicula, film.film_id,sum(payment.amount) as Total, count(*) as 'Cantidad de alquileres' from payment
 join rental ON payment.rental_id = rental.rental_id
 join inventory ON rental.inventory_id = inventory.inventory_id
 join film ON inventory.film_id = film.film_id
 group by film.title
 order by Total desc
 limit 10;
  
 -- discord
 SELECT f.title AS Pelicula, SUM(p.amount) Total, COUNT(r.rental_id) Cantidad FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
INNER JOIN payment p ON p.rental_id = r.rental_id
GROUP BY f.film_id
ORDER BY Total DESC
LIMIT 10;
/*b - ¿ Y cuáles son las que generan menos ingresos? Para cada una de ellas indicar la cantidad de alquileres. */
-- micha
select film.title as Pelicula, sum(payment.amount) as Total, count(rental.rental_id) as Cantidad from film
join inventory ON film.film_id = inventory.film_id
join rental ON inventory.inventory_id = rental.inventory_id
join payment ON rental.rental_id = payment.rental_id
group by film.title
order by Cantidad ASC
limit 10;

-- discord
SELECT f.title AS Pelicula, SUM(p.amount) Total, COUNT(r.rental_id) Cantidad FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
INNER JOIN payment p ON p.rental_id = r.rental_id
GROUP BY f.film_id
ORDER BY Total
LIMIT 10;

/*3. ¿Existen clientes que no hayan alquilado películas?*/
-- micha
select CONCAT(customer.first_name, customer.last_name), rental.rental_id from customer
left join rental ON customer.customer_id = rental.customer_id
where isnull(rental.customer_id);

-- discord
SELECT CONCAT(c.first_name, c.last_name) AS Cliente, r.rental_id FROM customer c
LEFT JOIN rental r ON r.customer_id = c.customer_id
WHERE ISNULL(r.rental_id);

/*4. Nivel avanzado: El jefe de stock quiere discontinuar las películas (film) con
menos alquileres (rental). ¿Qué películas serían candidatas a discontinuar?
Recordemos que pueden haber películas con 0 (Cero) alquileres.*/

-- micha
select film.title as Pelicula, count(rental.rental_id) as Cantidad from film
left join inventory ON film.film_id = inventory.film_id
left join rental ON inventory.inventory_id = rental.inventory_id
group by film.title
order by Cantidad ASC;

-- discord
SELECT f.title AS Pelicula, COUNT(r.rental_id) AS Cantidad FROM film f
LEFT JOIN inventory i ON i.film_id = f.film_id
LEFT JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY Pelicula
ORDER BY Cantidad;