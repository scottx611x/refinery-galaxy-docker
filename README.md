# refinery-galaxy-docker

A DockerFile for running a Galaxy instance locally for Refinery Development

### Pre-reqs:
- `docker`


### Running from scratch:
``` bash
$ docker build -t refinery-docker-local .
$ docker run -d -p 8080:80 -p 8021:21 -p 8022:22 refinery-docker-local
```

### Running the pre-built image:
``` bash
$ docker run -d -p 8080:80 -p 8021:21 -p 8022:22 scottx611x/refinery-galaxy-docker
```

### Integration with a locally running Refinery instance:
- Start the docker container with one of the above methods 
    - Ensure that Galaxy is accessible at: http://localhost:8080
    - Login (u: `admin` p: `admin`) and make sure the two test workflows are installed @ http://localhost:8080/workflow
- Follow [these steps to configure your Refinery Instance for use with Galaxy](https://github.com/refinery-platform/refinery-platform/wiki/setting-up-newer-galaxy#configure-refinery-for-your-galaxy-instance)
    - Note that Galaxy Instance DB Entry should look like this:
        ```
        Base URL: http://192.168.50.1:8080
        Data url: datasets
        Api url: api
        Api key: admin
        Description: Galaxy 17.05 Local Docker
        ```
- [Load the test workflows into your Refinery instance](https://github.com/refinery-platform/refinery-platform/wiki/Annotating-&-Importing-Refinery-Tools#load-workflows)
