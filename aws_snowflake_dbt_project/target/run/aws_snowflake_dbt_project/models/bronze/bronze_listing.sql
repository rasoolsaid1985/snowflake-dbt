-- back compat for old kwarg name
  
  begin;
    

        insert into AIRBNB.bronze.bronze_listing ("LISTING_ID", "HOST_ID", "PROPERTY_TYPE", "ROOM_TYPE", "CITY", "COUNTRY", "ACCOMMODATES", "BEDROOMS", "BATHROOMS", "PRICE_PER_NIGHT", "CREATED_AT")
        (
            select "LISTING_ID", "HOST_ID", "PROPERTY_TYPE", "ROOM_TYPE", "CITY", "COUNTRY", "ACCOMMODATES", "BEDROOMS", "BATHROOMS", "PRICE_PER_NIGHT", "CREATED_AT"
            from AIRBNB.bronze.bronze_listing__dbt_tmp
        );
    commit;