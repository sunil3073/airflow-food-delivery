
  create or replace   view FOOD_DELIVERY_DB.staging_dev_intermediate.int_order_items_enriched
  
  
  
  
  as (
    

with orders as (

    select *
    from FOOD_DELIVERY_DB.staging_dev.stg_orders

),

order_items as (

    select *
    from FOOD_DELIVERY_DB.staging_dev.stg_order_items

),

joined as (

    select
        oi.order_item_id,
        oi.order_id,
        o.customer_id,
        o.restaurant_id,
        o.order_time,
        o.delivery_time,
        o.status,
        o.total_amount,
        oi.item_name,
        oi.quantity,
        oi.unit_price,
        oi.quantity * oi.unit_price as item_total
    from order_items oi
    left join orders o
        on oi.order_id = o.order_id

)

select *
from joined
  );

