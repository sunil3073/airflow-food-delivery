
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from FOOD_DELIVERY_DB.staging_dev_marts.fct_delivery
where order_id is null



  
  
      
    ) dbt_internal_test