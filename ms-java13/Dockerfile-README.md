# This is base docker image that can be used to run spring boot based Microservice

## How to build this ms-java13 image

##### Run the below command to build the image
`docker build --tag=mvn-java13:base --rm=true .`

##### Run the below command to get the imageid
`docker images`

##### Run the below command to run the image, then that becomes container
`docker run -i -t <imageid>`
`docker run -it <imageid>`

##### Run the below command to delete the container
`docker ps -a ` Get the container id. it's the first column
`docker rm <containerid> <containerid> <containerid>`
`docker container rm <containerid> <containerid> <containerid>`

### Run the below command to remove the
`docker images` Get the image id and use it on the below command
`docker rmi <imageid> <imageid> <imageid>`
`docker image rm <imageid> <imageid> <imageid>`

### How to create a tag and push it to docker hub?
`Tag your source local image as remote image that includes <dockerhub account>/<image name or repo name>:<tag name>`

`docker tag ms-java13:latest srimani/ms-java13:latest`
`docker push srimani/ms-java13:latest`
`docker push srimani/ms-java13:latest-onbuild`