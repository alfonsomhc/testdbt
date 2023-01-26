with payments as (

    select 
        order_id, 
        sum(amount) as total_amount
    from {{ ref('stg_payments')}}
    where status = 'success'
    group by order_id

),

orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        payments.total_amount
    from orders
    inner join 
    payments using (order_id)

)

select * from final