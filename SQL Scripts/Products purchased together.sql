/*This query returns the products that are often purchased together. This was written by me.*/
/**/


with prod_sales as
(
select orderNumber, T1.productcode, productline
from orderdetails T1
inner join products T2
on T1.productCode = T2.productCode
)

select distinct T1.ordernumber, T1.productline as Product_1, T2.productline as Product_2
from prod_sales T1
left join prod_sales T2
on T1.ordernumber = T2.ordernumber and T1.productline <> T2.productline