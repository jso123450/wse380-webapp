#!/bin/bash

# sudo apt-get install build-essential
sudo apt-get install libncurses-dev
# wget -O ~/goaccess-1.9.1.tar.gz https://tar.goaccess.io/goaccess-1.9.1.tar.gz
# tar -xzvf ~/goaccess-1.9.1.tar.gz -C ~/
cd ~/goaccess-1.9.1/
./configure --enable-utf8
make