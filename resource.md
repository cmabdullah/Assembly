# Terminal Run Command
> ➜  nasm -f macho64 -o hello.o hello.asm
> ➜  ld -o hello hello.o
> ➜  ./hello

### Old School Way
```Makefile
all:
    nasm -f macho64 -o hello.o hello.asm
    ld -o hello hello.o
clean:
	rm -f hello hello.o
```


### Smart Way
```Makefile
TARGET =	hello
OBJS =		$(TARGET).o
NASMFLAGS = -f macho64 -o
$(TARGET):	$(OBJS)
	nasm $(NASMFLAGS) $(OBJS) $(TARGET).asm
	ld -o $(TARGET) $(OBJS)
all:
	$(TARGET)
clean:
	rm -f $(OBJS) $(TARGET)
```

[Documentation](https://lord.io/blog/2014/assembly-on-osx/)
