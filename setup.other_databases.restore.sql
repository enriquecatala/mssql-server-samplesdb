
RESTORE DATABASE [AdventureWorks2016] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2016.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2016_Data' TO N'/var/opt/mssql/data/AdventureWorks2016_Data.mdf',  
MOVE N'AdventureWorks2016_Log' TO N'/var/opt/mssql/data/AdventureWorks2016_Log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2


RESTORE DATABASE [AdventureWorks2014] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2014.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2014_Data' TO N'/var/opt/mssql/data/AdventureWorks2014_Data.mdf',  
MOVE N'AdventureWorks2014_Log' TO N'/var/opt/mssql/data/AdventureWorks2014_Log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2;


RESTORE DATABASE [AdventureWorks2012] FROM  DISK = N'/var/opt/mssql/backup/AdventureWorks2012.bak' WITH  
FILE = 1,  MOVE N'AdventureWorks2012' TO N'/var/opt/mssql/data/AdventureWorks2012.mdf',  
MOVE N'AdventureWorks2012_log' TO N'/var/opt/mssql/data/AdventureWorks2012_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2