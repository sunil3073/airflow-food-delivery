
    
    

select
    ORDER_ID as unique_field,
    count(*) as n_records

from FOOD_DELIVERY_DB.staging_dev.stg_delivery
where ORDER_ID is not null
group by ORDER_ID
having count(*) > 1


