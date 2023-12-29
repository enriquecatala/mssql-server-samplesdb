--  Enrique Catalá:
--    Web:      https://www.clouddataninjas.com
--    Linkedin: https://www.linkedin.com/in/enriquecatala/
--    Support:  https://github.com/sponsors/enriquecatala

CREATE DATABASE [AdventureWorks2016] ON 
       (FILENAME= N'/var/opt/mssql/data/AdventureWorks2016.mdf'  ),
       (FILENAME= N'/var/opt/mssql/data/AdventureWorks2016_log.ldf')
FOR ATTACH;

CREATE DATABASE [AdventureWorks2014] ON
       (FILENAME= N'/var/opt/mssql/data/AdventureWorks2014.mdf'  ),
       (FILENAME= N'/var/opt/mssql/data/AdventureWorks2014_log.ldf')
FOR ATTACH;


CREATE DATABASE [AdventureWorks2012] ON 
       (FILENAME= N'/var/opt/mssql/data/AdventureWorks2012.mdf'  ),
       (FILENAME= N'/var/opt/mssql/data/AdventureWorks2012_log.ldf')
FOR ATTACH;
