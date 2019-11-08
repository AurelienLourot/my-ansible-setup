#!/usr/bin/env bash

set -xe

apt-get update
apt-get install software-properties-common

# Not available on Ubuntu 18.04 anymore:
apt-get install python-software-properties || true

apt-add-repository ppa:ansible/ansible
apt-get update

# Don't use 2.0.0.1 because we hit https://github.com/ansible/ansible/issues/13763
#apt-get install ansible

# Not available on Ubuntu 18.04 anymore:
function install_python_support_manually {
  # See https://askubuntu.com/questions/766169/why-no-more-python-support-in-16-04
  pushd /tmp
  wget http://launchpadlibrarian.net/109052632/python-support_1.0.15_all.deb
  dpkg -i python-support_1.0.15_all.deb
  popd
}
apt-get install python-support || install_python_support_manually

apt-get install python-jinja2 python-yaml python-paramiko python-httplib2 sshpass
dpkg -i files/ansible_1.9.4-1ppa~precise_all.deb
apt-mark hold ansible
