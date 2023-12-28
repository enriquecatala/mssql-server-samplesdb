#!/bin/bash
# Start SQL Server
/opt/mssql/bin/sqlservr & /var/opt/mssql/setup/setup.sh
eval $1