-- Restoring databases
--
-- AdventureWorksDW2017
--
CREATE DATABASE [AdventureWorksDW2017] ON 
       (FILENAME= N'/var/opt/mssql/data/AdventureWorksDW2017.mdf'  ),
       (FILENAME= N'/var/opt/mssql/data/AdventureWorksDW2017_log.ldf')
FOR ATTACH;

-- -- StackOverflow2010
-- --
-- CREATE DATABASE [StackOverflow2010] ON 
-- ( FILENAME = N'/var/opt/mssql/data/StackOverflow2010.mdf' ),
-- ( FILENAME = N'/var/opt/mssql/data/StackOverflow2010_log.ldf' )
--  FOR ATTACH
-- GO