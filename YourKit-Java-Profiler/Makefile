.PHONY: all

all: build install

build:
	./build.sh

install:
	sudo dnf -y install ./yjp-*.rpm
	sudo install -t /usr/share/applications yjp.desktop

uninstall:
	sudo dnf -y erase yjp
	sudo rm /usr/share/applications/yjp.desktop
