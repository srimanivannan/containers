### How to build local docker?

#### Step1: Build docker image from the base docker?
1. Create a Dockerfile
    (Explanation of Dockerfile below)
    1. Download from postgres:alpine
    2. Add init file to start up location
    3. Add Environment variables related to postgres
    4. expose postgres port
2. build the docker image from the Dockerfile using following command
    ``` docker build -t srimani/postgres:v1.0 .```
3. Spin the local postgres docker container using the following command
    ```  ```docker-compose -f docker-compose-postgresql-local.yml up -d