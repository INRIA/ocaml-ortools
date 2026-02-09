# ocaml-ortools dev notes

## Protocol Buffer Interfaces

The [Protocol Buffers](https://protobuf.dev/)
interfaces have been generated with 
[ocaml-protc](https://github.com/mransan/ocaml-protoc) (with
[pull/263](https://github.com/mransan/ocaml-protoc/pull/263)).

If required, they can be regenerated as follows.

```
git clone git@github.com:google/or-tools.git
cd or-tools
git checkout v9.15      % TODO: update with required version
opam install ocaml-protoc
ocaml-protoc --binary --pp --make --ml_out src/model \
    <path-to-or-tools>/ortools/sat/cp_model.proto
ocaml-protoc --binary --pp --make --ml_out src/model \
    <path-to-or-tools>/ortools/sat/sat_parameters.proto
```

## Release new version

1. git tag -a <version> -m '...release notes...' --sign
2. dune-release bistro

## Update the docs

1. in *ocaml-ortools*: build the docs `dune build @doc`
2. check out the `gh-pages` branch to *ocaml-ortools-gh-pages*
3. in *ocaml_ortools-gh-pages*: `rm -r index.html odoc.support ortools ortools_solvers`
4. in *ocaml_ortools-gh-pages*: `cp -r ../ocaml-ortools/_build/default/_doc/_html/* .`
5. `git add`, `commit`, `push`, etc.

