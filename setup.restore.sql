-- Restoring databases
--
RESTORE DATABASE [Pubs] FROM  DISK = N'/var/opt/mssql/backup/Pubs.bak' WITH  
FILE = 1,  MOVE N'pubs' TO N'/var/opt/mssql/data/Pubs.mdf',  
MOVE N'pubs_log' TO N'/var/opt/mssql/data/Pubs_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 5;

-- Northwind
--
RESTORE DATABASE [Northwind] FROM  DISK = N'/var/opt/mssql/backup/Northwind.bak' WITH  
FILE = 1,  MOVE N'Northwind' TO N'/var/opt/mssql/data/Northwind.mdf',  
MOVE N'Northwind_log' TO N'/var/opt/mssql/data/Northwind_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 5;

-- AdventureWorks databases
--
RESTORE DATABASE [AdventureWorks2017] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2017.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2017' TO N'/var/opt/mssql/data/AdventureWorks2017.mdf',  
MOVE N'AdventureWorks2017_log' TO N'/var/opt/mssql/data/AdventureWorks2017_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2;

--
RESTORE DATABASE [WideWorldImporters] 
FROM  DISK = N'/var/opt/mssql/backup/WideWorldImporters-Full.bak' WITH  
FILE = 1,  MOVE N'WWI_Primary' TO N'/var/opt/mssql/data/WideWorldImporters.mdf',  
MOVE N'WWI_UserData' TO N'/var/opt/mssql/data/WideWorldImporters_UserData.ndf',  
MOVE N'WWI_Log' TO N'/var/opt/mssql/data/WideWorldImporters.ldf',  
MOVE N'WWI_InMemory_Data_1' TO N'/var/opt/mssql/data/WideWorldImporters_InMemory_Data_1',  
REPLACE, NOUNLOAD,  STATS = 2;

