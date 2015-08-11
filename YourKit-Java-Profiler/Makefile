.PHONY: all

all: build install

build:
	./build.sh

install:
	sudo dnf install ./yjp-*.rpm
	sudo install -t /usr/share/applications yjp.desktop
