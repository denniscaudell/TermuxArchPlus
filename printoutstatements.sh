#!/bin/sh -e
# Copyright 2017 by SDRausty. All rights reserved.
# See https://sdrausty.github.io/TermuxArch/Contributors
# Website for this project at https://sdrausty.github.io/TermuxArch
# Printout statement subroutines for `setupTermuxArch.sh`.
################################################################################

printdeleteq ()
{
	printf "\n\033[32;1mDo you wish to delete \033[33;1m\`$file\`\033[32;1m?  \n"
}

printdetectedsystem ()
{
	printf "\n\033[32;1mDetected $(uname -mo).  Congratulations 🔆  \033[0m\n"
}

printdownloading ()
{
	printf "\n\033[32;1mNow downloading \033[33;1m\`$file\`\033[32;1m and the corresponding checksum.  \n\n	This may take a long time depending on your Internet speed; Be patient ⏳  \033[0m\n\n"
}

printfooter()
{
	printf "\n\033[32;1mUse \033[33;1m\`pacman -Syu\`\033[32;1m to update your Arch Linux in Termux distribution.  Adjust your /etc/pacman.d/mirrorlist file in accordance with your geographic location 🌎  Run \033[33;1m\`locale-gen\`\033[32;1m to generate the en_US.UTF-8 locale.  Edit /etc/locale.gen if you want other locales.  Uncomment your preferred locale and run \033[33;1m\`locale-gen\`\033[32;1m again to update.\033[32;1m  Use \033[33;1m\`./arch/$bin\`\033[32;1m from your \033[33;1m\`\$HOME\`\033[32;1m directory to launch Arch Linux in Termux for future sessions.  Thank you for using \033[33;1m\`setupTermuxArch.sh\`\033[32;1m to install Arch Linux in Termux.  \033[0m\n\n"
}

printmd5check ()
{
	printf "\n\033[32;1mChecking download integrity with md5sum. This may take a while.  \033[0m\n\n"
}

printmd5error ()
{
	printf "\n⛔\033[31;1m md5sum mismatch! The download was corrupt. Removing failed download.  \033[0m\n\n\033[33;1m	Please run \`setupTermuxArch.sh\` again!  \n\n\033[32;1m	See https://sdrausty.github.io/TermuxArchPlus/md5sums for more information.  \n	If this keeps repeating, please change your mirror with an editor like vi.  \n\033[32;1m	See https://sdrausty.github.io/TermuxArchPlus/mirrors for more information.  \033[0m\n\n\033[31;1m	Exiting...  \033[0m\n"
}

printmd5success ()
{
	printf "\n\033[32;1mNow uncompressing \033[33;1m\`$file\`\033[32;1m.\n\n	This will take \033[33;1mmuch longer\033[32;1m; Be patient ⏳ If you are going to set your device aside, ensure \`termux-wake-lock\` is active to let this process complete. \033[0m\n"
}

printmd5syschkerror ()
{
	printf "\n⛔\033[31;1m md5sum mismatch! Setup initialization corrupt! \n\n\033[33;1m	Update your copy of \`\033[32;1msetupTermuxArch.sh\033[33;1m\` manually.  Waiting a few minutes before executing again is recommended if you have a fresh copy of \`\033[32;1mhttps://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh\033[33;1m\` on your system.  \n\n\033[32;1m	See https://sdrausty.github.io/TermuxArchPlus/md5sums for more information.  \n\n\033[31;1m	Exiting...  \033[0m\n"
}

printmd5syschksuccess ()
{
	printf "\n\033[32;1mInstallation script integrity OK. Continuing setup.  \033[0m\n"
}

printmismatch ()
{
	printf "\n\033[31;1mDid not find an architecture and operating system match in \033[33;1m\`knownconfigurations\`\033[31;1m.\n\n\033[32;1m	Detected $(uname -mo).\n\n	⛔\033[31;1m ERROR Unknown configuration!\033[32;1m  There still is hope.\n\n	Check at http://mirror.archlinuxarm.org/os/ and https://www.archlinux.org/mirrors/ for other available images.  See if any match your device.\n\nIf you find a match, then please \033[33;1msubmit a pull request\033[32;1m at https://github.com/sdrausty/TermuxArch/pulls with script modifications.\n\n	Alternatively, \033[33;1msubmit a modification request\033[32;1m at https://github.com/sdrausty/TermuxArch/issues if you find a configuration match.  Please include output from \033[33;1m\`uname -mo\`\033[32;1m on the device in order to expand autodetection for \033[33;1m\`setupTermuxArch.sh\`\033[32;1m.\n\n	See https://sdrausty.github.io/TermuxArchPlus/Known_Configurations for more information.\n\n\033[31;1m	Exiting...  \033[0m\n"
}

printtail ()
{
	printf "\n\033[32;1mUse \033[33;1m\`./arch/$bin\`\033[32;1m from your \033[33;1m\`\$HOME\`\033[32;1m directory to launch Arch Linux in Termux for future sessions.  This can be abbreviated to \033[33;1m\`!.\`\033[32;1m at the bash prompt after login into Termux.  Thank you for using \033[33;1m\`setupTermuxArch.sh\`\033[32;1m to install Arch Linux in Termux.  \033[0m\n\n" '\033]2;Thank you for using `setupTermuxArch.sh` 💎 \007'
}

