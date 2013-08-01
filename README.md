# Afterburner Ansible

Ansible playbooks to configure a finely tuned WordPress stack.

## Requirements

* Ubuntu 12.04
* SSH Access to remote hosts as 'root'
* [Ansible](http://www.ansibleworks.com/docs/) - if you are new to Ansible, read the [Getting Started](http://www.ansibleworks.com/docs/gettingstarted.html) guide. If you want a quick start, [run Ansible from a checkout](http://www.ansibleworks.com/docs/gettingstarted.html#running-from-checkout), source the environment, then `cd` into your clone of the `afterburner-ansible` repo and continue with the Afterburner setup instructions.

## Setup

1) Clone this repo
2) Run `./install`. (this copies `.sample` files for editing)
3) Edit `group_vars/*`, `hosts` and `ansible.cfg` and to tune to your liking
4) Execute `ansible all -m ping` to ensure Ansible can connect to your hosts
5) Run `ansible-playbook site.yml --extra-vars="importWordPressSQL=yes"`

Visit your applications domain name to view your WordPress install. The `wp-admin` login details:

* Username: **admin**
* Password: **nsgreoheare**

## What is Afterburner?
Read more about the project at http://afterburner.voceplatforms.com This repo relates to the [server setup](http://afterburer.voceplatforms.com/server-setup.html) covered on the Afterburner website. It consists of a set of Ansible playbooks geared towards a highly tuned WordPress stack running NGINX, PHP-FPM, Memcached and Percona MySQL.

## What Afterburner Doesn't Do
There are a few things that Afterburner doesn't do. Since many of these things are handled by hosting providers, and can vary greatly, we leave these to you to address.

* Backups
* Firewall configuration
* Load balancing

Afterburner is setup to configure a single server. Web server and database are on one box. However, Ansible is built to work with as many servers as you like. The files in `/group_vars/` are where you would begin.

##
## Roadmap
