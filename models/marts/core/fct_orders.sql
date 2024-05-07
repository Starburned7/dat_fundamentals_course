with orders as  (
    select * from {{ ref('stg_orders' )}}
),

payments as (
    select orderid as order_id, amount, status from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when status = 'success' then amount end) as amount

    from payments
    group by 1
),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payments.amount, 0) as amount

    from orders
    left join order_payments using (order_id)
)

select * from final













-- with orders as (

--     select order_id, customer_id from {{ ref('stg_orders') }}

-- ),

-- payments as (
--     select orderid as order_id, amount from {{ ref('stg_payments') }}

-- ),


-- final as (

--     select
--         orders.order_id,
--         orders.customer_id,
--         payments.amount
    

--     from orders

--     left join payments on orders.order_id = payments.order_id

-- )

-- select * from final
