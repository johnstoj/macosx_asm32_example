AS = nasm
LD = ld

EXECUTABLE = helloworld
OBJS = helloworld32.o

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(LD) -o $(EXECUTABLE) -e entrypoint $(OBJS)

%.o: %.asm
	$(AS) -f macho $<

clean:
	rm -rf *.o
	rm -rf $(EXECUTABLE)
