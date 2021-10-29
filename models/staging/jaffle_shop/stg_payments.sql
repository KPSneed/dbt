with payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,

        -- amount is stored in cents, convert it to dollars ---Practice did not state the amount field was in cents or dollars
        amount / 100 as amount,
        {{ cents_to_dollars('amount', 4) }} as amount_macro,
        created as created_date
    from {{source('dbt_datasets','raw_payments')}}

)

select * from payments