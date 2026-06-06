
  create or replace   view AIRBNB.dbt_schema.loops
  
  
  
  
  as (
    

select

    NIGHTS_BOOKED
    ,

    BOOKING_ID
    ,

    BOOKING_AMOUNT
    

from AIRBNB.bronze.bronze_booking
  );

