#!/usr/bin/env bash

# Change these to match the project's Ansible configuration
PLAYBOOK="nginx-php-mariadb-nodejs.yml"
INVENTORY="inventory/development"
LIMIT="nginx-php-mariadb-nodejs"

# Sanity check
if [ $# -ne 1 ]; then
    echo "$0: usage: provision.sh <environment>"
    exit 1
fi

ENVIRONMENT=$1

if [ "$ENVIRONMENT" == "development" ]
then
	cd /vagrant/ops/packer/ansible
	ansible-playbook -i $INVENTORY --limit $LIMIT $PLAYBOOK
else
	cd /vagrant
	cap $ENVIRONMENT ops:update
	cap $ENVIRONMENT ops:provision
fi
