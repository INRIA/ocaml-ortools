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

module CP = Ortools.Sat
module Sat_parameters = Ortools.Sat_parameters
module CPSAT = Ortools_solvers.Sat

let max = List.fold_left Int.max Int.min_int

let printf = Printf.printf

let main () =
  (* Minimal CP-SAT example to showcase calling the solver. *)

  (* Creates the model. *)
  let model = CP.make () in

  (* Creates the variables. *)
  let var_upper_bound = max [50; 45; 37] in
  let x = CP.Var.new_int model ~lb:0 ~ub:var_upper_bound "x" in
  let y = CP.Var.new_int model ~lb:0 ~ub:var_upper_bound "y" in
  let z = CP.Var.new_int model ~lb:0 ~ub:var_upper_bound "z" in

  (* Creates the constraints. *)
  CP.(add model Constraint.(2 * x + 7 * y + 3 * z <= of_int 50));
  CP.(add model Constraint.(3 * x - 5 * y + 7 * z <= of_int 45));
  CP.(add model Constraint.(5 * x + 2 * y - 6 * z <= of_int 37));

  CP.(maximize model (2 * x + 2 * y + 3 * z));

  let oc = open_out "cp_sat_example.pb" in
  CP.pb_output model oc;
  close_out oc;

  let parameters = Sat_parameters.make_sat_parameters
                     (*~max_time_in_seconds:60.*)
                     (*~relative_gap_limit:0.05*)
                     (* ~absolute_gap_limit *)
                     (*~log_search_progress:true*)
                     (*~log_to_stdout:true*)
                     (* ~log_prefix *)
                     (* ~num_workers:8 *)
                     ()
  in
  let oc = open_out "cp_sat_example.params.pb" in
  CP.Parameters.pb_output parameters oc;
  close_out oc;

  (* Creates a solver and solves the model. *)
  let CP.Response.{ status;
                    objective_value;
                    solution;
                    num_conflicts;
                    num_branches;
                    wall_time;
                    _ } = CPSAT.solve ~parameters model
  in

  (match status with
  | Optimal | Feasible ->
      printf "Maximum of objective function: %g\n\n" objective_value;
      printf "x = %d\n" solution.(CP.Var.to_index x);
      printf "y = %d\n" solution.(CP.Var.to_index y);
      printf "z = %d\n" solution.(CP.Var.to_index z)
  | _ -> printf "No solution found.\n");

  (* Statistics. *)
  printf "\nStatistics\n";
  printf "  status   : %s\n" (CP.Response.string_of_status status);
  printf "  conflicts: %d\n" num_conflicts;
  printf "  branches : %d\n" num_branches;
  printf "  wall time: %g s\n" wall_time

let _ = main ()

