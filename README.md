``` bash
$ docker build -t refinery-docker-local .
$ docker run -d -p 8080:80 -p 8021:21 -p 8022:22 refinery-docker-local
```