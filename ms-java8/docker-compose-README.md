# This is base docker image that can be used to run spring boot based Microservice

## How to build this ms-java8 image

##### Run the below command to build the image
`docker-compose build --build-arg VERSION=latest`

##### Run the below command to run the image, then that becomes container
`docker-compose up -d --no-build`

##### Run the below command to delete the container
`docker ps -a ` Get the container id. it's the first column
`docker rm <containerid>`

### Run the below command to remove the
`docker images` get the image id
`docker rmi <imageid>`

### How to create a tag and push it to docker hub?
Tag your source local image as remote image that includes <dockerhub account>/<image name or repo name>:<tag name>

`docker tag ms-java8:latest srimani/ms-java8:latest`
`docker push srimani/ms-java8:latest`