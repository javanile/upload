#!/bin/bash

docker-compose up -d

## Create a test file to upload
dd if=/dev/zero of=large_file.zip bs=1G count=1

## Run upload using curl
curl -H "Authorization: Bearer mysecret" -F @large_file.zip http://localhost:8080

## Test if file exists
if [[ -f "files/large_file.zip" ]]; then
  echo "Test passed."
else
  echo "Fail."
fi
