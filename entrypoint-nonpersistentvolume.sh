#!/bin/bash

/opt/mssql/bin/sqlservr & 

/usr/config/setup-nonpersistentvolume.sh

eval $1