.PHONY: all
all: markov
	cd markov && $(MAKE)

markov:
	git clone https://github.com/bobbybee/markov

.PHONY: install
install: all
	cd markov && $(MAKE) install
