## Define .env files

Copy from .env.dist to `.env` and config your env vars. Do the same for
`.env-backup.dist` in case you want to use the backup features.

## Run

```sh
docker-compose -p atlassian up -d
```

## Run with nginx

```sh
docker-compose -f docker-compose.yml -f docker-compose.nginx.yml -p atlassian up -d
```

## Build the images

```sh
docker-compose build
```
