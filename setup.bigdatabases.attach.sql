-- Restoring databases
--
-- AdventureWorksDW2017
--
CREATE DATABASE [AdventureWorksDW2017] ON 
       (FILENAME= N'/local_mountpoint/AdventureWorksDW2017.mdf'  ),
       (FILENAME= N'/local_mountpoint/AdventureWorksDW2017_log.ldf')
FOR ATTACH;

-- WideWorldImportersDW
--
CREATE DATABASE [WideWorldImportersDW] ON
       (FILENAME = N'/local_mountpoint/WideWorldImportersDW.mdf'),
       (FILENAME = N'/local_mountpoint/WideWorldImportersDW_UserData.ndf'),
	(FILENAME = N'/local_mountpoint/WideWorldImportersDW_InMemory_Data_1'),
	(FILENAME = N'/local_mountpoint/WideWorldImportersDW.ldf')
FOR ATTACH;

-- StackOverflow2010
--
CREATE DATABASE [StackOverflow2010] ON 
( FILENAME = N'/var/opt/mssql/data/StackOverflow2010.mdf' ),
( FILENAME = N'/var/opt/mssql/data/StackOverflow2010_log.ldf' )
 FOR ATTACH
GO