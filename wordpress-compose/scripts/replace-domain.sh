#!/bin/bash

set -a
. ./wordpress-compose/.env
set +a

# replace the placeholder <DOMAIN> string with the DOMAIN value from .env for http config
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' wordpress-compose/nginx-http/nginx.conf

# replace the placeholder <DOMAIN> string with the DOMAIN value from .env for https config
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' wordpress-compose/nginx-https/nginx.conf

# uncomment the domain server_name directive
sed -i 's/^    # /    /g' wordpress-compose/nginx-http/nginx.conf