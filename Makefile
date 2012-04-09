CC=gcc
CFLAGS=-Wall -Wextra -std=gnu99 -pedantic -g -fbounds-check
LDFLAGS=
PROGNAME=chip8

$(PROGNAME): main.c cpu.o opcodes.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(PROGNAME)  main.c cpu.o opcodes.o
	$(MAKE) clean-objs

cpu.o: cpu.c cpu.h opcodes.h
	$(CC) $(CFLAGS) -o cpu.o -c cpu.c

opcodes.o: opcodes.c opcodes.h
	$(CC) $(CFLAGS) -o opcodes.o -c opcodes.c

debug:
	$(MAKE) chip8debug CFLAGS=-DDEBUG_MODE PROGNAME=chip8debug
	$(MAKE) clean-objs

clean-objs:
	rm -f opcodes.o cpu.o
