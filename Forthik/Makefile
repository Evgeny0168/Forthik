ASM = nasm
ASM_FLAGS = -felf64 -g -Isrc/
LINKER = ld

all: bin/forthik

bin/forthik: objects/forthik.o 
	mkdir -p bin
	$(LINKER) -o bin/forthik $(LINKERFLAGS) -o bin/forthik objects/forthik.o $(LIBS)

objects/forthik.o:	src/forthik.asm src/macro.inc src/interpreter.inc src/forth-utils.inc 
	mkdir -p objects
	$(ASM) $(ASM_FLAGS) src/forthik.asm -o objects/forthik.o
clean:
	rm -rf bin objects

.PHONY: clean