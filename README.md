# Docker NextJS

Image to run NextJS apps in docker

## Quick reference

### Setup

Checkout the repository and run the `make` command in the root directory.
//TODO

### Build the image:

```
docker build -t davidetriso/nextjs:[tagname-dir_name] ./[tagname-dir_name]
```

E.g.:

```
docker build -t davidetriso/nextjs:node-14.15 ./node-14.15
```

### Push image to Docker Hub

```
docker push davidetriso/nextjs:tagname
```

E.g.:

```
docker push davidetriso/nextjs:node-14.15
```

###  Build and push everything

Execute the `./build-and-push.sh` script to build and push all images to Docker Hub at once.

## How to use

Mount your app code in the `/app` dir inside the container using bind mounts; exclude the `node_modules` and `.next` directories, because they will be populated by the image in runtime.

For example, in a compose file add:

```yaml
volumes:
    - ./:/app
    # exclude the node_modules and .next directories with 'empty' mounts
    - /app/node_modules
    - /app/.next
```

By default the image will start a production server.
To start the application in dev mode, set the `ENV` var to `dev`.

For example, in a compose file add:

```yaml
environment:
    ENV: dev
```
