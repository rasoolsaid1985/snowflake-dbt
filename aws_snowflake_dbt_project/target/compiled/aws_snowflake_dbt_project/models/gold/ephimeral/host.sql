

with host as(
    select
        host_id,
        host_name,
        host_since,
        is_superhost,
        RESPONSE_QUALITY,
        host_created_at
        from
            AIRBNB.gold.obt    
)
select * from host