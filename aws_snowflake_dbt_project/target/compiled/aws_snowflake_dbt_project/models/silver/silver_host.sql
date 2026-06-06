


select
    host_id,
    replace(host_name, ' ', '_') as host_name,
    host_since,
    is_superhost as is_superhost,
    response_rate as response_rate,
    case when response_rate > 95 then 'Excellent'
         when response_rate > 80 then 'Good'
         when response_rate > 60 then 'Average'
         else 'Needs Improvement' end as response_quality,
    created_at
    from AIRBNB.bronze.bronze_host