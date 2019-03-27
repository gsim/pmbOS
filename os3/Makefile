SOURCES = $(wildcard src/*.c)
SOURCEDIR = src
BUILDDIR = build
OBJECTS = $(patsubst $(SOURCEDIR)/%.c,$(BUILDDIR)/%.o,$(SOURCES))
CFLAGS = -c -std=gnu99 -ffreestanding -O2 -Wall -Wextra -nostdlib
MYCC = i386-elf-gcc

#$(info $(SOURCES))
#$(info $(OBJECTS))
#$(info $(FLAGS1))
#$(info $(MYCC))

all: boot.o $(OBJECTS) mylink

$(OBJECTS): $(BUILDDIR)/%.o : $(SOURCEDIR)/%.c
	$(MYCC) $< -o $@ $(CFLAGS)
	
boot.o: src/boot.asm
	i386-elf-as src/boot.asm -o build/boot.o

mylink: src/linker.ld
	$(MYCC) -T src/linker.ld -o isodir/boot/pmbOS.bin -ffreestanding -O2 -nostdlib build/*.o -lgcc
	grub-mkrescue -o pmbOS.iso isodir > /dev/null

run:
	qemu-system-i386 -cdrom pmbOS.iso
	
clean:
	rm build/*
	rm isodir/boot/pmbOS.bin
	rm pmbOS.iso