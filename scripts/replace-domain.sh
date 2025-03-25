#!/bin/bash

if [ "$1" != "wordpress" ] && [ "$1" != "academicpages" ]; then
  echo "Usage: $0 [wordpress|academicpages]"
  exit 1
fi

set -a
. ./compose/$1/.env
set +a

# replace the placeholder <DOMAIN> string with the DOMAIN value from .env for http config
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' compose/$1/mynginx/nginx-http/nginx.conf

# replace the placeholder <DOMAIN> string with the DOMAIN value from .env for https config
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' compose/$1/mynginx/nginx-https/nginx.conf

# uncomment the domain server_name directive
sed -i 's/^    # /    /g' compose/$1/mynginx/nginx-http/nginx.conf