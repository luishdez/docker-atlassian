# Vagrant + Docker Machine

In Mac use this command to manage the host from docker-machine.

```sh
docker-machine create -d=generic \
--generic-ip-address="192.168.80.100" \
--generic-ssh-key="/Users/$USER/.vagrant.d/insecure_private_key" \
--generic-ssh-user="core" docker-atlassian

# Export docker envs
eval "$(docker-machine env docker-atlassian)"
```
Now you can manage docker outside vagrant in your terminal as usual.

> Vagrant users: You will have to perform the `docker-compose up` within vagrant
> in `/var/docker/` otherwise docker-compose won't find `setup-jira-db.sh` and
> it will be mounted as a directory so Postgres won't be setup.
