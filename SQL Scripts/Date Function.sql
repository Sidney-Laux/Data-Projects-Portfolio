/*This script contains queries DATE functions. This script is written by me.*/
/**/

/*Seperate the Day, Month and Year in a Date data into seperate columns*/
select ordernumber, orderdate,
year(orderdate) as year,
month(orderdate) as month,
day(orderdate) as day
from orders;

/*show date that is Now*/
select now();

/*date difference*/
select requireddate, orderdate
from orders;

select ordernumber, 
datediff(requireddate, orderdate) days_until_required
from orders;

select ordernumber, 
datediff(now(), orderdate)/365 years_until_required
from orders;

/*date add & date sub - Aggregate functions for dates*/
select orderdate, date_add(orderdate, interval 1 year) as one_year_after,
date_sub(orderdate, interval 2 month) as two_months_ago
from orders
