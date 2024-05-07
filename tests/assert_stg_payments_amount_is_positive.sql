with payments as (
    select * from {{ref('stg_payments')}}
)

select id, sum(amount) as total_amount
from payments 
group by id
having total_amount < 0