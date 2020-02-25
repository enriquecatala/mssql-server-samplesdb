-- Restoring databases
-- Enrique Catalá: 
--     Since there is a bug with WSL2 on Windows10, we can´t restore databases directly and first require a deploy of empty data, thats the reason for the CREATE DATABASE commands
-- pubs
CREATE DATABASE [Pubs] ON 
       (FILENAME= N'/local_mountpoint/Pubs.mdf'  ),
       (FILENAME= N'/local_mountpoint/Pubs_log.ldf')
FOR ATTACH;

-- Northwind
CREATE DATABASE [Northwind] ON 
       (FILENAME= N'/local_mountpoint/Northwind.mdf'  ),
       (FILENAME= N'/local_mountpoint/Northwind_log.ldf')
 FOR ATTACH;

-- AdventureWorks databases

CREATE DATABASE [AdventureWorks2017] ON 
       (FILENAME= N'/local_mountpoint/AdventureWorks2017.mdf'  ),
       (FILENAME= N'/local_mountpoint/AdventureWorks2017_log.ldf')
FOR ATTACH;

CREATE DATABASE [AdventureWorks2016] ON 
       (FILENAME= N'/local_mountpoint/AdventureWorks2016.mdf'  ),
       (FILENAME= N'/local_mountpoint/AdventureWorks2016_log.ldf')
FOR ATTACH;

CREATE DATABASE [AdventureWorks2014] ON
       (FILENAME= N'/local_mountpoint/AdventureWorks2014.mdf'  ),
       (FILENAME= N'/local_mountpoint/AdventureWorks2014_log.ldf')
FOR ATTACH;


CREATE DATABASE [AdventureWorks2012] ON 
       (FILENAME= N'/local_mountpoint/AdventureWorks2012.mdf'  ),
       (FILENAME= N'/local_mountpoint/AdventureWorks2012_log.ldf')
FOR ATTACH;

-- WideWorldImporters
--
CREATE DATABASE [WideWorldImporters] ON
       (FILENAME = N'/local_mountpoint/WideWorldImporters.mdf'),
       (FILENAME = N'/local_mountpoint/WideWorldImporters_UserData.ndf'),
	(FILENAME = N'/local_mountpoint/WideWorldImporters_InMemory_Data_1'),
	(FILENAME = N'/local_mountpoint/WideWorldImporters.ldf')
FOR ATTACH;
