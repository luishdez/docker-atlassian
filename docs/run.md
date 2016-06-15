## Run

```sh
docker-compose up
```

## Run manually

```sh
docker run --restart=no --name "jira-software" \
  --publish "8080:8080" \
  --volume "/var/atlassian/jira" \
  --env "CATALINA_OPTS=" \
  luishdez/docker-jira
```

```sh
docker run --restart=no --name "database" \
  --volume "./setup-jira-db.sh:/docker-entrypoint-initdb.d/setup-jira-db.sh" \
  postgres:9.4
```

## Build the image

```sh
docker-compose build
```
