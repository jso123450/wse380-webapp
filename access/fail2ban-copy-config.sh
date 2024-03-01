#!/bin/bash

sudo cp fail2ban.conf /etc/fail2ban/jail.d/custom.conf
sudo systemctl restart fail2ban
sudo fail2ban-client status