#!/bin/bash

set -a
. ./.env
set +a

sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' nginx-http/nginx.conf
sed -i 's/<DOMAIN>/'"$DOMAIN"'/g' nginx-https/nginx.conf

sed -i 's/^    # /    /g' nginx-http/nginx.conf