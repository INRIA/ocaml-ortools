.PHONY : build deps clean docs

build:
	dune build

doc:
	dune build @doc

clean :
	dune clean

