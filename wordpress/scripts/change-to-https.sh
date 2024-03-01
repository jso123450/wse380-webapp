#!/bin/bash

set -a
. ./.env
set +a

sed -i 's/nginx-http/nginx-https/g' wordpress/docker-compose.yml