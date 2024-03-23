/*This query returns the locations of each customer and the office that dealt with them. This was written by me.*/
/**/


with cte_main as

(
select * 
from customers T1
inner join employees T2
on T1.salesRepEmployeeNumber = T2.employeeNumber
)

select distinct T1.customername, T1.country as customer_country, T2.country as office_country
from cte_main T1
inner join offices T2
on T1.officeCode = T2.officeCode
inner join orders T3
on T1.customernumber = T3.customerNumber
;