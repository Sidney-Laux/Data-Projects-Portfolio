/*This script contains queries using Union Functions. This script is written by me.*/
/**/


select contactFirstName as FirstName, 
contactLastName as LastName,
"customer" as Type
from customers

union all

select firstName, 
lastName,
"employee" as Type
from  employees;