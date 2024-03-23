/*This script contains queries using JOIN functions. This script is written by me.*/
/**/


/*INNER JOIN - only the rows where there is a match in both tables*/
select contactFirstName, contactLastName, orderDate, status
from orders T1
inner join customers T2
on T1.customernumber = T2.customerNumber;

/*LEFT JOIN - all rows in the left table and matching rows from right table*/
select contactFirstName, contactLastName, orderDate, orderNumber
from customers T2
left join orders T1
on T1.customernumber = T2.customerNumber
order by orderNumber ;

/*RIGHT JOIN - all rows in the right table and matching rows from right table*/
select contactFirstName, contactLastName, orderDate, orderNumber
from customers T2
right join orders T1
on T1.customernumber = T2.customerNumber
order by orderNumber ;

/*JOIN 2 tables on a specific condition*/
select *
from orders T1
inner join customers T2
on T1.customernumber = T2.customerNumber
where T1.customerNumber = 363;

/*JOIN 2 tables on multiple conditions*/
select firstname, lastname, customername
from employees T1
left join customers T2
on T1.employeeNumber = T2.salesRepEmployeeNumber
where jobTitle = "Sales Rep"
and customername is null;
