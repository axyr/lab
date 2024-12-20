#!/usr/bin/env bash

pwd=$(basename "$PWD")

set -e
set -o pipefail -o noclobber -o nounset

set -o allexport
source ./.env.example
source ./.env
set +o allexport

fresh=false

for arg in "$@"; do
    if [[ "$arg" == "--fresh" ]]; then
        fresh=true
        break
    fi
done


if [ -z "$DB_PASSWORD" ]; then
  echo "Error: DB_PASSWORD env variable is not set."
  exit 1
fi

if [[ "$fresh" == true ]]; then
    containers=("mysql" "redis" "php" "nginx")

    for container in "${containers[@]}"; do
        container_name="${pwd}_${container}"
    
        if [[ $(docker ps -a -q -f name="$container_name") ]]; then
            echo "Stopping and removing existing container: $container_name"
            docker stop "$container_name" >/dev/null 2>&1
            docker rm "$container_name" >/dev/null 2>&1
        else
            echo "Container $container_name does not exist."
        fi
    done
fi    

docker compose -f docker-compose.yml up -d --build

echo "Installing composer packages"
docker exec -it ${pwd}_php composer install

echo "Running database migrations"
docker exec -it ${pwd}_php php artisan migrate

