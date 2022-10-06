#!/bin/sh

go mod tidy

mkdir -p temp
go build -o temp/main main.go

echo "done"