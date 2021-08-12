#!/bin/bash

# check if your machine is ready for kernel development.
gcc --version | head -n1
clang --version | head -n1
make --version | head -n1
git --version
cscope --version 
vim --version | head -n1
ld -v
flex --version
bison --version | head -n1
fdformat --version
depmod -V | head -n1
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
openssl version
bc --version | head -n1
sphinx-build --version
