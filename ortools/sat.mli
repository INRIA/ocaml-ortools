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

(* Variables *)

type t

(* Note: belong to a specific model! *)
module Var :
  sig

    type 'a var

    type t_bool = [`Bool] var
    type t_int  = [`Int] var

    val new_int : t -> ?name:string -> lb:int -> ub:int -> unit-> t_int

    val new_bool : t -> ?name:string -> unit -> t_bool

    val neg : t_bool -> t_bool

    val new_constant : t -> int -> t_int

    type 'a t = 'a var

    val to_index : 'a var -> int

    (* TODO: richer domains? *)
    (* TODO: to_string, pp, etc. *)
  end

(* Linear Constraints *)

module LinearExpr :
  sig

    type t

    val sum : 'a Var.t list -> t
    val weighted_sum : (int * 'a Var.t) list -> t
    val scale  : int -> t -> t
    val of_int : int -> t
    val term : (int * 'a Var.t) -> t

    (* TODO: destructors, pp, etc. *)

    module L :
      sig
        val ( * )  : int -> 'a Var.t -> t
        val ( + )  : t -> t -> t
        val ( - )  : t -> t -> t
        val scale  : int -> t -> t
        val of_int : int -> t
      end
  end

module Constraint :
  sig

    type equality = {
      target: LinearExpr.t;
      exprs: LinearExpr.t list;
    }

    type equality2 = {
      target: LinearExpr.t;
      arg1:   LinearExpr.t;
      arg2:   LinearExpr.t;
    }

    type lt

    type t =
      | Or of Var.t_bool list
        (* At least one of the literals must be true. *)
      | And of Var.t_bool list
        (* All literals must be true. *)
      | At_most_one of Var.t_bool list
        (* At most one literal is true. Sum literals <= 1. *)
      | Exactly_one of Var.t_bool list
        (* Exactly one literal is true. Sum literals == 1. *)
      | Xor of Var.t_bool list
        (* An odd number of literals is true. *)
      | Div of equality2
      | Mod of equality2 (* TODO: 2nd argument not constant? *)
      | Prod of equality
      | Max of equality
      | Linear of lt
      | All_diff of LinearExpr.t list
      (* TODO:
      | Element of element_constraint_proto
      | Circuit of circuit_constraint_proto
      | Routes of routes_constraint_proto
      | Table of table_constraint_proto
      | Automaton of automaton_constraint_proto
      | Inverse of inverse_constraint_proto
      | Reservoir of reservoir_constraint_proto
      | Interval of interval_constraint_proto
      | No_overlap of no_overlap_constraint_proto
      | No_overlap_2d of no_overlap2_dconstraint_proto
      | Cumulative of cumulative_constraint_proto
      | Dummy_constraint of list_of_variables_proto
      *)

    (* Same as `Or`. *)
    val at_least_one : Var.t_bool list -> t

    (* Same as `Or [(Var.neg a); b]` *)
    val implication : Var.t_bool -> Var.t_bool -> t

    val min : equality -> t

    val abs : equality -> t

    val of_expr : LinearExpr.t -> lb:int -> ub:int -> t

    include module type of LinearExpr.L
    val (<=)    : LinearExpr.t -> LinearExpr.t -> t
    val (>=)    : LinearExpr.t -> LinearExpr.t -> t
    val (<)     : LinearExpr.t -> LinearExpr.t -> t
    val (>)     : LinearExpr.t -> LinearExpr.t -> t
    val (==)    : LinearExpr.t -> LinearExpr.t -> t
    val (!=)    : LinearExpr.t -> LinearExpr.t -> t
  end

include module type of LinearExpr.L
val (<=)   : LinearExpr.t -> int -> Constraint.t
val (>=)   : LinearExpr.t -> int -> Constraint.t
val (<)    : LinearExpr.t -> int -> Constraint.t
val (>)    : LinearExpr.t -> int -> Constraint.t
val (==)   : LinearExpr.t -> int -> Constraint.t
val (!=)   : LinearExpr.t -> int -> Constraint.t

val make : ?nvars:int -> ?name:string -> unit -> t

val add :
     t
  -> ?name:string
  -> ?only_enforce_if:Var.t_bool list
  -> Constraint.t
  -> unit

(* `add_implication m lhs rhs = add m ~only_enforce_if:lhs (Constraint.And rhs)` *)
val add_implication :
     t
  -> ?name:string
  -> Var.t_bool list
  -> Var.t_bool list
  -> unit

val maximize : t -> LinearExpr.t -> unit

val minimize : t -> LinearExpr.t -> unit

val add_hint : t -> 'a Var.t -> int -> unit

val add_hints : t -> ('a Var.t * int) list -> unit

val clear_hints : t -> unit

val add_assumptions : t -> Var.t_bool list -> unit

val clear_assumptions : t -> unit

module Parameters :
  sig
    type t = Sat_parameters.sat_parameters

    val pb_encode : t -> Pbrt.Encoder.t -> unit

    val pb_output : t -> out_channel -> unit
  end

module Response :
  sig

    type status =
      | Unknown
      | ModelInvalid
      | Feasible
      | Infeasible
      | Optimal

    val string_of_status : status -> string

    type vardom = {
      name : string;
      domain : (int64 * int64) list;
    }

    type objective = {
      terms                  : (Var.t_int * int) list;
      offset                 : float;
      scaling_factor         : float;
      domain                 : (int64 * int64) list;
      scaling_was_exact      : bool;
      integer_before_offset  : int64;
      integer_after_offset   : int64;
      integer_scaling_factor : int64;
    }

    type t = {
      status                                   : status;
      solution                                 : int array;
      objective_value                          : float;
      best_objective_bound                     : float;
      additional_solutions                     : int array list;
      tightened_variables                      : vardom list;
      sufficient_assumptions_for_infeasibility : Var.t_bool list;
      integer_objective                        : objective option;
      inner_objective_lower_bound              : int;
      num_integers                             : int;
      num_booleans                             : int;
      num_fixed_booleans                       : int;
      num_conflicts                            : int;
      num_branches                             : int;
      num_binary_propagations                  : int;
      num_integer_propagations                 : int;
      num_restarts                             : int;
      num_lp_iterations                        : int;
      wall_time                                : float;
      user_time                                : float;
      deterministic_time                       : float;
      gap_integral                             : float;
      solution_info                            : string;
      solve_log                                : string;
    }

    val of_proto : Cp_model.cp_solver_response -> t

  end

(* note: shares underlying data with the model... *)
val to_proto : t -> Cp_model.cp_model_proto

val pb_encode : t -> Pbrt.Encoder.t -> unit

val pb_output : t -> out_channel -> unit

type raw_solver = parameters_pb:string -> model_pb:string -> string

val solve :
     raw_solver
  -> ?parameters:Parameters.t
  -> t
  -> Response.t

