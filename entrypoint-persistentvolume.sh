#!/bin/bash
/opt/mssql/bin/mssql-conf set filelocation.defaultdatadir /local_mountpoint 
/opt/mssql/bin/mssql-conf set filelocation.defaultlogdir /local_mountpoint 
/opt/mssql/bin/sqlservr & 

/usr/config/setup-persistentvolume.sh

eval $1