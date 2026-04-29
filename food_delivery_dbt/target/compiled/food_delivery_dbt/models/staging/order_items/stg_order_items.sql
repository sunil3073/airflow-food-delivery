

with source_data as (

    select *
    from FOOD_DELIVERY_DB.raw.order_items

),

cleaned as (

    select
        ORDER_ITEM_ID, 
        ORDER_ID, 
        ITEM_NAME, 
        QUANTITY, 
        UNIT_PRICE
    from source_data

)

select *
from cleaned