#!/bin/bash

if [ "$1" != "wordpress" ] && [ "$1" != "academicpages" ]; then
  echo "Usage: $0 [wordpress|academicpages]"
  exit 1
fi

DIR_BASE=~/wse380-webapp

set -a
. $DIR_BASE/compose/$1/.env
set +a

# replace the placeholder <DOMAIN> string with the DOMAIN value from .env for http config
echo "Replacing placeholder domain for http config"
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' $DIR_BASE/compose/$1/mynginx/nginx-http/nginx.conf

# replace the placeholder <DOMAIN> string with the DOMAIN value from .env for https config
echo "Replacing placeholder domain for http config"
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' $DIR_BASE/compose/$1/mynginx/nginx-https/nginx.conf

# uncomment the domain server_name directive
echo "Uncommenting http config server_name directive"
sed -i 's/^    # /    /g' $DIR_BASE/compose/$1/mynginx/nginx-http/nginx.conf

echo "Success!"