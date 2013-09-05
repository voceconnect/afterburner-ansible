# Afterburner

Afterburner is a set of Ansible playbooks and tasks that complement the resources and guides at [afterburner.voceplatforms.com](http://afterburner.voceplatforms.com).

## What's included?

* System level tuning and optimizations
* Basic firewall via iptables and fail2ban with blocking of IP addresses that repeatedly send POST requests to various WordPress pages
* NGINX, tuned for WordPress with output level caching
* PHP-FPM, with ZendOptimizerPlus opcode caching
* memcached, for WordPress object level caching
* Percona MySQL
* Basic WordPress application setup (regular install or multi-site)
* Various utilities for monitoring the stack (htop, mytop, strace)

## Getting Started

### Requirements

1. A server (either bare metal or virtual) with at least 1GB of RAM.
2. Ubuntu 12.04
3. SSH access to your server as a user with 'sudo' ability

### Setting up your server

First, get [Ansible](http://ansibleworks.com/docs/gettingstarted.html#getting-ansible) installed.

Once you have Ansible installed...

1. Clone this repository and `cd afterburner-ansible`
2. Run `./install`. (this copies `.sample` files for editing)
3. Edit `group_vars/` files and change any variables needed to match your application/requirements.
4. Edit `hosts` and supply the domain names of your server(s).
5. Edit `ansible.cfg` and change any variables needed to run Ansible tasks against your server(s).
6. Execute `ansible all -m ping` to ensure Ansible can connect to your hosts
7. Run `ansible-playbook site.yml`

Visit your application's domain name to view your WordPress install. The `wp-admin` login details:

* Username: **admin**
* Password: **nsgreoheare**

It's **strongly** recommended you change the default `wp-admin` login credentials.

## To do

* Allow configuring and setting up multiple applications and domains
* Add backup support (Tarnsap? Duplicity to S3?)
* Use ansible facts for wp-config.php database and memcached addresses

## Contributing

Pull requests and contributions more than welcome...

## License

[GPLv3](http://gplv3.fsf.org/), just like Ansible. Any other components and templates should be considered covered by their respective licenses.
