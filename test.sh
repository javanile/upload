#!/bin/bash
set -e

docker-compose up --build --force-recreate -d

## Create a test file to upload
[ -f large_file.zip ] || dd if=/dev/zero of=large_file.zip bs=1G count=1

## Run upload using curl
echo "---[ TEST ]------------------------------------"
curl -F "file=@LICENSE" http://localhost:8080
echo ""
echo "-----------------------------------------------"

## Test if file exists
if [[ -f "files/large_file.zip" ]]; then
  echo "Test passed."
else
  echo "Fail."
fi
