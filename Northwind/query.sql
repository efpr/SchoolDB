-- 1.
SELECT FIRSTNAME AS "NOME PRÓPIO", LASTNAME AS "APELIDO" FROM EMPLOYEES;

--3.
SELECT TITLE AS "TÍTULO", FIRSTNAME AS "NOME PRÓPIO", LASTNAME AS "APELIDO" FROM EMPLOYEES
ORDER BY TITLE ASC, LASTNAME DESC;

--5.
SELECT FIRSTNAME AS "NOME PRÓPRIO", LASTNAME AS "APELIDO", 
        COUNTRY AS "PAÍS" FROM EMPLOYEES
WHERE COUNTRY!='USA';

--7.
SELECT EMPLOYEE_ID AS "CÓDIGO DO EMPREGADO", ORDER_ID AS "CÓDIGO DA ENCOMENDA", 
        CUSTOMER_ID AS "CÓDIGO DO CLIENTE", REQUIRED_DATE AS "DATA REQUERIDA",
        SHIPPED_DATE AS "DATA DE ENVIO" FROM ORDERS
WHERE REQUIRED_DATE<SHIPPED_DATE;

--9.
SELECT FIRSTNAME AS "NOME PRÓPIO", LASTNAME AS "APELIDO" FROM EMPLOYEES
WHERE LASTNAME BETWEEN 'J%' AND 'M%';

--11.
select title_of_courtesy as "Título de Cortesia", firstname as "Nome Próprio",
        lastname as "Apelido" from employees
where title_of_courtesy like 'M%';

--12.
select title_of_courtesy as "Título de Cortesia", firstname as "Nome Próprio",
        lastname as "Apelido" from employees
where title_of_courtesy like 'M_.';

--13.
select title_of_courtesy as "Título de Cortesia", firstname as "Nome Próprio",
        lastname as "Apelido" from employees
where title_of_courtesy not like 'Ms.' and title_of_courtesy not like 'Mrs.';

--17. a.
select order_id as "Código da encomenda", freight as "Custos dos Portes",
        (freight*1.1) as "Custos dos Portes Acrescidos"
from orders where freight>=500;
--    b.
select order_id as "Código da encomenda", freight as "Custos dos Portes",
        (freight*1.1) as "Total dos Portes"
from orders where freight>=500;

2.

select contact_name as nome, company_name as "empresa", contact_title as "title", phone as "telefone"
from CUSTOMERS;

4.
select product_name, unit_price, quantity_per_unit
from PRODUCTS
where UNITS_IN_STOCK = 0;

6.
select order_date as "data encomenda", shipped_date as "data envio", customer_id as "id cliente", freight as "portes"
from ORDERS
where ORDER_DATE = '1997-05-19';

8.
select company_name as "nome empresa", contact_name as "nome contacto", fax as "numero fax"
from CUSTOMERS
where fax IS NOT NULL;

10.
select title_of_courtesy as "Titulo de Cortesia", firstname as "Nome", lastname as "Apelido"
from EMPLOYEES
where title_of_courtesy = 'Mrs.' or title_of_courtesy = 'Ms.';

14.
select firstname as "nome proprio", lastname as "apelido"
from EMPLOYEES
where CITY = 'Seatle' or city = 'Redmond';
--a confirmar

15.
select firstname as "nome proprio", lastname as "apelido", city as "cidade", EMPLOYEE_ID as "id"
from EMPLOYEES
where CITY = 'Seatle' or city = 'Redmond';

16.
select CONCAT(firstname, lastname) as "nome completo"
from EMPLOYEES;

18.
select (firstname || ' ' || lastname || ' pode ser contactado em x' || extension) as "Informação de Contacto"
from EMPLOYEES;

19.
select sum(quantity) as "total de unidades"
from ORDER_DETAILS
where PRODUCT_ID = 3;

20.
select PRODUCTS.PRODUCT_NAME as "Producto", sum(ORDER_DETAILS.QUANTITY) as "Unidades Totais"
from ORDER_DETAILS inner join PRODUCTS on ORDER_DETAILS.PRODUCT_ID = PRODUCTS.PRODUCT_ID
where ORDER_DETAILS.PRODUCT_ID = 3
group by PRODUCTS.PRODUCT_NAME;

23.
select city, "Numero de Representantes"
from (
    select city, count(employee_id) as "Numero de Representantes"
    from EMPLOYEES
    group by city)
where "Numero de Representantes" > 1 
order by "Numero de Representantes" ASC;


24.
select city, "Numero de Representantes"
from (
    select city, count(employee_id) as "Numero de Representantes"
    from EMPLOYEES
    where title = 'Sales Representative'
    group by city)
where "Numero de Representantes" > 1 ;

26.

