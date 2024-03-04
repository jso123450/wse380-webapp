#!/bin/bash

set -a
. ./components/.env
set +a

# replace the placeholder <IP> string with the IP value from .env for http config
sed -i 's/<IP>/'"$IP"'/g' components/nginx-http/nginx.conf

# replace the placeholder <IP> string with the IP value from .env for https config
sed -i 's/<IP>/'"$IP"'/g' components/nginx-https/nginx.conf