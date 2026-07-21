CREATE USER testsynapsemgn FROM EXTERNAL PROVIDER;
SELECT name, type_desc FROM sys.database_principals WHERE type = 'R';

ALTER ROLE db_ddladmin ADD MEMBER testsynapsemgn;
ALTER ROLE db_datareader ADD MEMBER testsynapsemgn;
ALTER ROLE db_datawriter ADD MEMBER testsynapsemgn;

SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'
SELECT * FROM INFORMATION_SCHEMA.TABLES  WHERE TABLE_TYPE = 'BASE TABLE'
select * from INFORMATION_SCHEMA.COLUMNS where Table_schema<>'Dbo' and COLUMN_NAME='ModifiedDate'
select * from INFORMATION_SCHEMA.COLUMNS where table_name='ProductModel'
SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES  WHERE TABLE_SCHEMA='SalesLT' AND  TABLE_TYPE = 'BASE TABLE'


------------------
select *  from INFORMATION_SCHEMA.TABLES where table_type='BASE TABLE' and Table_schema='SalesLT'
select * from INFORMATION_SCHEMA.COLUMNS where table_name='Customers'

---Find the Column Names
select column_name, 
case when data_type ='int' then 'int ,'
when data_type ='bit' then 'bit ,'
when data_type='smallint' then 'smallint,'
when data_type='tinyint' then 'int,'
when data_type='decimal' then 'numeric(20,4),'
when data_type='uniqueidentifier' then 'uniqueidentifier ,'
when data_type='money' then 'numeric(20,4),'
when data_type='numeric' then 'numeric(20,4),'
when data_type='datetime' then 'datetime2 , '
else data_type+'('+cast(CHARACTER_MAXIMUM_LENGTH*2 as varchar(100))+')' +','
end as Data_type
from INFORMATION_SCHEMA.COLUMNS where table_name='ProductCategory'
 
--- Creation of Selection statement
with cte_ans as(
select column_name, 
table_name,
case when data_type ='int' then 'int ,'
when data_type ='bit' then 'bit ,'
when data_type='uniqueidentifier' then 'uniqueidentifier ,'
when data_type='datetime' then 'datetime2 , '
else data_type+'('+cast(CHARACTER_MAXIMUM_LENGTH*2 as varchar(100))+')' +','
end  as Data_type
from INFORMATION_SCHEMA.COLUMNS --where table_name='CustomerAddress'
)
select table_name,
'SELECT * 
FROM OPENROWSET(  BULK ' +''''+'SalesLT/'+Table_name+'.parquet'+''''+','+
'DATA_SOURCE = ''ADLSGen2StorageWithMI'',
FORMAT = ''PARQUET'' '+')'+
'WITH ( '+
column_name+ ' '+ Data_type +') as [r]'
from cte_ans
group by table_name

----------
---Find the Column Names
select column_name, 
case when data_type ='int' then 'int ,'
when data_type ='bit' then 'bit ,'
when data_type='smallint' then 'smallint,'
when data_type='tinyint' then 'int,'
when data_type='decimal' then 'numeric(20,4),'
when data_type='uniqueidentifier' then 'uniqueidentifier ,'
when data_type='money' then 'numeric(20,4),'
when data_type='numeric' then 'numeric(20,4),'
when data_type='datetime' then 'datetime2 , '
else data_type+'('+cast(CHARACTER_MAXIMUM_LENGTH*2 as varchar(100))+')' +','
end as Data_type
from INFORMATION_SCHEMA.COLUMNS where table_name='CDMCustomer'




