/*
	Titulo: Northwind DB

	Autores: 	Eduardo Romão nº35477
				João Dias nº 35476

	Data:	19/02/2016	

	Versão: Ver. 1.0 Rev. 01

	Dialecto:Standard. Restado em Oracle*SQL ver.17.4
*/

-- 1.
SELECT firstname AS "NOME PRÓPIO",
       lastname AS "APELIDO"
FROM employees;

--2.
SELECT contact_name AS nome,
       company_name AS "empresa",
       contact_title AS "title",
       phone AS "telefone"
FROM customers;

--3.
SELECT title AS "TÍTULO",
       firstname AS "NOME PRÓPIO",
       lastname AS "APELIDO"
FROM employees
ORDER BY title ASC,
         lastname DESC;

--4.
SELECT product_name,
       unit_price,
       quantity_per_unit
FROM products
WHERE units_in_stock = 0;

--5.
SELECT firstname AS "NOME PRÓPRIO",
       lastname AS "APELIDO",
       country AS "PAÍS"
FROM employees
WHERE country!='USA';

--6.
SELECT order_date AS "data encomenda",
       shipped_date AS "data envio",
       customer_id AS "id cliente",
       freight AS "portes"
FROM orders
WHERE order_date = '1997-05-19';

--7.
SELECT employee_id AS "CÓDIGO DO EMPREGADO",
       order_id AS "CÓDIGO DA ENCOMENDA",
       customer_id AS "CÓDIGO DO CLIENTE",
       required_date AS "DATA REQUERIDA",
       shipped_date AS "DATA DE ENVIO"
FROM orders
WHERE required_date<shipped_date;

--8.
SELECT company_name AS "nome empresa",
       contact_name AS "nome contacto",
       fax AS "numero fax"
FROM customers
WHERE fax IS NOT NULL;

--9.
SELECT firstname AS "NOME PRÓPIO",
       lastname AS "APELIDO"
FROM employees
WHERE lastname BETWEEN 'J%' AND 'M%';

--10.
SELECT title_of_courtesy AS "Titulo de Cortesia",
       firstname AS "Nome",
       lastname AS "Apelido"
FROM employees
WHERE title_of_courtesy = 'Mrs.'
  OR title_of_courtesy = 'Ms.';

--11.
SELECT title_of_courtesy AS "Título de Cortesia",
       firstname AS "Nome Próprio",
       lastname AS "Apelido"
FROM employees
WHERE title_of_courtesy LIKE 'M%';

--12.
SELECT title_of_courtesy AS "Título de Cortesia",
       firstname AS "Nome Próprio",
       lastname AS "Apelido"
FROM employees
WHERE title_of_courtesy LIKE 'M_.';

--13.
SELECT title_of_courtesy AS "Título de Cortesia",
       firstname AS "Nome Próprio",
       lastname AS "Apelido"
FROM employees
WHERE title_of_courtesy NOT LIKE 'Ms.'
  AND title_of_courtesy NOT LIKE 'Mrs.';

--14.
SELECT firstname AS "nome proprio",
       lastname AS "apelido"
FROM employees
WHERE title = 'Sales Representative'
  AND (city = 'Seattle'
       OR city = 'Redmond');

--15.
SELECT firstname AS "nome proprio",
       lastname AS "apelido",
       city AS "cidade",
       employee_id AS "id"
FROM employees
WHERE title = 'Sales Representative'
  AND (city = 'Seattle'
       OR city = 'Redmond');

--16.
SELECT concat(firstname, lastname) AS "nome completo"
FROM employees;

--17. a.
SELECT order_id AS "Código da encomenda",
       freight AS "Custos dos Portes",
       (freight*1.1) AS "Custos dos Portes Acrescidos"
FROM orders
WHERE freight>=500;

--    b.
SELECT order_id AS "Código da encomenda",
       freight AS "Custos dos Portes",
       (freight*1.1) AS "Total dos Portes"
FROM orders
WHERE freight>=500;

--18.
SELECT (firstname || ' ' || lastname || ' pode ser contactado em x' || extension) AS "Informação de Contacto"
FROM employees;

--19.
SELECT sum(quantity) AS "Total de encomendas"
FROM order_details
WHERE product_id =3;

--21.
SELECT round(avg(unit_price),3) AS "Preço Médio"
FROM order_details;

--20.
SELECT products.product_name AS "Producto",
       sum(order_details.quantity) AS "Unidades Totais"
FROM order_details
INNER JOIN products ON order_details.product_id = products.product_id
WHERE order_details.product_id = 3
GROUP BY products.product_name;

--22.
SELECT city,
       count(employee_id)
FROM employees
GROUP BY city;

--23.
SELECT city,
       "Numero de Representantes"
FROM
  ( SELECT city,
           count(employee_id) AS "Numero de Representantes"
   FROM employees
   GROUP BY city)
WHERE "Numero de Representantes" > 1
ORDER BY "Numero de Representantes" ASC;

--24.
SELECT city,
       "Numero de Representantes"
FROM
  ( SELECT city,
           count(employee_id) AS "Numero de Representantes"
   FROM employees
   WHERE title = 'Sales Representative'
   GROUP BY city)
WHERE "Numero de Representantes" > 1 ;

--25.
SELECT "Empresa",
       "Total de Encomendas" 
FROM
  ( SELECT company_name AS "Empresa", 
  		   count(order_id) AS "Total de Encomendas"
   FROM customers
   INNER JOIN orders ON orders.customer_id = customers.customer_id
   GROUP BY company_name )
WHERE "Total de Encomendas" > 15
ORDER BY "Total de Encomendas" DESC;

--26.
SELECT unit_price AS "Preço Unitário",
       '€' || cast(unit_price AS char(10))
FROM products;

