# How to

## Run shell with volumes

```sh
docker run -it \
-v atlassian_db:/data/db:rw \
-v atlassian_jira:/data/jira:rw \
-v atlassian_confluence:/data/confluence:rw \
alpine /bin/sh
```

## Clear JIRA Cache

```sh
docker run -it \
-v atlassian_db:/data/db:rw \
-v atlassian_jira:/data/jira:rw \
-v atlassian_confluence:/data/confluence:rw \
alpine rm -rf \
/data/jira/plugins/.bundled-plugins \
/data/jira/plugins/.osgi-plugins
```

## Clear confluence cache

```sh
docker run -it \
-v atlassian_db:/data/db:rw \
-v atlassian_jira:/data/jira:rw \
-v atlassian_confluence:/data/confluence:rw \
alpine rm -rf \
/data/confluence/bundled-plugins \
/data/confluence/plugins-cache \
/data/confluence/plugins-osgi-cache \
/data/confluence/plugins-temp \
/data/confluence/bundled-plugins_language
```
