<div>
    <a href="https://github.com/sponsors/enriquecatala"><img src="https://img.shields.io/badge/GitHub_Sponsors--_.svg?style=flat-square&logo=github&logoColor=EA4AAA" alt="GitHub Sponsors"></a>
    <a href="https://enriquecatala.com"><img src="https://img.shields.io/website?down_color=red&down_message=down&label=enriquecatala.com&up_color=46C018&url=https%3A%2F%2Fenriquecatala.com&style=flat-square" alt="Data Engineering with Enrique Catalá"></a>
    <a href="https://www.linkedin.com/in/enriquecatala"><img src="https://img.shields.io/badge/LinkedIn--_.svg?style=flat-square&logo=linkedin" alt="LinkedIn Enrique Catalá Bañuls"></a>
    <a href="https://twitter.com/enriquecatala"><img src="https://img.shields.io/twitter/follow/enriquecatala?color=blue&label=twitter&style=flat-square" alt="Twitter @enriquecatala"></a>
    <a href="https://youtube.com/enriquecatala"><img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala/master/img/youtube.png" alt="Data Engineering: Canal youtube de Enrique Catalá" height=20></a>
</div>

<a href="https://mvp.microsoft.com/es-es/PublicProfile/5000312?fullName=Enrique%20Catala"><img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala/master/img/MVP_Logo_horizontal.png" alt="Microsoft DataPlatform MVP Enrique Catalá"></a>

# mssql-server-samplesdb

