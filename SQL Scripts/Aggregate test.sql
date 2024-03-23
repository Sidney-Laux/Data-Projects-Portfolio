/*Show the customer name of the company with the most orders?*/

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

