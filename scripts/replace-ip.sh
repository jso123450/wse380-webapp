#!/bin/bash

if [ "$1" != "wordpress" ] && [ "$1" != "academicpages" ]; then
  echo "Usage: $0 [wordpress|academicpages]"
  exit 1
fi

set -a
. ./compose/$1/.env
set +a

# replace the placeholder <IP> string with the IP value from .env for http config
sed -i 's/<IP>/'"$IP"'/g' compose/$1/mynginx/nginx-http/nginx.conf

# replace the placeholder <IP> string with the IP value from .env for https config
sed -i 's/<IP>/'"$IP"'/g' compose/$1/mynginx/nginx-https/nginx.conf
