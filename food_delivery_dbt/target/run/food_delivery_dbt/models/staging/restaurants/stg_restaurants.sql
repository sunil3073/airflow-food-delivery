
  create or replace   view FOOD_DELIVERY_DB.staging_dev.stg_restaurants
  
  
  
  
  as (
    

with source_data as(
    select * from FOOD_DELIVERY_DB.raw.RESTAURANTS
), 

renamed as (
    select RESTAURANT_ID,
           RESTAURANT_NAME, 
           city,
           CUISINE
    from source_data    
),
cleaned as (
      select RESTAURANT_ID,
             trim(RESTAURANT_NAME) as RESTAURANT_NAME, 
             trim(CITY) as city,
             CUISINE
      from renamed
)
select * from cleaned
  );

