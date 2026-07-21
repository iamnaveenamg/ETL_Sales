create database RawDataLake

-- Replace 'YourStrongPassword123!' with a secure password of your choice
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'YourStrongPassword123!';

-- Ensure your Master Key is already created before running this
CREATE DATABASE SCOPED CREDENTIAL [WorkspaceManagedIdentityCred]
WITH IDENTITY = 'Managed Identity'; -- This literal string tells Synapse to use the System Identity

CREATE EXTERNAL DATA SOURCE ADLSGen2StorageWithMI
WITH (
    LOCATION = 'https://storagemgn.dfs.core.windows.net/staging/',
    CREDENTIAL = [WorkspaceManagedIdentityCred]
);

-- Create an external file format for DELIMITED (CSV/TSV) files.
-- Create an external file format for CSV files
CREATE EXTERNAL FILE FORMAT CSV_File_Format
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
	DATA_COMPRESSION ='org.apache.hadoop.io.compress.GzipCodec',
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',     -- Separates columns
        STRING_DELIMITER = '"',     -- Quotes around text values
        FIRST_ROW = 2,              -- Skips the header row (1 = no header)
        ENCODING = 'UTF8',          -- File character encoding
        USE_TYPE_DEFAULT = FALSE,    -- Determines how missing values are handled

    )
);

CREATE EXTERNAL FILE FORMAT ParquetFormat
WITH (
    FORMAT_TYPE = PARQUET,
	DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec' 
);

CREATE EXTERNAL DATA SOURCE ADLSGen2StorageTransformWithMI
WITH (
    LOCATION = 'https://storagemgn.dfs.core.windows.net/transform/',
    CREDENTIAL = [WorkspaceManagedIdentityCred]
);

