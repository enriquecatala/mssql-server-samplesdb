FROM mcr.microsoft.com/mssql/server:2019-latest
EXPOSE 1433
# You must set this variable with --build-arg INCLUDE_ALL_DATABASES=1 in case you want to restore all databases
ARG INCLUDE_ALL_DATABASES=0
# Depending on the value of the ARG, the bash script will try to restore/attach
ENV INCLUDE_ALL_DATABASES $INCLUDE_ALL_DATABASES

LABEL  "MAINTAINER" "Enrique Catalá Bañuls <enrique@enriquecatala.com>"
LABEL "Project" "Microsoft SQL Server image with sample databases"


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

RUN mkdir -p /var/opt/mssql/shared_folder
RUN mkdir -p /var/opt/mssql/backup
RUN mkdir -p /var/opt/mssql/setup



##############################################################
WORKDIR /var/opt/mssql/setup

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