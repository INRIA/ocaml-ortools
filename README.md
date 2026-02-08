# OCaml interface to Google OR-Tools

**Currently only a subset of CP-SAT is supported.**

[Pull requests](https://github.com/inria/ocaml-ortools/pulls) providing the 
missing features are welcome, but please pay attention to documentation and 
tests.

This project provides two packages:

* `ortools` is an OCaml interface for building CP-SAT models. It does not 
  require an installation of OR-Tools as it simply works with the protocol 
  buffer format. See `utils/sat_solve_pb.{c,py}` for examples of interfacing 
  with the CP-SAT solver.

* `ortools_solvers` builds on `ortools` to provide a simple OCaml interface 
  for calling CP-SAT. This package builds its own version of OR-Tools and, 
  on Linux, the libraries abseil, re2, protobuf, and protobuf-c.

Online docs: https://inria.github.io/ocaml-ortools/

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

## Development

Cheat sheets

### Release new version

1. git tag -a <version> -m '...release notes...' --sign
2. dune-release bistro

## Update the docs

1. in *ocaml-ortools*: build the docs `dune build @doc`
2. check out the `gh-pages` branch to *ocaml-ortools-gh-pages*
3. in *ocaml_ortools-gh-pages*: `rm -r index.html odoc.support ortools ortools_solvers`
4. in *ocaml_ortools-gh-pages*: `cp -r ../ocaml-ortools/_build/default/_doc/_html/* .`
5. `git add`, `commit, `push`, etc.

## TODOs

* Finish migrating OR-Tools `sat/samples`

* Use `alcotest` to test the interface.

* CP-SAT: Support `Interval` constraints

* CP-SAT: Support `NoOverlap` constraints

* CP-SAT: Support `NoOverlap2D` constraints

* CP-SAT: Support `Element` constraints

* CP-SAT: Support `Circuit` constraints

* CP-SAT: Support `Routes` constraints

* CP-SAT: Support `Table` constraints

* CP-SAT: Support `Automaton` constraints

* CP-SAT: Support `Inverse` constraints

* CP-SAT: Support `Reservoir` constraints

* CP-SAT: Support `Cumulative` constraints

* CP-SAT: Support `Dummy` constraints

* Support other solvers

