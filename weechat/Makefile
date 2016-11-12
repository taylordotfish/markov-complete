.PHONY: all
all: weechat/build/src/curses/gui/weechat

weechat:
	git clone https://github.com/weechat/weechat
	cd weechat && git am ../patch

.PHONY: patch
patch: weechat
	cd weechat && git am ../patch

weechat/build/src/curses/gui/weechat: weechat weechat/build
	cd weechat/build && $(MAKE)

weechat/build:
	mkdir weechat/build && cd weechat/build && \
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local/

.PHONY: install
install: all
	cd weechat/build && $(MAKE) install
