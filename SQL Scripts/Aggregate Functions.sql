/*This script contains queries using Aggregate Functions. This script is written by me.
using SUM, ROUND, COUNT, COUNT DISTINCT, MIN, MAX, AVG, etc.*/
/**/


/*sum keyword*/
select paymentDate, sum(amount) as total_payments
from payments
group by paymentDate
order by paymentDate desc;

/*round keyword-> round int data to the specified decimal place*/
select paymentDate, round(sum(amount),1) as total_payments
from payments
group by paymentDate
order by paymentDate desc;

/*having keyword-> like "where" but used after "group by" statements*/
select paymentDate, sum(amount) as total_payments
from payments
group by paymentDate
having total_payments > 50000 and paymentDate > '2005-04-01'
order by paymentDate desc;

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

/*Use cases with aggregate functions*/

/*Show the customer name of the company with the most orders*/
select T2.customerName, (count(customername)) as orders
from orders T1
inner join customers T2
on T1.customerNumber = T2.customernumber
group by T2.customerName
order by orders desc;

select T2.customerName, (count(customername)) as orders
from orders T1
inner join customers T2
on T1.customerNumber = T2.customernumber
group by T2.customerName
order by orders desc
limit 1;

/*Display each customers first and last order date*/
select customerName, min(orderdate) as first, max(orderDate) as last
from orders T1
left join customers T2
on T1.customerNumber = T2.customernumber
group by customerName;

