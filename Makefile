nasm_flags = -f elf32

all: build linkar run

build: sort.asm main.c 
	@nasm $(nasm_flags) sort.asm -o sort.o
	@gcc -m32 -c main.c -o main.o
	@gcc -m32 -c print.c -o print.o

linkar: main.o sort.o print.o
	@gcc -m32 -no-pie main.o sort.o print.o -o prog

run: prog 
	@./prog

.PHONY : clean # .PHONY means clean is not a file or an object
clean: 
	rm *.o prog