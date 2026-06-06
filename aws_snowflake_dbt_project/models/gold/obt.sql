{% set config = [
    {
        "table" : "Airbnb.silver.silver_booking",
        "columns" : "silver_booking.*",
        "alias" : "silver_booking"
    },
    {
        "table" : "Airbnb.silver.silver_listing",
        "columns" : "silver_listing.host_id, silver_listing.property_type, silver_listing.city, silver_listing.country, silver_listing.accommodates, silver_listing.bathrooms, silver_listing.price_per_night, silver_listing.created_at as listing_created_at",
        "alias" : "silver_listing",
        "join_condition" : "silver_booking.listing_id = silver_listing.listing_id",
    },
     {
        "table" : "Airbnb.silver.silver_host",
        "columns" : "silver_host.host_name, silver_host.host_since, silver_host.is_superhost, silver_host.response_rate, silver_host.response_rate as silver_response_rate, silver_host.response_quality, silver_host.created_at as host_created_at",
        "alias" : "silver_host",
        "join_condition" : "silver_listing.host_id = silver_host.host_id",
    }
]%}



select 
    {% for config in config %}
        {{ config.columns }}{% if not loop.last %}, {% endif %}
    {% endfor %}
from
    {% for config in config %}
    {% if loop.first %}
        {{config['table']}} as {{ config['alias'] }}
    {% else %}
        Left Join {{ config['table'] }} as {{ config['alias'] }}
        on {{ config['join_condition'] }}
    {% endif %}
    {%endfor %}