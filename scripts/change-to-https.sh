#!/bin/bash

if [ "$1" != "wordpress" ] && [ "$1" != "academicpages" ]; then
  echo "Usage: $0 [wordpress|academicpages]"
  exit 1
fi

DIR_BASE=~/wse380-webapp

set -a
. $DIR_BASE/compose/$1/.env
set +a

# change the mounted volume to use the https nginx configurations
echo "Changing the mounted nginx volume to https"
sed -i 's/nginx-http:/nginx-https:/g' $DIR_BASE/compose/$1/docker-compose.yml

# expose port 443 for HTTPS
echo "Exposing port 443"
sed -i 's/^            # - \"443:443\"/            - \"443:443\"/g' $DIR_BASE/compose/$1/docker-compose.yml

# mount the certs vol
echo "Mounting the certs volume"
sed -i 's/^            # - certbot-etc:\/etc\/letsencrypt/            - certbot-etc:\/etc\/letsencrypt/g' $DIR_BASE/compose/$1/docker-compose.yml

echo "Success!"