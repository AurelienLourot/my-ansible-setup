#!/usr/bin/env sh

ansible-playbook site.yml -i hosts -e @vars_home.yml --ask-sudo-pass --tags legacy
