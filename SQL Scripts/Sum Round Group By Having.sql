/*sum keyword*/
select paymentDate, sum(amount) as total_payments
from payments
group by paymentDate
order by paymentDate desc;

/*round keyword-> round int data to the specified decimal place*/
select paymentDate, round(sum(amount),1) as total_payments
from payments
group by paymentDate
order by paymentDate desc;

/*having keyword-> like "where" but used after "group by" statements*/
select paymentDate, sum(amount) as total_payments
from payments
group by paymentDate
having total_payments > 50000 and paymentDate > '2005-04-01'
order by paymentDate desc;