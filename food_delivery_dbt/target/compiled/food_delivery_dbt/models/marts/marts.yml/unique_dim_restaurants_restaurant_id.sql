
    
    

select
    restaurant_id as unique_field,
    count(*) as n_records

from FOOD_DELIVERY_DB.staging_dev_marts.dim_restaurants
where restaurant_id is not null
group by restaurant_id
having count(*) > 1


