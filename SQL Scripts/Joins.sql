select *
from orders T1
inner join customers T2
on T1.customernumber = T2.customerNumber
where T1.customerNumber = 363;

select firstname, lastname, customername
from employees T1
left join customers T2
on T1.employeeNumber = T2.salesRepEmployeeNumber
where jobTitle = "Sales Rep"
and customername is null;

select contactFirstName, contactLastName, orderDate, status
from orders T1
inner join customers T2
on T1.customernumber = T2.customerNumber;

select contactFirstName, contactLastName, orderDate, orderNumber
from customers T2
left join orders T1
on T1.customernumber = T2.customerNumber
order by orderNumber ;

/*this is how commenting works in SQL*/

select *
from customers
