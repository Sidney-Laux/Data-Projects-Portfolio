select distinct country
from customers;

select *
from customers
where city like "%New%";

select distinct city
from customers
where city like "%New%";

select *
from customers
order by contactlastname DESC, contactfirstname DESC;