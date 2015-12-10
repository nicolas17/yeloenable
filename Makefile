SDKPATH=/var/mobile/Documents/iPhoneOS8.1.sdk

CFLAGS=-isysroot ${SDKPATH} -F /Library/Frameworks
LDFLAGS=-isysroot ${SDKPATH} -F /Library/Frameworks \
		-framework Foundation \
		-framework CydiaSubstrate

.PHONY: all

all: YeloEnable.dylib

YeloEnable.o: YeloEnable.m
	clang -c $< -o $@ $(CFLAGS)

YeloEnable.dylib: YeloEnable.o
	clang -shared -o $@ YeloEnable.o $(LDFLAGS)
	ldid -S $@
