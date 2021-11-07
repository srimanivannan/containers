### How to build and run redis container?
```
$> cd redis/
$> docker-compose -f docker-compose-redis-local.yml up -d
```
### How to use the redis database
#### You can use any client tool. For example, tableplus or rdcli
```
Host: localhost
Port: 6379
Password: nopassword litertally
user: nousername litertally
```
#### rdcli installation
```
$> npm install -g redis-cli
$> rdcli
$> ping
$> set testkey testvalue
$> get testkey
```
