#!/usr/bin/env sh

# Generic ansible-playbook wrapper implementing the `setup_*.sh` scripts.
#
# args:
#   additional `ansible-playbook` args

tail -F --pid=$$ --lines=0 ansible_apt.log 2> /dev/null &

#FIXME EXTRA_ROLE_PATH duplicates ansible_extra.cfg/roles_path
ANSIBLE_CONFIG=ansible_extra.cfg EXTRA_ROLE_PATH="$(pwd)/../0050_ansible_extra" ansible-playbook site.yml -i hosts --ask-sudo-pass --timeout=10 "$@"
