i386-elf-as src/boot.asm -o build/boot.o
i386-elf-gcc -c src/kernel.c -o build/kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra
i386-elf-gcc -T src/linker.ld -o myos.bin -ffreestanding -O2 -nostdlib build/boot.o build/kernel.o -lgcc
cp myos.bin isodir/boot/myos.bin
grub-mkrescue -o myos.iso isodir
qemu-system-i386 -cdrom myos.iso
