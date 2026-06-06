Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

Project summary
This project implements a Snowflake + dbt analytics pipeline for Airbnb-style data with a standard layered architecture:

source layer:

AIRBNB.staging.bookings
AIRBNB.staging.listings
AIRBNB.staging.hosts
bronze layer:

bronze_booking — incremental ingestion of raw booking data
bronze_listing — incremental ingestion of raw listing data
bronze_host — incremental ingestion of raw host data
silver layer:

silver_booking — adds total_price using the multiply macro
silver_listing — casts/cleans listing fields, preserves listing metadata
silver_host — normalizes host names and derives response_quality
gold layer:

obt — joins silver booking, listing, and host datasets into one enriched analytics model
macros:

multiply.sql
tag.sql
tests:

tests/source_test.sql validates source booking data conditions
snapshot:

snapshots/dim_booking.yml defines a booking history snapshot
Data flow
Raw data comes from Snowflake staging tables.
Bronze models ingest raw records incrementally.
Silver models clean and enrich those bronze tables.
Gold model joins all silver outputs for analytics-ready booking insights.
Tests and snapshots add quality checks and historical tracking.
README created
Updated/created README.md at the repository root with full project overview, flow, key files, and run instructions.


LinkedIn post
🚀 Completed a dbt + Snowflake analytics pipeline for Airbnb-style data!
Built a layered ELT workflow with bronze, silver, and gold dbt models. The project ingests raw bookings, listings, and hosts from Snowflake staging, transforms data with reusable macros, and produces an analytics-ready gold model that joins booking, listing, and host dimensions.

Key highlights:

Incremental bronze ingestion for performance
Silver-level cleaning and enrichment
Gold-level joined dataset for business reporting
Reusable dbt macros for calculations and tagging
Source-level data quality checks
This project shows practical dbt modeling, Snowflake integration, and a strong data engineering workflow for building trusted analytics pipelines.

LLM prompt
Use this prompt when asking another LLM about the project:

I have a dbt project with Snowflake data that uses a bronze/silver/gold modeling pattern. The repository includes:

source definitions in sources.yml
bronze models in bronze
silver models in silver
a gold join model in obt.sql
macros in macros
a snapshot in dim_booking.yml
a sample test in source_test.sql
Explain the ETL/data flow, identify model dependencies, and answer questions such as:

What does each layer do?
How does the data move from raw staging to gold?
How can I extend or fix this dbt project?
What are the main tables and transformation rules?
Provide a concise model summary, recommended next steps, and any likely issues to watch for in a Snowflake + dbt setup.
