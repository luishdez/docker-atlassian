# Deploy

```sh
docker-compose build wobblecode/docker-confluence
docker-compose up --no-deps -d wobblecode/docker-confluence

docker-compose build wobblecode/docker-jira
docker-compose up --no-deps -d wobblecode/docker-jira
```

Notes: https://docs.docker.com/compose/production/#deploying-changes

## Docker Machine

Notes: https://docs.docker.com/machine/overview/
