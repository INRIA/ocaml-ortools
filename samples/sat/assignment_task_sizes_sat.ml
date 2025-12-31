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
      [| 90  ; 76  ; 75  ; 70  ; 50  ; 74  ; 12  ; 68 |] ;
      [| 35  ; 85  ; 55  ; 65  ; 48  ; 101 ; 70  ; 83 |] ;
      [| 125 ; 95  ; 90  ; 105 ; 59  ; 120 ; 36  ; 73 |] ;
      [| 45  ; 110 ; 95  ; 115 ; 104 ; 83  ; 37  ; 71 |] ;
      [| 60  ; 105 ; 80  ; 75  ; 59  ; 62  ; 93  ; 88 |] ;
      [| 45  ; 65  ; 110 ; 95  ; 47  ; 31  ; 81  ; 34 |] ;
      [| 38  ; 51  ; 107 ; 41  ; 69  ; 99  ; 115 ; 48 |] ;
      [| 47  ; 85  ; 57  ; 71  ; 92  ; 77  ; 109 ; 36 |] ;
      [| 39  ; 63  ; 97  ; 49  ; 118 ; 56  ; 92  ; 61 |] ;
      [| 47  ; 101 ; 71  ; 60  ; 88  ; 109 ; 52  ; 90 |]
    |]
  in
  let num_workers = Array.length costs in
  let num_tasks = Array.length costs.(0) in

  let task_sizes = [| 10; 7; 3; 12; 15; 4; 11; 5 |] in
  (* Maximum total of task sizes for any worker *)
  let total_size_max = 15 in

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
          sum (Array.init num_tasks (fun task -> task_sizes.(task) * x.(worker).(task)))
          <= of_int total_size_max))
  done;

  (* Each task is assigned to exactly one worker. *)
  for task = 0 to num_tasks - 1 do
    CP.(add model Constraint.WithArray.(exactly_one
                    Array.(init num_workers (fun worker -> x.(worker).(task)))))
  done;

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

