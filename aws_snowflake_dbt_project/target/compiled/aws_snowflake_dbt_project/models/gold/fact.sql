



select
    gold_obt.booking_id, gold_obt.listing_id, gold_obt.host_id, gold_obt.total_price, gold_obt.service_fee, gold_obt.cleaning_fee, gold_obt.accommodates, gold_obt.bathrooms, gold_obt.response_rate,
from
    
    
        Airbnb.gold.obt as gold_obt
    
    
    
        Left Join Airbnb.silver.silver_listing as dim_listing
        on gold_obt.listing_id = dim_listing.listing_id
    
    
    
        Left Join Airbnb.silver.silver_host as dim_host
        on gold_obt.host_id = dim_host.host_id
    
    