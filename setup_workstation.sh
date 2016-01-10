#!/usr/bin/env sh

#FIXME EXTRA_ROLE_PATH duplicates ansible_extra.cfg/roles_path
ANSIBLE_CONFIG=ansible_extra.cfg EXTRA_ROLE_PATH="$(pwd)/../0050_ansible_extra" ansible-playbook site.yml -i hosts -e @vars_work.yml --ask-sudo-pass --tags legacy
