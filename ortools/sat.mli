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
type model

(** Create an empty model with an optional name. The [nvars] argument
    optionally specifies the expected number of variables, which determines
    the size and growth of internal data structures. *)
val make : ?nvars:int -> ?name:string -> unit -> model

(** A subset of the integers. *)
module Domain : sig (* {{{ *)

  (** Internally, represented as a sorted, non-adjacent list of intervals. *)
  type t

  (** An integer interval from lower and upper bounds.
      - with both: {m \{ x \mid \mathtt{lb} \leq x \leq \mathtt{ub} \} },
      - with [lb] only: {m \{ x \mid \mathtt{lb} \leq x \} },
      - with [ub] only: {m \{ x \mid x \leq \mathtt{ub} \} }, and
      - with neither or [lb >= ub]: {m \emptyset }. *)
  val of_interval : ?lb:int -> ?ub:int -> unit -> t

  (** A union of intervals from [(lb, ub)] pairs. *)
  val of_intervals : (int * int) list -> t

  (** One of a set of values. *)
  val of_values : int list -> t

  (** Union of two intervals. *)
  val (@) : t -> t -> t

  (** Union of a list of intervals. *)
  val union : t list -> t

  (** Return a string representing the domain. *)
  val to_string : t -> string

  (** Pretty-printer for domains. *)
  val pp : Format.formatter -> t -> unit

end (* }}} *)

