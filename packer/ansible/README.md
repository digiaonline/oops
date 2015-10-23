# Using Ansible roles

## Requirements

* Grain of salt

## Guidelines

* Try not to roll your own Ansible roles. Instead, go to Ansible Galaxy, use your own judgement to filter out all the 
forks and copies, then when you've found something you think you can use, add it to your roles directory by running  
`ansible-galaxy install foo:bar -p roles/` from this directory. It is important that you use the `-p` switch, otherwise 
the role will be installed locally in `/etc/ansible` which is definitely not what you want.
