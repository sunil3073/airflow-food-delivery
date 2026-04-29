
  
    

create or replace transient table FOOD_DELIVERY_DB.staging_dev_marts.fct_orders
    
    
    
    as (

with order_metrics as (

    select *
    from FOOD_DELIVERY_DB.staging_dev_intermediate.int_order_metrics

)

select *
from order_metrics


    )
;


  