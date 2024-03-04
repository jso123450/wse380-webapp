#!/bin/bash

set -a
. ./components/.env
set +a

# replace the placeholder <DOMAIN> string with the DOMAIN value from .env for http config
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' components/nginx-http/nginx.conf

# replace the placeholder <DOMAIN> string with the DOMAIN value from .env for https config
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' components/nginx-https/nginx.conf

# uncomment the domain server_name directive
sed -i 's/^    # /    /g' components/nginx-http/nginx.conf