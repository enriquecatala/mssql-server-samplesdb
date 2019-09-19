# How to publish an image to docker

To manually publish your image go docker, you must follow this:

## Create the image

With this command we are going to create our own image
```powershell
docker-compose build
```

## Push the image

Execute the container exposing port 14333 and connecting the local volue d:/ inside the container. This is very interesting when you want to get data from your local storage outside the container

First you need to validate that the image exists:

```powershell
docker image list

REPOSITORY                       TAG                  IMAGE ID             CREATED             SIZE
my-image                         latest               __IMAGE_ID_VALUE__   3 minutes ago       2.02GB
```

And now you can instantiate a container from the image:

```powershell
docker tag __IMAGE_ID_VALUE__ enriquecatala/mssql-server-samplesdb:2019-ctp3.0-ubuntu
docker login
docker push enriquecatala/mssql-server-samplesdb
```

