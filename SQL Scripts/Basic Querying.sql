/*Selecting data from tables. This was written by me.*/
/**/

SELECT *
FROM CUSTOMERS;

SELECT *
FROM CUSTOMERS
WHERE country = "USA" 
and contactlastname = "Brown";

SELECT *
FROM CUSTOMERS
WHERE (country = "USA" 
or country = "UK")
and contactlastname = "Brown";

SELECT email
FROM employees
WHERE jobTitle = "Sales Rep";

SELECT upper(firstName), upper(lastname)
FROM employees;

SELECT *
FROM employees
WHERE upper(email) in
( "PMARSH@CLASSICMODELCARS.COM",
"GBONDUR@CLASSICMODELCARS.COM",
"ABOW@CLASSICMODELCARS.COM");

SELECT *
FROM employees
WHERE upper(email) not in
( "PMARSH@CLASSICMODELCARS.COM",
"GBONDUR@CLASSICMODELCARS.COM",
"ABOW@CLASSICMODELCARS.COM");

select distinct country
from customers;

select *
from customers
where city like "%New%";

select distinct city
from customers
where city like "%New%";

select *
from customers
order by contactlastname DESC, contactfirstname DESC;
