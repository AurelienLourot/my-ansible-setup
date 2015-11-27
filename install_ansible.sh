#!/usr/bin/env sh

apt-get install software-properties-common python-software-properties
apt-add-repository ppa:ansible/ansible
apt-get update
apt-get install ansible
