#!/bin/bash

set -a
. ./wordpress-compose/.env
set +a

# change the mounted volume to use the https nginx configurations
sed -i 's/nginx-http/nginx-https/g' wordpress-compose/docker-compose.yml

# expose port 443 for HTTPS
sed -i 's/^            # - \"443:443\"/            - \"443:443\"/g' wordpress-compose/docker-compose.yml