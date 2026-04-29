



with restaurants as (

    select *
    from FOOD_DELIVERY_DB.staging_dev.stg_restaurants

)

select
    restaurant_id,
    restaurant_name,
    city,
    cuisine
from restaurants