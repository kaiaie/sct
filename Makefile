BIN=sct
SRC=sct.c
OBJ=$(SRC:.c=.o)
DESTDIR=/usr/local


all: $(BIN)

$(BIN): $(OBJ)
	$(CC) -o $(BIN) $(OBJ) -L /usr/X11R6/lib -lm -lX11 -lXrandr

.c.o:
	$(CC) -Wall -pedantic -Werror -std=c99 -g -I /usr/X11R6/include -c $< -o $@

clean:
	rm -f $(BIN) $(OBJ)

install:
	install -m755 $(BIN) $(DESTDIR)/bin
	

.PHONY: all install clean

