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