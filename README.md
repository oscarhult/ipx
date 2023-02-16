# ipx dockerized

https://github.com/unjs/ipx

```sh
docker run \
  --detach \
  --name ipx \
  --memory 1g \
  --restart unless-stopped \
  --publish 3000:3000/tcp \
  --volume ipx:/usr/app/image \
  ghcr.io/oscarhult/ipx
```
