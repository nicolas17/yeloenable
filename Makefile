SDKPATH=/var/mobile/Documents/iPhoneOS8.1.sdk

CFLAGS=-isysroot ${SDKPATH} -F /Library/Frameworks
LDFLAGS=-isysroot ${SDKPATH} -F /Library/Frameworks \
		-framework Foundation \
		-framework CydiaSubstrate
ARCHFLAGS=-arch armv7 -arch arm64

.PHONY: all install package

all: YeloEnable.dylib

YeloEnable.o: YeloEnable.m
	clang -c $< -o $@ $(CFLAGS) $(ARCHFLAGS)

YeloEnable.dylib: YeloEnable.o
	clang -shared -o $@ YeloEnable.o $(LDFLAGS) $(ARCHFLAGS)
	ldid -S $@

install: all
	install -D -v YeloEnable.dylib $(DESTDIR)/Library/MobileSubstrate/DynamicLibraries/YeloEnable.dylib
	install -D -v YeloEnable.plist $(DESTDIR)/Library/MobileSubstrate/DynamicLibraries/YeloEnable.plist

package:
	sudo rm -rf stage || rm -rf stage
	mkdir stage
	$(MAKE) install DESTDIR=stage
	mkdir stage/DEBIAN
	cp control stage/DEBIAN
	-sudo chown -R 0:0 stage
	dpkg-deb --build stage stage.deb
	dpkg-name -a -o stage.deb
	sudo rm -rf stage || rm -rf stage
