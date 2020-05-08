# How to publish an image to docker

To manually publish your image go docker, you must follow this:

## Get the IMAGE_ID of your image

docker image list will show all the images you have, so check all the images and search for the one you just created

```powershell
PS D:\git\mssql-samples-db> docker image list   
REPOSITORY                       TAG                      IMAGE ID            CREATED              SIZE
mssql-server-samplesdb_db1       latest                   __IMAGE_ID_VALUE__        About a minute ago   2.06GB
```

## Push the image

Now that you have the IMAGE_ID you want to push to your docker image registry, 

And now you can instantiate a container from the image:

```powershell
docker tag 9e4b368a45e8 enriquecatala/mssql-server-samplesdb:2019-CU4-ubuntu-16.04
docker login
docker push enriquecatala/mssql-server-samplesdb
```