[![deploy sql server in docker with mssql-server-samplesdb](http://img.youtube.com/vi/ULL5nntWn1A/0.jpg)](http://www.youtube.com/watch?v=ULL5nntWn1A "mssql-server-samplesdb")


> NOTE: If you want me to make a translation of this video to english, please help me with a little of support!  <a href="https://github.com/sponsors/enriquecatala"><img src="https://img.shields.io/badge/GitHub_Sponsors--_.svg?style=social&logo=github&logoColor=EA4AAA" alt="GitHub Sponsors"></a> 


This project will create a docker image with all the sample databases restored. You can deploy by either a [stateless deployment](#stateless-deployment) or a [stateful deployment](#stateful-deployment).

Databases included:
- Pubs
- Northwind
- WideWorldImporters
- AdventureWorks2017
- _AdventureWorks2016*_
- _AdventureWorks2014*_
- _AdventureWorks2012*_
- _AdventureWorksDW2017*_
- _StackOverflow2010*_
- _WideWorldImportersDW*_


> NOTE: Databases marked with * must be switched on during build with **INCLUDE_ALL_DATABASES=1**

## How to run the image

```bash
# 1- permissions
#    Since the databases will be restored in your host (local_mountpoint), you need to create the folder and give permissions to the container to write in that folder
#
mkdir -p ./local_mountpoint/data/
mkdir -p ./local_mountpoint/shared_folder/
sudo chown 10001:0 ./local_mountpoint/data/
sudo chown 10001:0 ./local_mountpoint/shared_folder/
sudo chmod +rwx ./local_mountpoint/data/
sudo chmod +rwx ./local_mountpoint/shared_folder/

# 2- build and run the image
#
docker-compose up --build
```

Now you can open your favorite SQL Server client and connect to your local SQL Server instance. By default:
- Server localhost,14330
- user:sa
- Password: PaSSw0rd

>NOTE: You can find the credentials in the docker-compose.yml file

```yaml
    environment:
      MSSQL_SA_PASSWORD: "PaSSw0rd"      
    ports:
      - "14330:1433"  
```

## Enable all databases

Only common databases are deployed by default. To deploy ALL databases in your container, please enable the build flag called "INCLUDE_ALL_DATABASES=1"

```powershell
docker-compose build --build-arg INCLUDE_ALL_DATABASES=1
```

**IMPORTANT:** StackOverflow2010 database is huge and it will require a couple of minutes to initialize. Please be patient. You can work and play within the other databases while the StackOverflow database is being prepared

## Stateless deployment

Edit the [docker-compose.yml](./docker-compose.yml) file and comment the following lines:

```yml
#volumes:
#      - ${LOCAL_MOUNTPOINT}:/var/opt/mssql/data
```
>NOTE: Doing that, will disable mounting the local folder specified in the [.env](.env) file

Then, you can create and run the image with the following command:

```cmd
docker-compose up --build
```


**IMPORTANT:** StackOverflow2010 database is huge and it will require a couple of minutes to initialize. Please be patient. You can work and play within the other databases while the StackOverflow database is being prepared

## Stateful deployment

With the [docker-compose.yml](./docker-compose.yml) file you will deploy all databases in a persistent folder in the host (remind to configure the [.env](/.env) file with a valid local folder):

- LOCAL_MOUNTPOINT 

   The folder must exist ( for example: /home/enrique/your/path/to/volume/)

- SHARED_FOLDER

   The folder must exists. This shared folder can be used for example, to deploy backups or easily copy-paste between container and host

> IMPORTANT: There is some kind of bug with WSL2 and if you want to use stateful deployment, you need to start your container inside the wsl2 image. You cant execute docker-compose up from windows

### Permissions

Permissions are very important, since you are mounting local volumes to your container. To create a local folder and mount that folder to your container:

```bash
# log into your linux (host or wsl2 image)
mkdir -p ./local_mountpoint/data/
mkdir -p ./local_mountpoint/shared_folder/
sudo chown 10001:0 ./local_mountpoint/data/
sudo chown 10001:0 ./local_mountpoint/shared_folder/
sudo chmod +rwx ./local_mountpoint/data/
sudo chmod +rwx ./local_mountpoint/shared_folder/
#sudo chmod +rwx ./Backups/
``` 

And now, in the docker-compose, you can reference that path, for example

```yaml
    volumes:
       - ${LOCAL_MOUNTPOINT}:/var/opt/mssql/data
```

Now, when you start the container, you will see how the files are deployed locally 

```bash
mssql-server-samplesdb | 2020-05-25 16:23:11.74 Server      Setup step is copying system data file 'C:\templatedata\master.mdf' to '/var/opt/mssql/data/master.mdf'.
2020-05-25 16:23:12.05 Server      Did not find an existing master data file /var/opt/mssql/data/master.mdf, copying the missing default master and other system database files. If you have moved the database location, but not moved the database files, startup may fail. To repair: shutdown SQL Server, move the master database to configured location, and restart.
2020-05-25 16:23:12.11 Server      Setup step is copying system data file 'C:\templatedata\mastlog.ldf' to '/var/opt/mssql/data/mastlog.ldf'.
2020-05-25 16:23:12.15 Server      Setup step is copying system data file 'C:\templatedata\model.mdf' to '/var/opt/mssql/data/model.mdf'.
....
```


### Force Attach
- FORCE_ATTACH_IF_MDF_EXISTS

  1 -> if you don´t want to "restore" and the files exists, you can attach those databases
  0 -> if you did´nt executed docker-compose down, you can still "up" your container with previously restored databases

You can create and run the image with the following command:

```cmd
docker-compose up --build
```

## How to change the SQL Server base image

The [Dockerfile](./Dockerfile) specifies which base SQL Server Instance you want to use for your image. 

In case you want to change the version of the SQL Server used, please go edit the first line of the [Dockerfile](./Dockerfile)  and select your prefered version. For example

Change 

```docker
FROM mcr.microsoft.com/mssql/server:2019-GA-ubuntu-16.04
```

To

```docker
FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu
```

To get the latest SQL Server 2017 version with applied CU

__NOTE:__ To see which SQL Server versions, please go [here](https://hub.docker.com/_/microsoft-mssql-server) and select your "tag"

## How to add new databases to the image

It´s as easy as modifying the [Dockerfile](./Dockerfile), and adding the new backups you want to restore, and modifying the [setup.sql](./setup.sql) file with the RESTORE command.

## How to change the sa password

The password for the "sa" account is specified at the [docker-compose.yml](./docker-compose.yml) file.

# How it works?

Well, its a little tricky but when you find how it works, its very simple and stable:

[Dockerfile](/Dockerfile) makes 3 mayor steps

## Installing curl and 7-zip

This is the first thing we need to do, since we are going to download directly to the image, the databases we want

```docker
RUN apt-get update && apt-get install -y  \
	curl \
	apt-transport-https \
  p7zip-full
```

**IMPORTANT:** Please have in mind that starting with SQL Server 2019, mssql server containers are non-root. We need to change to root for executing specific tasks like this one

## Downloading databases

Once we have the curl installed, we are now ready to download the databases, and that´s what you found here:

```docker
##############################################################
# DATABASES SECTION
#    1) Add here the databases you want to have in your image
#    2) Edit setup.sql and include the RESTORE commands
#

# Adventureworks databases
#
RUN curl -L -o AdventureWorks2017.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak
RUN curl -L -o AdventureWorks2016.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2016.bak
...
```

_NOTE: Here you can add-remove the databases you want_

## Restoring databases

This is the tricky part since involves 2 scripts and the final command to keep alive the image

### Entrypoint

```docker
COPY setup.* ./
COPY entrypoint.sh ./

RUN chmod +x setup.sh
RUN chmod +x entrypoint.sh

# This entrypoint start sql server, restores data and waits infinitely
ENTRYPOINT ["./entrypoint.sh"]
```

### Avoid container to stop after deploy

To avoid the container to stop after first run, you need to ensure that is waiting for something. the best solution is to add a sleep infinity...as simple as it sounds :)

```docker
CMD ["sleep infinity"]
```