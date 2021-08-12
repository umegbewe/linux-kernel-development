#!/bin/bash

# check if your machine is ready for kernel development.
gcc --version | head -n1
clang --version | head -n1
make --version | head -n1
ld -v
flex --version
bison --version | head -n1
fdformat --version
depmod -V | head -n1
e2fsck -V | head -n1
fsck.jfs -V | head -n1
reiserfsck -V
