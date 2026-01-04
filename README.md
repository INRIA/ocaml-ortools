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
  C++ section). See also the notes below.

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

### Personal experience of trying to build from source

On macOS, install the required libraries:
```
brew install abseil protobuf protobuf-c re2 zlib bzip2 eigen@3
```

Then, in the OR-Tools source directory:
```
cmake -DBUILD_SAMPLES=OFF -DBUILD_EXAMPLES=OFF -DBUILD_FLATZINC=OFF \
      -DBUILD_TESTING=OFF \
      -DUSE_COINOR=OFF -DUSE_CPLEX=OFF -DUSE_GLPK=OFF -DUSE_HIGHS=OFF \
      -DUSE_PDLP=OFF -DUSE_SCIP=OFF -DUSE_GLOP=ON -DUSE_XPRESS=OFF \
      -DUSE_GUROBI=ON \
      -S . -B build
cmake --build build --config Release -j -v
```

For me, this sufficed to build v9.12, but my attempts to build v9.13 or 
v9.14 failed due to changes in Abseil around absl:Nonnull. It was possible 
however to build the main branch (62fbfbc55e71d67217b08eebfdc268646ae2c41a).
The `USE_GUROBI` and `USE_GLOP` options are needed to avoid missing symbols 
errors during linking.

On debian, the required libraries are:
```
sudo apt install libabsl-dev protobuf-compiler libprotobuf-c-dev \
                 libre2-dev libz-dev libbz2-dev libeigen3-dev
```

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

