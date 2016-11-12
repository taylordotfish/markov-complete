.PHONY: all
all: libs install-libs
	cd markov && $(MAKE)
	cd readline && $(MAKE)
	cd weechat && $(MAKE)
	cd vim && $(MAKE)

.PHONY: install
install:
	cd markov && $(MAKE) install
	cd readline && $(MAKE) install
	cd weechat && $(MAKE) install
	cd vim && $(MAKE) install

.PHONY: libs
libs:
	cd markov && $(MAKE)

.PHONY: install-libs
install-libs:
	cd markov && ($(MAKE) install || sudo $(MAKE) install)
