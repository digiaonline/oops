# nordsoftware-open-ops

This repository holds everything related to infrastructure/operations for all our open source projects. In a nutshell, we use 
Packer to build Vagrant boxes from a standard Ubuntu Server (or any other image if necessary) image. Packer then uses 
local Ansible provisioning to provision the software required in the box. The built boxes can then be uploaded to 
Atlas which makes them available to Vagrant. See ["The provisioning process"](#the-provisioning-process) for more details.

## Guidelines

The master branch contains the build definitions for our public Vagrant boxes.

## Requirements

### Packer

* Make sure you have [Packer](https://packer.io/) installed
* Make an account on Atlas if you haven't done so already. Once you've done that, create an Atlas token by clicking 
your nickname in the menu bar, then Tokens. Add this token as an environment variable named `ATLAS_TOKEN`. Consult the 
Internet on how to do this for your operating system.

## Usage

This section describes the steps you need to take if you want to fork this project and create your own Vagrant boxes. 
The master branch ships with a few base boxes that can be used as baselines when rolling your own:

* `nginx-php-mariadb-nodejs` a basic stack
* `nginx-php` good for generic library development

### Packer

In this example we use the `nginx-php-mariadb-nodejs` box from the master branch. If you fork you'll want to rename 
the file etc. to whatever your new box will be named.

* Enter the `packer/` directory. The paths in the Packer template are relative to the directory `packer` is run from 
so this step is important.
* Run `packer validate nginx-php-mariadb-nodejs.json` to verify that the configuration is valid
* Run `packer build nginx-php-mariadb-nodejs.json` to build the Vagrant box locally and push it to 
Atlas, or run `packer push nginx-php-mariadb-nodejs.json` to build the box in Atlas instead. You'll probably want to do 
the latter.

## The provisioning process

When a box is created and provisioned Packer starts with a standard Linux distribution image. It then uses shell 
provisioners to do the bare minimum required to get Ansible installed and working properly. This includes things like 
installing the VirtualBox guest additions, configuring sudo and so on.
 
The real provisioning is done by Ansible, and unless you have a very good reason not to you should adapt your Ansible 
playbook(s) instead of provisioning directly from Packer. See [ansible/README.md](packer/ansible/README.md) for further 
details.

## License

MIT
