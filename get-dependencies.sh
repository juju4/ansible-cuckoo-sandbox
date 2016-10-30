#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

#[ ! -d $rolesdir/redhat-epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/redhat-epel
[ ! -d $rolesdir/kbrebanov.epel ] && git clone https://github.com/kbrebanov/ansible-epel.git $rolesdir/kbrebanov.epel
[ ! -d $rolesdir/kbrebanov.selinux ] && git clone https://github.com/kbrebanov/ansible-selinux.git $rolesdir/kbrebanov.selinux
[ ! -d $rolesdir/kbrebanov.dkms ] && git clone https://github.com/kbrebanov/ansible-dkms.git $rolesdir/kbrebanov.dkms
[ ! -d $rolesdir/kbrebanov.kernel_headers ] && git clone https://github.com/kbrebanov/ansible-kernel_headers.git $rolesdir/kbrebanov.kernel_headers
[ ! -d $rolesdir/kbrebanov.virtualbox ] && git clone https://github.com/kbrebanov/ansible-virtualbox.git $rolesdir/kbrebanov.virtualbox
[ ! -d $rolesdir/volatility ] && git clone https://github.com/juju4/ansible-volatility $rolesdir/juju4.volatility

