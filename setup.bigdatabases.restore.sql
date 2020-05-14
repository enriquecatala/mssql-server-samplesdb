-- Restoring databases
-- Enrique Catalá: 
--     Since there is a bug with WSL2 on Windows10, we can´t restore databases directly and first require a deploy of empty data, thats the reason for the CREATE DATABASE commands
-- AdventureworksDW2017
--

-- DROP DATABASE IF EXISTS [AdventureWorksDW2017];
-- CREATE DATABASE [AdventureWorksDW2017] ON PRIMARY
--        (NAME = N'AdventureWorksDW2017' , FILENAME= N'/var/opt/mssql/data/AdventureWorksDW2017.mdf'  )
--        LOG ON (NAME= N'AdventureWorksDW2017_log', FILENAME= N'/var/opt/mssql/data/AdventureWorksDW2017_log.ldf');
RESTORE DATABASE [AdventureWorksDW2017] FROM  
DISK = N'/var/opt/mssql/backup/AdventureWorksDW2017.bak' WITH  
FILE = 1,  MOVE N'AdventureWorksDW2017' TO N'/var/opt/mssql/data/AdventureWorksDW2017.mdf',  
MOVE N'AdventureWorksDW2017_log' TO N'/var/opt/mssql/data/AdventureWorksDW2017_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2;

-- WideWorldImportersDW
--
-- DROP DATABASE IF EXISTS [WideWorldImportersDW];
-- CREATE DATABASE [WideWorldImportersDW]
-- ON PRIMARY
--        (NAME = N'WWI_Primary', FILENAME = N'/var/opt/mssql/data/WideWorldImportersDW.mdf'),
--        (NAME = N'WWI_UserData',FILENAME = N'/var/opt/mssql/data/WideWorldImportersDW_UserData.ndf'),
-- 	   (NAME = N'WWIDW_InMemory_Data_1',FILENAME = N'/var/opt/mssql/data/WideWorldImportersDW_InMemory_Data_1')	   
-- 	   LOG ON (NAME = N'WWI_Log',FILENAME = N'/var/opt/mssql/data/WideWorldImportersDW.ldf');
-- GO
RESTORE DATABASE [WideWorldImportersDW] 
FROM  DISK = N'/var/opt/mssql/backup/WideWorldImportersDW-Full.bak' WITH  
	FILE = 1,  MOVE N'WWI_Primary' TO N'/var/opt/mssql/data/WideWorldImportersDW.mdf',  
	MOVE N'WWI_UserData' TO N'/var/opt/mssql/data/WideWorldImportersDW_UserData.ndf',  
	MOVE N'WWI_Log' TO N'/var/opt/mssql/data/WideWorldImportersDW.ldf',  
	MOVE N'WWIDW_InMemory_Data_1' TO N'/var/opt/mssql/data/WideWorldImportersDW_InMemory_Data_1',  
	REPLACE, NOUNLOAD,  STATS = 2;

-- StackOverflow2010
--
CREATE DATABASE [StackOverflow2010] ON 
( FILENAME = N'/var/opt/mssql/data/StackOverflow2010.mdf' ),
( FILENAME = N'/var/opt/mssql/data/StackOverflow2010_log.ldf' )
 FOR ATTACH
GO