-----Total Number of Product
select Name, count(*)   as ProductCount
from SalesWH.DimProduct
group by Name

----- Total Number of Customer
Select count(CustomerID) as TotalCustomers
from SalesWH.DimCustomer

--- Total Color count
select color, count(*)  as ProductColor
from  SalesWH.DimProduct
group by color

---------
select 
count(*) as CountOfOrders,
sum(SubTotal) as SubTotal, 
sum(TaxAmt) as Tax_amount,
sum(Freight) as Total_Freight,
sum(TotalDue) as Total_Due
from SalesWH.FactSalesOrderHeader

---------
select DimProductSK, sum(LineTotal) as TotalSumEachProduct, sum(OrderQty) as TotalNumberOfOrdersOnEachProduct
from SalesWH.FactSalesOrderDetails
group by DimProductSK
order by 1



