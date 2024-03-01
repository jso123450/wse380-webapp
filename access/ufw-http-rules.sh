#!/bin/bash

# http rules
sudo ufw allow in 80/tcp
sudo ufw allow in 443/tcp

sudo ufw enable
sudo ufw status verbose
