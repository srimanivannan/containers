### Create Mongodb and required settings

This compose file will do below things
- create the root username and password and default to admin database using environment variables.
- Passwords are stored in a file using secrets fetures provided by docker file version 3.6
- domain user, collection and sample insert data are done in init-settings.js

```bash
    docker-compose up
```