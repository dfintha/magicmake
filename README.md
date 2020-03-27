# magicmake

## purpose
this is a GNU makefile, which explores the src folder, collects various sources,
and provides various targets without the hassle to expand it when a new file or
subfolder is added

## supported languages
* Assembly (.s)
* C (.c)
* C++ (.cpp)
* FORTRAN (.f)
* COBOL (.cob)

## targets
* all: creates the executable file
* clean: deletes build results
* run: runs the built executable
* debugger: runs the build executable in a debugger
* loc: displays lines of code

## todos
* reformat the output for something more fashionable
  (but still in 16 colors and ASCII), with colors
* add targets for debug and release executables
* add targets to install/uninstall

## ideas
a tool might be made, which generates such makefiles with parametric
customization, like choosing which languages, what file extensions, and which
toolchains will be used, and toggling some optional features on or off, such as
colorization, etc.

## license
this work is under the 'do what the fuck you want to public license'

