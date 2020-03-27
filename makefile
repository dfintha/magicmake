# Assembly Settings
COMPILER_ASM=yasm
SOURCES_ASM=$(shell find src -type f -name "*.s")
OBJECTS_ASM=$(patsubst src/%.s,obj/%.s.o,$(SOURCES_ASM))
CFLAGS_ASM=-f elf64

# C Settings
COMPILER_C=clang
SOURCES_C=$(shell find src -type f -name "*.c")
OBJECTS_C=$(patsubst src/%.c,obj/%.c.o,$(SOURCES_C))
CFLAGS_C=-std=c99

# C++ Settings
COMPILER_CXX=clang++
SOURCES_CXX=$(shell find src -type f -name "*.cpp")
OBJECTS_CXX=$(patsubst src/%.cpp,obj/%.cpp.o,$(SOURCES_CXX))
CFLAGS_CXX=-std=c++14 -Weffc++

# FORTRAN Settings
COMPILER_FORTRAN=gfortran
SOURCES_FORTRAN=$(shell find src -type f -name "*.f")
OBJECTS_FORTRAN=$(patsubst src/%.f,obj/%.f.o,$(SOURCES_FORTRAN))
CFLAGS_FOTRAN=-std=f77

# COBOL Settings
COMPILER_COBOL=cobc
SOURCES_COBOL=$(shell find src -type f -name "*.cob")
OBJECTS_COBOL=$(patsubst src/%.cob,obj/%.cob.o,$(SOURCES_COBOL))
CFLAGS_COBOL=-static

# Common Settings
BINARY=magicmake
LINKER=clang++
DEBUGGER=lldb
LFLAGS=-no-pie
LLIBS=-lpthread -lgfortran -lcob
CFLAGS_SHARED=-Wall -Wextra -pedantic \
			  -Wshadow -Wdouble-promotion -Wformat=2 -Wconversion \
			  -Isrc -Iinclude \
			  -O2 -ffast-math \
			  -march=x86-64 -mtune=generic -mrecip=all

# Intermediate Values
SOURCES=$(SOURCES_ASM) $(SOURCES_C) $(SOURCES_CXX) \
		$(SOURCES_FORTRAN) $(SOURCES_COBOL)
OBJECTS=$(OBJECTS_ASM) $(OBJECTS_C) $(OBJECTS_CXX) \
		$(OBJECTS_FORTRAN) $(OBJECTS_COBOL)

# ---------------------------------------------------------------------------- #

.PHONY: all loc run clean debugger

all: bin/$(BINARY)
	@printf "Build succeeded!\n"

loc:
	@printf "Lines of code in project: %s.\n" `cat $(SOURCES) | wc -l`

run: bin/$(BINARY)
	@printf "Running executable $<\n"
	@bin/$(BINARY)

debugger: bin/$(BINARY)
	@printf "Starting debugger for executable $<\n"
	@$(DEBUGGER) bin/$(BINARY)

bin/$(BINARY): $(OBJECTS_ASM) $(OBJECTS_C) $(OBJECTS_CXX) \
				$(OBJECTS_FORTRAN) $(OBJECTS_COBOL)
	@mkdir -p $(shell dirname $@)
	@printf "Linking executable $@\n"
	@$(LINKER) $(OBJECTS) $(LFLAGS) $(LLIBS) -o $@
	@strip $@

obj/%.s.o: src/%.s
	@mkdir -p $(shell dirname $@)
	@printf "Building x86 Assembly object $@\n"
	@$(COMPILER_ASM) $(CFLAGS_ASM) $< -o $@

obj/%.c.o: src/%.c
	@mkdir -p $(shell dirname $@)
	@printf "Building C object $@\n"
	@$(COMPILER_C) $(CFLAGS_C) $(CFLAGS_SHARED) -c $< -o $@

obj/%.cpp.o: src/%.cpp
	@mkdir -p $(shell dirname $@)
	@printf "Building C++ object $@\n"
	@$(COMPILER_CXX) $(CFLAGS_CXX) $(CFLAGS_SHARED) -c $< -o $@

obj/%.f.o: src/%.f
	@mkdir -p $(shell dirname $@)
	@printf "Building FORTRAN object $@\n"
	@$(COMPILER_FORTRAN) $(CFLAGS_FORTRAN) -c $< -o $@

obj/%.cob.o: src/%.cob
	@mkdir -p $(shell dirname $@)
	@printf "Building COBOL object $@\n"
	@$(COMPILER_COBOL) $(CFLAGS_COBOL) -c $< -o $@

clean:
	@printf "Removing directory bin\n"
	@rm -rf bin
	@printf "Removing directory obj\n"
	@rm -rf obj

