#!/bin/bash

docker-compose up -d

curl -H "Auth..." -F @large_file.zip  http://localhost:8080

if [[ -f "files/large_file.zip" ]]; then
  echo "Test passed."
else
  echo "Fail."
fi

