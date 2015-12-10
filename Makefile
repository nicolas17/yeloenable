SDKPATH=/var/mobile/Documents/iPhoneOS8.1.sdk

CFLAGS=-isysroot ${SDKPATH} -F /Library/Frameworks
LDFLAGS=-isysroot ${SDKPATH} -F /Library/Frameworks \
		-framework Foundation \
		-framework CydiaSubstrate
ARCHFLAGS=-arch armv7 -arch arm64

.PHONY: all

all: YeloEnable.dylib

YeloEnable.o: YeloEnable.m
	clang -c $< -o $@ $(CFLAGS) $(ARCHFLAGS)

YeloEnable.dylib: YeloEnable.o
	clang -shared -o $@ YeloEnable.o $(LDFLAGS) $(ARCHFLAGS)
	ldid -S $@
