#!/usr/bin/env bash

# Fail on error
set -e

# Install P4C
git clone --recursive https://github.com/p4lang/p4c.git
cd p4c
mkdir build
cd build
cmake ..
make -j4 && make -j4 check
sudo make install
