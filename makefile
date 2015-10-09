install: uninstall
	test -d /usr/share/fonts/truetype/mm || mkdir -p /usr/share/fonts/truetype/mm && cp ./fonts/*.ttf /usr/share/fonts/truetype/mm
	test -d /usr/share/ffs || mkdir -p /usr/share/ffs && cp ./ffs/* /usr/share/ffs/
	rm -rf /usr/share/X11/xkb/rules/evdev.xml
	rm -rf /usr/share/X11/xkb/symbols/mm
	cp ./ffs/evdev.xml /usr/share/X11/xkb/rules/evdev.xml
	chmod 775 /usr/share/X11/xkb/rules/evdev.xml
	cp ./ffs/zawgyi /usr/share/X11/xkb/symbols/zawgyi && chmod 775 /usr/share/X11/xkb/symbols/zawgyi
	cp ./ffs/mm /usr/share/X11/xkb/symbols/mm && chmod 775 /usr/share/X11/xkb/symbols/mm
	cp ./icons/* /usr/share/icons/ && chmod 775 /usr/share/icons/{zawgyi,unicode,ffs}.png
	ln -s /usr/share/ffs/ffs /usr/local/bin/ffs
	ln -s /usr/share/ffs/ffs-ui /usr/local/bin/ffs-ui
	cp ./ffs/fedora-font-switcher.desktop /usr/share/applications/
	fc-cache -fv

uninstall:
	rm -rfv /usr/share/fonts/truetype/mm
	rm -rfv /usr/share/ffs
	rm -fv /usr/local/bin/ffs
	rm -fv /usr/local/bin/ffs-ui
	rm -fv /usr/share/applications/fedora-font-switcher.desktop
	rm -rf /usr/share/X11/xkb/symbols/zawgyi

.PHONY: install uninstall
