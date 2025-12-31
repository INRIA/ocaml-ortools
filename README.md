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
  for calling CP-SAT. Building and installing it requires an OR-Tools 
  installation (see below).

Online docs: https://inria.github.io/ocaml-ortools/

## Building with Google OR-Tools

Ensure that `libortools.9.dylib` (macOS) or `libortools.so.9` (Linux), and 
the other runtime libraries, are accessible by your compiler and loader.

For example, on macOS, set the `LIBRARY_PATH` (for compilation) and 
`DYLD_LIBRARY_PATH` (for execution) environment variables.

On Linux, set the `LD_LIBRARY_PATH` (for compilation and execution) 
environment variable.

There are several options for obtaining the runtime libraries.

- Download or build from source following the [official 
  instructions](https://developers.google.com/optimization/install) (see the 
  C++ section).

- Install the Python libraires with `pip`. The OR-Tools runtime can be found 
  in `site-packages/ortools/.libs`.

- From the [or-tools releases on 
  github](https://github.com/google/or-tools/releases),
  download `Google.OrTools.runtime.<os>-<arch>.9.<minor>.<patch>.nupkg`
  where os ∈ { linux, osx, win } and arch ∈ { arm64, x64 } and `unzip` it. 
  The required files are in `runtimes/*/native`.

I would have liked all this to be automatic, but:

- There do not seem to be suitable brew/linux packages that could be linked 
  from opam;

- Vendoring the source in the opam package and building it on install is 
  error-prone and resource-intensive;

- Including several binary versions in the opam package is tedious to 
  maintain and wasteful to download; and

- Dynamically downloading the library on build is prevented by opam 
  sandboxing (see the `download` branch for a prototype).

## Protocol Buffer Interfaces

The [Protocol Buffers](https://protobuf.dev/)
interfaces have been generated with 
[ocaml-protc](https://github.com/mransan/ocaml-protoc) (with
[pull/263](https://github.com/mransan/ocaml-protoc/pull/263)).

If required, they can be regenerated as follows.

```
git clone git@github.com:google/or-tools.git
cd or-tools
git checkout v9.14      % TODO: update with required version
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

* More sophisticated `Ortools_solvers` interface: write in C++, require 
  OR-Tools headers.
  - Support FeasibleSolutionObserver interface with callbacks into OCaml.
  - Eliminate the redundant copy in `ocaml_ortools_sat_solve`.

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

