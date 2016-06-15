#!/bin/bash

# setup docker-compose as sudo
mkdir -p /opt/bin
curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /opt/bin/docker-compose
chmod +x /opt/bin/docker-compose
