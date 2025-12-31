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

(* Solves a simple assignment problem. *)

module CP = Ortools.Sat
module CPSAT = Ortools_solvers.Sat

let sprintf = Printf.sprintf
let printf  = Printf.printf

let init_matrix m n f = Array.(init m (fun i -> init n (fun j -> f i j)))

let fold_left2 f acc arr =
  snd Array.(fold_left
        (fun (i, acci) y ->
           (i + 1, snd (fold_left
                         (fun (j, acc) v -> (j + 1, f acc i j v))
                         (0, acci)
                         y)))
        (0, acc) arr)

let main () =
    (* Data *)
  let costs = [|
    [|  90 ;  76 ;  75 ;  70 |];
    [|  35 ;  85 ;  55 ;  65 |];
    [| 125 ;  95 ;  90 ; 105 |];
    [|  45 ; 110 ;  95 ; 115 |];
    [|  60 ; 105 ;  80 ;  75 |];
    [|  45 ;  65 ; 110 ;  95 |];
  |] in
  let num_workers = Array.length costs in
  let num_tasks = Array.length costs.(0) in

  let team1 = [0; 2; 4] in
  let team2 = [1; 3; 5] in
  (* Maximum total of tasks for any team *)
  let team_max = 2 in

  (* Model *)
  let model = CP.make () in

  (* Variables *)
  let x = init_matrix num_workers num_tasks (fun worker task ->
            CP.Var.new_bool model (sprintf "x[%d,%d]" worker task))
  in

  (* Constraints *)
  (* Each worker is assigned to at most one task. *)
  for worker = 0 to num_workers - 1 do
    CP.(add model Constraint.WithArray.(
          at_most_one (Array.init num_tasks (fun task -> x.(worker).(task)))))
  done;

  (* Each task is assigned to exactly one worker. *)
  for task = 0 to num_tasks - 1 do
    CP.(add model Constraint.WithArray.(exactly_one
                    Array.(init num_workers (fun worker -> x.(worker).(task)))))
  done;

  let team_tasks team =
    CP.Constraint.(List.fold_left
      (fun e worker ->
         (WithArray.sum (Array.init num_tasks (fun task -> 1 * x.(worker).(task))) + e))
      zero
      team)
  in

  (* Each team takes at most two tasks. *)
  CP.(add model (team_tasks team1 <= of_int team_max));
  CP.(add model (team_tasks team2 <= of_int team_max));

  (* Objective *)
  let objective =
    CP.LinearExpr.L.(fold_left2
                      (fun e worker task cost -> cost * x.(worker).(task) + e)
                      zero costs)
  in
  CP.minimize model objective;

  (* Solve *)
  let CP.Response.{ status; objective_value; solution; _ } = CPSAT.solve model in
  let solution_bool_value x = solution.(CP.Var.to_index x) = 1 in

  (* Print solution. *)
  match status with
  | Optimal | Feasible ->
      printf "Total cost = %.1f\n\n" objective_value;
      for worker = 0 to num_workers - 1 do
        for task = 0 to num_tasks - 1 do
          if solution_bool_value x.(worker).(task) then
            printf "Worker %d assigned to task %d. Cost = %d\n"
              worker task costs.(worker).(task)
        done
      done
  | _ ->
      printf "No solution found\n"

let _ = main ()

