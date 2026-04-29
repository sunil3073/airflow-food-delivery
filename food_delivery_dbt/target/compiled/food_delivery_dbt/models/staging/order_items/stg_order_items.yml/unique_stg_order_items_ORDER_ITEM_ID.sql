
    
    

select
    ORDER_ITEM_ID as unique_field,
    count(*) as n_records

from FOOD_DELIVERY_DB.staging_dev.stg_order_items
where ORDER_ITEM_ID is not null
group by ORDER_ITEM_ID
having count(*) > 1


