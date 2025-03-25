#!/bin/bash

sudo cp /var/lib/docker/volumes/wordpress_nginx_logs/_data/access.log ~/wse380-webapp/compose/wordpress/goaccess/access.log
sudo chown ubuntu:ubuntu ~/wse380-webapp/compose/wordpress/goaccess/access.log