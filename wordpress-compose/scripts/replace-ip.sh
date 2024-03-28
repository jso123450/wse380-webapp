#!/bin/bash

set -a
. ./wordpress-compose/.env
set +a

# replace the placeholder <IP> string with the IP value from .env for http config
sed -i 's/<IP>/'"$IP"'/g' wordpress-compose/mynginx/nginx-http/nginx.conf

# replace the placeholder <IP> string with the IP value from .env for https config
sed -i 's/<IP>/'"$IP"'/g' wordpress-compose/mynginx/nginx-https/nginx.conf