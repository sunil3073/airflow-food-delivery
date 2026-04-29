

with delivery_metrics as (

    select *
    from FOOD_DELIVERY_DB.staging_dev_intermediate.int_delivery_metrics

)

select
    order_id,
    customer_id,
    restaurant_id,
    order_time,
    delivery_time,
    status,
    total_amount,
    delivery_partner_id,
    delivery_time_minutes,
    delivery_performance
from delivery_metrics