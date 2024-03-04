#!/bin/bash

# default rules
sudo ufw default deny incoming
sudo ufw default allow outgoing

## http - allow later
sudo ufw deny in 80/tcp
sudo ufw deny in 443/tcp

## ssh
sudo ufw allow in 22/tcp

sudo ufw enable
sudo ufw status verbose
