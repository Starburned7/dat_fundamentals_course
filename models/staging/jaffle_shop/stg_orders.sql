-- select
--     id as order_id,
--     user_id as customer_id,
--     order_date,
--     status

-- from raw.jaffle_shop.orders


select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{ source('jaffle_shop', 'orders') }}


{{ limit_data_in_dev('order_date', 3000) }}