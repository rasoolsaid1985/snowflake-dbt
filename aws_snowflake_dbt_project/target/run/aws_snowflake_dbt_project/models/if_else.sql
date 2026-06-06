
  create or replace   view AIRBNB.dbt_schema.if_else
  
  
  
  
  as (
    

select * from AIRBNB.bronze.bronze_booking

    where NIGHTS_BOOKED <= 2

  );

