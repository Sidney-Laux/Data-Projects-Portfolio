/*This script contains queries using Window Functions. This script is written by me.*/
/**/


/*Row Number*/

with main_cte as
(
select distinct t3.customername, t1.customernumber, t1.ordernumber, orderdate,

row_number() over (partition by t3.customernumber order by orderdate) as 
purchase_number

from classicmodels.orders t1
join classicmodels.customers t3 on t1.customernumber = t3.customernumber
order by t3.customername
)
select *
from main_cte
where purchase_number = 2;

/*Lead*/

SELECT customernumber, paymentdate, amount,
lead(amount) over (partition by customernumber order by paymentdate) as next_payment
FROM classicmodels.payments;

/*Lag*/

SELECT customernumber, paymentdate, amount,
lag(amount) over (partition by customernumber order by paymentdate) as prev_payment
FROM classicmodels.payments;

with cte_main as
(
SELECT customernumber, paymentdate, amount,
lag(amount) over (partition by customernumber order by paymentdate) as prev_payment
FROM classicmodels.payments
)
select *, amount - prev_payment as difference
from cte_main;

/*Row Number Test - Query only the 2nd order made with each SalesRep*/

with rownumbertest as
(
select T2.salesRepEmployeeNumber as employee, T1.orderDate, T1.orderNumber,

row_number () over (partition by salesRepEmployeeNumber order by orderDate) as rownumber

from orders T1
join customers T2 on T1.customerNumber = T2.customerNumber
join employees T3 on T2.salesRepEmployeeNumber = T3.employeeNumber
)

select *
from rownumbertest
where rownumber =2;