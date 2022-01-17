### How to build and run sonar locally?
```
$> cd sonar/
$> docker-compose -f docker-compose-sonar-local-in-memory up -d
```
### If you have memory issue
```bash
sysctl -w vm.max_map_count=262144
```
### How to use the sonar app?
```
url: http://localhost:9000
user: admin
default Password: admin
my password: Really1
```
