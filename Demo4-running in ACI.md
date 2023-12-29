<div>
    <a href="https://github.com/sponsors/enriquecatala"><img src="https://img.shields.io/badge/GitHub_Sponsors--_.svg?style=flat-square&logo=github&logoColor=EA4AAA" alt="GitHub Sponsors"></a>
    <a href="https://www.clouddataninjas.com"><img src="https://img.shields.io/website?down_color=red&down_message=down&label=clouddataninjas.com&up_color=46C018&url=https%3A%2F%2Fwww.clouddataninjas.com&style=flat-square" alt="Data Engineering with Enrique Catalá"></a>
    <a href="https://enriquecatala.com"><img src="https://img.shields.io/website?down_color=red&down_message=down&label=enriquecatala.com&up_color=46C018&url=https%3A%2F%2Fenriquecatala.com&style=flat-square" alt="Data Engineering with Enrique Catalá"></a>
    <a href="https://www.linkedin.com/in/enriquecatala"><img src="https://img.shields.io/badge/LinkedIn--_.svg?style=flat-square&logo=linkedin" alt="LinkedIn Enrique Catalá Bañuls"></a>
    <a href="https://twitter.com/enriquecatala"><img src="https://img.shields.io/twitter/follow/enriquecatala?color=blue&label=twitter&style=flat-square" alt="Twitter @enriquecatala"></a>
    <a href="https://youtube.com/enriquecatala"><img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala/master/img/youtube.png" alt="Data Engineering: Canal youtube de Enrique Catalá" height=20></a>
</div>

# Runing image in Azure Container Instance

The docker [version >2.3.2](https://docs.docker.com/docker-for-windows/edge-release-notes/) lets you run your docker images on Azure Container Instances.

- [Runing image in Azure Container Instance](#runing-image-in-azure-container-instance)
- [1) Publish your image to docker hub](#1-publish-your-image-to-docker-hub)
- [2) Create an ACI context](#2-create-an-aci-context)
- [3) Switch to the new ACI context](#3-switch-to-the-new-aci-context)
- [4) Run the container](#4-run-the-container)
- [5) Check the status of the container](#5-check-the-status-of-the-container)
  - [Check the logs](#check-the-logs)
- [Apendix](#apendix)
  - [Create new context](#create-new-context)
  - [List context](#list-context)
  - [Stop the app](#stop-the-app)
  - [Delete old contexts](#delete-old-contexts)

# 1) Publish your image to docker hub

Please follow the [Demo3](Demo3-PublishImageToDocker.md)

# 2) Create an ACI context

Once you have the docker [version >2.3.2](https://docs.docker.com/docker-for-windows/edge-release-notes/), you will need to get started by logging into an Azure account using the Docker CLI:

```powershell
# login to azure
docker login azure
# create the context
docker context create aci myaci
# List the new context
docker context list
```

# 3) Switch to the new ACI context

```powershell
docker context use myaci
```

# 4) Run the container

To run container, you simply use the new sintax "_docker compose_" 
>NOTE: We are not using '-', the command is **_docker compose_** with a space in the midle

```powershell
❯ docker compose -f .\docker-compose-demo4.yml up
[+] Running 2/2
 - Group mssqlserversamplesdb  Created                      5.3s
 - db1                         Done                         92.5s
```

>NOTE: To check the status while deploying __docker ps -a__

```powershell
❯ docker ps -a
CONTAINER ID               IMAGE                                              COMMAND             STATUS              PORTS
mssqlserversamplesdb_db1   enriquecatala/mssql-server-samplesdb:2019-latest                       Waiting             52.155.222.157:1433->1433/tcp
```

# 5) Check the status of the container

```powershell
❯ docker ps
CONTAINER ID               IMAGE                                              STATUS              PORTS
mssqlserversamplesdb_db1   enriquecatala/mssql-server-samplesdb:2019-latest   Running             52.155.222.157:1433->1433/tcp
```

## Check the logs

```powershell
docker logs mssqlserversamplesdb_db1

❯ docker logs mssqlserversamplesdb_db1
*************************************************************************
Waiting for SQL Server to start (it will fail until port is opened)...
2020-09-28 22:00:55.24 Server      Microsoft SQL Server 2019 (RTM-CU4) (KB4548597) - 15.0.4033.1 (X64)
        Mar 14 2020 16:10:35
        Copyright (C) 2019 Microsoft Corporation
        Developer Edition (64-bit) on Linux (Ubuntu 18.04.4 LTS) <X64>
2020-09-28 22:00:55.24 Server      UTC adjustment: 0:00
2020-09-28 22:00:55.24 Server      (c) Microsoft Corporation.
2020-09-28 22:00:55.25 Server      All rights reserved.
2020-09-28 22:00:55.25 Server      Server process ID is 40.
2020-09-28 22:00:55.25 Server      Logging SQL Server messages in file '/var/opt/mssql/log/errorlog'.
2020-09-28 22:00:55.25 Server      Registry startup parameters:
         -d /var/opt/mssql/data/master.mdf
         -l /var/opt/mssql/data/mastlog.ldf
...
```

# Apendix

## Create new context

```bash
docker context create aci --help

```
## List context

```bash
> docker context --help
❯ docker context list
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT                  KUBERNETES ENDPOINT   ORCHESTRATOR
aci-context         aci                 mycontainerinstances@northeurope
default *           moby                Current DOCKER_HOST based configuration   npipe:////./pipe/docker_engine                         swarm
```

## Stop the app

```powershell
docker compose down
```

## Delete old contexts

```bash
docker context rm aci-context 
```