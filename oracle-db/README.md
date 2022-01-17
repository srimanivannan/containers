# Build oracle docker image/container using official docker images repo
* Download Clone `https://github.com/oracle/docker-images`
* For enterprise image
  * Download the Oracle Database 21c binary LINUX.X64_213000_db_home.zip from [here](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html)
  * Put the zip in the OracleDatabase/SingleInstance/dockerfiles/21.3.0 directory. Do not unzip it.
* For express edition
    * Download the Oracle Database 21c binary `oracle-database-xe-21c-1.0-1.ol8.x86_64.rpm` from [here](https://www.oracle.com/database/technologies/xe-downloads.html)
    * Put the rpm file in the OracleDatabase/SingleInstance/dockerfiles/21.3.0 directory. as it is.

## Building image of xpress edition
``` 
cd OracleDatabase/SingleInstance/dockerfiles
./buildContainerImage.sh -v 21.3.0 -x
```

## Building image of enterprise edition
``` 
cd OracleDatabase/SingleInstance/dockerfiles
./buildContainerImage.sh -v 21.3.0 -e
```
Building image can take up some time

## Spinning Xpress Edition Container
```
docker run \
--name oracle21c \
-p 1521:1521 \
-p 5500:5500 \
-e ORACLE_PDB=mani_pdb \
-e ORACLE_PWD=mani_Pwd1 \
-e INIT_SGA_SIZE=2000 \
-e INIT_PGA_SIZE=2000 \
-v /Users/mani/.cache/docker/vol/oracle/21/data:/opt/oracle/oradata \
-d \
oracle/database:21.3.0-xe
```
Note: Thre is no `ORACLE_SID` for xe edition. By default oracle uses `XE`

## Spinning Enterprise Edition Container
```
docker run \
--name oracle21c \
-p 1521:1521 \
-p 5500:5500 \
-e ORACLE_SID=manisid \
-e ORACLE_PDB=mani_pdb \
-e ORACLE_PWD=mani_Pwd1 \
-e INIT_SGA_SIZE=2000 \
-e INIT_PGA_SIZE=2000 \
-v /Users/mani/.cache/docker/vol/oracle/21/data:/opt/oracle/oradata \
-d \
oracle/database:21.3.0-xe
```

## Spin container via compose file
```
docker compose -f docker-compose-oracledb-local.yml -d
```

On first run, the database will be created and setup for you. 
This will take about 10 minutes. Open local Docker Dashboard and click the container and watch logs on the progress. Then you can connect.

## Connecting from any SQL client
```
host: localhost
port: 1521
username: system
password: mani_Pwd1
SID: 
    for xe use `XE`  
    for ee `your sid or service name`
```
## Connecting xpress manager
```
https://localhost:5500/em
```
