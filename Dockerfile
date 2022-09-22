# Build go image to any so

# syntax=docker/Dockerfile:1
FROM golang:1.18.2-alpine3.16

WORKDIR /app

ENV GOARCH=amd64
ENV GOOS=linux
ENV CGO_ENABLED=0

COPY ./function/go.mod ./
COPY ./function/go.sum ./
RUN go mod download

COPY ./function/ ./

RUN go build main.go

# copy file from container to local

# docker build -t golang_build .
# docker run --rm --name golang_build_container golang_build
# docker cp golang_build_container:/app/main ./temp
