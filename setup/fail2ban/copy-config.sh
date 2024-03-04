#!/bin/bash

sudo cp setup/fail2ban/fail2ban.conf /etc/fail2ban/jail.d/custom.conf
sudo systemctl restart fail2ban

echo "Waiting 5s for fail2ban to restart..."
sleep 5s # wait for fail2ban to start
sudo fail2ban-client status
