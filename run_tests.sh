#!/usr/bin/env bash

set -e
echo "" > coverage.txt

for d in $(go list ./... | grep -Ev '(vendor|config|mocks|docs|_/)'); do
    go test -race -coverprofile=profile.out -covermode=atomic $d
    if [ -f profile.out ]; then
        cat profile.out >> coverage.txt
        rm profile.out
    fi
done