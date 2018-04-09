#!/bin/bash

LOCATION=$(pwd)

docker system prune -f

RUNNING=$(docker ps -a | grep 'mongodb$' | awk '{print $1}')
if [ ${RUNNING} != "" ]
then
    docker stop ${RUNNING}
fi

docker build -t mongodb .
docker run --rm -dt -p 27017:27017 -v ${LOCATION}/files/data/:/data --name mongodb mongodb
