
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select ORDER_ID
from FOOD_DELIVERY_DB.staging_dev.stg_order_items
where ORDER_ID is null



  
  
      
    ) dbt_internal_test