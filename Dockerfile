# Build go image to any so
# syntax=docker/Dockerfile:1
FROM golang:1.18.2-alpine3.16

WORKDIR /app

RUN apk update && apk add bash

RUN echo hola
# copy file from container to local

ENTRYPOINT ["./build.sh"]

# docker build -t golang_build .
# docker run --rm --name golang_build_container golang_build
# docker cp golang_build_container:/app/main ./temp
