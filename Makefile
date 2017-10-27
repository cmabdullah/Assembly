CC = gcc
APPNAME = hello
all:
	${CC} -g -c ${APPNAME}.c -o ${APPNAME}.o
	${CC} ${APPNAME}.o -o ${APPNAME}
	objdump -s -t ${APPNAME}.o > ${APPNAME}.asm

clean:
	rm *.o
