#!/usr/bin/env bash

# Sanity check
if [ $# -ne 1 ]; then
    echo "$0: usage: deploy.sh <environment>"
    exit 1
fi

ENVIRONMENT=$1

cd /vagrant
cap $ENVIRONMENT deploy
