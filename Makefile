
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
