#!/bin/bash

# wait for MSSQL server to start
export STATUS=1
i=0

while [[ $STATUS -ne 0 ]] && [[ $i -lt 30 ]]; do
	i=$i+1
	/opt/mssql-tools/bin/sqlcmd -t 1 -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -Q "select 1" >> /dev/null
	STATUS=$?
done

if [ $STATUS -ne 0 ]; then 
	echo "Error: MSSQL SERVER took more than thirty seconds to start up."
	exit 1
fi

echo "======= MSSQL SERVER STARTED ========" | tee -a ./config.log

# If the wideworldimportersdw is restored, we don´t need to restore it again
#
file="/var/opt/mssql/data/WideWorldImportersDW.mdf"

if [ ! -f "$file" ]
then
	echo "*********** Restoring databases: WideWorldImporters, Adventureworks, tpcc ..." | tee -a ./config.log
	/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -d master -i /usr/config/setup-nonpersistentvolume.sql
else
	echo "*********** Databases Restored: ..." | tee -a ./config.log
fi
echo "======= MSSQL CONFIG COMPLETE =======" | tee -a ./config.log