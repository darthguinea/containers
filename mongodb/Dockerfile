FROM alpine:latest

RUN apk update && \
    apk add mongodb

RUN mkdir -p /data/db

ENTRYPOINT [ "/usr/bin/mongod" ]

EXPOSE "27017"
