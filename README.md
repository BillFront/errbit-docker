# Errbit Docker image

Dockerfile and repository for running [errbit] in a docker container.

The short version of how to get it running:
```
git clone https://github.com/BillFront/errbit-docker.git
docker-compose run errbit rake errbit:bootstrap
docker-compose up
```

And then point your browser at [localhost:3000](http://localhost:3000)

## Configuration

The image supports configuration using environment variables.
See the errbit documentation for list of [available variables].

### Changing the port

You don't need to change the port inside the container because you can
just change what the port is published as while still keeping the same
port inside the container. Edit the [docker-compose.yml] for that.

## Upgrade

To upgrade you need to replace the errbit container and upgrade the database.
```
docker-compose down
git pull
docker-compose build
docker-compose run errbit rake db:migrate db:mongoid:create_indexes db:mongoid:remove_undefined_indexes
docker-compose up
```

[errbit]: http://errbit.com/
[available variables]: https://github.com/errbit/errbit/blob/master/docs/configuration.md
[docker-compose.yml]: /docker-compose.yml
