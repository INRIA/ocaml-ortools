(lang dune 3.20)
(generate_opam_files true)

(maintainers "Timothy Bourke <tim@tbrk.org>")
(authors "Timothy Bourke <tim@tbrk.org>")
(license Apache-2.0)
(source (github inria/ocaml-ortools))
(maintenance_intent "(latest)")

(package
  (name ortools)
  (synopsis "Build and export Google OR-Tools models")
  (description
"Google OR-Tools is an open source software suite for optimization, tuned
for tackling the world's toughest problems in vehicle routing, flows,
integer and linear programming, and constraint programming. This package
provides OCaml functions for working with the Protocol Buffer formats that
are read and written by the different solvers. It does not actually depend
on the OR-Tools software, which need not even be installed. The interface
currently only supports a subset of the features provided by the CP-SAT solver.
Pull requests for more features and solvers are welcome.")
  (depends
    (pbrt (>= 4.0))
    (ocaml (>= 4.14.2)))
)

(package
  (name ortools_solvers)
  (synopsis "Call Google OR-Tools solvers")
  (description
"Google OR-Tools is an open source software suite for optimization, tuned
for tackling the world's toughest problems in vehicle routing, flows,
integer and linear programming, and constraint programming. This package
provides OCaml wrappers for calling the OR-Tools solvers. It currently only
supports the CP-SAT solver. Pull requests for other solvers are welcome.")
  (depends
    (ortools (>= 0.1))
    (conf-wget :build)
    (camlzip :build)
    (dune-configurator :build)
    (ocaml (>= 4.14.2)))
)

