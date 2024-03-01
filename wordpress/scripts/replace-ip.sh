#!/bin/bash

set -a
. ./.env
set +a

sed -i 's/<IP>/'"$IP"'/g' nginx-http/nginx.conf
sed -i 's/<IP>/'"$IP"'/g' nginx-https/nginx.conf