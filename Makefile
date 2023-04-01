CFLAGS += -std=c99 -Wall -Wextra -pedantic
PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
CC     ?= gcc

all: kilo

kilo: kilo.c
	$(CC) -O3 $(CFLAGS) -o $@ $< -lX11 $(LDFLAGS)

install: all
	install -Dm755 kilo $(DESTDIR)$(BINDIR)/kilo

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/kilo

clean:
	rm -f kilo

.PHONY: all install uninstall clean
