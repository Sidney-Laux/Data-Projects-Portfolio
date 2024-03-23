/*This query shows if higher credit limit affects how much the customer spends. 
This was written by me.*/
/**/


with sales as
(
select T1.orderNumber, T3.customerNumber, productcode, creditlimit, quantityOrdered*priceEach as sales_value
from orders T1
inner join orderdetails T2
on T1.orderNumber = T2.orderNumber
inner join customers T3
on T1.customerNumber = T3.customerNumber
)

select ordernumber, customernumber, sum(sales_value) as sales_value, 
case when creditlimit < '75000' then 'a: Less than 75k'
when creditlimit between '75000' and '100000' then 'b:75k - 100k'
when creditlimit between '100000' and '150000' then 'c:100k-150k'
when creditlimit > '15000' then 'd:More than 150k'
else 'Other'
end as creditlimit_group
from sales
group by ordernumber, customernumber, creditlimit;