---create schema SalesLT

-- ProductModel
--select top 100 * from  SalesLT.ProductModel 

create or alter view SalesLT.ProductModel as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/ProductModel/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
    ProductModelID varchar(1000),
    [Name] nvarchar(250) COLLATE Latin1_General_100_BIN2_UTF8,
    CatalogDescription varchar(8000) COLLATE Latin1_General_100_BIN2_UTF8,
    rowguid uniqueidentifier,
    ModifiedDate datetime2
) AS [r];
--where CatalogDescription is not null

---- Customer
create or alter view SalesLT.Customer as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/Customer/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
CustomerID	int ,
NameStyle	bit ,
Title	nvarchar(16),
FirstName	nvarchar(100),
MiddleName	nvarchar(100),
LastName	nvarchar(100),
Suffix	nvarchar(20),
CompanyName	nvarchar(256),
SalesPerson	nvarchar(512),
EmailAddress	nvarchar(100),
Phone	nvarchar(50),
PasswordHash	varchar(256),
PasswordSalt	varchar(20),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2 
) AS [r]


----- Address 
create or alter view SalesLT.Address as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/Address/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
AddressID	int ,
AddressLine1	nvarchar(120),
AddressLine2	nvarchar(120),
City	nvarchar(60),
StateProvince	nvarchar(100),
CountryRegion	nvarchar(100),
PostalCode	nvarchar(30),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2  
) AS [r]

----- CustomerAddress
create or alter view SalesLT.CustomerAddress as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/CustomerAddress/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
CustomerID	int ,
AddressID	int ,
AddressType	nvarchar(100),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2 
) AS [r]


--- SalesOrderDetail
create or alter view SalesLT.SalesOrderDetail as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/SalesOrderDetail/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
SalesOrderID	int ,
SalesOrderDetailID	int ,
OrderQty	smallint,
ProductID	int ,
UnitPrice	numeric(20,4),
UnitPriceDiscount	numeric(20,4),
LineTotal	numeric(20,4),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2 
) AS [r]


--- SalesOrderHeader
create or alter view SalesLT.SalesOrderHeader as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/SalesOrderHeader/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
SalesOrderID	int ,
RevisionNumber	int,
OrderDate	datetime2 , 
DueDate	datetime2 , 
ShipDate	datetime2 , 
Status	int,
OnlineOrderFlag	bit ,
SalesOrderNumber	nvarchar(50),
PurchaseOrderNumber	nvarchar(50),
AccountNumber	nvarchar(30),
CustomerID	int ,
ShipToAddressID	int ,
BillToAddressID	int ,
ShipMethod	nvarchar(100),
CreditCardApprovalCode	varchar(30),
SubTotal	numeric(20,4),
TaxAmt	numeric(20,4),
Freight	numeric(20,4),
TotalDue	numeric(20,4),
Comment	nvarchar(2000),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2 
) AS [r]


---- ProductDescription
create or alter view SalesLT.ProductDescription as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/ProductDescription/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
ProductDescriptionID	int ,
Description	nvarchar(800),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2 
) AS [r]

---Product
create or alter view SalesLT.Product as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/Product/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
ProductID	int ,
Name	nvarchar(100),
ProductNumber	nvarchar(50),
Color	nvarchar(30),
StandardCost	numeric(20,4),
ListPrice	numeric(20,4),
Size	nvarchar(10),
Weight	numeric(20,4),
ProductCategoryID	int ,
ProductModelID	int ,
SellStartDate	datetime2 , 
SellEndDate	datetime2 , 
DiscontinuedDate	datetime2 , 
ThumbNailPhoto	varbinary(8000),
ThumbnailPhotoFileName	nvarchar(100),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2 
) AS [r]


--- ProductModelProductDescription
create or alter view SalesLT.ProductModelProductDescription as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/ProductModelProductDescription/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
ProductModelID	int ,
ProductDescriptionID	int ,
Culture	nchar(12),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2 
) AS [r]

--- ProductCategory
create or alter view SalesLT.ProductCategory as
SELECT * 
FROM OPENROWSET(
    BULK 'SalesLT/ProductCategory/*',
    DATA_SOURCE = 'ADLSGen2StorageTransformWithMI',
    FORMAT = 'PARQUET'
) 
WITH (
ProductCategoryID	int ,
ParentProductCategoryID	int ,
Name	nvarchar(100),
rowguid	uniqueidentifier ,
ModifiedDate	datetime2 
) AS [r]


select 'select top 10 * from SalesLT.'+Table_name  from information_schema.tables
select top 10 * from SalesLT.ProductModel
select top 10 * from SalesLT.Customer
select top 10 * from SalesLT.Address
select top 10 * from SalesLT.CustomerAddress
select top 10 * from SalesLT.SalesOrderDetail
select top 10 * from SalesLT.SalesOrderHeader
select top 10 * from SalesLT.ProductDescription
select top 10 * from SalesLT.Product
select top 10 * from SalesLT.ProductModelProductDescription
select top 10 * from SalesLT.ProductCategory
