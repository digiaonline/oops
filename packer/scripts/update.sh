#!/bin/bash -eux

apt-get update
apt-get -y upgrade

# ensure some packages that are often needed are installed
apt-get -y install linux-headers-generic curl rsync ca-certificates software-properties-common
