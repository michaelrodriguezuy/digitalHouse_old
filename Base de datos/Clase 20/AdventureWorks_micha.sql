/*
Where
1. Mostrar el nombre, precio y color de los accesorios para asientos de las bicicletas cuyo precio sea mayor a 100 pesos
Tablas: Production.Product
Campos: Name, ListPrice, Color
*/
-- micha
select Name, listprice, color from product
where listprice>100;

-- profe
SELECT Name, ListPrice AS Precio, Color FROM Product
WHERE ListPrice > 100;

/*
Operadores & joins
1. Mostrar los empleados que tienen más de 90 horas de vacaciones
Tablas: Employee
Campos: VacationHours
*/

-- micha
select title, loginID, sum(vacationhours) as VacationHoras  from employee
group by title
having VacationHoras>90
order by VacationHoras desc;

-- profe
SELECT SUM(VacationHours) AS VacationHours FROM Employee
GROUP BY title
HAVING VacationHours > 90;
/*
2. Mostrar el nombre, precio y precio con iva de los productos con precio distinto de cero
Tablas: Product
Campos: Name, ListPrice
*/

-- micha
select Name, listprice, (listprice*1.21) as PrecioIva  from product
where listprice<>0;

-- profe
SELECT Name, ListPrice AS Precio, (ListPrice*1.21) AS PrecioConIva FROM Product
WHERE ListPrice != 0;
/*
3. Mostrar precio y nombre de los productos 776, 777, 778
Tablas: Product
Campos: ProductID, Name, ListPrice
*/
-- micha
select Name, listprice from product
where productID = 776 or productID = 777 or productID = 778;

-- profe
SELECT ProductID, Name, ListPrice FROM Product
WHERE ProductID BETWEEN 776 AND 778;

/*
Order by
1. Mostrar las personas ordenadas primero por su apellido y luego por su nombre
Tablas: Contact
Campos: Firstname, Lastname
*/
-- micha
select contactID, LastName, FirstName from contact
order by Lastname, firstname ASC;

-- profe
SELECT Firstname, Lastname FROM Contact
ORDER BY LastName, FirstName;

/*
Funciones de agregación
1. Mostrar la cantidad y el total vendido por productos
Tablas: SalesOrderDetail
Campos: LineTotal
*/
-- micha
select productID, count(*) as Cantidad, sum(linetotal) as Total from SalesOrderDetail
group by productID
order by Cantidad desc;

-- profe
SELECT SalesOrderID, COUNT(SalesOrderID) AS Cantidad, SUM(LineTotal) AS Total FROM SalesOrderDetail
GROUP BY ProductID;
/*
Group by
1. Mostrar el código de subcategoría y el precio del producto más barato de cada una de ellas
Tablas: Product
Campos: ProductSubcategoryID, ListPrice
*/
-- micha
select productSubcategoryID, listprice from product
group by productSubcategoryID
order by listprice asc
limit 1;

-- profe
SELECT ProductSubcategoryID, ListPrice FROM Product
GROUP BY ProductSubcategoryID
ORDER BY ListPrice DESC
LIMIT 1;

/*
Having
1. Mostrar todas las facturas realizadas y el total facturado de cada una de ellas
ordenado por número de factura pero sólo de aquellas órdenes superen un total de
$10.000
Tablas: SalesOrderDetail
Campos: SalesOrderID, LineTotal
*/
-- micha
select SalesOrderID, max(lineTotal) as Total from SalesOrderDetail
group by SalesOrderID
having Total>10000
order by SalesOrderID;

-- profe
SELECT SalesOrderID, SUM(LineTotal) AS Total FROM SalesOrderDetail
GROUP BY SalesOrderID
HAVING Total > 10000
ORDER BY SalesOrderID;
/*
Joins
1. Mostrar los empleados que también son vendedores
Tablas: Employee, SalesPerson
Campos: EmployeeID
*/
-- micha
select employeeID from employee
join salesPerson ON employee.managerID = salesPerson.salesPersonID;

-- profe
SELECT EmployeeID FROM Employee e
INNER JOIN SalesPerson s ON s.SalesPersonID = e.ManagerID;
/*
2. Mostrar los empleados ordenados alfabéticamente por apellido y por nombre
Tablas: Employee, Contact
Campos: LastName, FirstName
*/
-- micha
select contact.lastname, contact.firstname from employee
join contact ON employee.contactID = contact.contactID
order by contact.lastname, contact.firstname;

-- profe
SELECT LastName, FirstName FROM Employee e
INNER JOIN Contact c ON c.ContactID = e.ContactID
ORDER BY LastName, FirstName;