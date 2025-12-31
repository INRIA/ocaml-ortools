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

(* Solves a binpacking problem using the CP-SAT solver. *)

module CP = Ortools.Sat
module CPSAT = Ortools_solvers.Sat

let printf  = Printf.printf
let sprintf  = Printf.sprintf

let init_matrix m n f = Array.(init m (fun i -> init n (fun j -> f i j)))

let binpacking_problem_sat () =
  (* Solves a bin-packing problem using the CP-SAT solver. *)
  (* Data. *)
  let bin_capacity = 100 in
  let slack_capacity = 20 in
  let num_bins = 5 in
  let all_bins = List.init 5 Fun.id in

  let items = [| (20, 6); (15, 6); (30, 4); (45, 3) |] in
  let num_items = Array.length items in

  (* Model. *)
  let model = CP.make () in

  (* Main variables. *)
  let x = init_matrix num_items num_bins (fun i b ->
            let (_, num_copies) = items.(i) in
            CP.Var.new_int model ~lb:0 ~ub:num_copies (sprintf "x[%d,%d]" i b))
  in

  (* Load variables. *)
  let load = Array.init num_bins
      (fun b -> CP.Var.new_int model ~lb:0 ~ub:bin_capacity
                                     (sprintf "load[%d]" b))
  in

  (* Slack variables. *)
  let slacks = Array.init num_bins
      (fun b -> CP.Var.new_bool model (sprintf "slack[%d]" b))
  in

  (* Links load and x. *)
  List.iter (fun b -> CP.(add model
    Constraint.(WithArray.sum (Array.mapi
                  (fun i (c, _) -> c * x.(i).(b)) items) == 1 * load.(b))))
    all_bins;

  (* Place all items. *)
  Array.iteri (fun i (_, num_items) -> CP.(add model
    (LinearExpr.sum_vars (List.map (fun b -> x.(i).(b)) all_bins)
                                                      == of_int num_items)))
    items;

  (* Links load and slack through an equivalence relation. *)
  let safe_capacity = bin_capacity - slack_capacity in
  for b = 0 to num_bins - 1 do
    (* slack[b] => load[b] <= safe_capacity. *)
    CP.(add model ~only_enforce_if:[slacks.(b)] (var load.(b) <= of_int safe_capacity));
    (* not(slack[b]) => load[b] > safe_capacity. *)
    CP.(add model ~only_enforce_if:[not slacks.(b)] (var load.(b) > of_int safe_capacity))
  done;

  (* Maximize sum of slacks. *)
  CP.(maximize model Constraint.(WithArray.vars slacks));

  (* Solves and prints out the solution. *)
  let CP.Response.{ status;
                    objective_value;
                    num_conflicts;
                    num_branches;
                    wall_time;
                    _ } = CPSAT.solve model
  in

  printf "solve status: %s\n" (CP.Response.string_of_status status);
  if status = Optimal then
    printf "Optimal objective value: %.1f\n" objective_value;
  printf "Statistics\n";
  printf "  - conflicts : %d\n" num_conflicts;
  printf "  - branches  : %d\n" num_branches;
  printf "  - wall time : %es\n" wall_time

let _ = binpacking_problem_sat ()

