with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from {{ source('dbt_datasets','raw_customers')}}

)

select * from customers