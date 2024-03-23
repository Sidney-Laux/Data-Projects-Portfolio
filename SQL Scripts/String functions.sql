/*This script contains queries using string functions. This script is written by me.*/
/**/


/*CAST - convert a column's data into a different data type, as a new column*/
SELECT *, 
cast(paymentDate as datetime) as datetime_type
FROM payments;

/*SUBSTRING - select a specific number of characters in a string*/
SELECT CUSTOMERNUMBER,
PAYMENTDATE,
SUBSTRING(PAYMENTDATE, 1,7) AS MONTH_KEY
FROM PAYMENTS;

SELECT CUSTOMERNUMBER,
PAYMENTDATE,
SUBSTRING(PAYMENTDATE, 1,4) AS YEAR_KEY
FROM PAYMENTS;

/*CONCAT - Combine strings*/
SELECT EMPLOYEENUMBER,
LASTNAME,
FIRSTNAME,
CONCAT(firstName, ' ', Lastname) AS FULLNAME
FROM employees;

select customerName, concat(city,", ",country) as location
from customers