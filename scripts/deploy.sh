#!/usr/bin/env bash

# Sanity check
if [ $# -lt 1 ]; then
    echo "$0: usage: deploy.sh <environment> [ <branch|tag|revision> ]"
    exit 1
fi

ENVIRONMENT=$1

# Capistrano defaults to "master" if BRANCH is not set
if [ $# -eq 2 ]; then
	export BRANCH=$2
fi

cd /vagrant
cap $ENVIRONMENT deploy
