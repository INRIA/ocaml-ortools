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

```
opam install ocamlfind ortools_solvers
ocamlfind ocamlopt -o cp_is_fun_sat.exe \
            -package ortools_solvers -linkpkg \
            samples/sat/cp_is_fun_sat.ml
./cp_is_fun_sat.exe
```

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

### Dune

The `ortools-solvers` package tries to solve the difficulties of installing 
CP-SAT on a given platform and calling it from an OCaml program. To do this, 
the source of OR-Tools and required libraries is included in the package and 
built with the OCaml interface.

On macOS, the build relies on the homebrew packages `abseil`, `protobuf`, 
`protobuf-c`, and `re2`, and also an internal build of `eigen3`. On Linux, 
all of these libraries are built internally.

There are currently a number of known imperfections based on assumed 
limitations of dune (at the time of writing):

1. The build assumes that it is possible to run `cmake -j 8` 
   (`ortools_solvers/dune`). Running without any parallelism is much slower, 
   but requesting too much parallelism can overwhelm the build machine. Dune 
   does not currently provide a way of sharing cores between itself and an 
   external build process controlled by `cmake`/`make`. See this 
   [discussion](https://github.com/ocaml/dune/discussions/11112).

2. To run an OCaml program that uses `ortools-solvers`, the loader must be 
   able to find `libortools.so` (and also `libabsl_log_internal_message.so`, 
   `libabsl_raw_logging_internal.so`, `libabsl_raw_hash_set.so`, and 
   `protobuf.so`). This is not a problem once `ortools-solvers` is installed 
   since the stub uses `$CAMLORIGIN` to specify the `-L` and `-rpath` flags 
   (`ortools_solvers/stubs/dune`).
   However, to test against a local build before installation, it is 
   necessary to manually set and export either `DYLD_LIBRARY_PATH` (macOS) 
   or `LD_LIBRARY_PATH` (Linux). This is also the reason why the build does 
   not try to run such tests, e.g., by running the programs in 
   `samples/sat`, during continuous integration.
   (`DYLD_LIBRARY_PATH=_build/install/default/lib/ortools_solvers dune exec 
   -- samples/sat/cp_is_fun_sat.exe`).

