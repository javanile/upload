#!/bin/bash

docker-compose up -d

dd if=/dev/zero of=large_file.zip bs=1G count=1

curl -H "Auth..." -F @large_file.zip  http://localhost:8080

if [[ -f "files/large_file.zip" ]]; then
  echo "Test passed."
else
  echo "Fail."
fi

