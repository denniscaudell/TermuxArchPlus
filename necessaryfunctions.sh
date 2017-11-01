#!/data/data/com.termux/files/usr/bin/sh -e
# Copyright 2017 by SDRausty. All rights reserved.
# See https://sdrausty.github.io/TermuxArch/Contributors
# Website for this project at https://sdrausty.github.io/TermuxArch
# add submodules media docs
################################################################################

adjustmd5file ()
{
	if [ "$(uname -m)" = "x86_64" ] || [ "$(uname -m)" = "i686" ];then
		wget -q --show-progress http://$mirror${path}md5sums.txt
		sed '2q;d' md5sums.txt > $file.md5
		rm md5sums.txt
	else
		wget -q -nc --show-progress http://$mirror$path$file.md5
	fi
}

checkme ()
{
	if md5sum -c termuxarchchecksum.md5; then
		printmd5syschksuccess 
		deletefiles 
	else
		printmd5syschkerror
		deletefiles 
	exit 
	fi
}

detectsystem2 ()
{
	case $(uname -o) in
		"Android" ) 
			armv7lAndroid 
			;;
		"GNU/Linux" ) 
			askuser 
			;; 
		*)
			printmismatch 
			;;
	esac
}

askuser ()
{
	printf "\n\033[32;1m"
	while true; do
		read -p "Are you installing on Android or on a Chromebook? (A|C)?"  ac
		case $ac in
		        [Aa]* ) 
				printf "\nInstalling ${file} for Android. \n\033[0m"
				armv7lAndroid 
				break
				;;
		        [Cc]* ) 
				printf "\nInstalling ${file} for Chromebook. \n\033[0m"
				armv7lChrome 
				break
				;;
		        * ) printf "\nAnswer Android or Chrome (A|C).\n";;
		esac
	done
}

deletefiles ()
{
	rm ./termuxarchchecksum.md5
	rm ./knownconfigurations.sh
	rm ./necessaryfunctions.sh
	rm ./printoutstatements.sh
}

makebin ()
{
	cat > $bin <<- EOM
	#!/data/data/com.termux/files/usr/bin/sh -e
	unset LD_PRELOAD
	proot --link2symlink -0 -r $HOME/arch/$sysp -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@arch \W]\$ ' LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
	EOM
	chmod 700 $bin
	cd  $HOME/arch/$sysp
	rm etc/resolv* 2>/dev/null||:
	cat > etc/resolv.conf <<- EOM
	nameserver 8.8.8.8
	nameserver 8.8.4.4
	EOM
	cat >  etc/locale.gen <<- EOM
	en_US.UTF-8 UTF-8 
	EOM
	cp $HOME/.bash* root/ 
	cd  $HOME/arch/
}

prepbin ()
{
	bin=startArch.sh
	if [ "$(uname -m)" = "i686" ];then
		sysp=root.i686 
		makebin
	elif [ "$(uname -m)" = "x86_64" ];then
		sysp=root.x86_64
		makebin
	else
		sysp=""
		makebin
	fi
}

makesystem ()
{
	printdownloading 
	adjustmd5file 
	wget -q -c --show-progress http://$mirror$path$file
	printmd5check
	if md5sum -c $file.md5; then
		printmd5success
		proot --link2symlink bsdtar -xpf $file 2>/dev/null||:
	else
		printmd5error
		rm -rf $HOME/arch
	exit 
	fi
	rm *.tar.gz *.tar.gz.md5
	prepbin 
	printfooter
}

detectsystem ()
{
	checkme
	mkdir -p $HOME/arch
	cd $HOME/arch
	printdetectedsystem
	case $(uname -m) in
		"aarch64" )
			aarch64
			;;
		"armv7l" ) 
			detectsystem2 
			;; 
		"i686" ) 
			i686 
			;;
		"x86_64" ) 
			x86_64
			;;
		*)
			printmismatch 
			;;
	esac
}
