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

(** Build a model for CP-SAT *)

(** {1:model Models} *)

(** A CP-SAT model. *)
type t

(** Create an empty model with an optional name. The [nvars] argument
    optionally specifies the expected number of variables, which determines
    the size and growth of internal data structures. *)
val make : ?nvars:int -> ?name:string -> unit -> t

(** Representation of integer variables and boolean literals. *)
module Var : sig (* {{{ *)
  (** Note: “attached to a model” *)

  (** A variable / boolean literal *)
  type 'a var

  type t_bool = [`Bool] var
  type t_int  = [`Int] var

  val new_int : t -> ?name:string -> lb:int -> ub:int -> unit-> t_int

  val new_bool : t -> ?name:string -> unit -> t_bool

  val neg : t_bool -> t_bool

  val new_constant : t -> int -> t_int

  type 'a t = 'a var

  val to_index : 'a var -> int

  val to_bool : 'a var -> [`Bool] var
  val to_int  : 'a var -> [`Int] var

  (* TODO: richer domains? *)

  (* TODO: to_string, pp, etc. *)

end (* }}} *)

(** {1:linear-expr Linear Expressions} *)

(** Linear expressions are used in linear constraints and to specify
    objectives.  *)
module LinearExpr : sig (* {{{ *)

  (** A linear expression.
      An integer offset is maintainted in addition to a list of
      coefficients and variables. This allows both to normalize boolean
      literals into positive form and to represent constants
      (see {!of_int}). *)
  type t

  (** A sum of variables: all coefficients are 1s. *)
  val sum : 'a Var.t list -> t

  (** A weighted sum of variables. *)
  val weighted_sum : (int * 'a Var.t) list -> t

  (** Multiply all coefficients by an integer. *)
  val scale  : int -> t -> t

  (** A constant expression. *)
  val of_int : int -> t

  (** A single variable. *)
  val var : 'a Var.t -> t

  (** A single term. See also {!( * )}. *)
  val term : (int * 'a Var.t) -> t

  (** Negate all coefficients (and the offset). *)
  val neg : t -> t

  (* TODO: destructors, pp, etc. *)

  module L :
    sig
      (** Operators for building linear expressions.
          They are also available directly in the {!module:Sat} module. *)

      (** A single variable. *)
      val var : 'a Var.t -> t

      (** A single term. *)
      val ( * )  : int -> 'a Var.t -> t

      (** Concatenatation of two linear expressions. *)
      val ( + )  : t -> t -> t

      (** Concatenatation of the left expression with the negation
          of the right expression. *)
      val ( - )  : t -> t -> t

      (** Multiplication of a linear expression by a constant. *)
      val scale  : int -> t -> t

      (** A constant linear expression. *)
      val of_int : int -> t
    end

end (* }}} *)

include module type of LinearExpr.L

(** {1:constraints Constraints} *)

module Constraint : sig (* {{{ *)

  (** Logical, linear, and other constraints. *)

  (** {1:direct Direct Form}

      This is the raw form of constraints accepted by CP-SAT. See below for
      more convenient functions. *)

  (** An equality between a [target] linear expression and an operation, given
      externally, applied to multiple linear expression arguments.
      The [target] must be a (scaled) variable or constant,
      otherwise {!add} raises [Invalid_argument]. *)
  type equality = {
    target: LinearExpr.t;
    exprs: LinearExpr.t list;
  }

  (** An equality between a [target] linear expression and a operation, given
      externally, applied to a linear expression and a constant argument.
      The [target] must be a (scaled) variable or constant, otherwise {!add}
      raises [Invalid_argument].
      Similarly, [arg2] must be a (scaled) constant, but this cannot always
      be fully checked. *)
  type equality2 = {
    target: LinearExpr.t;
    arg1:   LinearExpr.t;
    arg2:   LinearExpr.t;
  }

  (** An opaque type representing a linear expression. Values of type
      [Linear of lt] are created indirectly by the {!(<=)}, {!(==)}, and
      similar operators. *)
  type lt

  (** The primitive constraints treated by CP-SAT. *)
  type t =
    | Or of Var.t_bool list
      (** At least one of the literals must be true. *)
    | And of Var.t_bool list
      (** All literals must be true. *)
    | At_most_one of Var.t_bool list
      (** At most one literal is true. Sum literals <= 1. *)
    | Exactly_one of Var.t_bool list
      (** Exactly one literal is true. Sum literals == 1. *)
    | Xor of Var.t_bool list
      (** An odd number of literals is true. *)
    | Div of equality2
      (** Integer division by a constant. *)
    | Mod of equality2
      (** Integer modulo a constant. *)
    | Prod of equality
      (** Constrain a variable to equal the product of linear expressions. *)
    | Max of equality
      (** Constrain a variable to equal the maximum of a list of linear
          expressions. *)
    | Linear of lt
    (** A linear constraint created by combining a
        {{!LinearExpr.t}linear expression},
        a relation, like {!(<=)} or {!(==)}, and
        a constant. *)
    | All_diff of LinearExpr.t list
    (** Require that a list of (scaled) variables and constants have
        different values from each other. *)
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

  (** {!Max} with negated target and expressions.  *)
  val min : equality -> t

  (** {!Max} of the original expressions together with their negations. *)
  val abs : equality -> t


  (** {1:logical Logical Constraints} *)

  (** Negate a boolean literal. Same as {!val:Var.neg}. *)
  val not : Var.t_bool -> Var.t_bool

  (** At least one of the literals must be true. Same as {!Or}. *)
  val bool_or : Var.t_bool list -> t

  (** All literals must be true. Same as {!And}. *)
  val bool_and : Var.t_bool list -> t

  (** An odd number of literals is true. Same as {!Xor}. *)
  val bool_xor : Var.t_bool list -> t

  (** At most one literal is true. Sum literals <= 1.
      Same as {!At_most_one}. *)
  val at_most_one : Var.t_bool list -> t

  (** Exactly one literal is true. Sum literals == 1.
      Same as {!Exactly_one}. *)
  val exactly_one : Var.t_bool list -> t

  (** At least one of the literals must be true.
      Same as {!Or}. *)
  val at_least_one : Var.t_bool list -> t

  (** Logical implication between two literals.
      ([implication a b] is the same as [ Or [(Var.neg a); b] ].) *)
  val implication : Var.t_bool -> Var.t_bool -> t

  (** {1:integer Integer Relations} *)

  (** Constrain a variable to equal the product of linear expressions.
      Slightly less general than {!Prod} since the left-hand-side
      may also be a scaled variable or a constant.
      [multiplication_equality v [x y z]] means [v = x * y * z]. *)
  val multiplication_equality : 'a Var.t -> LinearExpr.t list -> t

  (** Integer division by a constant.
      Slightly less general than {!Div}, since the left-hand-side
      may also be a scaled variable or a constant.
      [division_equality x e c] means [x = e // c]. *)
  val division_equality : 'a Var.t -> LinearExpr.t -> int -> t

  (** Integer modulo a constant.
      Slightly less general than {!Mod}, since the left-hand-side
      may also be a scaled variable or a constant.
      [modulo_equality x e c] means [x = e % c]. *)
  val modulo_equality : 'a Var.t -> LinearExpr.t -> int -> t

  (** Constrain a variable to equal the maximum of a list of linear
      expressions. Slightly less general than {!Max} since the
      left-hand-side may also be a scaled variable or a constant. *)
  val max_equality : 'a Var.t -> LinearExpr.t list -> t

  (** Slightly less general than {!min} since the left-hand-side
      may also be a scaled variable or a constant. *)
  val min_equality : 'a Var.t -> LinearExpr.t list -> t

  (** Slightly less general than {!abs} since the left-hand-side
      may also be a scaled variable or a constant. *)
  val abs_equality : 'a Var.t -> LinearExpr.t list -> t

  (** Require that a list of (scaled) variables and constants have
      different values from each other. Same as {!All_diff}. *)
  val all_different : LinearExpr.t list -> t

  (** {1:linear Linear Constraints} *)

  (** A {!Linear} constraint: [of_expr e lb ub] means [lb <= e <= ub]. *)
  val of_expr : LinearExpr.t -> lb:int -> ub:int -> t

  include module type of LinearExpr.L

  (** A {!Linear} constraint: [lhs <= rhs]. *)
  val (<=)    : LinearExpr.t -> LinearExpr.t -> t

  (** A {!Linear} constraint: [lhs >= rhs]. *)
  val (>=)    : LinearExpr.t -> LinearExpr.t -> t

  (** A {!Linear} constraint: [lhs < rhs]. *)
  val (<)     : LinearExpr.t -> LinearExpr.t -> t

  (** A {!Linear} constraint: [lhs > rhs]. *)
  val (>)     : LinearExpr.t -> LinearExpr.t -> t

  (** A {!Linear} constraint: [lhs == rhs]. *)
  val (==)    : LinearExpr.t -> LinearExpr.t -> t

  (** A {!Linear} constraint: [lhs != rhs]. *)
  val (!=)    : LinearExpr.t -> LinearExpr.t -> t

end (* }}} *)

(** Add a constraint to the model, with an optional name. The constraint is
    conditional if the [only_enforce_if] argument is a non-empty list of
    boolean literals. *)
val add :
     t
  -> ?name:string
  -> ?only_enforce_if:Var.t_bool list
  -> Constraint.t
  -> unit

(** Adds an implication constraint to the model.
    [add_implication m lhs rhs = add m ~only_enforce_if:lhs (Constraint.And rhs)] *)
val add_implication :
     t
  -> ?name:string
  -> Var.t_bool list
  -> Var.t_bool list
  -> unit

(** Place a constant upper-bound on a linear expression. *)
val (<=)   : LinearExpr.t -> int -> Constraint.t

(** Place a constant lower-bound on a linear expression. *)
val (>=)   : LinearExpr.t -> int -> Constraint.t

(** Place a strict constant upper-bound on a linear expression. *)
val (<)    : LinearExpr.t -> int -> Constraint.t

(** Place a strict constant lower-bound on a linear expression. *)
val (>)    : LinearExpr.t -> int -> Constraint.t

(** Require that a linear expression equals a constant. *)
val (==)   : LinearExpr.t -> int -> Constraint.t

(** Require that a linear expression does not equal a constant. *)
val (!=)   : LinearExpr.t -> int -> Constraint.t

(** {1:objectives Objectives} *)

(** The linear expression to maximize. Any existing objective is replaced. *)
val maximize : t -> LinearExpr.t -> unit

(** The linear expression to minimize. Any existing objective is replaced. *)
val minimize : t -> LinearExpr.t -> unit

(** {2:hints Hints} *)

(** Suggest an initial solution for the given variable. *)
val add_hint : t -> 'a Var.t -> int -> unit

(** Suggest initial solutions for the given variables. *)
val add_hints : t -> ('a Var.t * int) list -> unit

(** Remove any initial solutions. *)
val clear_hints : t -> unit

(** {2:assumptions Assumptions} *)

(** Add assumptions on boolean literals. *)
val add_assumptions : t -> Var.t_bool list -> unit

(** Clear any assumptions on boolean literals. *)
val clear_assumptions : t -> unit

(** {1:solutions Solutions} *)

module Parameters : sig (* {{{ *)

  (** Encode a set of parameters as a protocol buffer. *)

  (** Directly use the underlying protocol buffer interface.
      See {!Sat_parameters.make_sat_parameters} and the documentation in
      {{: https://github.com/google/or-tools/blob/789b01f7c93b857ac51d8472c3352ea1ae6326ae/ortools/sat/sat_parameters.proto#L28}sat_parameters.proto}.
   *)
  type t = Sat_parameters.sat_parameters

  (** Return the default parameters. *)
  val defaults : unit -> t

  (** Write the parameters to an output channel. *)
  val pb_output : t -> out_channel -> unit

  (** Encode the parameters using a specific encoder. *)
  val pb_encode : t -> Pbrt.Encoder.t -> unit

end (* }}} *)

module Response : sig (* {{{ *)

  (** A response from CP-SAT for a given problem. *)

  (** The overall result. *)
  type status =
    | Unknown
      (** The solver has not run for long enough. *)
    | ModelInvalid
      (** There is a problem with the model. *)
    | Feasible
      (** The model has a solution but it may not be optimal with respect
          to the objective. *)
    | Infeasible
      (** The model has no solutions, i.e., the constraints are too
          restrictive. *)
    | Optimal
      (** The model has a solution and it is optimal with respect to the
          objective. *)

  (** String representing the status. *)
  val string_of_status : status -> string

  (** The name and restricted domain of a variable. *)
  type vardom = {
    name : string;
    domain : (int64 * int64) list;
  }

  (** Information on the objective. *)
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

  (** A response from CP-SAT.
      See the documentation in
      {{: https://github.com/google/or-tools/blob/789b01f7c93b857ac51d8472c3352ea1ae6326ae/ortools/sat/cp_model.proto#L747}cp_model.proto}.
   *)
  type t = {
    status                                   : status;
    (** The status of the solve. *)
    solution                                 : int array;
    (** A feasible solution, mapping each variable (index) to an integer value. *)
    objective_value                          : float;
    (** The value of the objective for the given solution. *)
    best_objective_bound                     : float;
    (** A proven lower or upper bound on the objective to, respectively,
        minimize or maximize. *)
    additional_solutions                     : int array list;
    (** Other solutions if the [fill_additional_solutions_in_response]
        parameters is set. *)
    tightened_variables                      : vardom list;
    (** Reduced variable domains if the [fill_tightened_domains_in_response]
        parameter is set. *)
    sufficient_assumptions_for_infeasibility : Var.t_bool list;
    (** A subset of the assumptions field that makes the model infeasible. *)
    integer_objective                        : objective option;
    (** Integer objective optimized internally. *)
    integer_objective_lower_bound              : int;
    (** A lower bound on the integer expression of the objective. *)
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
    (** Counted from the beginning of the solve call. *)
    user_time                                : float;
    (** Counted from the beginning of the solve call. *)
    deterministic_time                       : float;
    (** Counted from the beginning of the solve call. *)
    gap_integral                             : float;
    (** The integral of [log(1 + absolute_objective_gap)] over time. *)
    solution_info                            : string;
    (** Additional information about how the solution was found. *)
    solve_log                                : string;
    (** Filled if the [log_to_response] parameter is set. *)
  }

  (** Convert from the protocol buffer response format. *)
  val of_proto : Cp_model.cp_solver_response -> t

end (* }}} *)

(** An interface for invoking CP-SAT. This function is passed protocol buffers
    for the parameters and the model and should return a protocol buffer for
    the response. *)
type raw_solver = parameters_pb:string -> model_pb:string -> string

(** Calls a {!type:raw_solver} with encoded versions of the parameters and
    model and returns the decoded response. *)
val solve :
     raw_solver
  -> ?parameters:Parameters.t
  -> t
  -> Response.t

(** {2:output Output} *)

(** Converts a model to a protocol buffer. NB: copying is minimized, so the
    returned data structure shares some (mutable) data structures with the
    model. I.e., it becomes invalid if the model is changed. *)
val to_proto : t -> Cp_model.cp_model_proto

(** Send the model to the output channel as a protocol buffer. *)
val pb_output : t -> out_channel -> unit

(** Encode a model. *)
val pb_encode : t -> Pbrt.Encoder.t -> unit

