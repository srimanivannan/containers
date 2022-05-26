### To create a mongo cluster, run the below command
```
docker-compose -f docker-compose-mongo-cluster.yml up -d
```
### Commands used to create replication configuration:

Step1: Pick any node that is going to be as primary
```
loginto primary container: 
docker exec -it <containerid> mongo
```
Step2: run below config
```
config = {
  "_id": "mongo_replica_set_name",
  "members": [
    {
      "_id": 0,
      "host": "mongo_primary:27017"
    },
    {
      "_id": 1,
      "host": "mongo_slave:27017"
    }
  ]
}
```
Step3: initiate to start replicating data of "mongo_replica_set_name" replica set
```
rs.initiate(config)
exit
```

Step4: Again Login to primary container
```
db = (new Mongo('localhost:27017')).getDB('twitter_events');
show dbs
show collections
db.mycollection.insert({id:001}) // This will create a collection named mycollection
```
Step5: Login to secondary container to see data is replicated or not
```
db = (new Mongo('localhost:27017')).getDB('twitter_events');
show dbs
show collections
db.mycollection.find() // First time you might see below error
Error: error: {
        "operationTime" : Timestamp(1589740478, 1),
        "ok" : 0,
        "errmsg" : "not master and slaveOk=false",
        "code" : 13435,
        "codeName" : "NotMasterNoSlaveOk",
        "$clusterTime" : {
                "clusterTime" : Timestamp(1589740478, 1),
                "signature" : {
                        "hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
                        "keyId" : NumberLong(0)
                }
        }
}

to fix that run
db.setSlaveOk()
db.mycollection.find()
```
