#!/bin/bash
set -e

docker-compose up --build --force-recreate -d
[[ -f "files/large_file.zip" ]] && docker-compose run --rm upload rm -fr /files/large_file.zip

## Create a test file to upload
[ -f large_file.zip ] || dd if=/dev/zero of=large_file.zip bs=1G count=1

## Run upload using curl
echo "---[ TEST ]----------------------------------------------------"
curl -H "Secret: secret" -F "file=@large_file.zip" http://localhost:8080
echo "---------------------------------------------------------------"

## Test if file exists
if [[ -f "files/large_file.zip" ]]; then
  echo "Test passed."
else
  echo "Fail."
fi
