#!/bin/sh -e
# Copyright 2017 by SDRausty. All rights reserved.
# See https://sdrausty.github.io/TermuxArch/Contributors
# Website for this project at https://sdrausty.github.io/TermuxArch
# Printout statement subroutines for `setupTermuxArch.sh`.
################################################################################

printdetectedsystem ()
{
	printf "\033[36;1m\n  Detected $(uname -mo) 🔆  \n"
}

printdownloading ()
{
	printf "\033[34;1m\n  Now downloading \033[37;1m\`$file\`\033[34;1m and the corresponding checksum ⛵  This may take a long time depending on your Internet speed; Be patient.  If you are going to set your device aside, ensure \033[37;1m\`termux-wake-lock\`\033[34;1m is active to let this process complete ⏳  \n\n"
}

printfooter()
{
	printf "\033[33;1m\033[42;1m\n  Use \033[37;1m\`pacman -Syu\`\033[33;1m to update your Arch Linux in Termux distribution.  Adjust your \033[37;1m\`/etc/pacman.d/mirrorlist\`\033[33;1m file in accordance with your geographic location 🌎  Run \033[37;1m\`locale-gen\`\033[33;1m to generate the en_US.UTF-8 locale.  Edit \033[37;1m\`/etc/locale.gen\` \033[33;1mif you want other locales.  Uncomment your preferred locale and run \033[37;1m\`locale-gen\`\033[33;1m again to update.\033[33;1m  Use \033[37;1m\`./arch/$bin\`\033[33;1m from your \033[37;1m\`\$HOME\`\033[33;1m directory to launch Arch Linux in Termux for future sessions.  Thank you for using \033[37;1m\`setupTermuxArch.sh\`\033[33;1m to install Arch Linux in Termux.  \n\n"
}

printmd5check ()
{
	printf "\033[33;1m\n  Checking download integrity with md5sum. This may take a while.  \n\n"
}

printmd5error ()
{
	printf "\033[07;1m\033[31;1m\n  🔆 ERROR md5sum mismatch! The download was corrupt! Removing failed download.\033[33;1m  Run \033[37;1m\`setupTermuxArch.sh\`\033[33;1m again!  See https://sdrausty.github.io/TermuxArchPlus/md5sums for more information.  This kind of error can go away, sort of like magic.  Waiting a few minutes before executing again is recommended. There are many reasons that generate checksum errors.  Proxies are one reason.  Mirroring and mirrors are another explaination for md5sum errors.  Either way it means this download was corrupt.  If this keeps repeating, please change your mirror with an editor like vi in \033[37;1m\`knownconfigurations.sh\`\033[33;1m.  See https://sdrausty.github.io/TermuxArchPlus/mirrors for more information.  \n\n	\033[0m\033[37;1mRun \`setupTermuxArch.sh\` again. \033[31;1mExiting...  \033[0m\n"
}

printmd5success ()
{
	printf "\033[32;1m\n  Now uncompressing \033[34;1m\`$file\`\033[32;1m.  \033[33;1mThis will take much longer;\033[32;1m Be patient.  If you are going to set your device aside, ensure \033[33;1m\`termux-wake-lock\`\033[32;1m is active to let this process complete ⏳  \n"
}

printmd5syschkerror ()
{
	printf "\033[07;1m\033[31;1m\n  🔆 ERROR md5sum mismatch!  Setup initialization mismatch!  Update your copy of \`setupTermuxArch.sh\`.  If you have updated it, this kind of error can go away, sort of like magic.  Waiting a few minutes before executing again is recommended, especially if you are using a fresh copy from \`https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh\` on your system.  There are many reasons that generate checksum errors.  Proxies are one reason.  Mirroring and mirrors are another explaination for md5sum errors.  Either way it means,  \"Try again, this initialization was not successful.\"  See https://sdrausty.github.io/TermuxArchPlus/md5sums for more information.  \n\n	\`setupTermuxArch.sh\` again. \033[31;1mExiting...  \033[0m\n"
}

printmd5syschksuccess ()
{
	printf "\033[36;1m\n  Installation script integrity OK. Continuing setup 🔆  \n"
}

printmismatch ()
{
	printf "\033[07;1m\033[31;1m\n  🔆 ERROR Unknown configuration!  Did not find an architecture and operating system match in\033[37;1m \`knownconfigurations.sh\`\033[31;1m!  \033[33;1mDetected $(uname -mo).  There still is hope.  Check at http://mirror.archlinuxarm.org/os/ and https://www.archlinux.org/mirrors/ for other available images and see if any match your device.  If you find a match, then please \033[37;1msubmit a pull request\033[33;1m at https://github.com/sdrausty/TermuxArch/pulls with script modifications.  Alternatively, \033[37;1msubmit a modification request\033[33;1m at https://github.com/sdrausty/TermuxArch/issues if you find a configuration match.  Please include output from \033[37;1m\`uname -mo\`\033[33;1m on the device in order to expand autodetection for \033[37;1m\`setupTermuxArch.sh\`\033[33;1m.  See https://sdrausty.github.io/TermuxArchPlus/Known_Configurations for more information.  \n\n	\033[0m\033[33;1mRun \`setupTermuxArch.sh\` again. \033[31;1mExiting...  \033[0m\n"
}

printtail ()
{
	printf "\033[33;1m\n  Use \033[37;1m\`./arch/$bin\`\033[33;1m from your \033[37;1m\`\$HOME\`\033[33;1m directory to launch Arch Linux in Termux for future sessions.  This can be abbreviated to \033[37;1m\`!.\`\033[33;1m at the bash prompt after starting a session in Termux.  Thank you for using \033[37;1m\`setupTermuxArch.sh\`\033[33;1m to install Arch Linux in Termux.  \033[0m\n\n" '\033]2;  Thank you for using `setupTermuxArch.sh` 💎 \007'
}

