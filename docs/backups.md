# Backups

## Perform a Backup

You can perform a backup and store it into S3 using the next command. You have
to define your KEY IDs and settings in `.env-backup`

```sh
docker run --rm \
--env-file .env-backup \
-v atlassian_db:/data/db:ro \
-v atlassian_jira:/data/jira:ro \
-v atlassian_confluence:/data/confluence:ro \
--name dockup frekele/helicopterizer:latest backup --tarball
```

## Restore a backup

You should stop your containers to restore the data into the docker volumes.

If you use another project name just change the name of the mounted volumes.

```sh
docker run --rm \
--env-file .env-backup \
-e BACKUP_VERSION="2016-06-15T14:13:13Z" \
-e CLEAN_DATA_BEFORE_RESTORE=false \
-v atlassian_db:/data/db:rw \
-v atlassian_jira:/data/jira:rw \
-v atlassian_confluence:/data/confluence:rw \
--name dockup frekele/helicopterizer:latest restore --tarball
```
