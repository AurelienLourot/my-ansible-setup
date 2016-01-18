#!/usr/bin/env sh

set -xe

apt-get update
apt-get install software-properties-common python-software-properties
apt-add-repository ppa:ansible/ansible
apt-get update

# Don't use 2.0.0.1 because we hit https://github.com/ansible/ansible/issues/13763
#apt-get install ansible
apt-get install python-support python-jinja2 python-yaml python-paramiko python-httplib2 sshpass
dpkg -i files/ansible_1.9.4-1ppa~precise_all.deb
