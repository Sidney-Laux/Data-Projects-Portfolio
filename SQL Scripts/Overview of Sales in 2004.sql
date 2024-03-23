/*This query returns an overview on orders made in 2004. This was written by me.*/
/**/


select T2.orderdate, T1.ordernumber, quantityOrdered, priceEach, productName, productLine, buyPrice, city, country
from orderdetails T1
inner join orders T2 on T1.orderNumber = T2.orderNumber
inner join products T3 on T1.productCode = T3.productCode
inner join customers T4 on T4.customerNumber = T2.customerNumber
where year(orderdate) = "2004";