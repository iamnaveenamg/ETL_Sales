--- Dim1 DimCustomer
create or alter view SalesLT.CDMCustomer as
select C.CustomerID ,NameStyle ,Title ,FirstName ,MiddleName ,LastName ,Suffix ,CompanyName ,SalesPerson ,CA.AddressType, AddressLine1, AddressLine2 ,City ,StateProvince ,CountryRegion ,PostalCode
EmailAddress ,Phone ,PasswordHash ,PasswordSalt ,C.rowguid ,C.ModifiedDate  
from SalesLT.Customer as C
LEFT JOIN  SalesLT.CustomerAddress as CA on C.CustomerID=CA.CustomerID
LEFT JOIN  SalesLT.Address as A ON A.AddressID=CA.AddressID

---Dim2 DimProduct
create or alter view SalesLT.CDMProduct as
select ProductID ,p.Name ,ProductNumber ,Color ,StandardCost ,ListPrice ,Size , PC.Name as ProductCategoryName,
PM.Name as ProductModelName,  CatalogDescription,Culture, Description,
Weight ,SellStartDate ,SellEndDate ,DiscontinuedDate ,ThumbNailPhoto ,ThumbnailPhotoFileName ,p.rowguid ,p.ModifiedDate 
from SalesLT.Product as P
LEFT JOIN SalesLT.ProductCategory as PC ON P.ProductCategoryID=PC.ProductCategoryID
LEFT JOIN SalesLT.ProductModel as PM ON  P.ProductModelID=PM.ProductModelID
Left JOIN SalesLT.ProductModelProductDescription AS PMPD ON PM.ProductModelID=PMPD.ProductModelID
LEFT JOIN SalesLT.ProductDescription as PD ON PMPD.ProductDescriptionID=PD.ProductDescriptionID

--- FACT1 SalesOrderHeader
create or alter view SalesLT.CDMSalesOrderHeader as
select SalesOrderID ,RevisionNumber ,OrderDate ,DueDate ,ShipDate ,
Status ,OnlineOrderFlag ,SalesOrderNumber ,PurchaseOrderNumber ,AccountNumber ,SOH.CustomerID ,ShipToAddressID ,
BillToAddressID ,ShipMethod ,CreditCardApprovalCode ,SubTotal ,TaxAmt ,Freight ,TotalDue ,Comment ,SOH.rowguid ,SOH.ModifiedDate
from SalesLT.SalesOrderHeader as SOH
LEFT JOIN  SalesLT.Customer as C  ON SOH.CustomerID=C.CustomerID
LEFT JOIN SalesLT.Address as A ON SOH.ShipToAddressID=A.AddressID and SOH.BillToAddressID=A.AddressId

--- FACT2 SalesOrderDetail
create or alter view SalesLT.CDMSalesOrderDetails as
select SOD.SalesOrderID ,SalesOrderDetailID ,OrderQty ,SOD.ProductID ,UnitPrice ,UnitPriceDiscount ,LineTotal ,SOD.rowguid ,SOD.ModifiedDate 
from SalesLT.SalesOrderDetail as SOD
LEFT JOIN SalesLT.Product as P On SOD.ProductID=P.ProductID
LEft JOIN SalesLT.SalesOrderHeader as SOH ON SOH.SalesOrderID=SOD.SalesOrderID

----- NOT Required Items
select top 100 * from SalesLT.CustomerAddress----- Not Required

---Dim3
create or alter view SalesLT.CDMAddress as
select AddressID ,AddressLine1, AddressLine2 ,City ,StateProvince ,CountryRegion ,PostalCode ,rowguid ,ModifiedDate 
from SalesLT.Address 

---Dim2
create or alter view SalesLT.CDMProductModel as
select PM.ProductModelID, Name, CatalogDescription,Culture, Description, PM.rowguid, PM.ModifiedDate
FROM
SalesLT.ProductModel as PM
Left JOIN SalesLT.ProductModelProductDescription AS PMPD ON PM.ProductModelID=PMPD.ProductModelID
LEFT JOIN SalesLT.ProductDescription as PD ON PMPD.ProductDescriptionID=PD.ProductDescriptionID


