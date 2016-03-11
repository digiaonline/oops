#!/usr/bin/env bash

# Sanity check
if [ $# -lt 1 ]; then
    echo "$0: usage: deploy.sh <environment> [ <branch|tag|revision> ]"
    exit 1
fi

ENVIRONMENT=$1
export BRANCH=$2

cd /vagrant
cap $ENVIRONMENT deploy
