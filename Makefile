.PHONY: build_pkg build vm_test install remove clean


build:
	glib-compile-schemas source/schemas
	mkdir -p build/
	cp -r source/* build/
	rm -f build/prefs.ui~


build_pkg: build
	mkdir -p pkg/
	cd build/ && zip -r ../pkg/Transbar@SinaMobasheri.zip .


vm_test: build
	rm -rf $(HOME)/Documents/shared/Transbar/Transbar@SinaMobasheri
	mkdir -p $(HOME)/Documents/shared/Transbar/Transbar@SinaMobasheri
	cp -r build/* $(HOME)/Documents/shared/Transbar/Transbar@SinaMobasheri/


install: build
	rm -rf $(HOME)/.local/share/gnome-shell/extensions/Transbar@SinaMobasheri
	mkdir -p $(HOME)/.local/share/gnome-shell/extensions/Transbar@SinaMobasheri
	cp -r build/* $(HOME)/.local/share/gnome-shell/extensions/Transbar@SinaMobasheri/


remove:
	rm -rf $(HOME)/.local/share/gnome-shell/extensions/Transbar@SinaMobasheri


clean:
	rm -rf pkg/ build/
