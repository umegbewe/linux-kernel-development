# Linux Kernel Development

The purpose of this repo is to get you started with packages and resources necessary to develop for the Linux Kernel

## check.sh script
The check.sh script checks and installs the required packages to compile Linux Kernel for your distribution.<br>
Usage: ``bash check.sh``

Example:
```
Gcc OK
Clang OK
Make OK
Binutils OK
Flex OK
Bison OK
Perl OK
Bc OK
OpenSSL OK
kmod OK
Util-Linux OK
e2fsprogs OK
 
### If everything is OK above you should be able to compile
 
jfsutils NO
reiserfsprogs NO
squashfs-tools NO
pcmciautils NO
quota-tools OK
PPP NO
nfs-utils OK
nfs-utils OK
Xfsprogs OK
udev NO
Grub NO
Mcelog NO
Iptables OK
Git OK

```

## Courses and Links
- https://training.linuxfoundation.org/training/a-beginners-guide-to-linux-kernel-development-lfd103/ (Recommended)
- [Linux From Scratch Book](https://www.linuxfromscratch.org/lfs/download.html) (Recommended)
- https://www.linuxtopia.org/online_books/linux_kernel/kernel_configuration/
- https://www.kernel.org/doc/html/v4.16/process/howto.html

## Minimum Requirements to compile the Linux Kernel

### GCC (GNU Compiler Collection) [Wikipedia](https://en.wikipedia.org/wiki/GNU_Compiler_Collection)
GCC is a compiler for C and C++ programming languages, the Linux Kernel is written in C and GCC is it's default compiler

### Clang [Wikipedia](https://en.wikipedia.org/wiki/Clang)
Clang is an "LLVM native" C/C++/Objective-C compiler a substitute to GCC. Distributions such as Android, ChromeOS use Clang built kernels. 
:smile:  Pronounced “klang,” not “see-lang.”

### Make [Read more](https://www.gnu.org/software/make/)
Make is a tool which controls the generation of executables and other non-source files of a program from the program's source files. 

### Binutils [Read more](https://www.gnu.org/software/binutils/)
Binutils is a collection of software development tools containing a linker, assembler and other tools to work with object files and archives.

### Flex (fast lexical analyzer generator) [Wikipedia](https://en.wikipedia.org/wiki/Flex_(lexical_analyser_generator))
Flex is a tool that generates programs that perform pattern-matching on text.

### Bison [Wikipedia](https://en.wikipedia.org/wiki/GNU_Bison)
Bison is a general-purpose parser generator that converts a grammar description (Bison Grammar Files) for an LALR(1) context-free grammar into a C program to parse that grammar, the linux kernel build system generates parsers during build. This requires bison 2.0 or later.

### Perl [Read more](https://unix.stackexchange.com/questions/48018/why-is-perl-installed-by-default-with-most-linux-distributions)
Might wonder why perl? Obviously the Linux Kernel isn't written in Perl but it is needed to built some packages, you need perl 5 and the following modules: ``Getopt::Long``, ``Getopt::Std``, ``File::Basename``, and ``File::Find`` to build the kernel.

### BC (Basic Calculator) [Wikipedia](https://en.wikipedia.org/wiki/Bc_(programming_language))
bc is used during the kernel build to generate time constants in header files. Perl was formerly used but required a mechanism to support Perl < 5.8 installations lacking the ``Math::BigInt`` module [check this commit](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=70730bca1331fc50c3caacaea00439de1325bd6e). Though this could still be implemented with C or Perl.

### OpenSSL [Wikipedia](https://en.wikipedia.org/wiki/OpenSSL)
Module signing and external certificate handling use the OpenSSL and crypto library to do key creation and signature generation. 

### Kmod [Read more](https://man7.org/linux/man-pages/man8/kmod.8.html)
kmod is a multi-call binary which implements the programs used to control Linux Kernel modules. Linux distributions use modules in order to load only the needed driver for the system based on the hardware present, instead of building all possible drivers in the kernel to one large chunk.

**These are the basic packages required listed, you can find others [here](https://www.kernel.org/doc/html/latest/process/changes.html)**



## Found this useful?
Star the repo and follow me on [Twitter](https://twitter.com/nwebedu_junior) Thanks :heart:





