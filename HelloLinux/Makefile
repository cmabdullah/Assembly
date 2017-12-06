APP = hellolinux
NASMFLAGS = -f macho64 -o
all:
	nasm ${NASMFLAGS} ${APP}.o ${APP}.asm
	ld -o ${APP} ${APP}.o
clean:
	rm -f ${APP} ${APP}.o