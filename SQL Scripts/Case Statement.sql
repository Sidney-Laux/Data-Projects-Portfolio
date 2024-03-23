/*This script contains queries using Case Statements to create Flags. This script is written by me.*/
/**/


/*Case Statement 1*/

select 
case 
when creditLimit < 75000 then 'Less than $75k'
when creditLimit between 75000 and 100000 then '$75k -
$100k'
when creditLimit between 100000 and 150000 then '$100k 
- $150k'
when creditLimit > 150000 then 'Over $150k'
else 'Other' end as credit_limit_grp,
count(distinct c.customernumber) as customers
from classicmodels.customers c
group by 1;

/*Case Statement 2, using it with CTE and Flags*/

with cte_main as
(
select
t1.ordernumber, orderdate, quantityordered, productname, productline,

case /*this is a Flag.*/
when quantityordered > 40 and productline = 'Motorcycles' 
then 1 else 
0 end as ordered_over_40_motorcycles

from classicmodels.orders t1

join classicmodels.orderdetails t2 on t1.ordernumber = t2.ordernumber
join classicmodels.products t3 on t2.productcode = t3.productcode
)
select orderdate, sum(ordered_over_40_motorcycles) as ordered_over_40_motorcycles
from cte_main
group by orderdate;

/*Case Statement 3*/
/*Using a Flag to identify "negotiate" mentioned in comments in order table*/

select orderNumber, customerNumber, comments,
case 
when upper(comments) like '%negotiate%' then 1
else 0
end as negotiate_mention
from orders;

/*multiple flags*/

select customernumber, comments,
case /*dispute comments flag*/
when upper(comments) like '%dispute%' then 1
end as disputed,

case /*negotiate comments flag*/
when upper(comments) like '%negotiate%' then 1
end as negotiated
from orders
where upper(comments) like '%negotiate%'  = 1 or upper(comments) like '%dispute%' = 1
order by disputed desc;