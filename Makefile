all:
	nasm -f macho64 -o hello.o hello.asm
	ld -o hello hello.o

clean:
	rm hello hello.o
