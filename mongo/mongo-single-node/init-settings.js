db.auth('root', _getEnv("MONGO_INITDB_ROOT_PASSWORD_FILE")); // Takes value of environment variable MONGO_INITDB_ROOT_PASSWORD_FILE loded by docker-compose.yml file
db = db.getSiblingDB('domain-database'); // This will create DB domain-database if not already present
db.createUser(
    {
        user: "domain-user",
        pwd: cat(_getEnv("MONGO_DOMAIN_USER_PASSWORD")), // Takes value of environment variable MONGO_DOMAIN_USER_PASSWORD loded by docker-compose.yml file
        roles: [
            {
                role: "readWrite",
                db: "domain-database"
            }
        ]
    }
);
// This will create collection name domainName if not already present
db.domainName.createIndex({
                              "address.zip": 1
                          }, 
                          {
                              unique: false
                          });
db.domainName.insert({
                         "address": {
                             "city": "Henrico",
                             "zip": "23233"
                         },
                         "name": "Manivannan",
                         "phone": "1234"
                     });
db.domainName.insert({
                         "address": {
                             "city": "Henrico",
                             "zip": "23234"
                         },
                         "name": "Aaa",
                         "phone": "1234"
                     });
