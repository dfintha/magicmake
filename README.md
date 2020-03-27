# magicmake

## Short Description
This is a GNU makefile, which explores the src folder, collects source files,
and provides various targets without the hassle to expand it when a new file or
subfolder is added.
Each source file will be compiled into an object file, and object files will be
linked together into a single source.

## Supported Languages
* x86 Assembly (.s)
* C (.c)
* C++ (.cpp)
* FORTRAN (.f)
* COBOL (.cob)

## Targets
* all: Creates the executable file.
* clean: Deletes build result and artifacts.
* run: Runs the built executable.
* debugger: Runs the build executable in a debugger.
* loc: Displays the amount of lines of code in the project.

## To-Do
* Reformat the output for something more fashionable (in 16 colors).
* Add targets for debug and release executables.
* Add targets to install/uninstall.

## License
This work is under the 'Do What the Fuck You Want To Public License' or WTFPL.

