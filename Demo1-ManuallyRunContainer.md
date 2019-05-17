# How to manually run the container without docker-compose

In this demo we will instantiate a docker image with the latest SQL Server 2017

## Pull the image from repository

```powershell
docker pull mcr.microsoft.com/mssql/server:2017-latest
```

## Run the container

Execute the container exposing port 14333 and connecting the local volue d:/ inside the container. This is very interesting when you want to get data from your local storage outside the container

```powershell
docker run -p 14333:1433 -it -v d:/:/data  -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=PaSSw0rd' --name my-container-sql2017 my-image-2017
```

### Connect to the container

```powershell
sqlcmd -S laptop,14333 -U sa -P 'PaSSw0rd' -Q "select @@version"
```