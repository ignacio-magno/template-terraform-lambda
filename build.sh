#!/bin/sh

# write credentials to download packages from private repo
echo "machine github.com login $GIT_USERNAME password $GIT_ACCESS_TOKEN" > /root/.netrc

mkdir -p temp

chmod 777 temp

go mod tidy
go build -o temp/main main.go

echo "done"

# active to logs without terraform
#tail -f /dev/null