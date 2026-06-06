
  create or replace   view AIRBNB.dbt_schema.play1
  
  
  
  
  as (
    select * from AIRBNB.bronze.bronze_host
  );

