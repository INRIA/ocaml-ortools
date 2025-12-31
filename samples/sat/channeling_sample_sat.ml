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

(* Link integer constraints together. *)

module CP = Ortools.Sat
module CPSAT = Ortools_solvers.Sat
module Sat_parameters = Ortools.Sat_parameters

let printf  = Format.printf

let channeling_sample_sat () =
  (* Demonstrates how to link integer constraints together. *)

  (* Create the CP-SAT model. *)
  let model = CP.make () in

  (* Declare our two primary variables. *)
  let x = CP.Var.new_int model ~lb:0 ~ub:10 "x" in
  let y = CP.Var.new_int model ~lb:0 ~ub:10 "y" in

  (* Declare our intermediate boolean variable. *)
  let b = CP.Var.new_bool model "b" in

  (* Implement b == (x >= 5). *)
  CP.(add model ~only_enforce_if:[b] Constraint.(var x >= of_int 5));
  CP.(add model ~only_enforce_if:[not b] Constraint.(var x < of_int 5));

  (* Create our two half-reified constraints. *)
  (* First, b implies (y == 10 - x). *)
  CP.(add model ~only_enforce_if:[b] Constraint.(var y == of_int 10 - var x));
  (* Second, not(b) implies y == 0. *)
  CP.(add model ~only_enforce_if:[not b] Constraint.(var y == of_int 0));

  (* Search for x values in increasing order. *)
  CP.(add_decision_strategy model [x] ChooseFirst SelectMinValue);

  (* CP.(add_hints model [(x, 5)]); *)

  (* Create a solver and solve with a fixed search. *)
  let parameters = Sat_parameters.(make_sat_parameters
                     (* Force the solver to follow the decision strategy exactly. *)
                     ~search_branching:Fixed_search
                     (* Enumerate all solutions. *)
                     ~enumerate_all_solutions:true
                     ~fill_additional_solutions_in_response:true
                     (* ~fix_variables_to_their_hinted_value:true *)
                     ())
  in

  (* Search and print out all solutions. *)
  let CP.Response.{ additional_solutions; _ } = CPSAT.solve ~parameters model in
  (* TODO: Support the FeasibleSolutionObserver from OCaml? *)
  let print_solution sol =
    printf "x=%d y=%d b=%d\n"
      sol.(CP.Var.to_index x) sol.(CP.Var.to_index y) sol.(CP.Var.to_index b)
  in
  List.iter print_solution additional_solutions

let _ = channeling_sample_sat ()

