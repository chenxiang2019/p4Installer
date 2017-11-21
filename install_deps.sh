#!/usr/bin/env bash

# Fail on error
set -e

sudo apt-get update

# Install vim and git
sudo apt-get install vim git

# Install  mininet from source codes
git clone https://github.com/mininet/mininet.git
cd mininet/
sudo ./util/install.sh -a
