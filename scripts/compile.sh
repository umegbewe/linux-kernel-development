#!/bin/bash

RED="$(printf '\033[31m')"  GREENS="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"
RESETBG="$(printf '\e[0m\n')"

read -p "${ORANGE}[!] Add a .config file...${RESETBG}"
echo
# cp /boot/<latest - config-5.0.0-21-generic> .config

lsmod > /tmp/my-lsmod
make LSMOD=/tmp/my-lsmod localmodconfig
make -j3 all
printf "${GREENS}[+] Kernel compilation completed...\n${RESETBG}"

su -c "make modules_install install"
printf "${GREENS}[+] Kernel installation completed...\n${RESETBG}"

# for debug
if [[ ! -d "dmesg_messages" ]]; then
  mkdir dmesg_messages
fi

dmesg -t > dmesg_messages/dmesg_current
dmesg -t -k > dmesg_messages/dmesg_kernel
dmesg -t -l emerg > dmesg_messages/dmesg_current_emerg
dmesg -t -l alert > dmesg_messages/dmesg_current_alert
dmesg -t -l crit > dmesg_messages/dmesg_current_crit
dmesg -t -l err > dmesg_messages/dmesg_current_err
dmesg -t -l warn > dmesg_messages/dmesg_current_warn
dmesg -t -l info > dmesg_messages/dmesg_current_info
printf "${GREENS}[+] Dmesg logs are ready...\n${RESETBG}"
