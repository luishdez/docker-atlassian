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
--name backup helicopterizer backup --tarball
```

## Run with schedule

Define in your .env-backup a var for cron Eg: `CRON_SCHEDULE='0 */12 * * *'`

Then run docker as daemon

```sh
docker run -d \
--env-file .env-backup \
-v atlassian_db:/data/db:ro \
-v atlassian_jira:/data/jira:ro \
-v atlassian_confluence:/data/confluence:ro \
--name backup frekele/helicopterizer backup --tarball
```

## Restore a backup

You should stop your containers to restore the data into the docker volumes.

If you use another project name just change the name of the mounted volumes.

```sh
docker run --rm \
--env-file .env-backup \
-e CLEAN_DATA_BEFORE_RESTORE=false \
-v atlassian_db:/data/db:rw \
-v atlassian_jira:/data/jira:rw \
-v atlassian_confluence:/data/confluence:rw \
--name backup frekele/helicopterizer:latest restore --tarball
```
