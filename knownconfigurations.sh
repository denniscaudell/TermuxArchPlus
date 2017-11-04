#!/bin/sh -e
# Copyright 2017 by SDRausty. All rights reserved.
# See https://sdrausty.github.io/TermuxArch/Contributors Thank You 
# Website for this project at https://sdrausty.github.io/TermuxArch
# Detected configurations. Change mirror to your desired geographic location.
# Please add configurations to this list if you find one that is not listed.
################################################################################

aarch64 ()
{
	file=ArchLinuxARM-aarch64-latest.tar.gz
	mirror=os.archlinuxarm.org
	path=/os/
	makesystem 
}

armv7lAndroid  ()
{
	file=ArchLinuxARM-armv7-latest.tar.gz 
	mirror=os.archlinuxarm.org
	path=/os/
	makesystem 
}

armv7lChrome ()
{
	file=ArchLinuxARM-armv7-chromebook-latest.tar.gz
	mirror=os.archlinuxarm.org
	path=/os/
	makesystem 
}

i686 ()
{
	file=archlinux-bootstrap-2017.03.01-i686.tar.gz
	mirror=archive.archlinux.org
	path=/iso/2017.03.01/
	makesystem 
}

x86_64 ()
{
	file=archlinux-bootstrap-2017.10.01-x86_64.tar.gz
	mirror=mirrors.evowise.com
	path=/archlinux/iso/2017.10.01/
	makesystem 
}

