#!/bin/bash

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREENS="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

function check() {
# checks if your distribution is ready for kernel development.
if [[ `command -v gcc` ]]; then
    echo "Gcc OK"
else echo "Gcc ${RED}NO${RESETBG}"
fi

if [[ `command -v clang-11` ]]; then
    echo "Clang OK"
else echo "Clang ${RED}NO${RESETBG}"
fi

if [[ `command -v make` ]]; then
    echo "Make OK"
else echo "Make ${RED}NO${RESETBG}"
fi
if [[ `command -v ld` ]]; then
    echo "Binutils OK"
else echo "BInutils ${RED}NO${RESETBG}"
fi

if [[ `command -v flex` ]]; then
    echo "Flex OK"
else echo "Flex ${RED}NO${RESETBG}"
fi

if [[ `command -v bison` ]]; then
    echo "Bison OK"
else echo "Bison ${RED}NO${RESETBG}"
fi

if [[ `command -v perl` ]]; then
    echo "Perl OK"
else echo "Perl ${RED}NO${RESETBG}"
fi

if [[ `command -v bc` ]]; then
    echo "Bc OK"
else echo "Bc ${RED}NO${RESETBG}"
fi

if [[ `command -v openssl` ]]; then
    echo "OpenSSL OK"
else echo "OpenSSL ${RED}NO${RESETBG}"
fi

if [[ `command -v depmod` ]]; then
    echo "kmod OK"
else echo "Kmod ${RED}NO${RESETBG}"
fi

if [[ `command -v fdformat` ]]; then
    echo "Util-Linux OK"
else echo "Util-Linux ${RED}NO${RESETBG}"
fi

if [[ `command -v e2fsck` ]]; then
    echo "e2fsprogs OK"
else echo "e2fsprogs ${RED}NO${RESETBG}"
fi

if [[ `command -v mutt` ]]; then
    echo "Mutt OK"
else echo "Mutt ${RED}NO${RESETBG}"
fi

echo " "

echo "### If everything is OK above you should be able to compile"

echo " "

if [[ `command -v fsck.jfs` ]]; then
    echo "jfsutils OK"
else echo "jfsutils ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v reiserfsck` ]]; then
    echo "reiserfsprogs OK"
else echo "reiserfsprogs ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v mksquashfs` ]]; then
    echo "squashfs-tools OK"
else echo "squashfs-tools ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v pccardctl` ]]; then
    echo "pcmciautils OK"
else echo "pcmciautils ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v quota` ]]; then
    echo "quota-tools OK"
else echo "quota-tools ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v pppd` ]]; then
    echo "PPP OK"
else echo "PPP ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v showmount` ]]; then
    echo "nfs-utils OK"
else echo "nfs-utils ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v xfs_db -V` ]]; then
    echo "nfs-utils OK"
else echo "nfs-utils ${ORANGE}NO${RESETBG}"
fi


if [[ `command -v ps` ]]; then
    echo "Xfsprogs OK"
else echo "Xfsprogs ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v udevd` ]]; then
    echo "udev OK"
else echo "udev ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v grub-install || command -v grub` ]]; then
    echo "Grub OK"
else echo "Grub ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v mcelog` ]]; then
    echo "Mcelog OK"
else echo "Mcelog ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v iptables` ]]; then
    echo "Iptables OK"
else echo "Iptables ${ORANGE}NO${RESETBG}"
fi

if [[ `command -v git` ]]; then
    echo "Git OK"
else echo "Git ${ORANGE}NO${RESETBG}"
fi
}

function main {
read -p "install packages not found?[y/n] "
if [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v apt-get` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Apt package manager detected installing packages........."
	sleep 1
	sudo apt-get install build-essential libncurses-dev bison flex libssl-dev libelf-dev clang-11 mutt && echo ${RED} "Packages installed!!!"
elif [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v yum` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum package manager detected installing packages........."
	sleep 1
	sudo sudo yum groupinstall "Development Tools" && sudo yum update && sudo yum install clang ncurses-devel bison flex elfutils-libelf-devel openssl-devel && echo ${RED} "Packages installed!!!"
elif [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v dnf` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Dnf package manager detected installing packages........."
	sleep 1
	sudo dnf group install "Development Tools" && sudo dnf install ncurses-devel bison flex elfutils-libelf-devel openssl-devel && echo ${RED} "Packages installed!!!"
else echo -ne "${RESETBG}\n${WHITEBG}${BLACK}[${BLACK}!${BLACK}]${BLACK} Thanks for using this tool have a good day and spread the love 💖 ${RESETBG}\n" && exit
fi
}

check
main
