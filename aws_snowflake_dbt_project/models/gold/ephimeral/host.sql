{{
      config(
        materialized = 'ephemeral',
        )
}}

with host as(
    select
        host_id,
        host_name,
        host_since,
        is_superhost,
        RESPONSE_QUALITY,
        host_created_at
        from
            {{ ref('obt') }}    
)
select * from host