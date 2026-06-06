



select 
    
        silver_booking.*, 
    
        silver_listing.host_id, silver_listing.property_type, silver_listing.city, silver_listing.country, silver_listing.accommodates, silver_listing.bathrooms, silver_listing.price_per_night, silver_listing.created_at as listing_created_at, 
    
        silver_host.host_name, silver_host.host_since, silver_host.is_superhost, silver_host.response_rate, silver_host.response_rate as silver_response_rate, silver_host.response_quality, silver_host.created_at as host_created_at
    
from
    
    
        Airbnb.silver.silver_booking as silver_booking
    
    
    
        Left Join Airbnb.silver.silver_listing as silver_listing
        on silver_booking.listing_id = silver_listing.listing_id
    
    
    
        Left Join Airbnb.silver.silver_host as silver_host
        on silver_listing.host_id = silver_host.host_id
    
    