#/bin/bash

docker-compose --file ../docker/postgresql/docker-compose.yml up -d
docker-compose --file ../docker/redis/docker-compose.yml up -d
