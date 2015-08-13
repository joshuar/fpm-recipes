.PHONY: all

all: build install

build:
	./build.sh

install:
	sudo dnf install ./eclipse-mat-*.rpm
	sudo install -t /usr/share/applications eclipse-mat.desktop
	sudo install -t /usr/share/pixmaps eclipse-mat.png

uninstall:
	sudo dnf erase eclipse-mat
	sudo rm /usr/share/applications/eclipse-mat.desktop
	sudo rm /usr/share/pixmaps/eclipse-mat.png
