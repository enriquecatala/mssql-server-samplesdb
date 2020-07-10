#!/bin/bash

# wait for MSSQL server to start
export STATUS=1
i=0

while [[ $STATUS -ne 0 ]] && [[ $i -lt 60 ]]; do
	i=$i+1
	echo "*************************************************************************"
	echo "Waiting for SQL Server to start (it will fail until port is opened)..."
	/opt/mssql-tools/bin/sqlcmd -t 1 -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -Q "select 1" >> /dev/null
	STATUS=$?
	sleep 1	
done

if [ $STATUS -ne 0 ]; then 
	echo "Error: MSSQL SERVER took more than 60 seconds to start up."
	exit 1
fi

echo "======= MSSQL SERVER STARTED ========" | tee -a ./config.log

echo "*********** Preparing SQL Server instance features: Contained databases " | tee -a ./config.log
/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -d master -i /usr/config/setup.instance.sql

# If the wideworldimportersdw is restored, we don´t need to restore it again
#
file="/var/opt/mssql/data/Pubs.mdf"

if [ ! -f "$file" ]
then
	echo "*********** Restoring databases: WideWorldImporters, Adventureworks, tpcc ..." | tee -a ./config.log
	/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -d master -i /usr/config/setup.restore.sql

	case $INCLUDE_ALL_DATABASES in	
	1)	echo "*********** Restoring big databases: WideWorldImportersDW, AdventureworksDW, StackOverflow..." | tee -a ./config.log
		/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -d master -i /usr/config/setup.other_databases.restore.sql	
		/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -d master -i /usr/config/setup.bigdatabases.restore.sql	
	;;
	*)
	;;
	esac
else
	case $FORCE_ATTACH_IF_MDF_EXISTS in	
	1)	echo "*********** Attaching previously restored databases..." | tee -a ./config.log
		/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -d master -i /usr/config/setup.attach.sql
		
		case $INCLUDE_ALL_DATABASES in	
		1)	echo "*********** Attaching previously restored big databases..." | tee -a ./config.log
			/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -d master -i /usr/config/setup.other_databases.attach.sql
			/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $MSSQL_SA_PASSWORD -d master -i /usr/config/setup.bigdatabases.attach.sql
		;;
		*)
		;;
		esac	
	;;
	*)
	;;
	esac	

fi
echo "======= MSSQL CONFIG COMPLETE =======" | tee -a ./config.log