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