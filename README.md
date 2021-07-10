# Testing connection to mongodb on a docker container from R
Test running mongodb database in docker container and connecting via R mongolite package  

## Steps to create connection manually(without docker compose)
### Create mongo network
docker network create mongo-network

### Create mongo database image
docker run  -d \\ \
-p 27017:27017 \\ \
-e MONGO_INITDB_ROOT_USERNAME=admin \\ \
-e MONGO_INITDB_ROOT_PASSWORD=password \\ \
--name mongodb \\ \
--net mongo-network \\ \
mongo

### Create mongo-express database ui connection image
docker run -d \\ \
-p 8081:8081 \\ \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \\ \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=password \\ \
--name mongodb-express \\ \
--net mongo-network \\ \
-e ME_CONFIG_MONGODB_SERVER=mongodb \\ \
mongo-express

### TBD Create rstudio connected to mongodb server TBD
docker run -d \\ \
-p 8787:8787 \\ \


## Steps to create connection with docker-compose

### Build rstudio image with Dockerfile
docker build -t rstudio-image "path-to-dockerfile" 

This builds an image with the name "rstudio-image" - needed for docker-compose.yaml file

### Docker-compose
Docker compose file:
- creates a network for the containers
- creates a docker database volume
- creates and connects the 3 containers:
    - mongo database server
    - mongo-express ui
    - rstudio

Uses .env file data for login credentials

## looking at docker logs
docker logs "container-id"
### For streaming of logs
docker logs "container-id" -f

## NB
- 