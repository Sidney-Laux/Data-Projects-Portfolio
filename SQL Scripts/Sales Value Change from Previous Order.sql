with cte_main as
(
select ordernumber, orderdate, customernumber, sum(sales_value) as sales_value
from
(
select T1.ordernumber, orderdate, customernumber, productCode, quantityOrdered*priceEach as sales_value
from orders T1
inner join orderdetails T2
on T1.orderNumber = T2.orderNumber
) main
group by ordernumber, orderdate, customernumber
),

sales_query as
(
select T1.*, customerName, row_number() over (partition by customername order by orderdate) as purchase_number, 
lag(sales_value) over (partition by customername order by orderdate) as prev_sale_value
from cte_main T1
inner join customers T2
on T1.customernumber = T2.customernumber
)

select *, sales_value - prev_sale_value as sales_difference
from sales_query
where prev_sale_value is not null