#!/bin/bash

if [ "$1" != "wordpress" ] && [ "$1" != "academicpages" ]; then
  echo "Usage: $0 [wordpress|academicpages]"
  exit 1
fi

DIR_BASE=~/wse380-webapp

set -a
. $DIR_BASE/compose/$1/.env
set +a

# replace the placeholder <IP> string with the IP value from .env for http config
echo "Replacing placeholder IP for http config"
sed -i 's/<IP>/'"$IP"'/g' $DIR_BASE/compose/$1/mynginx/nginx-http/nginx.conf

# replace the placeholder <IP> string with the IP value from .env for https config
echo "Replacing placeholder IP for https config"
sed -i 's/<IP>/'"$IP"'/g' $DIR_BASE/compose/$1/mynginx/nginx-https/nginx.conf

echo "Success!"