(* Licensed under the Apache License, Version 2.0 (the "License");
   You may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. *)

(* Based on OR-Tools, Copyright 2010-2025 Google LLC
   OCaml Interface: 2025 T. Bourke *)

(* Cryptarithmetic puzzle.

First attempt to solve equation CP + IS + FUN = TRUE
where each letter represents a unique digit.

This problem has 72 different solutions in base 10.
*)

module CP = Ortools.Sat
module CPSAT = Ortools_solvers.Sat
module Sat_parameters = Ortools.Sat_parameters

let printf  = Format.printf

let main () =
  (* solve the CP+IS+FUN==TRUE cryptarithm. *)
  (* Constraint programming engine *)
  let model = CP.make () in

  let base = 10 in

  let c = CP.Var.new_int model ~lb:1 ~ub:(base - 1) "C" in
  let p = CP.Var.new_int model ~lb:0 ~ub:(base - 1) "P" in
  let i = CP.Var.new_int model ~lb:1 ~ub:(base - 1) "I" in
  let s = CP.Var.new_int model ~lb:0 ~ub:(base - 1) "S" in
  let f = CP.Var.new_int model ~lb:1 ~ub:(base - 1) "F" in
  let u = CP.Var.new_int model ~lb:0 ~ub:(base - 1) "U" in
  let n = CP.Var.new_int model ~lb:0 ~ub:(base - 1) "N" in
  let t = CP.Var.new_int model ~lb:1 ~ub:(base - 1) "T" in
  let r = CP.Var.new_int model ~lb:0 ~ub:(base - 1) "R" in
  let e = CP.Var.new_int model ~lb:0 ~ub:(base - 1) "E" in

  (* We need to group variables in a list to use the constraint AllDifferent. *)
  let letters = [c; p; i; s; f; u; n; t; r; e] in

  (* Verify that we have enough digits. *)
  assert (base >= List.length letters);

  (* Define constraints. *)
  CP.(add model Constraint.(all_different (List.map var letters)));

  (* CP + IS + FUN = TRUE *)
  let rec basen n = if n = 0 then 1 else base * basen (n - 1) in
  CP.(add model
        Constraint.(base * c + 1*p + base * i + 1*s + basen 2 * f + base * u + 1*n
                    == basen 3 * t + basen 2 * r + base * u + 1*e));

  (* Creates a solver and solves the model. *)
  (* Enumerate all solutions. *)
  let parameters = Sat_parameters.(make_sat_parameters
                     (* Enumerate all solutions. *)
                     ~enumerate_all_solutions:true
                     ~fill_additional_solutions_in_response:true
                     ())
  in
  (* TODO: Support the FeasibleSolutionObserver from OCaml? *)

  (* Solve. *)
  let CP.Response.{ status;
                    additional_solutions;
                    num_conflicts;
                    num_branches;
                    wall_time;
                    _ } =
    CPSAT.solve ~parameters model
  in
  let print_solution sol =
    let sep = ref "" in
    List.iter (fun v ->
        printf "%s%a=%d" !sep CP.Var.pp v sol.(CP.Var.to_index v); sep := " ")
      letters;
    printf "\n"
  in
  List.iter print_solution additional_solutions;

  (* Statistics. *)
  printf "\nStatistics\n";
  printf "  status   : %s\n" (CP.Response.string_of_status status);
  printf "  conflicts: %d\n" num_conflicts;
  printf "  branches : %d\n" num_branches;
  printf "  wall time: %e s\n" wall_time;
  printf "  sol found: %d\n" (List.length additional_solutions)

let _ = main ()

