
## 9.15.0-3 (2026-10-11)

MacOS: build all required libraries (abseil, re2, protobuf, protobuf-c) 
rather than rely on brew-installed external dependencies to avoid build 
failures after the recent update of Abseil to 20260817. The other external 
libraries all require a consistent version of Abseil. This change increases 
the build time but also its robustness to changes in the build environment, 
i.e., to changes in the packages install with homebrew.

## 9.15.0-2 (2026-06-10)

Expose more of the underlying protocol buffers machinery to facilitate the 
iterative use of the CP-SAT solver from OCaml, e.g., to complete hints, or 
to solve multiple objectives in sequence.

## 9.15.0-1 (2026-03-06)

Include the v9.15 Google OR-tools source and build together with the 
OCaml interface. Rewrite the interface in C++ to avoid an unnecessary copy 
and allow feasible solution observers.

Remove the eigen3 depext (this template library is now included directly 
in the build). Adjust other dependencies based on recent work on conf-zlib  
and conf-bzip2.

Add Sat.Var.any.

## 9.15.0 (2026-02-08)

Include the v9.15 Google OR-tools source and build together with the OCaml 
interface. Rewrite the interface in C++ to avoid an unnecessary copy and 
allow feasible solution observers.

## 9.14.0 (2025-12-31)

Initial release.

Incomplete interface to the Google OR-Tools CP-SAT solver.

