#!/bin/bash

set -a
. ./components/.env
set +a

# change the mounted volume to use the https nginx configurations
sed -i 's/nginx-http/nginx-https/g' components/docker-compose.yml

# expose port 443 for HTTPS
sed -i 's/^            # - \"443:443\"/            - \"443:443\"/g' components/docker-compose.yml