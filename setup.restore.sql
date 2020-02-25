-- Restoring databases
-- Enrique Catalá: 
--     Since there is a bug with WSL2 on Windows10, we can´t restore databases directly and first require a deploy of empty data, thats the reason for the CREATE DATABASE commands
-- pubs
DROP DATABASE IF EXISTS [Pubs];
CREATE DATABASE [Pubs] ON PRIMARY
       (NAME = N'pubs' , FILENAME= N'/local_mountpoint/Pubs.mdf'  )
       LOG ON (NAME= N'pubs_log', FILENAME= N'/local_mountpoint/Pubs_log.ldf');

RESTORE DATABASE [Pubs] FROM  DISK = N'/var/opt/mssql/backup/Pubs.bak' WITH  
FILE = 1,  MOVE N'pubs' TO N'/local_mountpoint/Pubs.mdf',  
MOVE N'pubs_log' TO N'/local_mountpoint/Pubs_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 5;

-- Northwind
DROP DATABASE IF EXISTS [Northwind];
CREATE DATABASE [Northwind] ON PRIMARY
       (NAME = N'Northwind' , FILENAME= N'/local_mountpoint/Northwind.mdf'  )
       LOG ON (NAME= N'Northwind_log', FILENAME= N'/local_mountpoint/Northwind_log.ldf');

RESTORE DATABASE [Northwind] FROM  DISK = N'/var/opt/mssql/backup/Northwind.bak' WITH  
FILE = 1,  MOVE N'Northwind' TO N'/local_mountpoint/Northwind.mdf',  
MOVE N'Northwind_log' TO N'/local_mountpoint/Northwind_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 5;

-- AdventureWorks databases
DROP DATABASE IF EXISTS [AdventureWorks2017];
CREATE DATABASE [AdventureWorks2017] ON PRIMARY
       (NAME = N'AdventureWorks2017' , FILENAME= N'/local_mountpoint/AdventureWorks2017.mdf'  )
       LOG ON (NAME= N'AdventureWorks2017_log', FILENAME= N'/local_mountpoint/AdventureWorks2017_log.ldf');

RESTORE DATABASE [AdventureWorks2017] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2017.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2017' TO N'/local_mountpoint/AdventureWorks2017.mdf',  
MOVE N'AdventureWorks2017_log' TO N'/local_mountpoint/AdventureWorks2017_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2;


DROP DATABASE IF EXISTS [AdventureWorks2016];
CREATE DATABASE [AdventureWorks2016] ON PRIMARY
       (NAME = N'AdventureWorks2016' , FILENAME= N'/local_mountpoint/AdventureWorks2016.mdf'  )
       LOG ON (NAME= N'AdventureWorks2016_log', FILENAME= N'/local_mountpoint/AdventureWorks2016_log.ldf');

RESTORE DATABASE [AdventureWorks2016] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2016.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2016_Data' TO N'/local_mountpoint/AdventureWorks2016_Data.mdf',  
MOVE N'AdventureWorks2016_Log' TO N'/local_mountpoint/AdventureWorks2016_Log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2

DROP DATABASE IF EXISTS [AdventureWorks2014];
CREATE DATABASE [AdventureWorks2014] ON PRIMARY
       (NAME = N'AdventureWorks2014' , FILENAME= N'/local_mountpoint/AdventureWorks2014.mdf'  )
       LOG ON (NAME= N'AdventureWorks2014_log', FILENAME= N'/local_mountpoint/AdventureWorks2014_log.ldf');

RESTORE DATABASE [AdventureWorks2014] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2014.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2014_Data' TO N'/local_mountpoint/AdventureWorks2014_Data.mdf',  
MOVE N'AdventureWorks2014_Log' TO N'/local_mountpoint/AdventureWorks2014_Log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2;

DROP DATABASE IF EXISTS [AdventureWorks2012];
CREATE DATABASE [AdventureWorks2012] ON PRIMARY
       (NAME = N'AdventureWorks2012' , FILENAME= N'/local_mountpoint/AdventureWorks2012.mdf'  )
       LOG ON (NAME= N'AdventureWorks2012_log', FILENAME= N'/local_mountpoint/AdventureWorks2012_log.ldf');

RESTORE DATABASE [AdventureWorks2012] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2012.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2012' TO N'/local_mountpoint/AdventureWorks2012.mdf',  
MOVE N'AdventureWorks2012_log' TO N'/local_mountpoint/AdventureWorks2012_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2



DROP DATABASE IF EXISTS [WideWorldImporters];
CREATE DATABASE [WideWorldImporters]
ON PRIMARY
       (NAME = N'WWI_Primary', FILENAME = N'/local_mountpoint/WideWorldImporters.mdf'),
       (NAME = N'WWI_UserData',FILENAME = N'/local_mountpoint/WideWorldImporters_UserData.ndf'),
	   (NAME = N'WWIDW_InMemory_Data_1',FILENAME = N'/local_mountpoint/WideWorldImporters_InMemory_Data_1')	   
	   LOG ON (NAME = N'WWI_Log',FILENAME = N'/local_mountpoint/WideWorldImporters.ldf');
GO
RESTORE DATABASE [WideWorldImporters] 
FROM  DISK = N'/var/opt/mssql/backup/WideWorldImporters-Full.bak' WITH  
FILE = 1,  MOVE N'WWI_Primary' TO N'/local_mountpoint/WideWorldImporters.mdf',  
MOVE N'WWI_UserData' TO N'/local_mountpoint/WideWorldImporters_UserData.ndf',  
MOVE N'WWI_Log' TO N'/local_mountpoint/WideWorldImporters.ldf',  
MOVE N'WWI_InMemory_Data_1' TO N'/local_mountpoint/WideWorldImporters_InMemory_Data_1',  
REPLACE, NOUNLOAD,  STATS = 2;

