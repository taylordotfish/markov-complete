.PHONY: all
all: readline/shlib/libreadline.so.7.0

readline:
	git clone git://git.savannah.gnu.org/readline.git
	cd readline && git am ../patch

.PHONY: patch
patch: readline
	cd readline && git am ../patch

readline/shlib/libreadline.so.7.0: readline readline/markov readline/Makefile readline/shlib/Makefile
	cd readline && $(MAKE) SHLIB_LIBS=/lib/x86_64-linux-gnu/libncurses.so.5

readline/Makefile: readline/Makefile.in
	cd readline && ./configure

readline/shlib/Makefile: readline/shlib/Makefile.in
	cd readline && ./configure

readline/markov:
	cd ../markov && $(MAKE)
	cd readline && ln -s ../../markov/markov .

.PHONY: install
install: readline/shlib/libreadline.so.7.0
	cp $? /usr/local/lib
