# News-Data-Analysis-with-Event-Driven-Incremental-Load-in-Snowflake
News Data Analysis with Event-Driven Incremental Load in Snowflake


## Project Overview

This project focuses on the event-driven incremental load of news data into a Snowflake table. The data is sourced from the News API, stored in Google Cloud Storage, and loaded into Snowflake using an Airflow DAG.

### Tech Stack
- **Airflow**: Orchestrates the data pipeline.
- **Google Cloud Storage (GCS)**: Stores raw news data in Parquet format.
- **Python**: Extracts news data from the News API and writes to GCS.
- **Snowflake**: Stores and analyzes the data loaded from GCS.

### Workflow

1. **News API Setup**: 
   - Sign up for an account on [newsapi.org](https://newsapi.org/) to obtain an API key.
   
2. **Python Script**: 
   - Extract data from the News API endpoint.
   - Write the extracted data to a new file in the Google Cloud Storage bucket.

3. **Snowflake Integration**: 
   - Create a storage integration and external stage in Snowflake to securely connect to GCS.
   
4. **Airflow DAG**:
   - Extracts news data from the News API.
   - Writes the data to a new file in GCS.
   - Loads the data from the external stage in GCS to a target table in Snowflake.

## Prerequisites

### Tools & Libraries:
- **Airflow** (with Google Cloud provider package)
- **Snowflake Python Connector**
- **Google Cloud SDK** (for managing GCS)
- **newsapi-python** library (for API integration)

### Cloud Setup:
- **Google Cloud Storage Bucket**: Set up a bucket for storing news data files.
- **Snowflake**: Create a database, external stage, and storage integration to load data from GCS.

## Setup Guide

### 1. News API Setup
- Sign up at [newsapi.org](https://newsapi.org/).
- Get your API key.

### 2. Python Code
- Install dependencies:
  ```bash
  pip install newsapi-python google-cloud-storage snowflake-connector-python
