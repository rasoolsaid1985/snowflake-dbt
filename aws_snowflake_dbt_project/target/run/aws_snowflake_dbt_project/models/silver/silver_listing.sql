
  
    

create or replace transient table AIRBNB.silver.silver_listing
    
    
    
    as (

select
    listing_id,
    host_id,
    property_type,
    room_type,
    city,
    country,
    accommodates,
    bathrooms,
    
    Case
        when Cast(price_per_night as int) < 100 then 'LOW'
        when Cast(price_per_night as int) >= 100 and Cast(price_per_night as int) < 500 then 'MEDIUM'
        else 'NOT NULL'
    end


 as price_per_night,
    created_at
from AIRBNB.bronze.bronze_listing
    )
;


  