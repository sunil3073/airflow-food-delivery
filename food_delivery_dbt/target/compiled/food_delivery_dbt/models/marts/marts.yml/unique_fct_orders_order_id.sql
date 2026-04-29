
    
    

select
    order_id as unique_field,
    count(*) as n_records

from FOOD_DELIVERY_DB.staging_dev_marts.fct_orders
where order_id is not null
group by order_id
having count(*) > 1


