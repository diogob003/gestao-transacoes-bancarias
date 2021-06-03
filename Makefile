# Variáveis
CC = gcc
CFLAGS = -std=c99 -pedantic-errors -Wall

# Regra : dependências
all: listaDeDados.o main.o
	$(CC) $(CFLAGS) main.o lib/listaDeDados.o -lm -o main

main.o: main.c
	$(CC) $(CFLAGS) -c main.c -o main.o

listaDeDados.o: lib/listaDeDados.h
	$(CC) $(CFLAGS) -c lib/listaDeDados.c -o lib/listaDeDados.o

.PHONY: clean
clean:
	-rm -rf *.o lib/*.o main

run:
	./main

# See target-specific variables https://www.gnu.org/software/make/manual/make.html#Target_002dspecific
debug: CFLAGS += -g
debug: clean all
