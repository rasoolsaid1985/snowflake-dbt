{% set config = [
    {
        "table" : "Airbnb.gold.obt",
        "columns" : "gold_obt.booking_id, gold_obt.listing_id, gold_obt.host_id, gold_obt.total_price, gold_obt.service_fee, gold_obt.cleaning_fee, gold_obt.accommodates, gold_obt.bathrooms, gold_obt.response_rate",
        "alias" : "gold_obt"
    },
    {
        "table" : "Airbnb.silver.silver_listing",
        "columns" : "",
        "alias" : "dim_listing",
        "join_condition" : "gold_obt.listing_id = dim_listing.listing_id",
    },
     {
        "table" : "Airbnb.silver.silver_host",
        "columns" : "",
        "alias" : "dim_host",
        "join_condition" : "gold_obt.host_id = dim_host.host_id",
    }
]%}



select
    {{ config[0]['columns'] }},
from
    {% for config in config %}
    {% if loop.first %}
        {{config['table']}} as {{ config['alias'] }}
    {% else %}
        Left Join {{ config['table'] }} as {{ config['alias'] }}
        on {{ config['join_condition'] }}
    {% endif %}
    {%endfor %}