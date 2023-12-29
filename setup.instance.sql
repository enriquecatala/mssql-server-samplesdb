--  Enrique Catalá:
--    Web:      https://www.clouddataninjas.com
--    Linkedin: https://www.linkedin.com/in/enriquecatala/
--    Support:  https://github.com/sponsors/enriquecatala

-- Script for prepare the instance
-- Allow contained databases
--
exec sp_configure 'contained database authentication',1
go
RECONFIGURE	
go