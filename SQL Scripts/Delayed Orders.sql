/*This query returns the orders that will be delivered later than the required date, given that they were shipped 3 days late. 
This was written by me.*/
/**/


with cte_main as
(
select*, date_add(shippeddate, interval 3 day) as latest_arrival,
case when date_add(shippeddate, interval 3 day) > requiredDate then 1 else 0 end as late_flag
from orders
where (case when date_add(shippeddate, interval 3 day) > requiredDate then 1 else 0 end) = 1
)

select ordernumber, requireddate, latest_arrival
from cte_main