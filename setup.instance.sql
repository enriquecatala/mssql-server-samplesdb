-- Script for prepare the instance
-- Allow contained databases
--
exec sp_configure 'contained database authentication',1
go
RECONFIGURE	
go