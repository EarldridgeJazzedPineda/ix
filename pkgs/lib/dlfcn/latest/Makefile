all: libdl.a

libdl.a: dlfcn.o Makefile
	-rm -f libdl.a
	ar q libdl.a dlfcn.o

dlfcn.o: dlfcn.cpp dlfcn.h Makefile
	$(CC) -DCOMPILE_DLOPEN -std=c++17 $(CPPFLAGS) $(CFLAGS) $(CXXFLAGS) -c -o dlfcn.o dlfcn.cpp

install: all
	mkdir -p $(PREFIX)/lib
	mkdir -p $(PREFIX)/include
	cp libdl.a $(PREFIX)/lib
	cp dlfcn.h $(PREFIX)/include
