-- Restoring databases
--
-- pubs
RESTORE DATABASE [Pubs] FROM  DISK = N'/var/opt/mssql/backup/Pubs.bak' WITH  
FILE = 1,  MOVE N'pubs' TO N'/var/opt/mssql/data/Pubs.mdf',  
MOVE N'pubs_log' TO N'/var/opt/mssql/data/Pubs_log.ldf',  
NOUNLOAD,  STATS = 5;

-- Northwind
RESTORE DATABASE [Northwind] FROM  DISK = N'/var/opt/mssql/backup/Northwind.bak' WITH  
FILE = 1,  MOVE N'Northwind' TO N'/var/opt/mssql/data/Northwind.mdf',  
MOVE N'Northwind_log' TO N'/var/opt/mssql/data/Northwind_log.ldf',  
NOUNLOAD,  STATS = 5;

-- AdventureWorks databases
RESTORE DATABASE [AdventureWorks2017] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2017.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2017' TO N'/var/opt/mssql/data/AdventureWorks2017.mdf',  
MOVE N'AdventureWorks2017_log' TO N'/var/opt/mssql/data/AdventureWorks2017_log.ldf',  
NOUNLOAD,  STATS = 5;

RESTORE DATABASE [AdventureWorks2016] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2016.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2016_Data' TO N'/var/opt/mssql/data/AdventureWorks2016_Data.mdf',  
MOVE N'AdventureWorks2016_Log' TO N'/var/opt/mssql/data/AdventureWorks2016_Log.ldf',  
NOUNLOAD,  STATS = 5

RESTORE DATABASE [AdventureWorks2014] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2014.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2014_Data' TO N'/var/opt/mssql/data/AdventureWorks2014_Data.mdf',  
MOVE N'AdventureWorks2014_Log' TO N'/var/opt/mssql/data/AdventureWorks2014_Log.ldf',  
NOUNLOAD,  STATS = 5;

RESTORE DATABASE [AdventureWorks2012] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2012.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2012' TO N'/var/opt/mssql/data/AdventureWorks2012.mdf',  
MOVE N'AdventureWorks2012_log' TO N'/var/opt/mssql/data/AdventureWorks2012_log.ldf',  
NOUNLOAD,  STATS = 5

RESTORE DATABASE [AdventureWorksDW2017] FROM  
DISK = N'/var/opt/mssql/backup/AdventureWorksDW2017.bak' WITH  
FILE = 1,  MOVE N'AdventureWorksDW2017' TO N'/var/opt/mssql/data/AdventureWorksDW2017.mdf',  
MOVE N'AdventureWorksDW2017_log' TO N'/var/opt/mssql/data/AdventureWorksDW2017_log.ldf',  
NOUNLOAD,  STATS = 5;

-- WideWorldImportersDW
RESTORE DATABASE [WideWorldImportersDW] 
FROM  DISK = N'/var/opt/mssql/backup/WideWorldImportersDW-Full.bak' WITH  
	FILE = 1,  MOVE N'WWI_Primary' TO N'/var/opt/mssql/data/WideWorldImportersDW.mdf',  
	MOVE N'WWI_UserData' TO N'/var/opt/mssql/data/WideWorldImportersDW_UserData.ndf',  
	MOVE N'WWI_Log' TO N'/var/opt/mssql/data/WideWorldImportersDW.ldf',  
	MOVE N'WWIDW_InMemory_Data_1' TO N'/var/opt/mssql/data/WideWorldImportersDW_InMemory_Data_1',  
	NOUNLOAD,  STATS = 5;

RESTORE DATABASE [WideWorldImporters] 
FROM  DISK = N'/var/opt/mssql/backup/WideWorldImporters-Full.bak' WITH  
FILE = 1,  MOVE N'WWI_Primary' TO N'/var/opt/mssql/data/WideWorldImporters.mdf',  
MOVE N'WWI_UserData' TO N'/var/opt/mssql/data/WideWorldImporters_UserData.ndf',  
MOVE N'WWI_Log' TO N'/var/opt/mssql/data/WideWorldImporters.ldf',  
MOVE N'WWI_InMemory_Data_1' TO N'/var/opt/mssql/data/WideWorldImporters_InMemory_Data_1',  
NOUNLOAD,  STATS = 5;
