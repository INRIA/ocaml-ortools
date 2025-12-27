# OCaml interface to Google OR-Tools

**Currently only a subset of CP-SAT is supported.**

(https://github.com/inria/ocaml-ortools/pulls)[Pull requests] providing the 
missing features are welcome, but please pay attention to documentation and 
tests.

TODO:
* install and build instructions for macos/linux
* Makefile
  - download ortools binaries and install with OCaml interface?
    (like Python does)
  - update from proto files
* reread cp_model.cc and double-check OCaml implementation
* more samples
* setup testing
* C++ interface to solve to eliminate copy?

; on macOS
; LIBRARY_PATH=~/Downloads/software/or-tools_v9.12.4544/lib:$LIBRARY_PATH
; DYLD_LIBRARY_PATH=~/Downloads/software/or-tools_v9.12.4544/lib:$DYLD_LIBRARY_PATH
;
; see also: install_name_tool

## Update Low-level Protocol Buffer Interface

Use (https://github.com/mransan/ocaml-protoc)[ocaml-protc] to generate the 
low-level (https://protobuf.dev/)[Protocol Buffers] interfaces from the 
OR-tools source.

TODO: (https://github.com/mransan/ocaml-protoc/blob/master/doc/ocaml_extensions.md)[(ocaml_container) = repeated_field] extension?

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

