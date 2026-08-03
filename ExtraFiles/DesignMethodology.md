1. Cloud Data Engineering
Designed and implemented end-to-end ETL pipeline on Microsoft Azure Synapse Analytics for sales data processing
Configured Azure SQL Database as source system and Azure Data Lake Storage Gen2 for data staging and processing
Established secure connections using Linked Services and managed credentials for multi-environment deployments

2. Data Pipeline Architecture
Built a complete three-stage data pipeline:
Source-to-Staging: Extracted data from Azure SQL DB (SalesLT schema) to Parquet format on Data Lake
Transformation: Applied business logic using Azure Synapse Data Flows
Data Warehouse: Loaded transformed data into dimensional and fact tables following star schema design
Implemented dynamic metadata-driven pipelines using Lookup activities and ForEach loops to process multiple tables (batch count of 10 for parallel processing)

3. Data Warehouse Design
Implemented dimensional modeling with:
Dimension tables: DimCustomer, DimProduct
Fact tables: FactSalesOrderHeader, FactSalesOrderDetails
Designed data flows with proper type conversions and data truncation handling for accurate dimensional reporting

4. Data Integration & Transformation
Created 5 production pipelines:
Source_Pipeline_Staging: Automated data extraction from multiple tables
Staging_Pipeline_Transform: Data cleansing and validation
DimPipelines: Dimension table population
FactPipeline: Fact table loading with multi-step dependencies
Final_Stage_Pipeline: Data validation and quality checks
Managed 8 linked services connecting to Azure SQL Database, Data Lake, and Synapse workspace defaults

5. Advanced ETL Techniques
Implemented dependency management between pipeline activities (sequential execution of Dim tables before Fact tables)
Applied parameterized datasets for table and schema names, enabling reusability across multiple data sources
Configured compute optimization with General compute type and 8-core allocation for data flows
Handled parallel batch processing with customizable batch counts for performance tuning

6. Data Format & Storage Strategy
Converted source data to Parquet format for optimized compression and query performance
Managed multiple dataset configurations for:
Raw staging data
CDM (Common Data Model) views
Parquet intermediate formats
Final warehouse tables
Implemented hierarchical storage with separate containers for raw, staging, and processed data

7. Documentation & DevOps
Maintained infrastructure-as-code approach using JSON-based pipeline definitions for version control
Created architectural diagrams documenting the complete data flow and integration points
Implemented Git-based collaboration using publish configurations for Azure Synapse workspaces

8. SQL & Data Access
Wrote dynamic SQL queries with INFORMATION_SCHEMA metadata extraction for automated table discovery
Configured parameterized SQL queries with isolation levels and query timeouts for reliable data extraction
Managed schema-qualified table references (SalesLT schema) ensuring data consistency
