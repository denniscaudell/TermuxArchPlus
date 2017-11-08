#!/bin/bash -e
# Website for this project at https://sdrausty.github.io/TermuxArch
# See https://sdrausty.github.io/TermuxArch/Contributors Thank You 
# Copyright 2017 by SDRausty. All rights reserved.
# $ while true ;do play-audio NEIL\ YOUNG\ -\ OLD\ MAN-An2a1_Do_fc.webm ;done
################################################################################

adjustmd5file ()
{
	if [ "$(uname -m)" = "x86_64" ] || [ "$(uname -m)" = "i686" ];then
		wget -q -N --show-progress http://$mirror${path}md5sums.txt
		sed '2q;d' md5sums.txt > $file.md5
		rm md5sums.txt
	else
		wget -q -N --show-progress http://$mirror$path$file.md5
	fi
}

askuser ()
{
	printf "\n\033[36;1m"
	while true; do
	read -p "Are you installing on Android or on a Chromebook? (A|C)?"  ac
	if [[ $ac = [Aa]* ]];then
		armv7lAndroid 
		break
	elif [[ $ac = [Cc]* ]];then
		armv7lChrome 
		break
	else
		printf "\nYou answered \033[34;1m$ac\033[36;1m.\n"
		printf "\nAnswer Android or Chrome (A|C).\n\n"
	fi
	done
}

callsystem ()
{
	integratycheck 
	mkdir -p $HOME/arch
	cd $HOME/arch
	detectsystem
}

detectsystem ()
{
	printdetectedsystem
	if [ "$(uname -m)" = "aarch64" ];then
		aarch64
	elif [ "$(uname -m)" = "armv7l" ];then
		detectsystem2 
	elif [ "$(uname -m)" = "armv8l" ];then
		armv8l
	elif [ "$(uname -m)" = "i686" ];then
		i686 
	elif [ "$(uname -m)" = "x86_64" ];then
		x86_64
	else
		printmismatch 
	fi
}

detectsystem2 ()
{
	if [ "$(uname -o)" = "Android" ];then
		armv7lAndroid 
	elif [ "$(uname -o)" = "GNU/Linux" ];then
		askuser 
	else
		printmismatch 
	fi
}

getimage ()
{
	# Get latest image for x86_64. This wants refinement. Continue does not work. 
	# wget -A tar.gz -m -nd -np http://mirrors.evowise.com/archlinux/iso/latest/
	# wget -A tar.gz -m -nd -np http://$mirror$path
	wget -q -c --show-progress http://$mirror$path$file
}

integratycheck ()
{
	if md5sum -c termuxarchchecksum.md5; then
		rmfiles 
		printmd5syschksuccess 
	else
		rmfiles 
		printmd5syschkerror
	fi
}

makebin ()
{
	bin=startArch.sh
	cat > $bin <<- EOM
	#!/data/data/com.termux/files/usr/bin/sh -e
	unset LD_PRELOAD
	exec proot --link2symlink -0 -r $HOME/arch/ -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@arch \W]\$ ' LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
	EOM
	chmod 700 $bin
	touchupsys 
}

touchupsys ()
{
	rm etc/resolv* 2>/dev/null||:
	cat > etc/resolv.conf <<- EOM
	nameserver 8.8.8.8
	nameserver 8.8.4.4
	EOM
	if [ -f "etc/locale.gen" ]; then
		sed -i '/en_US.UTF-8 UTF-8/{s/#//g;s/@/-at-/g;}' etc/locale.gen 
	else
		cat >  etc/locale.gen <<- EOM
		en_US.UTF-8 UTF-8 
		EOM
	fi
	if [ -f "$HOME/.bashrc" ]; then
		cp $HOME/.bashrc root/ 
	else
		touch root/.bashrc 
	fi
	if [ -f "$HOME/.bash_profile" ]; then
		cp $HOME/.bash_profile root/ 
	else
		touch root/.bash_profile 
	fi
	echo ". .bashrc" >> root/.bash_profile
	if [ -d "$HOME/bin" ]; then
		cp -r $HOME/bin root 2>/dev/null||:
	fi
}

makesystem ()
{
	printdownloading 
	adjustmd5file 
	getimage
	printmd5check
	if md5sum -c $file.md5; then
		printmd5success
		preproot 
	else
		rm -rf $HOME/arch
		printmd5error
	fi
	rm *.tar.gz *.tar.gz.md5
	makebin 
	printfooter
}

preproot ()
{
	if [ "$(uname -m)" = "x86_64" ] || [ "$(uname -m)" = "i686" ];then
		proot --link2symlink bsdtar -xpf --strip-components 1 $file 2>/dev/null||:
	else
		proot --link2symlink bsdtar -xpf $file 2>/dev/null||:
	fi
}

rmfiles ()
{
	rm ./termuxarchchecksum.md5
	rm ./knownconfigurations.sh
	rm ./necessaryfunctions.sh
	rm ./printoutstatements.sh
}

