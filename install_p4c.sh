#!/usr/bin/env bash

THIS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Fail on error
set -e

# Ubuntu 16.04 Requirements

sudo apt-get install g++ git automake libtool libgc-dev bison flex libfl-dev libgmp-dev libboost-dev libboost-iostreams-dev libboost-graph-dev pkg-config python python-scapy python-ipaddr tcpdump cmake
sudo apt-get install libboost-all-dev libbz2-dev
sudo apt-get install -y doxygen graphviz texlive-full

# Install Protobuf

sudo apt-get install autoconf automake libtool curl make g++ unzip
git clone https://github.com/google/protobuf.git
cd protobuf
git checkout v3.0.2
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

# Install boost-1.57
sudo mkdir /opt/download
cd /opt/download/
sudo wget http://downloads.sourceforge.net/project/boost/boost/1.57.0/boost_1_57_0.tar.gz
sudo tar -vxf boost_1_57_0.tar.gz
cd /opt/download/boost_1_57_0
sudo ./bootstrap.sh
sudo ./b2
sudo ./bjam -j8 variant=release link=static runtime-link=shared threading=multi install --layout=system \
      --prefix=/usr --with-system --with-thread --with-locale --with-atomic --with-coroutine \
      --with-context --with-filesystem --with-program_options --with-regex --with-date_time --with-timer \
      --with-chrono --with-python
cd $THIS_DIR

# Install P4C
git clone --recursive https://github.com/p4lang/p4c.git
cd p4c
mkdir build
cd build
cmake ..
make -j4 && make -j4 check
sudo make install
