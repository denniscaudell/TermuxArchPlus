#!/data/data/com.termux/files/usr/bin/sh -e
# Copyright 2017 by SDRausty. All rights reserved.
# See https://sdrausty.github.io/TermuxArch/Contributors
# Website for this project at https://sdrausty.github.io/TermuxArch
# Change mirror to your desired geographic location in `knownconfigurations.sh`.
################################################################################

printf '\033]2;Thank you for using `setupTermuxArch.sh` 💎 \007'"\n\033[32;1mThis setup script will attempt to set Arch Linux up in your Termux environment.\n"
sleep 2
printf "\nWhen successfully completed, you will be at the bash prompt in Arch Linux in Termux.\n"
sleep 1
printf "\nUpdating Termux and installing the required components for Arch Linux installation.\033[0m\n"

apt-get -qq update && apt-get -qq upgrade --yes
apt-get -qq install bsdtar proot wget --yes 

depends ()
{
	wget -N -q --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/knownconfigurations.sh
	wget -N -q --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/necessaryfunctions.sh
	wget -N -q --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/printoutstatements.sh
	wget -N -q --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh
	wget -N -q --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/termuxarchchecksum.md5
	. ./knownconfigurations.sh
	. ./necessaryfunctions.sh
	. ./printoutstatements.sh
}

# Main Block
#-------------------------------------------------------------------------------

depends
detectsystem 
$HOME/arch/$bin
printtail
exit 
