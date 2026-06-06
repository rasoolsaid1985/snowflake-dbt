


select * from AIRBNB.staging.listings

where created_at > (select coalesce(max(created_at), '1970-01-01') from AIRBNB.bronze.bronze_listing)
