#!/bin/bash

sudo cp /var/lib/docker/volumes/wordpress-compose_nginx_logs/_data/access.log ~/wse380-webapp/wordpress-compose/goaccess/access.log
sudo chown ubuntu:ubuntu ~/wse380-webapp/wordpress-compose/goaccess/access.log