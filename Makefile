MAJOR_VERSION = 1
MINOR_VERSION = 0

CC = gcc
DESTDIR =
PREFIX = /usr/local
CFLAGS = -std=c99 -Wall -Wextra -pedantic -g
LDFLAGS = -g
SHARED_CFLAGS = -fPIC
SHARED_LDFLAGS = -shared -Wl,-soname,$@.$(MAJOR_VERSION)

SRC = string_score.c
OBJ = $(SRC:.c=.o)

all: libstring_score.so

$(OBJ): $(SRC)
	$(CC) $(CFLAGS) $(SHARED_CFLAGS) -c $<

libstring_score.so: $(OBJ)
	$(CC) $(LDFLAGS) $(SHARED_LDFLAGS) -o $@.$(MAJOR_VERSION).$(MINOR_VERSION) $(OBJ)
	ln -sf $@.$(MAJOR_VERSION).$(MINOR_VERSION) $@.$(MAJOR_VERSION)
	ln -sf $@.$(MAJOR_VERSION).$(MINOR_VERSION) $@

clean:
	rm -f libstring_score.so* $(OBJ)

install: all
	install -D libstring_score.so.$(MAJOR_VERSION).$(MINOR_VERSION) $(DESTDIR)$(PREFIX)/lib/libstring_score.so.$(MAJOR_VERSION).$(MINOR_VERSION)
	ln -sf libstring_score.so.$(MAJOR_VERSION).$(MINOR_VERSION) $(DESTDIR)$(PREFIX)/lib/libstring_score.so
	ldconfig

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/lib/libstring_score.so
	rm -f $(DESTDIR)$(PREFIX)/lib/libstring_score.so.$(MAJOR_VERSION)
	rm -f $(DESTDIR)$(PREFIX)/lib/libstring_score.so.$(MAJOR_VERSION).$(MINOR_VERSION)

.PHONY: all clean install uninstall
