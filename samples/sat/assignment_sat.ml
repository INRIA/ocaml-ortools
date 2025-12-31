(* Copyright 2010-2025 Google LLC
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. *)

module CP = Ortools.Sat
module Sat_parameters = Ortools.Sat_parameters
module CPSAT = Ortools_solvers.Sat

let sprintf = Printf.sprintf
let printf  = Printf.printf

let transpose x =
  let l = Array.length x in
  Array.(init (length x.(0)) (fun j ->
           init l (fun i -> x.(i).(j))))

let fold2 f acc arr1 arr2 =
  snd Array.(fold_left
        (fun (i, acci) y ->
           (i + 1, snd (fold_left
                         (fun (j, accj) v1 -> (j + 1, f accj v1 arr2.(i).(j)))
                         (0, acci)
                         y)))
        (0, acc) arr1)

let init_matrix m n f = Array.(init m (fun i -> init n (fun j -> f i j)))

(* Solves a simple assignment problem with CP-SAT. *)

let main () =
  (* Data *)
  let costs = [|
      [|  90;  80;  75;  70  |];    (* w1: t1, t2, t3, t4 *)
      [|  35;  85;  55;  65  |];    (* w2: t1, t2, t3, t4 *)
      [| 125;  95;  90;  95 |];     (* w3: t1, t2, t3, t4 *)
      [|  45; 110;  95; 115 |];     (* w4: t1, t2, t3, t4 *)
      [|  50; 100;  90; 100 |];     (* w5: t1, t2, t3, t4 *)
    |]
  in
  let num_workers = Array.length costs in
  let num_tasks = Array.length costs.(0) in

  (* Model *)
  let model = CP.make () in

  (* Variables *)
  let x = init_matrix num_workers num_tasks
      (fun i j -> CP.Var.new_bool model (sprintf "x[%d,%d]" i j))
  in

  (* Constraints *)
  (* Each worker is assigned to at most one task. *)
  Array.iter (fun bs -> CP.(add model Constraint.WithArray.(at_most_one bs))) x;

  (* Each task is assigned to exactly one worker. *)
  Array.iter (fun bs -> CP.(add model Constraint.WithArray.(exactly_one bs)))
    (transpose x);

  (* Objective *)
  CP.(minimize model Constraint.(fold2 (fun e xij cost -> cost * xij + e) zero x costs));

  (* Solve *)
  let CP.Response.{ status; objective_value; solution; _ } = CPSAT.solve model in
  let solution_bool_value x = solution.(CP.Var.to_index x) = 1 in

  (* Print solution. *)
  match status with
  | Optimal | Feasible ->
      printf "Total cost = %.1f\n\n" objective_value;
      for i = 0 to num_workers - 1 do
        for j = 0 to num_tasks - 1 do
          if solution_bool_value x.(i).(j) then
            printf "t%d assigned to w%d with a cost of %d\n"
              (j + 1) (i + 1) costs.(i).(j)
        done
      done
  | Infeasible ->
      printf "No solution found\n"
  | _ ->
      printf "Something is wrong, check the status and the log of the solve\n"

let _ = main ()

