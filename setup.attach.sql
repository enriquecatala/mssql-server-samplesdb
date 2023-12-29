--  Enrique Catalá:
--    Web:      https://www.clouddataninjas.com
--    Linkedin: https://www.linkedin.com/in/enriquecatala/
--    Support:  https://github.com/sponsors/enriquecatala

--    NOTE: Since there is a bug with WSL2 on Windows10, we can´t restore databases directly and first require a deploy of empty data, thats the reason for the CREATE DATABASE commands
-- pubs
CREATE DATABASE [Pubs] ON 
       (FILENAME= N'/var/opt/mssql/data/Pubs.mdf'  ),
       (FILENAME= N'/var/opt/mssql/data/Pubs_log.ldf')
FOR ATTACH;

-- Northwind
CREATE DATABASE [Northwind] ON 
       (FILENAME= N'/var/opt/mssql/data/Northwind.mdf'  ),
       (FILENAME= N'/var/opt/mssql/data/Northwind_log.ldf')
 FOR ATTACH;

-- AdventureWorks databases

CREATE DATABASE [AdventureWorks2017] ON 
       (FILENAME= N'/var/opt/mssql/data/AdventureWorks2017.mdf'  ),
       (FILENAME= N'/var/opt/mssql/data/AdventureWorks2017_log.ldf')
FOR ATTACH;

-- WideWorldImporters
--
CREATE DATABASE [WideWorldImporters] ON
       (FILENAME = N'/var/opt/mssql/data/WideWorldImporters.mdf'),
       (FILENAME = N'/var/opt/mssql/data/WideWorldImporters_UserData.ndf'),
	(FILENAME = N'/var/opt/mssql/data/WideWorldImporters_InMemory_Data_1'),
	(FILENAME = N'/var/opt/mssql/data/WideWorldImporters.ldf')
FOR ATTACH;

-- WideWorldImportersDW
--
CREATE DATABASE [WideWorldImportersDW] ON
       (FILENAME = N'/var/opt/mssql/data/WideWorldImportersDW.mdf'),
       (FILENAME = N'/var/opt/mssql/data/WideWorldImportersDW_UserData.ndf'),
	(FILENAME = N'/var/opt/mssql/data/WideWorldImportersDW_InMemory_Data_1'),
	(FILENAME = N'/var/opt/mssql/data/WideWorldImportersDW.ldf')
FOR ATTACH;