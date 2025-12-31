(* Copyright 2010-2025 Google LLC
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. *)

(* Code sample that solves a model and gets the infeasibility assumptions. *)

module CP = Ortools.Sat
module CPSAT = Ortools_solvers.Sat

let printf  = Format.printf

let main () =
  (* Showcases assumptions. *)
  (* Creates the model. *)
  let model = CP.make () in

  (* Creates the variables. *)
  let x = CP.Var.new_int model ~lb:0 ~ub:10 "x" in
  let y = CP.Var.new_int model ~lb:0 ~ub:10 "y" in
  let z = CP.Var.new_int model ~lb:0 ~ub:10 "z" in
  let a = CP.Var.new_bool model "a" in
  let b = CP.Var.new_bool model "b" in
  let c = CP.Var.new_bool model "c" in

  (* Creates the constraints. *)
  CP.(add model ~only_enforce_if:[a] Constraint.(var x > var y));
  CP.(add model ~only_enforce_if:[b] Constraint.(var y > var z));
  CP.(add model ~only_enforce_if:[c] Constraint.(var z > var x));

  (* Add assumptions *)
  CP.add_assumptions model [a; b; c];

  (* Creates a solver and solves. *)
  let CP.Response.{ status; sufficient_assumptions_for_infeasibility; _ }
    = CPSAT.solve model
  in

  (* Print solution. *)
  printf "Status = %s\n" (CP.Response.string_of_status status);
  if status = Infeasible then
    printf "sufficient_assumptions_for_infeasibility = [%a]\n"
      Format.(pp_print_list
                ~pp_sep:(fun fmt () -> pp_print_string fmt ", ")
                CP.Var.pp)
      sufficient_assumptions_for_infeasibility

let _ = main ()

