
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

