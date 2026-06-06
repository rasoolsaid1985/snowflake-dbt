# Airbnb dbt + Snowflake Project

## Project Overview
This repository contains a dbt analytics project built on Snowflake for an Airbnb-style dataset. The project implements a layered data modeling architecture with:
- `bronze` raw ingestion tables
- `silver` cleaned and enriched tables
- `gold` business-ready analytics outputs

## What the project does
- Reads raw staging data from Snowflake source tables:
  - `AIRBNB.staging.bookings`
  - `AIRBNB.staging.listings`
  - `AIRBNB.staging.hosts`
- Builds `bronze` models that ingest source data incrementally.
- Builds `silver` models that clean, cast, and enrich bronze data.
- Builds a `gold` model that joins booking, listing, and host data into a single enriched dataset.
- Includes reusable Jinja macros for calculations and classifications.
- Defines a snapshot configuration for booking history tracking.
- Includes a sample dbt test against the staging bookings source.

## Data flow
1. `source('staging', 'bookings')`, `source('staging', 'listings')`, and `source('staging', 'hosts')`
   provide raw input data.
2. `bronze` models ingest that raw data into Snowflake tables with incremental loads.
3. `silver` models transform and clean bronze outputs:
   - `silver_booking`: calculates `total_price` using the `multiply` macro.
   - `silver_listing`: casts `price_per_night` and retains listing metadata.
   - `silver_host`: standardizes host names and derives response quality.
4. `gold` model `obt` joins the silver tables to create enriched booking analytics data.
5. A snapshot definition exists for `dim_booking` to track booking history over time.

## Key files
- `aws_snowflake_dbt_project/dbt_project.yml` — dbt project configuration and schema/materialization defaults.
- `aws_snowflake_dbt_project/models/bronze/bronze_booking.sql`
- `aws_snowflake_dbt_project/models/bronze/bronze_listing.sql`
- `aws_snowflake_dbt_project/models/bronze/bronze_host.sql`
- `aws_snowflake_dbt_project/models/silver/silver_booking.sql`
- `aws_snowflake_dbt_project/models/silver/silver_listing.sql`
- `aws_snowflake_dbt_project/models/silver/silver_host.sql`
- `aws_snowflake_dbt_project/models/gold/obt.sql`
- `aws_snowflake_dbt_project/macros/multiply.sql`
- `aws_snowflake_dbt_project/macros/tag.sql`
- `aws_snowflake_dbt_project/models/sources/sources.yml`
- `aws_snowflake_dbt_project/tests/source_test.sql`
- `aws_snowflake_dbt_project/snapshots/dim_booking.yml`

## How to run
```powershell
cd "E:\Data Engineer\AWS_DBT_Snowflake\aws_snowflake_dbt_project"
dbt deps
dbt run
dbt test
dbt snapshot
```

## Notes
- `bronze` and `silver` models are configured as tables.
- `gold` output is built as a table for analytics consumption.
- A snapshot config exists, but snapshots require a persistent source relation.
- This repo also includes a sample source-level test that warns on low booking amounts.
