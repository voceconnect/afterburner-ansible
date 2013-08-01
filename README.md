# Afterburner Ansible

Ansible playbooks to configure a finely tuned WordPress stack.

## What is Afterburner?

Read more about the project at http://afterburner.voceplatforms.com This repo relates to the [server setup](http://afterburer.voceplatforms.com/server-setup.html) covered on the Afterburner website. It consists of a set of Ansible playbooks geared towards a highly tuned WordPress stack running NGINX, PHP-FPM, Memcached and Percona MySQL.

## Requirements

* Ubuntu 12.04
* SSH Access to remote hosts as a user with sudo access
* [Ansible](http://www.ansibleworks.com/docs/) - if you are new to Ansible, read the [Getting Started](http://www.ansibleworks.com/docs/gettingstarted.html) guide. If you are using Mac OS X and want a quick start, read the Quick Start section below.

## Setup

Afterburner sets up a WordPress installation for http://afterburner-test.dev on your server. If you want to use this domain to see it in action, update your `/etc/hosts` file or DNS to point the domain **afterburner-test.dev** to the IP of the server where you will set this up.

1. Clone this repo and `cd afterburner-ansible`
2. Run `./install`. (this copies `.sample` files for editing)
3. Edit `group_vars/all` and update `wpAdminEmail` to your email.
4. If you are setting up the default domain, `afterburner-test.dev`, no other changes are needed, though you may want to examine the contents of `/group_vars/` files, `hosts` and `ansible.cfg` to review the existing variables that are set.
5. Execute `ansible all -m ping` to ensure Ansible can connect to your hosts
6. Run `ansible-playbook site.yml --extra-vars="importWordPressSQL=yes"` Adding the `importWordPressSQL` variable loads an empty WordPress database, and only needs to be run the first time (otherwise it will replace the existing database).

If you want to run Afterburner using a different domain name, review and update all the variables in `/group_vars/` and `hosts`, otherwise the defaults should work to setup a test demo instance. [Pull requests and issues welcome](https://github.com/voceconnect/afterburner-ansible/issues).

Visit your applications domain name to view your WordPress install. The `wp-admin` login details:

* Username: **admin**
* Password: **nsgreoheare**

## What Afterburner Doesn't Do

There are a few things that Afterburner doesn't do. Since many of these things are handled by hosting providers, and can vary greatly, we leave these to you to address.

* Backups
* Firewall configuration

Afterburner is setup to configure a stand-alone server to run all the components required, or configured to separate web, MySQL, and memcached instances across several machines.

## Mac OS X Quick Start

Ansible can be installed by cloning Ansible and [running from the checkout](http://www.ansibleworks.com/docs/gettingstarted.html#running-from-checkout). Afterburner was built and tested against the `release1.2.2` branch.

```
git clone -b release1.2.2 git@github.com:ansible/ansible.git
cd ansible
source ./hacking/env-setup
```

This places the `ansible` and `ansible-playbook` commands in your environments `$PATH`.

