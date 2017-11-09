#!/bin/bash -e
# Website for this project at https://sdrausty.github.io/TermuxArch
# See https://sdrausty.github.io/TermuxArch/CONTRIBUTORS Thank You! 
# Copyright 2017 by SDRausty. All rights reserved.  🌎 🌍 🌏 🌐 🗺
# Change mirror to your desired geographic location in `knownconfigurations.sh`.
################################################################################

printf '\033]2;  Thank you for using `setupTermuxArch.sh` 📲 \007'"\n\033[10m 🕛<🕛 This setup script will attempt to set Arch Linux up in your Termux environment.  When successfully completed, you will be at the bash prompt in Arch Linux in Termux.  Updating Termux and installing the required components for Arch Linux installation.  \n\n"

apt-get -qq update && apt-get -qq upgrade --yes
apt-get -qq install bsdtar proot termux-exec wget --yes 

depend ()
{
wget -q -N --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/knownconfigurations.sh
wget -q -N --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/necessaryfunctions.sh
wget -q -N --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/printoutstatements.sh
wget -q -N --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh
wget -q -N --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/systemconfigs.sh
wget -q -N --show-progress https://raw.githubusercontent.com/sdrausty/TermuxArch/master/termuxarchchecksum.md5
. ./knownconfigurations.sh
. ./necessaryfunctions.sh
. ./printoutstatements.sh
. ./systemconfigs.sh
}

# Main Block
termux-wake-lock
depend 
callsystem 
$HOME/arch/$bin ||:
printtail
termux-wake-unlock
exit 

