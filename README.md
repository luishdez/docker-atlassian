
# Docker JIRA Software

## Features

- [x] Setup with Postgres link
- [x] Postgres JIRA and Confluence auto config
- [x] Backup and restoring to/from S3

## Docker Machine

In Mac use this command to manage the host from docker-machine.

```sh
docker-machine create -d=generic \
--generic-ip-address="192.168.80.100" \
--generic-ssh-key="/Users/$USER/.vagrant.d/insecure_private_key" \
--generic-ssh-user="core" docker-atlassian

# Export docker envs
eval "$(docker-machine env docker-atlassian)"
```
Now you can manage docker outside vagrant

## Run with docker-compose

> Vagrant users: You will have to perform the `docker-compose up` within vagrant
> in `/var/docker/` otherwise docker-compose won't find `setup-jira-db.sh` and
> it will be mounted as a directory so Postgres won't be setup.

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

## Backup

```sh
docker run --rm \
--env-file .env-backup \
-v docker_db:/data/db:ro \
-v docker_jira:/data/jira:ro \
-v docker_confluence:/data/confluence:ro \
--name dockup frekele/helicopterizer:latest backup --tarball
```

## Restore

You should your containers to restore

```sh
docker run --rm \
--env-file .env-backup \
-e BACKUP_VERSION="2016-06-13T14:39:57Z" \
-e CLEAN_DATA_BEFORE_RESTORE=true \
-v docker_db:/data/db:rw \
-v docker_jira:/data/jira:rw \
-v docker_confluence:/data/confluence:rw \
--name dockup frekele/helicopterizer:latest restore --tarball
```

## Build the image

```sh
docker-compose build
```
