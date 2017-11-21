#!/usr/bin/env bash

# Fail on error
set -e

sudo apt-get install python-pip
git clone https://github.com/p4lang/p4c-bm.git
cd p4c-bm
sudo pip install -r requirements.txt && sudo pip install -r requirements_v1_1.txt
sudo python setup.py install
