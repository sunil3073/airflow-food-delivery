
  create or replace   view FOOD_DELIVERY_DB.staging_dev.stg_orders
  
  
  
  
  as (
    

with source_data as (

    select *
    from FOOD_DELIVERY_DB.raw.orders

),

cleaned as (

    select
        trim(order_id) as order_id,
        trim(customer_id) as customer_id,
        trim(restaurant_id) as restaurant_id,
        cast(order_time as timestamp) as order_time,
        cast(delivery_time as timestamp) as delivery_time,
        lower(trim(status)) as status,
        cast(total_amount as number(10,2)) as total_amount
    from source_data

)

select *
from cleaned
  );

