# Docker NextJS

Image to run NextJS apps in docker

## Quick reference

### Build the image:

```
docker build -t davidetriso/nextjs:[tagname-dir_name] ./[tagname-dir_name]
```

E.g.:

```
docker build -t davidetriso/nextjs:node-14.5 ./node-14.5
```

### Push image to Docker Hub

```
docker push davidetriso/nextjs:tagname
```

E.g.:

```
docker push davidetriso/nextjs:node-14.5
```

## How to use

Mount your app code in the `/app` dir inside the container using bind mounts; exclude the `node_modules` and `.next` directories, because they will be recreated by the image in runtime.

For example, in a compose file add:

```yaml
volumes:
    - ./:/app
    # exclude the node_modules and .next directories with 'empty' mounts
    - /app/node_modules
    - /app/.next
```

