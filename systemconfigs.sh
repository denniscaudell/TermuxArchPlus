#!/bin/bash -e
# Website for this project at https://sdrausty.github.io/TermuxArch
# See https://sdrausty.github.io/TermuxArch/Contributors Thank You 
# Copyright 2017 by SDRausty. All rights reserved.
################################################################################

startbin ()
{
	cat > $bin <<- EOM
	#!/data/data/com.termux/files/usr/bin/sh -e
	unset LD_PRELOAD
	exec proot --link2symlink -0 -r $HOME/arch/ -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@arch \W]\$ ' LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
	EOM
	chmod 700 $bin
}

bashrc ()
{
	cat > root/.bashrc <<- EOM
	alias ..="cd ../.. && pwd"
	alias ...="cd ../../.. && pwd"
	alias ....="cd ../../../.. && pwd"
	alias .....="cd ../../../../.. && pwd"
	alias c='cd .. && pwd'
	alias cdd='cd /sdcard/Download/ && pwd'
	alias e='exit'
	alias h='history >> ~/.historyFile'
	alias j='jobs'
	alias l='ls -al'
	alias p='pwd'
	alias q='exit'
	alias rf='rm -rf'
	EOM
}

bash_profile ()
{
	touch root/.bash_profile 
}

finishsetup ()
{
	cat > root/bin/finishsetup.sh  <<- EOM
	#!/bin/sh 
	vi /etc/locale.gen
	locale-gen
	vi /etc/pacman.d/mirrorlist
	pacman -Syu
	EOM
	chmod 700 root/bin/finishsetup.sh 
}
