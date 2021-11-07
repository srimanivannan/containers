# create 1 primary and 1 secondry 
primary will have read-write access and secondary will have read replica

## create a network
```dockerfile
docker network  create mongo-cluster
```
### create primary
```
docker run -p 30001:27071 --name primary-mongo --net mongo-cluster mongo mongod --replSet comments
```
### create secondary
```
docker run -p 30002:27071 --name secondary-mongo --net mongo-cluster mongo mongod --replSet comments
```
### change config file in primary
```
docker exec -it primary-mongo mongo
```
