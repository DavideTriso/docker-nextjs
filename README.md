# Docker NextJS

Image to run NextJS apps in docker.

## Quick reference

### Build the image:

```
docker buildx build --tag davidetriso/nextjs[tagname-dir_name] -o type=image --platform=linux/arm64,linux/amd64 ./[tagname-dir_name]
```

E.g.:

```
docker buildx build --tag davidetriso/nextjs:node-14.15 -o type=image --platform=linux/arm64,linux/amd64 ./node-14.15
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

Mount your app code in the `/app` dir inside the container using bind mounts; the `node_modules` and `.next` directories can be excluded, because they will be populated by the image in runtime.

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

> NOTE: When the container is launched, and no `package.json` file is found in the `/app` directory, the entrypoint script will trigger the creation of a new Next.js application with default configurations (applicable for images running Node versions >= 18.18).

## License

Licensed under the terms of the [MIT](LICENSE) license.