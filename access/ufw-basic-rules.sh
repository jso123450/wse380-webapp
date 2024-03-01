#!/bin/bash

# default rules
sudo ufw default deny incoming
sudo ufw default allow outgoing

# http rules
# sudo ufw allow in 80/tcp
# sudo ufw allow in 443/tcp

sudo ufw allow in 22/tcp

sudo ufw enable
sudo ufw status verbose