all:
	nasm -f elf64 -gdwarf cnt_even.asm && gcc -o cnt_even -no-pie cnt_even.o

clean:
	rm cnt_even cnt_even.o

