
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    RESTAURANT_ID as unique_field,
    count(*) as n_records

from FOOD_DELIVERY_DB.staging_dev.stg_restaurants
where RESTAURANT_ID is not null
group by RESTAURANT_ID
having count(*) > 1



  
  
      
    ) dbt_internal_test