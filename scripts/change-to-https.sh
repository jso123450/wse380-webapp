#!/bin/bash

if [ "$1" != "wordpress" ] && [ "$1" != "academicpages" ]; then
  echo "Usage: $0 [wordpress|academicpages]"
  exit 1
fi

set -a
. ./compose/$1/.env
set +a

# change the mounted volume to use the https nginx configurations
sed -i 's/nginx-http:/nginx-https:/g' compose/$1/docker-compose.yml

# expose port 443 for HTTPS
sed -i 's/^            # - \"443:443\"/            - \"443:443\"/g' compose/$1/docker-compose.yml

# mount the certs vol
sed -i 's/^            # - certbot-etc:\/etc\/letsencrypt/            - certbot-etc:\/etc\/letsencrypt/g' compose/$1/docker-compose.yml
