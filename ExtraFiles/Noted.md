Project Name: Azure End-to-End Sales Analytics Pipeline

Key Technologies:
- Azure Data Factory (Data Orchestration)
- Azure Data Lake Storage Gen2 (Bronze/Silver/Gold Architecture)
- Azure Databricks (PySpark ETL)
- Azure Synapse Analytics (Data Warehousing)
- Microsoft Power BI (BI & Reporting)
- Azure Key Vault (Security)
- Microsoft Entra ID (Access Management)

Key Accomplishments:
✓ Designed & implemented complete ETL pipeline for on-premise to cloud data migration
✓ Built automated data transformation using Bronze-Silver-Gold architecture
✓ Created interactive sales dashboards with Power BI DirectQuery
✓ Implemented scheduled triggers for daily automated data refresh
✓ Applied data security best practices using Azure Key Vault

1. Enterprise ETL Pipeline
* Designed 4-stage data pipeline on Azure Synapse Analytics with sequential orchestration, automating data flow from Azure SQL Database to cloud data warehouse using ExecutePipeline activities.
* Built dimensional data warehouse with dimension tables (DimCustomer, DimProduct) and fact tables (FactSalesOrderHeader, FactSalesOrderDetails) following star schema design principles.
* Developed dynamic ETL pipelines using INFORMATION_SCHEMA metadata extraction and parameterized datasets for automatic multi-table processing with ForEach loops and batch optimization.
* Configured Azure Linked Services, Data Lake Storage Gen2, optimized compute resources with 8-core instances, and implemented Parquet format conversion for data compression and query performance.
* Sales Revenue Analytics — Validated $956K+ in order transactions (32 orders) with product sales ranging $27-$37K per SKU; aggregated financial metrics (SubTotal, Tax, Freight) for audit compliance and revenue reporting
* Product & Customer Analytics — Analyzed product portfolio distribution, customer base metrics, and SKU-level revenue performance to support inventory optimization and sales forecasting
* Data Warehouse Validation — Built ETL quality checks on dimensional and fact tables ensuring 100% data integrity for enterprise sales reporting and financial reconciliation

$956K Total Revenue | 32 Orders | $27-$37K Product Range
Product inventory by name/color, customer count, order fulfillment tracking
Multi-table aggregations (GROUP BY, SUM, COUNT) across DimProduct, DimCustomer, FactSalesOrderHeader, FactSalesOrderDetails
