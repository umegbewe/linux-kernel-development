#!/bin/bash
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

# checks if your distribution is ready for kernel development.
gcc --version | head -n1
clang --version | head -n1
make --version | head -n1
ld -v
flex --version
bison --version | head -n1
echo perl `perl -V:version`
bc --version | head -n1
openssl version
depmod -V | head -n1
fdformat --version
e2fsck -V | head -n1
fsck.jfs -V | head -n1
reiserfsck -V
mksquashfs -version | head -n1
pccardctl -V
quota -V | head -n1
pppd --version | head -n1
showmount --version
ps --version
udevd –version
grub-install --version || grub --version
mcelog --version
iptables --version
sphinx-build --version
python3 --version
git --version
cscope --version 
vim --version | head -n1 || nano --version

function main {
read -p "install packages not found?[y/n] "
if [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v apt-get` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Apt package manager detected installing packages........."
	sleep 1
	sudo apt-get install build-essential libncurses-dev bison flex libssl-dev libelf-dev
elif [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v yum` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Yum package manager detected installing packages........."
	sleep 1
	sudo sudo yum groupinstall "Development Tools" && sudo yum update && sudo yum install clang ncurses-devel bison flex elfutils-libelf-devel openssl-devel
elif [[ "$REPLY" == y || "$REPLY" == yes ]] && [[ `command -v dnf` ]]; then
	echo -e "\n${GREEN}[${WHITE}+${GREENS}]${GREENS} Dnf package manager detected installing packages........."
	sleep 1
	sudo dnf group install "Development Tools" && sudo dnf install ncurses-devel bison flex elfutils-libelf-devel openssl-devel
else echo -ne "${RESETBG}\n${WHITEBG}${BLACK}[${BLACK}!${BLACK}]${BLACK} Thanks for using this tool have a good day and spread the love 💖 ${RESETBG}\n" && exit
fi
}

main
