# How to manually run the container without docker-compose

In this demo we will instantiate a docker image with the latest SQL Server 2017

## Pull the image from repository

```powershell
docker pull mcr.microsoft.com/mssql/server:2017-latest
```

## Run the container

Execute the container exposing port 14333 and connecting the local volue d:/ inside the container. This is very interesting when you want to get data from your local storage outside the container

```powershell
docker run -p 14333:1433 -it -v d:/:/data  -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=PaSSw0rd' --name my-container-sql2017 mcr.microsoft.com/mssql/server:2017-latest
```

_-d parameter will open the container and return the execution to the bash runtime_

## Connect to the container

```powershell
sqlcmd -S laptop,14333 -U sa -P 'PaSSw0rd' -Q "select @@version"
```

Try to restore a database from your local path:

```powershell
sqlcmd -S laptop,14333 -U sa -P 'PaSSw0rd' -Q " USE [master]; RESTORE DATABASE [pubs] FROM  DISK = N'/data/Git_ecb/mssql-server-samplesdb/Backups/Pubs.bak' WITH  FILE = 1,  MOVE N'pubs' TO N'/var/opt/mssql/data/pubs.mdf',  MOVE N'pubs_log' TO N'/var/opt/mssql/data/pubs_log.ldf',  NOUNLOAD,  STATS = 5"
```

_or try to do the same and use SQL Server Management studio_

## Stop the container

By pressyng ctrl+z 

## Try to start again the container

```powershell
docker run -p 14333:1433 -it -v d:/:/data  -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=PaSSw0rd' --name my-container-sql2017 mcr.microsoft.com/mssql/server:2017-latest
```

This time it will throw you an error:

_C:\Program Files\Docker\Docker\Resources\bin\docker.exe: Error response from daemon: Conflict. The container name "/my-container-sql2017" is already in use by container "70de3443a42ad37f55de9e8db4177a7a846b7067c39faf16db3410ad330dc50a". You have to remove (or rename) that container to be able to reuse that name.
See 'C:\Program Files\Docker\Docker\Resources\bin\docker.exe run --help'._

So list the containers with

```powershell
docker container list -a
```


| CONTAINER ID | IMAGE                                      | COMMAND                | CREATED       | STATUS                        | PORTS                | NAMES |
|--------------|--------------------------------------------|------------------------|---------------|-------------------------------|----------------------|-------|
| 70de3443a42a | mcr.microsoft.com/mssql/server:2017-latest | "/opt/mssql/bin/sqls…" | 9 minutes ago | Exited (0) About a minute ago |  | my-container-sql2017      |
|              |                                            |                        |               |                               |                      |       |

and execute the container with the name you gave it:

```powershell
docker start -i my-container-sql2017
```

## Clean up container

With the following execution, you will delete all exited containers 

```powershell
docker rm $(docker ps -q -f status=exited)
```

