SELECT *
FROM CUSTOMERS

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
"ABOW@CLASSICMODELCARS.COM")
