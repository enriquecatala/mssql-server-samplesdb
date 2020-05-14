FROM mcr.microsoft.com/mssql/server:2019-latest
EXPOSE 1433

LABEL  "MAINTAINER" "Enrique Catalá Bañuls <enrique@enriquecatala.com>"
LABEL "Project" "Microsoft SQL Server container with sample databases"

# Since SQL Server 2019 is non-root container, we need to force this to install packages
USER root
RUN apt-get update && apt-get install -y  \
	curl \
	apt-transport-https \
	p7zip-full

# Create the local_mountpoint folder where the restores will be happening
# This is critical if you want to use this as a local mountpoint to enable stateful deployments
RUN mkdir -p /var/opt/mssql/data
RUN chown 10001:0 /var/opt/mssql/data
RUN chmod +rwx /var/opt/mssql/data

# Get to the default user (mssql = 10001)
USER 10001

RUN mkdir -p /var/opt/mssql/backup
WORKDIR /var/opt/mssql/backup

##############################################################
# DATABASES SECTION
#    1) Add here the databases you want to have in your image
#    2) Edit setup.sql and include the RESTORE commands
#

# Local .bak files
#
COPY ./Backups/Pubs.bak ./
COPY ./Backups/Northwind.bak ./


RUN curl -L -o AdventureWorks2017.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak
RUN curl -L -o AdventureWorks2016.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2016.bak
RUN curl -L -o AdventureWorks2014.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2014.bak
RUN curl -L -o AdventureWorks2012.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2012.bak

RUN curl -L -o WideWorldImporters-Full.bak https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak

## BIG DATABASES
#
RUN curl -L -o AdventureWorksDW2017.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2017.bak
RUN curl -L -o WideWorldImportersDW-Full.bak https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImportersDW-Full.bak

# StackOverflow2010
# 
RUN curl -L -o StackOverflow2010.7z http://downloads.brentozar.com.s3.amazonaws.com/StackOverflow2010.7z
# This is going to unzip the 10Gb StackOverflow sample database
#
RUN 7za x StackOverflow2010.7z -o/var/opt/mssql/data/



##############################################################

RUN mkdir -p /usr/config
WORKDIR /usr/config/

COPY setup.* ./
COPY entrypoint.sh ./

# Since SQL Server 2019 is non-root container, we need to force this to install packages
USER root
RUN chown -R 10001:0 setup.sh
RUN chown -R 10001:0 entrypoint.sh
# Get to the default user
USER 10001

RUN chmod +x setup.sh
RUN chmod +x entrypoint.sh

# This entrypoint start sql server, restores data and waits infinitely
ENTRYPOINT ["./entrypoint.sh"]

CMD ["sleep infinity"]
