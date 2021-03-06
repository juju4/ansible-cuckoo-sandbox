#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
#[ ! -d $rolesdir/kbrebanov.epel ] && git clone https://github.com/kbrebanov/ansible-epel.git $rolesdir/kbrebanov.epel
[ ! -d $rolesdir/kbrebanov.epel ] && git clone https://github.com/juju4/ansible-epel.git $rolesdir/kbrebanov.epel
#[ ! -d $rolesdir/kbrebanov.selinux ] && git clone https://github.com/kbrebanov/ansible-selinux.git $rolesdir/kbrebanov.selinux
[ ! -d $rolesdir/kbrebanov.selinux ] && git clone https://github.com/juju4/ansible-selinux.git $rolesdir/kbrebanov.selinux
[ ! -d $rolesdir/kbrebanov.dkms ] && git clone https://github.com/kbrebanov/ansible-dkms.git $rolesdir/kbrebanov.dkms
#[ ! -d $rolesdir/kbrebanov.kernel_headers ] && git clone https://github.com/kbrebanov/ansible-kernel_headers.git $rolesdir/kbrebanov.kernel_headers
[ ! -d $rolesdir/kbrebanov.kernel_headers ] && git clone https://github.com/juju4/ansible-kernel_headers.git $rolesdir/kbrebanov.kernel_headers
#[ ! -d $rolesdir/kbrebanov.virtualbox ] && git clone https://github.com/kbrebanov/ansible-virtualbox.git $rolesdir/kbrebanov.virtualbox
[ ! -d $rolesdir/kbrebanov.virtualbox ] && git clone https://github.com/juju4/ansible-virtualbox.git $rolesdir/kbrebanov.virtualbox
[ ! -d $rolesdir/volatility ] && git clone https://github.com/juju4/ansible-volatility $rolesdir/juju4.volatility
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.cuckoo_sandbox ] && ln -s ansible-cuckoo-sandbox $rolesdir/juju4.cuckoo_sandbox
[ ! -e $rolesdir/juju4.cuckoo_sandbox ] && cp -R $rolesdir/ansible-cuckoo-sandbox $rolesdir/juju4.cuckoo_sandbox

## don't stop build on this script return code
true
