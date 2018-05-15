
# Dol Push Notification
The is a webservices that allows enterpise to register IOS and Android applications and allow them to send push notification to devices.


## Setup using docker

### Development Environment
#### (We assume that you have already installed docker or use this [how to install docker link](https://docs.docker.com/machine/install-machine/#install-bash-completion-scripts))

```
docker run --name ens-postgres -e POSTGRES_PASSWORD=mysecretpasswor -d postgres
```

#### Then run the following commands to bring up the instances after cloning the code locally

    docker-compose up

#### Once the web and db instances are up without any issues create the db and run the migrations

    docker-compose exec web bundle exec rake db:create
    docker-compose exec web bundle exec rake db:migrate
