

with customers  as (
    select * from FOOD_DELIVERY_DB.staging_dev.stg_customers
)

select customer_id,
        customer_name,
        city,
        signup_date
from customers