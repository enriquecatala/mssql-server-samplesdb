# How to manually run the container without docker-compose

To manually run the container without using the docker-compose, you must follow this:

## Create the image

```powershell
docker build -t my-image . 
```

### Pull the image from repository

**OPTIONAL**: If you don´t want to create the image from scratch, you can get the image from repository:

```powershell
docker pull enriquecatala/mssql-server-samplesdb:2019-ctp2.5-ubuntu
```

## Run the container

Execute the container exposing port 14333 and connecting the local volue d:/ inside the container. This is very interesting when you want to get data from your local storage outside the container

```powershell
docker run -p 14333:1433 -it -v d:/:/data  -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=PaSSw0rd' --name my-container-sql2017 my-image
```

### Connect to the container

```powershell
sqlcmd -S laptop,14333 -U sa -P 'PaSSw0rd' -Q "select @@version"
```