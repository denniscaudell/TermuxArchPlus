#!/data/data/com.termux/files/usr/bin/sh -e
# Copyright 2017 by SDRausty. All rights reserved.
# See https://sdrausty.github.io/TermuxArch/Contributors
# Website for this project at https://sdrausty.github.io/TermuxArch
################################################################################

adjustmd5file ()
{
	if [ "$(uname -m)" = "x86_64" ];then
		wget -q --show-progress http://$mirror${path}md5sums.txt
		sed '2q;d' md5sums.txt > $file.md5
		rm md5sums.txt
	else
		wget -q -nc --show-progress http://$mirror$path$file.md5
	fi
}

checksystem2 ()
{
	mkdir -p $HOME/arch
	cd $HOME/arch
	case $(uname -o) in
		"Android" ) 
			armv7lAndroid 
			;;
		"GNU/Linux" ) 
			checksystem2q 
			;; 
		*)
			printmismatch 
			;;
	esac
}

checksystem2q ()
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

deletefileq ()
{
	printf "\n\033[32;1mUncompressing \`$file\` was succesful.\n"
	while true; do
		read -p "Do you wish to delete \`$file\` and \`${file}.md5\` (y|n)?"  yn
		case $yn in
		        [Yy]* ) printf "\nFiles \`$file\` and \`${file}.md5\` deleted.\n\033[0m"; rm *.tar.gz *.tar.gz.md5; break;;
		        [Nn]* ) printf "\nFiles \`$file\` and \`${file}.md5\` kept.\n\033[0m"; break;;
		        * ) printf "\nAnswer yes or no (y|n).\n";;
		esac
	done
}

fixArch ()
{
	bin=startArch.sh
	if [ "$(uname -m)" = "x86_64" ];then
		cat > $bin <<- EOM
		#!/data/data/com.termux/files/usr/bin/sh 
		set -e
		proot --link2symlink -0 -r $HOME/arch/root.x86_64 -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@arch \W]\$ ' LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
		EOM
		chmod 700 $bin
		cd  root.x86_64
		rm etc/resolv* 2>/dev/null||:
		cat > etc/resolv.conf <<- EOM
		nameserver 8.8.8.8
		nameserver 8.8.4.4
		EOM
		cat >  etc/locale.gen <<- EOM
		en_US.UTF-8 UTF-8 
		EOM
		cp $HOME/.bash* root/ 
		cd ..
	else
		cat > $bin <<- EOM
		#!/data/data/com.termux/files/usr/bin/sh 
		set -e
		proot --link2symlink -0 -r $HOME/arch -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" PS1='[termux@arch \W]\$ ' LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
		EOM
		chmod 700 $bin
		rm etc/resolv* 2>/dev/null||:
		cat > etc/resolv.conf <<- EOM
		nameserver 8.8.8.8
		nameserver 8.8.4.4
		EOM
		cat >  etc/locale.gen <<- EOM
		en_US.UTF-8 UTF-8 
		EOM
		cp $HOME/.bash* root/ 
	fi
}

#wget -q --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/checksum.md5
#rm ./checksum.md5
#	if md5sum -c $file.md5; then
#		printmd5success
#		proot --link2symlink bsdtar -xpf $file 2>/dev/null||:
#	else
#		printmd5error
#		rm -rf $HOME/arch
#	exit 
#	fi
#	rm ./knownconfigurations.sh
#	rm ./requiredfunctions.sh
#	rm ./printoutstatements.sh
# add submodules media docs

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
	deletefileq
	fixArch
	printfooter
}

system ()
{
	mkdir -p $HOME/arch
	cd $HOME/arch
	printdetectedsystem
	case $(uname -m) in
		"aarch64" )
			aarch64
			;;
		"armv7l" ) 
			checksystem2
			;; 
		"x86_64" ) 
			x86_64
			;;
		*)
			printmismatch 
			;;
	esac
}

