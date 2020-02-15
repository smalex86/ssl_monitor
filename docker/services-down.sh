#/bin/bash

docker-compose --file ../docker/postgresql/docker-compose.yml down
docker-compose --file ../docker/redis/docker-compose.yml down
