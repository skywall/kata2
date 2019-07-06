install:
	brew cask install haskell-platform

build:
	ghc kata_2.hs -O3

run:
	@./kata_2

clean:
	rm kata_2 kata_2.hi kata_2.o
