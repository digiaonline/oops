#!/bin/bash -eux
# install ansible
add-apt-repository ppa:ansible/ansible
/usr/bin/apt-get update
/usr/bin/apt-get -y install ansible
