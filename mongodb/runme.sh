#!/bin/bash

docker system prune -f
docker stop mongodb

docker build -t mongodb .
docker run -v files/data:/data --rm -dt -p 27017:27017 --name mongodb mongodb
