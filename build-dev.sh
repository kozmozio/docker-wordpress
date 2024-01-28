#!/bin/bash
clear 

echo "Compose up and build..."

docker-compose -f docker-compose.yml down -d 
docker-compose -f docker-compose.yml up -d --build --remove-orphans 

# Check if all services are up and running
echo "Checking if all services are up and running..."


services=("wordpress" "nginx" "db" "phpmyadmin")


for service in "${services[@]}"
do
    state=$(docker inspect --format '{{.State.Status}}' $service)
    if [ "$state" == "running" ]; then
        echo " ✔ $service is up and running"
    elif [ "$state" == "restarting" ]; then
        echo " X $service is restarting"
    else
        echo " X $service is not running"
    fi
done

# echo "All Services are now up and running √"
