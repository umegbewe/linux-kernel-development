# Linux Kernel Development

The purpose of this repo is to get you ready with tools and resources to develop for the linux kernel

## Minimum Requirements

### GCC (GNU Compiler Collection) [Wikipedia](https://en.wikipedia.org/wiki/GNU_Compiler_Collection)
GCC is a compiler for C and C++ programming languages, the Linux Kernel is written in C and GCC is it's default compiler

### Clang [Wikipedia](https://en.wikipedia.org/wiki/Clang)
Clang is an "LLVM native" C/C++/Objective-C compiler a substitute to GCC. Distributions such as Android, ChromeOS use Clang built kernels. 
☺️  Pronounced “klang,” not “see-lang.”

### Make [Read more](https://www.gnu.org/software/make/)
Make is a tool which controls the generation of executables and other non-source files of a program from the program's source files. 

### Binutils [Read more](https://www.gnu.org/software/binutils/)
Binutils is a collection of software development tools containing a linker, assembler and other tools to work with object files and archives.

### Flex (fast lexical analyzer generator) [Wikipedia](https://en.wikipedia.org/wiki/Flex_(lexical_analyser_generator))
Flex is a tool that generates programs that perform pattern-matching on text.

### Bison [Wikepedia](https://en.wikipedia.org/wiki/GNU_Bison)
Bison is a general-purpose parser generator that converts a grammar description (Bison Grammar Files) for an LALR(1) context-free grammar into a C program to parse that grammar, the linux kernel build system generates parsers during build. This requires bison 2.0 or later.

### Perl [Read more](https://unix.stackexchange.com/questions/48018/why-is-perl-installed-by-default-with-most-linux-distributions)
Might wonder why perl? Obviously the Linux Kernel isn't written in Perl but it is needed to built some packages, you need perl 5 and the following modules: ``Getopt::Long``, ``Getopt::Std``, ``File::Basename``, and ``File::Find`` to build the kernel.

### BC (Basic Calculator) [Wikipedia](https://en.wikipedia.org/wiki/Bc_(programming_language))
bc is used during the kernel build to generate time constants in header files. Perl was formerly used but required a mechanism to support Perl < 5.8 installations lacking the ``Math::BigInt`` module [check this commit](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=70730bca1331fc50c3caacaea00439de1325bd6e). Though this could still be implemented with C or Perl.

### OpenSSL [Wikipedia](https://en.wikipedia.org/wiki/OpenSSL)
Module signing and external certificate handling use the OpenSSL and crypto library to do key creation and signature generation. 





