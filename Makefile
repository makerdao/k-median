SOURCES = src/prelude.smt2.md src/lemmas.k.md src/storage.k.md src/specs.md

specs: dapp
	klab build

dapp:
	git submodule sync --recursive
	git submodule update --init --recursive
	cd median && dapp build

.PHONY: clean
clean:
	cd median && dapp clean
	rm -rf out/
