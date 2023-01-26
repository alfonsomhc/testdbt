with payments as (
    
    select
        id as payment_id,
        orderid as order_id,
        status,
        amount
    from {{source('stripe','payment')}}
)

select * from payments