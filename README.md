# Introduction

Operating System: Ubuntu 14.04, 16.04.

This repository maintains the scripts used to install P4 environment automatically, including:
- `install_bmv2.sh` - installing "behaviour-model", P4 software switch;
- `install_p4c-bm.sh` - installing "p4c-bm", P4-14 front-end compiler;
- `install_p4c.sh` - installing state-of-the-art P4 front-end compiler "p4c".

I recommend you to execute these scripts under `/home/xxx/` to avoid unnecessary path problems.

# CI Test: [![Build Status](https://www.travis-ci.org/Wasdns/p4Installer.svg?branch=master)](https://www.travis-ci.org/Wasdns/p4Installer)

I didn't add the examination of `install_p4c.sh` to CI tests because of timeout. 

If you get stuck with some exceptions as using `install_p4c.sh`, please let me know.

# Questions

Mail: wasdnsxchen@gmail.com
