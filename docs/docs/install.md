# -rwxrwx--- [setupTermuxArch.sh](https://raw.githubusercontent.com/sdrausty/TermuxArch/master/setupTermuxArch.sh)

# There are many ways to run this setup script on device. Please use the bash shell for installation and execution.  Here are some methods:

(1) Copy and paste the following command lines into your Termux bash command shell:

```
pkg install wget
wget https://sdrausty.github.io/TermuxArch/setupTermuxArch.sh
sh setupTermuxArch.sh

```


(2) Run the following command lines in bash to install Arch Linux in Termux on your device. Hint, copy and paste the following into the Termux window: 

```
pkg install git
cd && git clone https://github.com/sdrausty/TermuxArch
sh TermuxArch/setupTermuxArch.sh

```
Should you choose this option, the preferred method to work on projects at GitHub, clone to native space on device when you can.  See ["Notice to Collaborators"](Notice_to_Collaborators.md) for more information about collaborating.


(3) This method can be run by tapping [this link](https://sdrausty.github.io/TermuxArch/setupTermuxArch.sh) which should download `setupTermuxArch.sh` into the `/sdcard/Download/` directory on your smartphone and tablet.  If this is where `setupTermuxArch.sh` was actually downloaded on your device, start it by simply running the next line of code. Otherwise, change the script PATH before executing `setupTermuxArch.sh` with `sh`.

```
sh /sdcard/Download/setupTermuxArch.sh

```  


![Linux on Android](./../TermuxArchPlus/Screenshot_2017-10-18-06-09-29-831_com.termux.png)

This setup script will attempt to set Arch Linux up in your Termux.  When successfully completed, you will be at a bash prompt in [Arch Linux](https://archlinuxarm.org) in [Termux](https://wiki.termux.com/) using an Android smartphone, tablet or a Chromebook.

[![Community at Termux](./../../TermuxArchPlus/termuxfavicon.ico)](./Community)

[![Join the chat at https://gitter.im/termux/termux](https://badges.gitter.im/termux/termux.svg)](https://gitter.im/termux/termux)

* Comments are welcome [here](https://github.com/sdrausty/TermuxArch/issues) ✍

* Pull requests are welcome [here](https://github.com/sdrausty/TermuxArch/pulls) ✍

Thanks for making this project work; Please contribute 🔆  See [Notice to Collaborators](Notice_to_Collaborators.md) for more information.  Please see [PRoot](./PRoot) for more information about Linux on device with Termux and visit the [Termux wiki website](https://wiki.termux.com/) for more information about Termux.
