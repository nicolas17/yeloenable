SDKPATH=/var/mobile/Documents/iPhoneOS8.1.sdk

CFLAGS=-isysroot ${SDKPATH}
LDFLAGS=-isysroot ${SDKPATH}

.PHONY: all

all: main

main: main.o
	clang -o $@ main.o $(LDFLAGS)

main.o: main.c
	clang -c $< -o $@ $(CFLAGS)
