#!/usr/bin/env sh

apt-get install software-properties-common python-software-properties
apt-add-repository ppa:ansible/ansible
apt-get update

# Don't use 2.0.0.1 because we hit https://github.com/ansible/ansible/issues/13763
#apt-get install ansible
dpkg -i files/ansible_1.9.4-1ppa~precise_all.deb
