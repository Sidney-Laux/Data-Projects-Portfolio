/*count function -> counts number of rows of specified data*/
select count(orderNumber)
from orderdetails;

select count(orderNumber)
from orders;

/*distinct function -> removes duplicates in counted rows*/

select count(distinct(orderNumber))
from orders;

select productcode, count(distinct(orderNumber))
from orderdetails
group by productcode;

/*min/max function -> gives the highest and lowest amount*/
select productcode, 
min(quantityOrdered) as most, 
max(quantityOrdered) as least
from orderdetails
group by productCode;

/*avg function -> gives the average of a column*/
select productcode, avg(quantityOrdered) as average
from orderdetails
group by productCode;
