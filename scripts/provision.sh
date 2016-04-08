#!/usr/bin/env bash

# Change these to match the project's Ansible configuration
PLAYBOOK_DIR="/vagrant/ops/packer/ansible"
PLAYBOOK="playbook.yml"
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
	cd $PLAYBOOK_DIR
	ansible-playbook -i $INVENTORY --limit $LIMIT $PLAYBOOK
else
	cd /vagrant
	cap $ENVIRONMENT ops:update
	cap $ENVIRONMENT ops:provision
fi
