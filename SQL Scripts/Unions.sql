select *
from employees;

select * 
from customers;

select contactFirstName as FirstName, 
contactLastName as LastName,
"customer" as Type
from customers

union all

select firstName, 
lastName,
"employee" as Type
from  employees