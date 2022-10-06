#!/bin/sh

# write credentials to download packages from private repo
echo "machine github.com login $GIT_USERNAME password $GIT_ACCESS_TOKEN" > /root/.netrc

mkdir -p temp

go mod tidy
go build -o temp/main main.go

echo "done"
tail -f /dev/null