-- Create a new database named 'news_api'
create database news_api;

-- Use the 'news_api' database for subsequent operations
use news_api;

-- Create a file format for Parquet files to be used in the stage or table loading
CREATE FILE FORMAT parquet_format TYPE=parquet;

-- Create or replace a storage integration to securely connect Snowflake to Google Cloud Storage (GCS)
CREATE OR REPLACE STORAGE INTEGRATION news_data_gcs_integration
TYPE = EXTERNAL_STAGE 
STORAGE_PROVIDER = GCS 
ENABLED = TRUE 
STORAGE_ALLOWED_LOCATIONS = ('gcs://snowflake_gcp_projects/news_data_analysis/parquet_files/');
-- The integration ensures that Snowflake has secure access to the specific GCS location.
-- Replace 'snowflake_gcp_projects' with the correct GCS bucket if it's different.

-- Describe the newly created storage integration to inspect the details
DESC INTEGRATION news_data_gcs_integration;

-- Create or replace a Snowflake stage to reference the GCS bucket where the raw data is stored
CREATE OR REPLACE STAGE gcs_raw_data_stage
URL = 'gcs://snowflake_gcp_projects/news_data_analysis/parquet_files/'
STORAGE_INTEGRATION = news_data_gcs_integration
FILE_FORMAT = (TYPE = 'PARQUET');
-- The stage allows you to access and load files from GCS into Snowflake easily.
-- The file format is set to 'PARQUET', so only Parquet files will be processed.

-- Show all stages currently available in the 'news_api' database
show stages;

-- Sample query to count records in a table named 'news_api_data' (ensure this table exists)
select count(*) from news_api_data;
-- This counts the total rows in 'news_api_data', which should be replaced with the actual table name if different.
