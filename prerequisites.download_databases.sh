#!/bin/bash

# Define the backups directory
BACKUPS_DIR="./Backups"

# check if WideWorldImporters-Full.bak exists
if [ ! -f "$BACKUPS_DIR/WideWorldImporters-Full.bak" ]; then
    echo "*********** Downloading WideWorldImporters-Full.bak..." | tee -a ./config.log
    curl -k -L -o $BACKUPS_DIR/WideWorldImporters-Full.bak https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak
else
    echo "*********** WideWorldImporters-Full.bak already exists. Skipping download." | tee -a ./config.log
fi

# check if AdventureWorks2017.bak exists
if [ ! -f "$BACKUPS_DIR/AdventureWorks2017.bak" ]; then
    echo "*********** Downloading AdventureWorks2017.bak..." | tee -a ./config.log
    curl -k -L -o $BACKUPS_DIR/AdventureWorks2017.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak
else
    echo "*********** AdventureWorks2017.bak already exists. Skipping download." | tee -a ./config.log
fi

# Conditional downloads based on INCLUDE_ALL_DATABASES environment variable
# If INCLUDE_ALL_DATABASES is set to 1, download all databases
# INCLUDE_ALL_DATABASES=1 ./prerequisites.download_databases.sh
if [ "${INCLUDE_ALL_DATABASES}" = "1" ]; then
    #check if AdventureWorks2016.bak exists
    if [ ! -f "$BACKUPS_DIR/AdventureWorks2016.bak" ]; then
        echo "*********** Downloading AdventureWorks2016.bak..." | tee -a ./config.log
        curl -k -L -o $BACKUPS_DIR/AdventureWorks2016.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2016.bak
    else
        echo "*********** AdventureWorks2016.bak already exists. Skipping download." | tee -a ./config.log
    fi
    
    #check if AdventureWorks2014.bak exists
    if [ ! -f "$BACKUPS_DIR/AdventureWorks2014.bak" ]; then
        echo "*********** Downloading AdventureWorks2014.bak..." | tee -a ./config.log
        curl -k -L -o $BACKUPS_DIR/AdventureWorks2014.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2014.bak
    else
        echo "*********** AdventureWorks2014.bak already exists. Skipping download." | tee -a ./config.log
    fi
    
    #check if AdventureWorks2012.bak exists
    if [ ! -f "$BACKUPS_DIR/AdventureWorks2012.bak" ]; then
        echo "*********** Downloading AdventureWorks2012.bak..." | tee -a ./config.log
        curl -k -L -o $BACKUPS_DIR/AdventureWorks2012.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2012.bak
    else
        echo "*********** AdventureWorks2012.bak already exists. Skipping download." | tee -a ./config.log    
    fi

    #check if AdventureWorksDW2017.bak exists
    if [ ! -f "$BACKUPS_DIR/AdventureWorksDW2017.bak" ]; then
        echo "*********** Downloading AdventureWorksDW2017.bak..." | tee -a ./config.log
        curl -L -o $BACKUPS_DIR/AdventureWorksDW2017.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2017.bak
    else
        echo "*********** AdventureWorksDW2017.bak already exists. Skipping download." | tee -a ./config.log    
    fi
    #check if WideWorldImportersDW-Full exists
    if [ ! -f "$BACKUPS_DIR/WideWorldImportersDW-Full.bak" ]; then
        echo "*********** Downloading WideWorldImportersDW-Full.bak..." | tee -a ./config.log
        curl -L -o $BACKUPS_DIR/WideWorldImportersDW-Full.bak https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImportersDW-Full.bak
    else
        echo "*********** WideWorldImportersDW-Full.bak already exists. Skipping download." | tee -a ./config.log        
    fi
    
    # # check if StackOverflow2010.7z exists
    # if [ ! -f "$BACKUPS_DIR/StackOverflow2010.7z" ]; then
    #     echo "*********** Downloading StackOverflow2010.7z..." | tee -a ./config.log
    #     curl -k -L -o $BACKUPS_DIR/StackOverflow2010.7z http://downloads.brentozar.com.s3.amazonaws.com/StackOverflow2010.7z
    #     # Unzip StackOverflow2010
    #     7za x $BACKUPS_DIR/StackOverflow2010.7z -o$BASE_DIR/data/
    # else
    #     echo "*********** StackOverflow2010.7z already exists. Skipping download." | tee -a ./config.log
    # fi
    
else
    echo 'Only selected databases are downloaded as INCLUDE_ALL_DATABASES is not set to 1.'
    echo 'To download all databases: INCLUDE_ALL_DATABASES=1 ./prerequisites.download_databases.sh'
fi
