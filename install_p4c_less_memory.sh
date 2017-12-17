#!/usr/bin/env bash

# Fail on error
set -e

# Ubuntu 16.04 Requirements

sudo apt-get install g++ git automake libtool libgc-dev bison flex libfl-dev libgmp-dev libboost-dev libboost-iostreams-dev libboost-graph-dev pkg-config python python-scapy python-ipaddr tcpdump cmake

# Install Protobuf

sudo apt-get install autoconf automake libtool curl make g++ unzip
git clone https://github.com/google/protobuf.git
cd protobuf
sudo ./autogen.sh && sudo ./configure && make && make check
sudo make install && sudo ldconfig
cd ..

# Install gcc/g++ 4.9
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-4.9
sudo apt-get install g++-4.9
ln -s /usr/bin/g++-4.9 /usr/bin/g++ -f
ln -s /usr/bin/gcc-4.9 /usr/bin/gcc -f

# Install cmake 3.2
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:george-edison55/cmake-3.x
sudo apt-get update
sudo apt-get install cmake

# Install P4C
git clone --recursive https://github.com/p4lang/p4c.git
cd p4c
mkdir build
cd build
cmake ..
make -j2
make -j2 check
sudo make install
