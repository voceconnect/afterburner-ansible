# Afterburner Ansible

Ansible playbooks to configure a finely tuned WordPress stack.

## Requirements

* Ubuntu 12.04
* SSH Access to remote hosts as 'root'
* Ansible

## Setup

1) Clone this repo
2) Run `./install`. (this copies `.sample` files for editing)
3) Edit `group_vars/*`, `hosts` and `ansible.cfg` and to tune to your liking
4) Execute `ansible all -m ping` to ensure Ansible can connect to your hosts
5) Run `ansible-playbook site.yml --extra-vars="importWordPressSQL=yes"`

Visit your applications domain name to view your WordPress install. The `wp-admin` login details:

* Username: **admin**
* Password: **nsgreoheare**

## Roadmap
