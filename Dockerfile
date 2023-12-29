FROM mcr.microsoft.com/mssql/server:2019-latest
EXPOSE 1433

LABEL  "MAINTAINER" "Enrique Catalá Bañuls <enrique@enriquecatala.com>"
LABEL "Project" "Microsoft SQL Server image with sample databases"

RUN mkdir -p /var/opt/mssql/setup

# Copy the backup files to the container
WORKDIR /var/opt/mssql/setup

COPY setup.* ./
COPY entrypoint.sh ./

# Since SQL Server 2019 is non-root container, we need to force this to install packages
USER root
RUN chown -R 10001:0 setup.sh entrypoint.sh

# Get to the default user
USER 10001
RUN chmod +x setup.sh entrypoint.sh

# This entrypoint start sql server, restores data and waits infinitely
ENTRYPOINT ["./entrypoint.sh"]
CMD ["sleep infinity"]