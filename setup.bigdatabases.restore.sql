-- Restoring databases
-- Enrique Catalá: 
--     Since there is a bug with WSL2 on Windows10, we can´t restore databases directly and first require a deploy of empty data, thats the reason for the CREATE DATABASE commands
-- AdventureworksDW2017
--

RESTORE DATABASE [AdventureWorksDW2017] FROM  
DISK = N'/var/opt/mssql/backup/AdventureWorksDW2017.bak' WITH  
FILE = 1,  MOVE N'AdventureWorksDW2017' TO N'/var/opt/mssql/data/AdventureWorksDW2017.mdf',  
MOVE N'AdventureWorksDW2017_log' TO N'/var/opt/mssql/data/AdventureWorksDW2017_log.ldf',  
REPLACE, NOUNLOAD,  STATS = 2;


-- -- StackOverflow2010
-- --
-- CREATE DATABASE [StackOverflow2010] ON 
-- ( FILENAME = N'/var/opt/mssql/data/StackOverflow2010.mdf' ),
-- ( FILENAME = N'/var/opt/mssql/data/StackOverflow2010_log.ldf' )
--  FOR ATTACH
-- GO