{{
  config(
    materialized = 'table',
    unique_key = 'listing_id'
    )
}}

select
    listing_id,
    host_id,
    property_type,
    room_type,
    city,
    country,
    accommodates,
    bathrooms,
    {{tag('Cast(price_per_night as int)')}} as price_per_night,
    created_at
from {{ ref('bronze_listing') }}