(** Representation of integer variables and boolean literals. *)
module Var : sig (* {{{ *)

  (** A variable or boolean literal. Note that each variable and boolean
      literal is associated with a specific model. It is an error to mix
      variables or literals from different models. *)
  type 'a t

  (** A boolean literal. *)
  type t_bool = [`Bool] t

  (** An integer variable. *)
  type t_int  = [`Int] t

  (** Add a new bounded integer variable to a model. *)
  val new_int : model -> lb:int -> ub:int -> string -> t_int

  (** Restrict the new bounded integer variable to a domain. *)
  val new_int_from_domain : model -> Domain.t -> string -> t_int

  (** Add a new boolean variable to a model. *)
  val new_bool : model -> string -> t_bool

  (** Complement a boolean literal. *)
  val not : t_bool -> t_bool

  (** Create a new integer variable constrained to a given value. *)
  val new_constant : model -> int -> t_int

  (** Expose the underlying index of a variable. *)
  val to_index : 'a t -> int

  (** Assert that a variable is a boolean variable.
      Raises [Invalid_argument] for a variable [x] that does not satisfy
      [0 <= x <= 1]. *)
  val to_bool : 'a t -> [`Bool] t

  (** Convert a variable to an integer variable.
      Raises [Invalid_argument] on complemented boolean literals. *)
  val to_int  : 'a t -> [`Int] t

  (** Return a string representing the variable or boolean literal. *)
  val to_string : 'a t -> string

  (** Pretty-printer for variables and boolean literals. *)
  val pp : Format.formatter -> 'a t -> unit

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

  (** An empty linear expression. *)
  val zero : t

  (** A sum of linear expressions. *)
  val sum : t list -> t

  (** A sum of variables: all coefficients are 1s. *)
  val sum_vars : 'a Var.t list -> t

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

  (** Return a string representing the linear expression. *)
  val to_string : t -> string

  (** Pretty-printer for linear expressions. *)
  val pp : Format.formatter -> t -> unit

  module L : sig (* {{{ *)
    (** Operators for building linear expressions.
        They are also available directly in the {!module:Sat} module. *)

    (** An empty linear expression. *)
    val zero : t

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

    (** Complement a boolean literal. Same as {!val:Var.nto}. *)
    val not : Var.t_bool -> Var.t_bool

  end (* }}} *)

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
    | Linear of LinearExpr.t * Domain.t
      (** Constrains a {{!LinearExpr.t}linear expression} to a domain.
          Values of type [Linear of lt] are created by the {!(<=)}, {!(==)},
          and similar operators. *)
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

  module WithArray : sig (* {{{ *)
    (** Constraints with arrays as arguments .  *)

    (** At least one of the literals must be true. Same as {!Or}. *)
    val bool_or : Var.t_bool array -> t

    (** All literals must be true. Same as {!And}. *)
    val bool_and : Var.t_bool array -> t

    (** An odd number of literals is true. Same as {!Xor}. *)
    val bool_xor : Var.t_bool array -> t

    (** At most one literal is true. Sum literals <= 1.
        Same as {!At_most_one}. *)
    val at_most_one : Var.t_bool array -> t

    (** Exactly one literal is true. Sum literals == 1.
        Same as {!Exactly_one}. *)
    val exactly_one : Var.t_bool array -> t

    (** At least one of the literals must be true.
        Same as {!Or}. *)
    val at_least_one : Var.t_bool array -> t

    (** Sum of an array of linear expressions. *)
    val sum : LinearExpr.t array -> LinearExpr.t

    (** Sum of an array of variables or boolean literals. *)
    val vars : 'a Var.t array -> LinearExpr.t

  end (* }}} *)

  (** Logical implication between two literals.
      ([implication a b] is the same as [ Or [(Var.not a); b] ].) *)
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

  val in_domain : LinearExpr.t -> Domain.t -> t

  include module type of LinearExpr.L

  module Linear : sig (* {{{ *)

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

  (** {1:utility Utilities} *)

  (** Return a string representing the linear expression. *)
  val to_string : t -> string

  (** Pretty-printer for linear expressions. *)
  val pp : Format.formatter -> t -> unit

end (* }}} *)

(** Add a constraint to the model, with an optional name. The constraint is
    conditional if the [only_enforce_if] argument is a non-empty list of
    boolean literals. *)
val add :
     model
  -> ?name:string
  -> ?only_enforce_if:Var.t_bool list
  -> Constraint.t
  -> unit

(** Adds an implication constraint to the model.
    [add_implication m lhs rhs = add m ~only_enforce_if:lhs (Constraint.And rhs)] *)
val add_implication :
     model
  -> ?name:string
  -> Var.t_bool list
  -> Var.t_bool list
  -> unit

include module type of Constraint.Linear

(** {1:objectives Objectives} *)

(** The linear expression to maximize. Any existing objective is replaced. *)
val maximize : model -> LinearExpr.t -> unit

(** The linear expression to minimize. Any existing objective is replaced. *)
val minimize : model -> LinearExpr.t -> unit

(** {2:hints Hints} *)

(** Suggest an initial solution for the given variable. *)
val add_hint : model -> 'a Var.t -> int -> unit

(** Suggest initial solutions for the given variables. *)
val add_hints : model -> ('a Var.t * int) list -> unit

(** Remove any initial solutions. *)
val clear_hints : model -> unit

(** {2:assumptions Assumptions} *)

(** Add assumptions on boolean literals. *)
val add_assumptions : model -> Var.t_bool list -> unit

(** Clear any assumptions on boolean literals. *)
val clear_assumptions : model -> unit

(** {1:strategies Decision Strategies} *)

(** Specifies branching decisions on variables. *)
type variable_selection_strategy =
  | ChooseFirst
    (** The first variable in the list that is not fixed. *)
  | ChooseLowestMin
    (** The variable that might take the lowest value. *)
  | ChooseHighestMax
    (** The variable that might take the highest value. *)
  | ChooseMinDomainSize
    (** The variable having the fewest feasible assignments. *)
  | ChooseMaxDomainSize
    (** The variable having the most feasible assignments. *)

(** Specifies branching decisions on domains. *)
type domain_reduction_strategy =
  | SelectMinValue
    (** Try to assign the smallest value. *)
  | SelectMaxValue
    (** Try to assign the largest value. *)
  | SelectLowerHalf
    (** Branch to the lower half of the domain. *)
  | SelectUpperHalf
    (** Branch to the upper half of the domain. *)
  | SelectMedianValue
    (** Try to assign the median value. *)
  | SelectRandomHalf
    (** Randomly select either the lower or the upper half of the domain. *)

(** Controls how the solver branches when no further deductions are possible.
    The selection and reduction strategies are applied to the given list of
    variables in order. Adding a new decision strategy replaces any existing
    one. *)
val add_decision_strategy :
     model
  -> 'a Var.t list
  -> variable_selection_strategy
  -> domain_reduction_strategy
  -> unit

(** Controls how the solver branches when no further deductions are possible.
    The selection and reduction strategies are applied to the given list of
    expressions. Adding a new decision strategy replaces any existing one. *)
val add_decision_strategy_with_exprs :
     model
  -> LinearExpr.t list
  -> variable_selection_strategy
  -> domain_reduction_strategy
  -> unit

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
    terms                  : (int * Var.t_int) list;
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
  val of_proto : model -> Cp_model.cp_solver_response -> t

  (** Convert from a protocol buffer decoder. *)
  val pb_decode : model -> Pbrt.Decoder.t -> t

  (** Read all the input data and decode. *)
  val of_input : model -> in_channel -> t

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
  -> model
  -> Response.t

(** {2:output Output} *)

(** Converts a model to a protocol buffer. NB: copying is minimized, so the
    returned data structure shares some (mutable) data structures with the
    model. I.e., it becomes invalid if the model is changed. *)
val to_proto : model -> Cp_model.cp_model_proto

(** Send the model to the output channel as a protocol buffer. *)
val pb_output : model -> out_channel -> unit

(** Encode a model. *)
val pb_encode : model -> Pbrt.Encoder.t -> unit

