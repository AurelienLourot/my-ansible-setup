#!/usr/bin/env sh

ansible-playbook site.yml -i hosts -e @vars_vps.yml --ask-sudo-pass
