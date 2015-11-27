#!/usr/bin/env sh

ANSIBLE_CONFIG=ansible_work.cfg ansible-playbook site.yml -i hosts -e @vars_work.yml --ask-sudo-pass --tags legacy
