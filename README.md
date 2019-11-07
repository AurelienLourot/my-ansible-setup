# My Ansible setup

This is the [Ansible](http://www.ansible.com) setup I use to provision all my developer machines.
Feel free to use it as an example and reuse any part of it.

## Install Ansible on Ubuntu

```
$ sudo ./install_ansible.sh
```

## Setup machines

I usually call the `setup.sh` script (without `sudo`) which is a simple wrapper around
`ansible-playbook`.
