# Docker

A platform for building, shipping, and running application in multiple environments.

## Images and Containers

**Image** is a read-only template of the app used to build a container.
**Container** is actually running the application (an _instance_ of an image).

### Containers vs VMs

Virtual Machines are complete OSs, they are big and slow to start/stop. Containers are smaller and faster, they are not copies of a whole OS.

## Docker Toolbox

- **Docker Client** - manage containers

  - `$ docker images` - list installed (available) images
  - `$ docker rmi <image-id>` - remove image
  - `$ docker rm <container-id>` - remove container, `-v` option removes also the associated volume (only if the host dir was automatically created )
  - `$ docker ps` - list containers, `-a` option shows all (not only running containers)
  - `$ docker run <image-name>` - set up a container
  - `$ docker exec -it <container-id> <command>` to execute a command in the container, e.g. `docker exec -it c4cb6fa51bde /bin/bash`

- **Docker Machine** - manage VMs

  by default there is one machine, called `default`

  `$ docker-machine env <machine-name>` hooks up `$ docker` command to the machine (sets up env variables). This has to be done for any new session.

- **Docker Composer** - container management
- **Docker Kitematic** - GUI
- **VirtualBox** - to run VMs
- **Docker Hub** - Cloud-based repository of images.

## `$ docker run`

`$ docker run <image-name>` - set up a container, if it's not found locally, docker will try to `docker pull` the image from Docker Hub.
  - `-d` start in background
  - `-v` sets up a volume
  - `-w` sets the working directory (from where should the starting command be executed)
  - `-p` sets the port. can map - `-p 8080:3000` (link machine's `8080` port to app's `3000` port)
  - anything after this command is the command to run in the container, e.g.: `$ docker run -p 8080:3000 -v $(pwd):/var/www -w "/var/www" my-node-container npm start`

  nginx example: `$ docker run -p 80:80 kitematic/hello-world-nginx`

## Layered File System and Volumes

- a volume is a special type of directory in a container. Typically a _data volume_
- volumes can be shared and reused among containers
- a volume is really an alias to a folder in the host

`$ docker run -v /var/www <image-name>` will create a volume. To reveal that volume in host system, `$ docker inspect <container-id>` - 'Mounts' section . We can specify that host location with `$ docker run -v /local/path:/var/www <image-name>` (or with `pwd` - `-v $(pwd)/src:/var/www`)

## Dockerfile

contains Docker image build instructions

- `FROM` - defines what the image is based on (e.g. node)
- `RUN` - the commands to run

example:

```
FROM node
COPY . /var/www
ENV NODE_ENV=production
ENV PORT=3000
WORKDIR /var/www
RUN npm install
EXPOSE $PORT
ENTRYPOINT ["node", "server.js"]
```

to build it:

`docker build -t <tag-name>/node .`

## Container linking and networks

- `docker run --name <custom-name>`, `docker run --link <custom-name>`
- `docker network --create <network-name> --driver <driver-name>`, `docker run -net=<network-name>`

## Docker Compose

managing application lifecycle - multiple services

`docker-compose.yml` - defines relationships between services (containers)

```yml
version: '2'
services:
  node:
    build:
      context: .
      dockerfile: node.dockerfile
    ports:
      - "3000:3000"
    networks:
      - nodeapp-network
  mongodb:
    image: mongo
    networks:
      - nodeapp-network
networks:
  nodeapp-network:
    driver: bridge
```

- `$ docker-compose build`
- `$ docker-compose up` - start it all (`-d` to run in background)
- `$ docker-compose down` - stop and remove containers

## Docker Cloud

Managing cloud deployments. Set up on cloud.docker.com.

A Stack is like Docker Compose, but in the cloud.

---
sources:
- [Docker for Web Developers - a pluralsight course](https://app.pluralsight.com/library/courses/docker-web-development/description)
