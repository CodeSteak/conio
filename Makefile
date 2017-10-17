CC=gcc
CFLAGS=-Wall
LIB_DIR=/usr/lib
INCLUDE_DIR=/usr/include

conio.so: conio.c
	$(CC) $(CFLAGS) -shared -o conio.so -fPIC conio.c

test: main.c conio.c
	$(CC) $(CFLAGS) -g -o test main.c conio.c
	./test

clean:
	rm -f test
	rm -f conio.so

install: conio.so
	mkdir -p $(LIB_DIR)/conio/
	cp conio.so $(LIB_DIR)/conio/libconio.so
	ln -s $(LIB_DIR)/conio/libconio.so $(LIB_DIR)/libconio.so
	cp conio.h $(INCLUDE_DIR)/
	ldconfig

uninstall:
	rm $(LIB_DIR)/libconio.so
	rm $(LIB_DIR)/conio/libconio.so
	rm $(INCLUDE_DIR)/conio.h
	rmdir $(LIB_DIR)/conio
	ldconfig
