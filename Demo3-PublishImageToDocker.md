<div>
    <a href="https://github.com/sponsors/enriquecatala"><img src="https://img.shields.io/badge/GitHub_Sponsors--_.svg?style=flat-square&logo=github&logoColor=EA4AAA" alt="GitHub Sponsors"></a>
    <a href="https://www.clouddataninjas.com"><img src="https://img.shields.io/website?down_color=red&down_message=down&label=clouddataninjas.com&up_color=46C018&url=https%3A%2F%2Fwww.clouddataninjas.com&style=flat-square" alt="Data Engineering with Enrique Catalá"></a>
    <a href="https://enriquecatala.com"><img src="https://img.shields.io/website?down_color=red&down_message=down&label=enriquecatala.com&up_color=46C018&url=https%3A%2F%2Fenriquecatala.com&style=flat-square" alt="Data Engineering with Enrique Catalá"></a>
    <a href="https://www.linkedin.com/in/enriquecatala"><img src="https://img.shields.io/badge/LinkedIn--_.svg?style=flat-square&logo=linkedin" alt="LinkedIn Enrique Catalá Bañuls"></a>
    <a href="https://twitter.com/enriquecatala"><img src="https://img.shields.io/twitter/follow/enriquecatala?color=blue&label=twitter&style=flat-square" alt="Twitter @enriquecatala"></a>
    <a href="https://youtube.com/enriquecatala"><img src="https://raw.githubusercontent.com/enriquecatala/enriquecatala/master/img/youtube.png" alt="Data Engineering: Canal youtube de Enrique Catalá" height=20></a>
</div>

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

