# Using Ansible roles

## Requirements

* Grain of salt

## Guidelines

*  Try to refrain from using roles from Ansible Galaxy. Even though you may find what you're looking for there, the 
roles are often overly complicated, sometimes they don't work, sometimes they're outdated, sometimes they rely on PPAs 
that don't exist anymore, or they just otherwise sucks. Often times you just want to install a package and maybe supply 
a template for a configuration file and the time spent figuring out how to configure an existing role for that can just 
as well be spent writing a proper role from scratch.

## Various default values

* The MySQL root password is `root`
