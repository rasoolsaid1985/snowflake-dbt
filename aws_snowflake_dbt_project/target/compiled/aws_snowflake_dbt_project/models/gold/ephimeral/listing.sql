

with listing as(
    select
        listing_id,
        property_type,
        city,
        country, 
        price_per_night,
        listing_created_at
        from
            AIRBNB.gold.obt    
)
select * from listing