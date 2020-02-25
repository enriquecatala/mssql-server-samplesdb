# How to create an image with data

To manually run the container without using the docker-compose, you must follow this:

## Create the image

With this command we are going to create our own image
```powershell
docker build -t my-image . 
```

And [this is the expected output](##Output-of-docker-build)

## Run the container

Execute the container exposing port 14333 and connecting the local volue d:/ inside the container. This is very interesting when you want to get data from your local storage outside the container

First you need to validate that the image exists:

```powershell
docker image list

REPOSITORY                       TAG                  IMAGE ID            CREATED             SIZE
my-image                         latest               209405f1d529        3 minutes ago       2.02GB
```

And now you can instantiate a container from the image:

```powershell
docker run -p 14333:1433 -it -v d:/:/data  -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=PaSSw0rd' -e 'MSSQL_SA_PASSWORD=PaSSw0rd' --name my-container-sql2019 my-image
```

_MSSQL_SA_PASSWORD is a variable used in [setup.sh](/setup.sh), its intentional to show you how the variables works_

This is going to take a while depending on your machine, since the docker container is going to start the SQL Server instance and restore all databases... You will find a mark in the OUTPUT signaling when the restores start and end. something like:

```powershell
======= MSSQL SERVER STARTED ========
*********** Restoring databases: WideWorldImporters, Adventureworks, tpcc ...
...
...
RESTORE DATABASE successfully processed 58455 pages in 3.626 seconds (125.944 MB/sec).
======= MSSQL CONFIG COMPLETE =======
```

## Connect to the container

```powershell
sqlcmd -S laptop,14333 -U sa -P 'PaSSw0rd' -Q "select @@version"
```

Validate that this image contains databases restored in it:

## Output of docker build

This is the expected output of the docker build

```powershell
Sending build context to Docker daemon  13.14MB
Step 1/24 : FROM mcr.microsoft.com/mssql/server:2019-CTP2.5-ubuntu
2019-CTP2.5-ubuntu: Pulling from mssql/server
59ab41dd721a: Already exists
57da90bec92c: Already exists
06fe57530625: Already exists
5a6315cba1ff: Already exists
739f58768b3f: Already exists
0b751601bca3: Already exists
bcf04a22644a: Already exists
6efede4b0bec: Pull complete
e9b26e17c29a: Pull complete
Digest: sha256:74adb0d809b4012f5b06e28a5e19e0ef20434db4aa99b92b37ae67f516305980
Status: Downloaded newer image for mcr.microsoft.com/mssql/server:2019-CTP2.5-ubuntu
 ---> 5494536a73c1
Step 2/24 : EXPOSE 1433
 ---> Running in 487b0351e022
Removing intermediate container 487b0351e022
 ---> 793eff29d144
Step 3/24 : LABEL  "MAINTAINER" "Enrique Catalá Bañuls <enrique@enriquecatala.com>"
 ---> Running in 276c5abc1bed
Removing intermediate container 276c5abc1bed
 ---> a2aeb9f02a51
Step 4/24 : LABEL "Project" "Microsoft SQL Server container with sample databases"
 ---> Running in ce15a60f4ae8
Removing intermediate container ce15a60f4ae8
 ---> 71f2552c0f41
Step 5/24 : RUN apt-get update && apt-get install -y    curl    apt-transport-https
 ---> Running in a37c7df4aff1
Get:1 http://security.ubuntu.com/ubuntu xenial-security InRelease [109 kB]
Get:2 http://archive.ubuntu.com/ubuntu xenial InRelease [247 kB]
Get:3 http://security.ubuntu.com/ubuntu xenial-security/universe Sources [129 kB]
Get:4 http://archive.ubuntu.com/ubuntu xenial-updates InRelease [109 kB]
Get:5 http://archive.ubuntu.com/ubuntu xenial-backports InRelease [107 kB]
Get:6 https://packages.microsoft.com/ubuntu/16.04/prod xenial InRelease [3226 B]
Get:7 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages [827 kB]
Get:8 http://archive.ubuntu.com/ubuntu xenial/universe Sources [9802 kB]
Get:9 https://packages.microsoft.com/ubuntu/16.04/prod xenial/main amd64 Packages [92.1 kB]
Get:10 http://security.ubuntu.com/ubuntu xenial-security/restricted amd64 Packages [12.7 kB]
Get:11 http://security.ubuntu.com/ubuntu xenial-security/universe amd64 Packages [553 kB]
Get:12 http://security.ubuntu.com/ubuntu xenial-security/multiverse amd64 Packages [6113 B]
Get:13 http://archive.ubuntu.com/ubuntu xenial/main amd64 Packages [1558 kB]
Get:14 http://archive.ubuntu.com/ubuntu xenial/restricted amd64 Packages [14.1 kB]
Get:15 http://archive.ubuntu.com/ubuntu xenial/universe amd64 Packages [9827 kB]
Get:16 http://archive.ubuntu.com/ubuntu xenial/multiverse amd64 Packages [176 kB]
Get:17 http://archive.ubuntu.com/ubuntu xenial-updates/universe Sources [320 kB]
Get:18 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 Packages [1237 kB]
Get:19 http://archive.ubuntu.com/ubuntu xenial-updates/restricted amd64 Packages [13.1 kB]
Get:20 http://archive.ubuntu.com/ubuntu xenial-updates/universe amd64 Packages [965 kB]
Get:21 http://archive.ubuntu.com/ubuntu xenial-updates/multiverse amd64 Packages [19.1 kB]
Get:22 http://archive.ubuntu.com/ubuntu xenial-backports/main amd64 Packages [7942 B]
Get:23 http://archive.ubuntu.com/ubuntu xenial-backports/universe amd64 Packages [8532 B]
Fetched 26.1 MB in 17s (1491 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
apt-transport-https is already the newest version (1.2.31).
The following NEW packages will be installed:
  curl
0 upgraded, 1 newly installed, 0 to remove and 8 not upgraded.
Need to get 139 kB of archives.
After this operation, 339 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu xenial-updates/main amd64 curl amd64 7.47.0-1ubuntu2.12 [139 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 139 kB in 0s (520 kB/s)
Selecting previously unselected package curl.
(Reading database ... 10796 files and directories currently installed.)
Preparing to unpack .../curl_7.47.0-1ubuntu2.12_amd64.deb ...
Unpacking curl (7.47.0-1ubuntu2.12) ...
Setting up curl (7.47.0-1ubuntu2.12) ...
Removing intermediate container a37c7df4aff1
 ---> a7628e367445
Step 6/24 : RUN mkdir -p /var/opt/mssql/backup
 ---> Running in 811d7e31b109
Removing intermediate container 811d7e31b109
 ---> 0a07f188b519
Step 7/24 : WORKDIR /var/opt/mssql/backup
 ---> Running in 662bd37132e5
Removing intermediate container 662bd37132e5
 ---> 87a8ad9730e2
Step 8/24 : RUN curl -L -o AdventureWorks2017.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak
 ---> Running in 1fcf83be649c
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   612    0   612    0     0   1312      0 --:--:-- --:--:-- --:--:--  1310
100 47.9M  100 47.9M    0     0  2774k      0  0:00:17  0:00:17 --:--:-- 7794k
Removing intermediate container 1fcf83be649c
 ---> 16756f6851e2
Step 9/24 : RUN curl -L -o AdventureWorks2016.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2016.bak
 ---> Running in ecbeb05bc492
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   612    0   612    0     0   1409      0 --:--:-- --:--:-- --:--:--  1410
100 46.4M  100 46.4M    0     0  11.3M      0  0:00:04  0:00:04 --:--:-- 16.5M
Removing intermediate container ecbeb05bc492
 ---> 75b275955bc1
Step 10/24 : RUN curl -L -o AdventureWorks2014.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2014.bak
 ---> Running in 964971530fa2
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   612    0   612    0     0   1206      0 --:--:-- --:--:-- --:--:--  1204
100 44.5M  100 44.5M    0     0  6226k      0  0:00:07  0:00:07 --:--:-- 10.3M
Removing intermediate container 964971530fa2
 ---> 9a73fb6db22b
Step 11/24 : RUN curl -L -o AdventureWorks2012.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2012.bak
 ---> Running in 687a2a1c63ba
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   612    0   612    0     0   1368      0 --:--:-- --:--:-- --:--:--  1372
100 44.8M  100 44.8M    0     0  2559k      0  0:00:17  0:00:17 --:--:-- 7164k
Removing intermediate container 687a2a1c63ba
 ---> 34487e76cf94
Step 12/24 : RUN curl -L -o AdventureWorksDW2017.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2017.bak
 ---> Running in 56e6fdfc9989
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   614    0   614    0     0   1363      0 --:--:-- --:--:-- --:--:--  1364
100 22.3M  100 22.3M    0     0  5783k      0  0:00:03  0:00:03 --:--:-- 7159k
Removing intermediate container 56e6fdfc9989
 ---> 692a78b418cd
Step 13/24 : RUN curl -L -o WideWorldImportersDW-Full.bak https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImportersDW-Full.bak
 ---> Running in 6751e2d6ac75
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   619    0   619    0     0   1406      0 --:--:-- --:--:-- --:--:--  1410
100 47.7M  100 47.7M    0     0  2671k      0  0:00:18  0:00:18 --:--:-- 7066k
Removing intermediate container 6751e2d6ac75
 ---> eb1fcf1e2b64
Step 14/24 : RUN curl -L -o WideWorldImporters-Full.bak https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Full.bak
 ---> Running in 253d2ad7b1d1
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   617    0   617    0     0   1333      0 --:--:-- --:--:-- --:--:--  1332
100  121M  100  121M    0     0  11.4M      0  0:00:10  0:00:10 --:--:-- 13.7M
Removing intermediate container 253d2ad7b1d1
 ---> f405600809f1
Step 15/24 : COPY ./Backups/Pubs.bak ./
 ---> 07671e037bd1
Step 16/24 : COPY ./Backups/Northwind.bak ./
 ---> 8e65549e3954
Step 17/24 : RUN mkdir -p /usr/config
 ---> Running in b4935a036c15
Removing intermediate container b4935a036c15
 ---> 313bc14d74dd
Step 18/24 : WORKDIR /usr/config/
 ---> Running in 113baa1f44ff
Removing intermediate container 113baa1f44ff
 ---> 71e13a85c09c
Step 19/24 : COPY setup.* ./
 ---> ac5b2ad0de18
Step 20/24 : COPY entrypoint.sh ./
 ---> b6deb416ee0d
Step 21/24 : RUN chmod +x setup.sh
 ---> Running in 5470f49df807
Removing intermediate container 5470f49df807
 ---> efcf2c674d02
Step 22/24 : RUN chmod +x entrypoint.sh
 ---> Running in cc903a643a0c
Removing intermediate container cc903a643a0c
 ---> 43b3c4824c7c
Step 23/24 : ENTRYPOINT ["./entrypoint.sh"]
 ---> Running in d68fd492abc5
Removing intermediate container d68fd492abc5
 ---> b4bf68c3bb46
Step 24/24 : CMD ["sleep infinity"]
 ---> Running in 00f3a7cb72c5
Removing intermediate container 00f3a7cb72c5
 ---> 209405f1d529
Successfully built 209405f1d529
Successfully tagged my-image:latest
SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.
```