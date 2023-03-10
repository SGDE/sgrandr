



CC = gcc

CFLAGS = `pkg-config --cflags gtk+-3.0`

LIBS = `pkg-config --libs gtk+-3.0` -lm

# File names

SRC = sgrandr.c sgrandr-cr.c

OBJ = $(SRC:.c=.o)

EXE = sgrandr sgrandr-cr

# Build executable files

all: $(EXE)

sgrandr: sgrandr.o

	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

sgrandr-cr: sgrandr-cr.o

	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

# Debug step

debug:

	$(CC) $(CFLAGS) -g $(SRC) -o debug $(LIBS)

# Test step

test:

	./sgrandr

	./sgrandr-cr

# Clean object files and executables

clean:

	rm -f $(OBJ) $(EXE) debug
