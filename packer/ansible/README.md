# Using Ansible roles

This document contains some general guidelines on how these roles are used, as well as some good practices to follow 
for the sake of consistency across branches.

## Requirements

* Grain of salt

## General

* You should only need a single playbook file. Use inventories and groups to control which box gets provisioned how.
* If you use relative paths inside a role, the path is relative to the playbook file. In other words, `./` is the 
`ansible` directory.
* Avoid doing branch-specific changes to any Ansible role, this makes merging master into your branch much easier. If 
you need to extend a roles functionality, switch to the master branch, commit your changes, then merge master back into 
your branch.

## Guidelines for using roles

### deployuser

This role is generally only used when provisioning production/staging environments. A good place to store the keys is 
in `ansible/keys` (you must create the directory).

### nginx

If you need to provide a custom template, put it in `ansible/templates` and reference it using `./templates/foo.j2`.

### mysql

The MySQL root password is `root`

### firewall

By default, the firewall role will allow complete access from internal networks and access from anywhere to port 22. If 
you need to expose more ports than this, override `ufw_allowed_incoming_ports`. If you don't want to keep any ports 
open to the world (useful for servers that only need to be internally accessible), override `ufw_allowed_incoming_ports`
to the value `[]`.

### xdebug

If you want to be able to debug your code, follow these instructions to configure PhpStorm properly:

1. Go to `Run -> Edit Configuration`
2. Click `Add`, then select `PHP Remote Debug`
3. Give the configuration a proper name, e.g. the name of your project
4. Click the `...` button next to the server list to configure a server
	1. `Name:` a proper name, e.g. the name of your project
	2. `Host:` the IP address of your Vagrant box (or hostname if you've configured `/etc/hosts`)
	3. `Port:` 80
	4. `Debugger:` Xdebug
	5. Check the "Use path mappings" checkbox, then make sure the directory that contains your `Vagrantfile` is mapped 
	   to `/vagrant` on the server. If your project uses custom Vagrant shared folders you'll have to figure out the 
	   correct mappings on your own.
5. Close the "add server" dialog and make sure the server you just added is selected in the drop down
6. Set `Ide key:` to `vagrant`

### Adding new roles

Try to refrain from using roles from Ansible Galaxy. Even though you may find what you're looking for there, the 
roles are often overly complicated, sometimes they don't work, sometimes they're outdated, sometimes they rely on PPAs 
that don't exist anymore, or they just otherwise sucks. Often times you just want to install a package and maybe supply 
a template for a configuration file and the time spent figuring out how to configure an existing role for that can just 
as well be spent writing a proper role from scratch.
