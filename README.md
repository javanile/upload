# upload

The simplest docker file uploader. It allows to upload a file or a list files.

## Adding to docker compose
To add the file uploader service with all default settings to your mu.semte.ch project add the following snippet to your docker-compose.yml file:
```

services:
  upload:
    image: javanile/upload
    environment:
      - UPLOAD_SECRET=mysecret
    ports:
      - 8080:80
    volumes:
      - ./files:/files
```

## Options
This micro-service is used to store file on server.

In addtion to those you who wish to can also set the following variables:
* UPLOAD_SECRET: The value of the key required to post file

## exmaple of a docker-compose.yml set up
This set up shows the file uploader service with all variables set and the upload service connected to the delta-service
```
  upload:
    image: javanile/upload
    environment:
      - UPLOAD_SECRET=secret1234
    ports:
      - 8080:80
    volumes:
      - ./uploads:/files
```


## example of usage
This is how the service could be used with a curl call if it is put in a docker-compose.yml file as uploader:
```
curl -H "Authorization: Bearer secret1234" -F "@large_file.zip" http://localhost:8080
```

## Testing

```bash
bash test.sh
```

## How to contribute

Get detailed information on thie file [CONTRIBUTE.md](CONTRIBUTE.md)

## License

Creative Commons Attribution 3.0 Unported [LICENSE](LICENSE)

