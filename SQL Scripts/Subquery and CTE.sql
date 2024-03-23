/*This script contains queries using Subquery and CTEs. This script is written by me.*/
/**/


/*Subquery*/
select orderdate, max(ordercount)
from
(select orderdate, count(ordernumber) as ordercount
from orders
group by orderDate) as T1
group by orderdate
order by ordercount desc
limit 1;

select orderdate, ordercount
from
(select orderdate, count(ordernumber) as ordercount
from orders
group by orderDate) as T1
where ordercount > 2;

/*CTE - Common table expression*/

with 
cte_orders as
(select orderdate, count(ordernumber) as ordercount
from orders
group by orderDate),

cte_payments as
(select*
from payments)

select orderdate, ordercount
from cte_orders
where ordercount > 2;