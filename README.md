Docker PM2 Routify
========
powered by pm2:latest-stretch image

[Routify][1] Routes for Svelte, automated by your file structure.



Available tags you can use: dev



## docker-compose.yml

```yaml
version: '2'
services:
  sapper:
    image: aamservices/pm2-routify:latest
    restart: unless-stopped
    volumes:
      - data:/usr/src/app
    networks:
      - internal
    ports:
      - 3000
volumes:
  data:
    driver: local
```


[1]: https://routify.dev/
