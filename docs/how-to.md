# How to

## Restart Docker

```sh
docker-compose -p wobblecodeatlassian restart
```

## Run shell with volumes

```sh
docker run -it \
-v wobblecodeatlassian_db:/data/db:rw \
-v wobblecodeatlassian_jira:/data/jira:rw \
-v wobblecodeatlassian_confluence:/data/confluence:rw \
alpine /bin/sh
```

## Clear JIRA Cache

```sh
docker run -it \
-v wobblecodeatlassian_db:/data/db:rw \
-v wobblecodeatlassian_jira:/data/jira:rw \
-v wobblecodeatlassian_confluence:/data/confluence:rw \
alpine rm -rf \
/data/jira/plugins/.bundled-plugins \
/data/jira/plugins/.osgi-plugins
```

## Clear confluence cache

```sh
docker run -it \
-v wobblecodeatlassian_db:/data/db:rw \
-v wobblecodeatlassian_jira:/data/jira:rw \
-v wobblecodeatlassian_confluence:/data/confluence:rw \
alpine rm -rf \
/data/confluence/bundled-plugins \
/data/confluence/plugins-cache \
/data/confluence/plugins-osgi-cache \
/data/confluence/plugins-temp \
/data/confluence/bundled-plugins_language
```
