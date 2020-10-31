[![Build Status - Master](https://travis-ci.com/juju4/ansible-cuckoo-sandbox.svg?branch=master)](https://travis-ci.com/juju4/ansible-cuckoo-sandbox)
[![Build Status - Devel](https://travis-ci.com/juju4/ansible-cuckoo-sandbox.svg?branch=devel)](https://travis-ci.com/juju4/ansible-cuckoo-sandbox/branches)
# Cuckoo sandbox ansible role

Ansible role to setup cuckoo sandbox
* https://www.cuckoosandbox.org/
* http://docs.cuckoosandbox.org/en/latest/
It targets cuckoo 2.0 (currently rc) on Ubuntu and Centos

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with xenial, trusty and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.cuckoo-sandbox
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.cuckoo-sandbox
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.cuckoo-sandbox/test/vagrant
$ vagrant up
$ vagrant ssh
```

Role has also a packer config which allows to create image for virtualbox, vmware, eventually digitalocean, lxc and others.
When building it, it's advise to do it outside of roles directory as all the directory is upload to the box during building 
and it's currently not possible to exclude packer directory from it (https://github.com/mitchellh/packer/issues/1811)
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/cuckoo-sandbox/packer .
## update packer-*.json with your current absolute ansible role path for the main role
## you can add additional role dependencies inside setup-roles.sh
$ cd packer
$ packer build packer-*.json
$ packer build -only=virtualbox-iso packer-*.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build packer-*.json
## for digitalocean build, you need to export TOKEN in environment.
##  update json config on your setup and region.
$ export DO_TOKEN=xxx
$ packer build -only=digitalocean packer-*.json
```

## Troubleshooting & Known issues

* pip install on xenial
build/temp.linux-x86_64-2.7/_openssl.c:687:6: error: conflicting types for ‘BIO_new_mem_buf’

* issue with kbrebanov.selinux on centos-7
```
IOError: [Errno 2] No such file or directory: '/etc/selinux/config'
```
include selinux-policy


## FAQ

* Windows VM
To quickly generate template, you can use following project with packer tool: https://github.com/boxcutter/windows.
This fork has cuckoo agent option: https://github.com/juju4/windows
Alternative: https://github.com/mwrock/packer-templates

* Bootstrap network from packer image: vagrant?

* You need to review yourself default VM config in order to emulate real system and evade detection, especially part like VM settings, installed applications, desktop icons, shellbags...


## License

BSD 2-clause

