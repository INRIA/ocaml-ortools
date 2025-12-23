
(** Code for cp_model.proto *)

(* generated from "ortools/sat/cp_model.proto", do not edit *)



(** {2 Types} *)

type integer_variable_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable name : string;
  mutable domain : int64 list;
}

type bool_argument_proto = private {
  mutable literals : int32 list;
}

type linear_expression_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable vars : int32 list;
  mutable coeffs : int64 list;
  mutable offset : int64;
}

type linear_argument_proto = private {
  mutable target : linear_expression_proto option;
  mutable exprs : linear_expression_proto list;
}

type all_different_constraint_proto = private {
  mutable exprs : linear_expression_proto list;
}

type linear_constraint_proto = private {
  mutable vars : int32 list;
  mutable coeffs : int64 list;
  mutable domain : int64 list;
}

type element_constraint_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable index : int32;
  mutable target : int32;
  mutable vars : int32 list;
  mutable linear_index : linear_expression_proto option;
  mutable linear_target : linear_expression_proto option;
  mutable exprs : linear_expression_proto list;
}

type interval_constraint_proto = private {
  mutable start : linear_expression_proto option;
  mutable end_ : linear_expression_proto option;
  mutable size : linear_expression_proto option;
}

type no_overlap_constraint_proto = private {
  mutable intervals : int32 list;
}

type no_overlap2_dconstraint_proto = private {
  mutable x_intervals : int32 list;
  mutable y_intervals : int32 list;
}

type cumulative_constraint_proto = private {
  mutable capacity : linear_expression_proto option;
  mutable intervals : int32 list;
  mutable demands : linear_expression_proto list;
}

type reservoir_constraint_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable min_level : int64;
  mutable max_level : int64;
  mutable time_exprs : linear_expression_proto list;
  mutable level_changes : linear_expression_proto list;
  mutable active_literals : int32 list;
}

type circuit_constraint_proto = private {
  mutable tails : int32 list;
  mutable heads : int32 list;
  mutable literals : int32 list;
}

type routes_constraint_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable tails : int32 list;
  mutable heads : int32 list;
  mutable literals : int32 list;
  mutable demands : int32 list;
  mutable capacity : int64;
}

type table_constraint_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable vars : int32 list;
  mutable values : int64 list;
  mutable exprs : linear_expression_proto list;
  mutable negated : bool;
}

type inverse_constraint_proto = private {
  mutable f_direct : int32 list;
  mutable f_inverse : int32 list;
}

type automaton_constraint_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable starting_state : int64;
  mutable final_states : int64 list;
  mutable transition_tail : int64 list;
  mutable transition_head : int64 list;
  mutable transition_label : int64 list;
  mutable vars : int32 list;
  mutable exprs : linear_expression_proto list;
}

type list_of_variables_proto = private {
  mutable vars : int32 list;
}

type constraint_proto_constraint =
  | Bool_or of bool_argument_proto
  | Bool_and of bool_argument_proto
  | At_most_one of bool_argument_proto
  | Exactly_one of bool_argument_proto
  | Bool_xor of bool_argument_proto
  | Int_div of linear_argument_proto
  | Int_mod of linear_argument_proto
  | Int_prod of linear_argument_proto
  | Lin_max of linear_argument_proto
  | Linear of linear_constraint_proto
  | All_diff of all_different_constraint_proto
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

and constraint_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable name : string;
  mutable enforcement_literal : int32 list;
  mutable constraint_ : constraint_proto_constraint option;
}

type cp_objective_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 6 fields *)
  mutable vars : int32 list;
  mutable coeffs : int64 list;
  mutable offset : float;
  mutable scaling_factor : float;
  mutable domain : int64 list;
  mutable scaling_was_exact : bool;
  mutable integer_before_offset : int64;
  mutable integer_after_offset : int64;
  mutable integer_scaling_factor : int64;
}

type float_objective_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable vars : int32 list;
  mutable coeffs : float list;
  mutable offset : float;
  mutable maximize : bool;
}

type decision_strategy_proto_variable_selection_strategy =
  | Choose_first 
  | Choose_lowest_min 
  | Choose_highest_max 
  | Choose_min_domain_size 
  | Choose_max_domain_size 

type decision_strategy_proto_domain_reduction_strategy =
  | Select_min_value 
  | Select_max_value 
  | Select_lower_half 
  | Select_upper_half 
  | Select_median_value 
  | Select_random_half 

type decision_strategy_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable variables : int32 list;
  mutable exprs : linear_expression_proto list;
  mutable variable_selection_strategy : decision_strategy_proto_variable_selection_strategy;
  mutable domain_reduction_strategy : decision_strategy_proto_domain_reduction_strategy;
}

type partial_variable_assignment = private {
  mutable vars : int32 list;
  mutable values : int64 list;
}

type sparse_permutation_proto = private {
  mutable support : int32 list;
  mutable cycle_sizes : int32 list;
}

type dense_matrix_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable num_rows : int32;
  mutable num_cols : int32;
  mutable entries : int32 list;
}

type symmetry_proto = private {
  mutable permutations : sparse_permutation_proto list;
  mutable orbitopes : dense_matrix_proto list;
}

type cp_model_proto = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable name : string;
  mutable variables : integer_variable_proto list;
  mutable constraints : constraint_proto list;
  mutable objective : cp_objective_proto option;
  mutable floating_point_objective : float_objective_proto option;
  mutable search_strategy : decision_strategy_proto list;
  mutable solution_hint : partial_variable_assignment option;
  mutable assumptions : int32 list;
  mutable symmetry : symmetry_proto option;
}

type cp_solver_status =
  | Unknown 
  | Model_invalid 
  | Feasible 
  | Infeasible 
  | Optimal 

type cp_solver_solution = private {
  mutable values : int64 list;
}

type cp_solver_response = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 19 fields *)
  mutable status : cp_solver_status;
  mutable solution : int64 list;
  mutable objective_value : float;
  mutable best_objective_bound : float;
  mutable additional_solutions : cp_solver_solution list;
  mutable tightened_variables : integer_variable_proto list;
  mutable sufficient_assumptions_for_infeasibility : int32 list;
  mutable integer_objective : cp_objective_proto option;
  mutable inner_objective_lower_bound : int64;
  mutable num_integers : int64;
  mutable num_booleans : int64;
  mutable num_fixed_booleans : int64;
  mutable num_conflicts : int64;
  mutable num_branches : int64;
  mutable num_binary_propagations : int64;
  mutable num_integer_propagations : int64;
  mutable num_restarts : int64;
  mutable num_lp_iterations : int64;
  mutable wall_time : float;
  mutable user_time : float;
  mutable deterministic_time : float;
  mutable gap_integral : float;
  mutable solution_info : string;
  mutable solve_log : string;
}


(** {2 Basic values} *)

val default_integer_variable_proto : unit -> integer_variable_proto 
(** [default_integer_variable_proto ()] is a new empty value for type [integer_variable_proto] *)

val default_bool_argument_proto : unit -> bool_argument_proto 
(** [default_bool_argument_proto ()] is a new empty value for type [bool_argument_proto] *)

val default_linear_expression_proto : unit -> linear_expression_proto 
(** [default_linear_expression_proto ()] is a new empty value for type [linear_expression_proto] *)

val default_linear_argument_proto : unit -> linear_argument_proto 
(** [default_linear_argument_proto ()] is a new empty value for type [linear_argument_proto] *)

val default_all_different_constraint_proto : unit -> all_different_constraint_proto 
(** [default_all_different_constraint_proto ()] is a new empty value for type [all_different_constraint_proto] *)

val default_linear_constraint_proto : unit -> linear_constraint_proto 
(** [default_linear_constraint_proto ()] is a new empty value for type [linear_constraint_proto] *)

val default_element_constraint_proto : unit -> element_constraint_proto 
(** [default_element_constraint_proto ()] is a new empty value for type [element_constraint_proto] *)

val default_interval_constraint_proto : unit -> interval_constraint_proto 
(** [default_interval_constraint_proto ()] is a new empty value for type [interval_constraint_proto] *)

val default_no_overlap_constraint_proto : unit -> no_overlap_constraint_proto 
(** [default_no_overlap_constraint_proto ()] is a new empty value for type [no_overlap_constraint_proto] *)

val default_no_overlap2_dconstraint_proto : unit -> no_overlap2_dconstraint_proto 
(** [default_no_overlap2_dconstraint_proto ()] is a new empty value for type [no_overlap2_dconstraint_proto] *)

val default_cumulative_constraint_proto : unit -> cumulative_constraint_proto 
(** [default_cumulative_constraint_proto ()] is a new empty value for type [cumulative_constraint_proto] *)

val default_reservoir_constraint_proto : unit -> reservoir_constraint_proto 
(** [default_reservoir_constraint_proto ()] is a new empty value for type [reservoir_constraint_proto] *)

val default_circuit_constraint_proto : unit -> circuit_constraint_proto 
(** [default_circuit_constraint_proto ()] is a new empty value for type [circuit_constraint_proto] *)

val default_routes_constraint_proto : unit -> routes_constraint_proto 
(** [default_routes_constraint_proto ()] is a new empty value for type [routes_constraint_proto] *)

val default_table_constraint_proto : unit -> table_constraint_proto 
(** [default_table_constraint_proto ()] is a new empty value for type [table_constraint_proto] *)

val default_inverse_constraint_proto : unit -> inverse_constraint_proto 
(** [default_inverse_constraint_proto ()] is a new empty value for type [inverse_constraint_proto] *)

val default_automaton_constraint_proto : unit -> automaton_constraint_proto 
(** [default_automaton_constraint_proto ()] is a new empty value for type [automaton_constraint_proto] *)

val default_list_of_variables_proto : unit -> list_of_variables_proto 
(** [default_list_of_variables_proto ()] is a new empty value for type [list_of_variables_proto] *)

val default_constraint_proto_constraint : unit -> constraint_proto_constraint
(** [default_constraint_proto_constraint ()] is a new empty value for type [constraint_proto_constraint] *)

val default_constraint_proto : unit -> constraint_proto 
(** [default_constraint_proto ()] is a new empty value for type [constraint_proto] *)

val default_cp_objective_proto : unit -> cp_objective_proto 
(** [default_cp_objective_proto ()] is a new empty value for type [cp_objective_proto] *)

val default_float_objective_proto : unit -> float_objective_proto 
(** [default_float_objective_proto ()] is a new empty value for type [float_objective_proto] *)

val default_decision_strategy_proto_variable_selection_strategy : unit -> decision_strategy_proto_variable_selection_strategy
(** [default_decision_strategy_proto_variable_selection_strategy ()] is a new empty value for type [decision_strategy_proto_variable_selection_strategy] *)

val default_decision_strategy_proto_domain_reduction_strategy : unit -> decision_strategy_proto_domain_reduction_strategy
(** [default_decision_strategy_proto_domain_reduction_strategy ()] is a new empty value for type [decision_strategy_proto_domain_reduction_strategy] *)

val default_decision_strategy_proto : unit -> decision_strategy_proto 
(** [default_decision_strategy_proto ()] is a new empty value for type [decision_strategy_proto] *)

val default_partial_variable_assignment : unit -> partial_variable_assignment 
(** [default_partial_variable_assignment ()] is a new empty value for type [partial_variable_assignment] *)

val default_sparse_permutation_proto : unit -> sparse_permutation_proto 
(** [default_sparse_permutation_proto ()] is a new empty value for type [sparse_permutation_proto] *)

val default_dense_matrix_proto : unit -> dense_matrix_proto 
(** [default_dense_matrix_proto ()] is a new empty value for type [dense_matrix_proto] *)

val default_symmetry_proto : unit -> symmetry_proto 
(** [default_symmetry_proto ()] is a new empty value for type [symmetry_proto] *)

val default_cp_model_proto : unit -> cp_model_proto 
(** [default_cp_model_proto ()] is a new empty value for type [cp_model_proto] *)

val default_cp_solver_status : unit -> cp_solver_status
(** [default_cp_solver_status ()] is a new empty value for type [cp_solver_status] *)

val default_cp_solver_solution : unit -> cp_solver_solution 
(** [default_cp_solver_solution ()] is a new empty value for type [cp_solver_solution] *)

val default_cp_solver_response : unit -> cp_solver_response 
(** [default_cp_solver_response ()] is a new empty value for type [cp_solver_response] *)


(** {2 Make functions} *)

val make_integer_variable_proto : 
  ?name:string ->
  ?domain:int64 list ->
  unit ->
  integer_variable_proto
(** [make_integer_variable_proto … ()] is a builder for type [integer_variable_proto] *)

val copy_integer_variable_proto : integer_variable_proto -> integer_variable_proto

val integer_variable_proto_has_name : integer_variable_proto -> bool
  (** presence of field "name" in [integer_variable_proto] *)

val integer_variable_proto_set_name : integer_variable_proto -> string -> unit
  (** set field name in integer_variable_proto *)

val integer_variable_proto_set_domain : integer_variable_proto -> int64 list -> unit
  (** set field domain in integer_variable_proto *)

val make_bool_argument_proto : 
  ?literals:int32 list ->
  unit ->
  bool_argument_proto
(** [make_bool_argument_proto … ()] is a builder for type [bool_argument_proto] *)

val copy_bool_argument_proto : bool_argument_proto -> bool_argument_proto

val bool_argument_proto_set_literals : bool_argument_proto -> int32 list -> unit
  (** set field literals in bool_argument_proto *)

val make_linear_expression_proto : 
  ?vars:int32 list ->
  ?coeffs:int64 list ->
  ?offset:int64 ->
  unit ->
  linear_expression_proto
(** [make_linear_expression_proto … ()] is a builder for type [linear_expression_proto] *)

val copy_linear_expression_proto : linear_expression_proto -> linear_expression_proto

val linear_expression_proto_set_vars : linear_expression_proto -> int32 list -> unit
  (** set field vars in linear_expression_proto *)

val linear_expression_proto_set_coeffs : linear_expression_proto -> int64 list -> unit
  (** set field coeffs in linear_expression_proto *)

val linear_expression_proto_has_offset : linear_expression_proto -> bool
  (** presence of field "offset" in [linear_expression_proto] *)

val linear_expression_proto_set_offset : linear_expression_proto -> int64 -> unit
  (** set field offset in linear_expression_proto *)

val make_linear_argument_proto : 
  ?target:linear_expression_proto ->
  ?exprs:linear_expression_proto list ->
  unit ->
  linear_argument_proto
(** [make_linear_argument_proto … ()] is a builder for type [linear_argument_proto] *)

val copy_linear_argument_proto : linear_argument_proto -> linear_argument_proto

val linear_argument_proto_set_target : linear_argument_proto -> linear_expression_proto -> unit
  (** set field target in linear_argument_proto *)

val linear_argument_proto_set_exprs : linear_argument_proto -> linear_expression_proto list -> unit
  (** set field exprs in linear_argument_proto *)

val make_all_different_constraint_proto : 
  ?exprs:linear_expression_proto list ->
  unit ->
  all_different_constraint_proto
(** [make_all_different_constraint_proto … ()] is a builder for type [all_different_constraint_proto] *)

val copy_all_different_constraint_proto : all_different_constraint_proto -> all_different_constraint_proto

val all_different_constraint_proto_set_exprs : all_different_constraint_proto -> linear_expression_proto list -> unit
  (** set field exprs in all_different_constraint_proto *)

val make_linear_constraint_proto : 
  ?vars:int32 list ->
  ?coeffs:int64 list ->
  ?domain:int64 list ->
  unit ->
  linear_constraint_proto
(** [make_linear_constraint_proto … ()] is a builder for type [linear_constraint_proto] *)

val copy_linear_constraint_proto : linear_constraint_proto -> linear_constraint_proto

val linear_constraint_proto_set_vars : linear_constraint_proto -> int32 list -> unit
  (** set field vars in linear_constraint_proto *)

val linear_constraint_proto_set_coeffs : linear_constraint_proto -> int64 list -> unit
  (** set field coeffs in linear_constraint_proto *)

val linear_constraint_proto_set_domain : linear_constraint_proto -> int64 list -> unit
  (** set field domain in linear_constraint_proto *)

val make_element_constraint_proto : 
  ?index:int32 ->
  ?target:int32 ->
  ?vars:int32 list ->
  ?linear_index:linear_expression_proto ->
  ?linear_target:linear_expression_proto ->
  ?exprs:linear_expression_proto list ->
  unit ->
  element_constraint_proto
(** [make_element_constraint_proto … ()] is a builder for type [element_constraint_proto] *)

val copy_element_constraint_proto : element_constraint_proto -> element_constraint_proto

val element_constraint_proto_has_index : element_constraint_proto -> bool
  (** presence of field "index" in [element_constraint_proto] *)

val element_constraint_proto_set_index : element_constraint_proto -> int32 -> unit
  (** set field index in element_constraint_proto *)

val element_constraint_proto_has_target : element_constraint_proto -> bool
  (** presence of field "target" in [element_constraint_proto] *)

val element_constraint_proto_set_target : element_constraint_proto -> int32 -> unit
  (** set field target in element_constraint_proto *)

val element_constraint_proto_set_vars : element_constraint_proto -> int32 list -> unit
  (** set field vars in element_constraint_proto *)

val element_constraint_proto_set_linear_index : element_constraint_proto -> linear_expression_proto -> unit
  (** set field linear_index in element_constraint_proto *)

val element_constraint_proto_set_linear_target : element_constraint_proto -> linear_expression_proto -> unit
  (** set field linear_target in element_constraint_proto *)

val element_constraint_proto_set_exprs : element_constraint_proto -> linear_expression_proto list -> unit
  (** set field exprs in element_constraint_proto *)

val make_interval_constraint_proto : 
  ?start:linear_expression_proto ->
  ?end_:linear_expression_proto ->
  ?size:linear_expression_proto ->
  unit ->
  interval_constraint_proto
(** [make_interval_constraint_proto … ()] is a builder for type [interval_constraint_proto] *)

val copy_interval_constraint_proto : interval_constraint_proto -> interval_constraint_proto

val interval_constraint_proto_set_start : interval_constraint_proto -> linear_expression_proto -> unit
  (** set field start in interval_constraint_proto *)

val interval_constraint_proto_set_end_ : interval_constraint_proto -> linear_expression_proto -> unit
  (** set field end_ in interval_constraint_proto *)

val interval_constraint_proto_set_size : interval_constraint_proto -> linear_expression_proto -> unit
  (** set field size in interval_constraint_proto *)

val make_no_overlap_constraint_proto : 
  ?intervals:int32 list ->
  unit ->
  no_overlap_constraint_proto
(** [make_no_overlap_constraint_proto … ()] is a builder for type [no_overlap_constraint_proto] *)

val copy_no_overlap_constraint_proto : no_overlap_constraint_proto -> no_overlap_constraint_proto

val no_overlap_constraint_proto_set_intervals : no_overlap_constraint_proto -> int32 list -> unit
  (** set field intervals in no_overlap_constraint_proto *)

val make_no_overlap2_dconstraint_proto : 
  ?x_intervals:int32 list ->
  ?y_intervals:int32 list ->
  unit ->
  no_overlap2_dconstraint_proto
(** [make_no_overlap2_dconstraint_proto … ()] is a builder for type [no_overlap2_dconstraint_proto] *)

val copy_no_overlap2_dconstraint_proto : no_overlap2_dconstraint_proto -> no_overlap2_dconstraint_proto

val no_overlap2_dconstraint_proto_set_x_intervals : no_overlap2_dconstraint_proto -> int32 list -> unit
  (** set field x_intervals in no_overlap2_dconstraint_proto *)

val no_overlap2_dconstraint_proto_set_y_intervals : no_overlap2_dconstraint_proto -> int32 list -> unit
  (** set field y_intervals in no_overlap2_dconstraint_proto *)

val make_cumulative_constraint_proto : 
  ?capacity:linear_expression_proto ->
  ?intervals:int32 list ->
  ?demands:linear_expression_proto list ->
  unit ->
  cumulative_constraint_proto
(** [make_cumulative_constraint_proto … ()] is a builder for type [cumulative_constraint_proto] *)

val copy_cumulative_constraint_proto : cumulative_constraint_proto -> cumulative_constraint_proto

val cumulative_constraint_proto_set_capacity : cumulative_constraint_proto -> linear_expression_proto -> unit
  (** set field capacity in cumulative_constraint_proto *)

val cumulative_constraint_proto_set_intervals : cumulative_constraint_proto -> int32 list -> unit
  (** set field intervals in cumulative_constraint_proto *)

val cumulative_constraint_proto_set_demands : cumulative_constraint_proto -> linear_expression_proto list -> unit
  (** set field demands in cumulative_constraint_proto *)

val make_reservoir_constraint_proto : 
  ?min_level:int64 ->
  ?max_level:int64 ->
  ?time_exprs:linear_expression_proto list ->
  ?level_changes:linear_expression_proto list ->
  ?active_literals:int32 list ->
  unit ->
  reservoir_constraint_proto
(** [make_reservoir_constraint_proto … ()] is a builder for type [reservoir_constraint_proto] *)

val copy_reservoir_constraint_proto : reservoir_constraint_proto -> reservoir_constraint_proto

val reservoir_constraint_proto_has_min_level : reservoir_constraint_proto -> bool
  (** presence of field "min_level" in [reservoir_constraint_proto] *)

val reservoir_constraint_proto_set_min_level : reservoir_constraint_proto -> int64 -> unit
  (** set field min_level in reservoir_constraint_proto *)

val reservoir_constraint_proto_has_max_level : reservoir_constraint_proto -> bool
  (** presence of field "max_level" in [reservoir_constraint_proto] *)

val reservoir_constraint_proto_set_max_level : reservoir_constraint_proto -> int64 -> unit
  (** set field max_level in reservoir_constraint_proto *)

val reservoir_constraint_proto_set_time_exprs : reservoir_constraint_proto -> linear_expression_proto list -> unit
  (** set field time_exprs in reservoir_constraint_proto *)

val reservoir_constraint_proto_set_level_changes : reservoir_constraint_proto -> linear_expression_proto list -> unit
  (** set field level_changes in reservoir_constraint_proto *)

val reservoir_constraint_proto_set_active_literals : reservoir_constraint_proto -> int32 list -> unit
  (** set field active_literals in reservoir_constraint_proto *)

val make_circuit_constraint_proto : 
  ?tails:int32 list ->
  ?heads:int32 list ->
  ?literals:int32 list ->
  unit ->
  circuit_constraint_proto
(** [make_circuit_constraint_proto … ()] is a builder for type [circuit_constraint_proto] *)

val copy_circuit_constraint_proto : circuit_constraint_proto -> circuit_constraint_proto

val circuit_constraint_proto_set_tails : circuit_constraint_proto -> int32 list -> unit
  (** set field tails in circuit_constraint_proto *)

val circuit_constraint_proto_set_heads : circuit_constraint_proto -> int32 list -> unit
  (** set field heads in circuit_constraint_proto *)

val circuit_constraint_proto_set_literals : circuit_constraint_proto -> int32 list -> unit
  (** set field literals in circuit_constraint_proto *)

val make_routes_constraint_proto : 
  ?tails:int32 list ->
  ?heads:int32 list ->
  ?literals:int32 list ->
  ?demands:int32 list ->
  ?capacity:int64 ->
  unit ->
  routes_constraint_proto
(** [make_routes_constraint_proto … ()] is a builder for type [routes_constraint_proto] *)

val copy_routes_constraint_proto : routes_constraint_proto -> routes_constraint_proto

val routes_constraint_proto_set_tails : routes_constraint_proto -> int32 list -> unit
  (** set field tails in routes_constraint_proto *)

val routes_constraint_proto_set_heads : routes_constraint_proto -> int32 list -> unit
  (** set field heads in routes_constraint_proto *)

val routes_constraint_proto_set_literals : routes_constraint_proto -> int32 list -> unit
  (** set field literals in routes_constraint_proto *)

val routes_constraint_proto_set_demands : routes_constraint_proto -> int32 list -> unit
  (** set field demands in routes_constraint_proto *)

val routes_constraint_proto_has_capacity : routes_constraint_proto -> bool
  (** presence of field "capacity" in [routes_constraint_proto] *)

val routes_constraint_proto_set_capacity : routes_constraint_proto -> int64 -> unit
  (** set field capacity in routes_constraint_proto *)

val make_table_constraint_proto : 
  ?vars:int32 list ->
  ?values:int64 list ->
  ?exprs:linear_expression_proto list ->
  ?negated:bool ->
  unit ->
  table_constraint_proto
(** [make_table_constraint_proto … ()] is a builder for type [table_constraint_proto] *)

val copy_table_constraint_proto : table_constraint_proto -> table_constraint_proto

val table_constraint_proto_set_vars : table_constraint_proto -> int32 list -> unit
  (** set field vars in table_constraint_proto *)

val table_constraint_proto_set_values : table_constraint_proto -> int64 list -> unit
  (** set field values in table_constraint_proto *)

val table_constraint_proto_set_exprs : table_constraint_proto -> linear_expression_proto list -> unit
  (** set field exprs in table_constraint_proto *)

val table_constraint_proto_has_negated : table_constraint_proto -> bool
  (** presence of field "negated" in [table_constraint_proto] *)

val table_constraint_proto_set_negated : table_constraint_proto -> bool -> unit
  (** set field negated in table_constraint_proto *)

val make_inverse_constraint_proto : 
  ?f_direct:int32 list ->
  ?f_inverse:int32 list ->
  unit ->
  inverse_constraint_proto
(** [make_inverse_constraint_proto … ()] is a builder for type [inverse_constraint_proto] *)

val copy_inverse_constraint_proto : inverse_constraint_proto -> inverse_constraint_proto

val inverse_constraint_proto_set_f_direct : inverse_constraint_proto -> int32 list -> unit
  (** set field f_direct in inverse_constraint_proto *)

val inverse_constraint_proto_set_f_inverse : inverse_constraint_proto -> int32 list -> unit
  (** set field f_inverse in inverse_constraint_proto *)

val make_automaton_constraint_proto : 
  ?starting_state:int64 ->
  ?final_states:int64 list ->
  ?transition_tail:int64 list ->
  ?transition_head:int64 list ->
  ?transition_label:int64 list ->
  ?vars:int32 list ->
  ?exprs:linear_expression_proto list ->
  unit ->
  automaton_constraint_proto
(** [make_automaton_constraint_proto … ()] is a builder for type [automaton_constraint_proto] *)

val copy_automaton_constraint_proto : automaton_constraint_proto -> automaton_constraint_proto

val automaton_constraint_proto_has_starting_state : automaton_constraint_proto -> bool
  (** presence of field "starting_state" in [automaton_constraint_proto] *)

val automaton_constraint_proto_set_starting_state : automaton_constraint_proto -> int64 -> unit
  (** set field starting_state in automaton_constraint_proto *)

val automaton_constraint_proto_set_final_states : automaton_constraint_proto -> int64 list -> unit
  (** set field final_states in automaton_constraint_proto *)

val automaton_constraint_proto_set_transition_tail : automaton_constraint_proto -> int64 list -> unit
  (** set field transition_tail in automaton_constraint_proto *)

val automaton_constraint_proto_set_transition_head : automaton_constraint_proto -> int64 list -> unit
  (** set field transition_head in automaton_constraint_proto *)

val automaton_constraint_proto_set_transition_label : automaton_constraint_proto -> int64 list -> unit
  (** set field transition_label in automaton_constraint_proto *)

val automaton_constraint_proto_set_vars : automaton_constraint_proto -> int32 list -> unit
  (** set field vars in automaton_constraint_proto *)

val automaton_constraint_proto_set_exprs : automaton_constraint_proto -> linear_expression_proto list -> unit
  (** set field exprs in automaton_constraint_proto *)

val make_list_of_variables_proto : 
  ?vars:int32 list ->
  unit ->
  list_of_variables_proto
(** [make_list_of_variables_proto … ()] is a builder for type [list_of_variables_proto] *)

val copy_list_of_variables_proto : list_of_variables_proto -> list_of_variables_proto

val list_of_variables_proto_set_vars : list_of_variables_proto -> int32 list -> unit
  (** set field vars in list_of_variables_proto *)

val make_constraint_proto : 
  ?name:string ->
  ?enforcement_literal:int32 list ->
  ?constraint_:constraint_proto_constraint ->
  unit ->
  constraint_proto
(** [make_constraint_proto … ()] is a builder for type [constraint_proto] *)

val copy_constraint_proto : constraint_proto -> constraint_proto

val constraint_proto_has_name : constraint_proto -> bool
  (** presence of field "name" in [constraint_proto] *)

val constraint_proto_set_name : constraint_proto -> string -> unit
  (** set field name in constraint_proto *)

val constraint_proto_set_enforcement_literal : constraint_proto -> int32 list -> unit
  (** set field enforcement_literal in constraint_proto *)

val constraint_proto_set_constraint_ : constraint_proto -> constraint_proto_constraint -> unit
  (** set field constraint_ in constraint_proto *)

val make_cp_objective_proto : 
  ?vars:int32 list ->
  ?coeffs:int64 list ->
  ?offset:float ->
  ?scaling_factor:float ->
  ?domain:int64 list ->
  ?scaling_was_exact:bool ->
  ?integer_before_offset:int64 ->
  ?integer_after_offset:int64 ->
  ?integer_scaling_factor:int64 ->
  unit ->
  cp_objective_proto
(** [make_cp_objective_proto … ()] is a builder for type [cp_objective_proto] *)

val copy_cp_objective_proto : cp_objective_proto -> cp_objective_proto

val cp_objective_proto_set_vars : cp_objective_proto -> int32 list -> unit
  (** set field vars in cp_objective_proto *)

val cp_objective_proto_set_coeffs : cp_objective_proto -> int64 list -> unit
  (** set field coeffs in cp_objective_proto *)

val cp_objective_proto_has_offset : cp_objective_proto -> bool
  (** presence of field "offset" in [cp_objective_proto] *)

val cp_objective_proto_set_offset : cp_objective_proto -> float -> unit
  (** set field offset in cp_objective_proto *)

val cp_objective_proto_has_scaling_factor : cp_objective_proto -> bool
  (** presence of field "scaling_factor" in [cp_objective_proto] *)

val cp_objective_proto_set_scaling_factor : cp_objective_proto -> float -> unit
  (** set field scaling_factor in cp_objective_proto *)

val cp_objective_proto_set_domain : cp_objective_proto -> int64 list -> unit
  (** set field domain in cp_objective_proto *)

val cp_objective_proto_has_scaling_was_exact : cp_objective_proto -> bool
  (** presence of field "scaling_was_exact" in [cp_objective_proto] *)

val cp_objective_proto_set_scaling_was_exact : cp_objective_proto -> bool -> unit
  (** set field scaling_was_exact in cp_objective_proto *)

val cp_objective_proto_has_integer_before_offset : cp_objective_proto -> bool
  (** presence of field "integer_before_offset" in [cp_objective_proto] *)

val cp_objective_proto_set_integer_before_offset : cp_objective_proto -> int64 -> unit
  (** set field integer_before_offset in cp_objective_proto *)

val cp_objective_proto_has_integer_after_offset : cp_objective_proto -> bool
  (** presence of field "integer_after_offset" in [cp_objective_proto] *)

val cp_objective_proto_set_integer_after_offset : cp_objective_proto -> int64 -> unit
  (** set field integer_after_offset in cp_objective_proto *)

val cp_objective_proto_has_integer_scaling_factor : cp_objective_proto -> bool
  (** presence of field "integer_scaling_factor" in [cp_objective_proto] *)

val cp_objective_proto_set_integer_scaling_factor : cp_objective_proto -> int64 -> unit
  (** set field integer_scaling_factor in cp_objective_proto *)

val make_float_objective_proto : 
  ?vars:int32 list ->
  ?coeffs:float list ->
  ?offset:float ->
  ?maximize:bool ->
  unit ->
  float_objective_proto
(** [make_float_objective_proto … ()] is a builder for type [float_objective_proto] *)

val copy_float_objective_proto : float_objective_proto -> float_objective_proto

val float_objective_proto_set_vars : float_objective_proto -> int32 list -> unit
  (** set field vars in float_objective_proto *)

val float_objective_proto_set_coeffs : float_objective_proto -> float list -> unit
  (** set field coeffs in float_objective_proto *)

val float_objective_proto_has_offset : float_objective_proto -> bool
  (** presence of field "offset" in [float_objective_proto] *)

val float_objective_proto_set_offset : float_objective_proto -> float -> unit
  (** set field offset in float_objective_proto *)

val float_objective_proto_has_maximize : float_objective_proto -> bool
  (** presence of field "maximize" in [float_objective_proto] *)

val float_objective_proto_set_maximize : float_objective_proto -> bool -> unit
  (** set field maximize in float_objective_proto *)

val make_decision_strategy_proto : 
  ?variables:int32 list ->
  ?exprs:linear_expression_proto list ->
  ?variable_selection_strategy:decision_strategy_proto_variable_selection_strategy ->
  ?domain_reduction_strategy:decision_strategy_proto_domain_reduction_strategy ->
  unit ->
  decision_strategy_proto
(** [make_decision_strategy_proto … ()] is a builder for type [decision_strategy_proto] *)

val copy_decision_strategy_proto : decision_strategy_proto -> decision_strategy_proto

val decision_strategy_proto_set_variables : decision_strategy_proto -> int32 list -> unit
  (** set field variables in decision_strategy_proto *)

val decision_strategy_proto_set_exprs : decision_strategy_proto -> linear_expression_proto list -> unit
  (** set field exprs in decision_strategy_proto *)

val decision_strategy_proto_has_variable_selection_strategy : decision_strategy_proto -> bool
  (** presence of field "variable_selection_strategy" in [decision_strategy_proto] *)

val decision_strategy_proto_set_variable_selection_strategy : decision_strategy_proto -> decision_strategy_proto_variable_selection_strategy -> unit
  (** set field variable_selection_strategy in decision_strategy_proto *)

val decision_strategy_proto_has_domain_reduction_strategy : decision_strategy_proto -> bool
  (** presence of field "domain_reduction_strategy" in [decision_strategy_proto] *)

val decision_strategy_proto_set_domain_reduction_strategy : decision_strategy_proto -> decision_strategy_proto_domain_reduction_strategy -> unit
  (** set field domain_reduction_strategy in decision_strategy_proto *)

val make_partial_variable_assignment : 
  ?vars:int32 list ->
  ?values:int64 list ->
  unit ->
  partial_variable_assignment
(** [make_partial_variable_assignment … ()] is a builder for type [partial_variable_assignment] *)

val copy_partial_variable_assignment : partial_variable_assignment -> partial_variable_assignment

val partial_variable_assignment_set_vars : partial_variable_assignment -> int32 list -> unit
  (** set field vars in partial_variable_assignment *)

val partial_variable_assignment_set_values : partial_variable_assignment -> int64 list -> unit
  (** set field values in partial_variable_assignment *)

val make_sparse_permutation_proto : 
  ?support:int32 list ->
  ?cycle_sizes:int32 list ->
  unit ->
  sparse_permutation_proto
(** [make_sparse_permutation_proto … ()] is a builder for type [sparse_permutation_proto] *)

val copy_sparse_permutation_proto : sparse_permutation_proto -> sparse_permutation_proto

val sparse_permutation_proto_set_support : sparse_permutation_proto -> int32 list -> unit
  (** set field support in sparse_permutation_proto *)

val sparse_permutation_proto_set_cycle_sizes : sparse_permutation_proto -> int32 list -> unit
  (** set field cycle_sizes in sparse_permutation_proto *)

val make_dense_matrix_proto : 
  ?num_rows:int32 ->
  ?num_cols:int32 ->
  ?entries:int32 list ->
  unit ->
  dense_matrix_proto
(** [make_dense_matrix_proto … ()] is a builder for type [dense_matrix_proto] *)

val copy_dense_matrix_proto : dense_matrix_proto -> dense_matrix_proto

val dense_matrix_proto_has_num_rows : dense_matrix_proto -> bool
  (** presence of field "num_rows" in [dense_matrix_proto] *)

val dense_matrix_proto_set_num_rows : dense_matrix_proto -> int32 -> unit
  (** set field num_rows in dense_matrix_proto *)

val dense_matrix_proto_has_num_cols : dense_matrix_proto -> bool
  (** presence of field "num_cols" in [dense_matrix_proto] *)

val dense_matrix_proto_set_num_cols : dense_matrix_proto -> int32 -> unit
  (** set field num_cols in dense_matrix_proto *)

val dense_matrix_proto_set_entries : dense_matrix_proto -> int32 list -> unit
  (** set field entries in dense_matrix_proto *)

val make_symmetry_proto : 
  ?permutations:sparse_permutation_proto list ->
  ?orbitopes:dense_matrix_proto list ->
  unit ->
  symmetry_proto
(** [make_symmetry_proto … ()] is a builder for type [symmetry_proto] *)

val copy_symmetry_proto : symmetry_proto -> symmetry_proto

val symmetry_proto_set_permutations : symmetry_proto -> sparse_permutation_proto list -> unit
  (** set field permutations in symmetry_proto *)

val symmetry_proto_set_orbitopes : symmetry_proto -> dense_matrix_proto list -> unit
  (** set field orbitopes in symmetry_proto *)

val make_cp_model_proto : 
  ?name:string ->
  ?variables:integer_variable_proto list ->
  ?constraints:constraint_proto list ->
  ?objective:cp_objective_proto ->
  ?floating_point_objective:float_objective_proto ->
  ?search_strategy:decision_strategy_proto list ->
  ?solution_hint:partial_variable_assignment ->
  ?assumptions:int32 list ->
  ?symmetry:symmetry_proto ->
  unit ->
  cp_model_proto
(** [make_cp_model_proto … ()] is a builder for type [cp_model_proto] *)

val copy_cp_model_proto : cp_model_proto -> cp_model_proto

val cp_model_proto_has_name : cp_model_proto -> bool
  (** presence of field "name" in [cp_model_proto] *)

val cp_model_proto_set_name : cp_model_proto -> string -> unit
  (** set field name in cp_model_proto *)

val cp_model_proto_set_variables : cp_model_proto -> integer_variable_proto list -> unit
  (** set field variables in cp_model_proto *)

val cp_model_proto_set_constraints : cp_model_proto -> constraint_proto list -> unit
  (** set field constraints in cp_model_proto *)

val cp_model_proto_set_objective : cp_model_proto -> cp_objective_proto -> unit
  (** set field objective in cp_model_proto *)

val cp_model_proto_set_floating_point_objective : cp_model_proto -> float_objective_proto -> unit
  (** set field floating_point_objective in cp_model_proto *)

val cp_model_proto_set_search_strategy : cp_model_proto -> decision_strategy_proto list -> unit
  (** set field search_strategy in cp_model_proto *)

val cp_model_proto_set_solution_hint : cp_model_proto -> partial_variable_assignment -> unit
  (** set field solution_hint in cp_model_proto *)

val cp_model_proto_set_assumptions : cp_model_proto -> int32 list -> unit
  (** set field assumptions in cp_model_proto *)

val cp_model_proto_set_symmetry : cp_model_proto -> symmetry_proto -> unit
  (** set field symmetry in cp_model_proto *)

val make_cp_solver_solution : 
  ?values:int64 list ->
  unit ->
  cp_solver_solution
(** [make_cp_solver_solution … ()] is a builder for type [cp_solver_solution] *)

val copy_cp_solver_solution : cp_solver_solution -> cp_solver_solution

val cp_solver_solution_set_values : cp_solver_solution -> int64 list -> unit
  (** set field values in cp_solver_solution *)

val make_cp_solver_response : 
  ?status:cp_solver_status ->
  ?solution:int64 list ->
  ?objective_value:float ->
  ?best_objective_bound:float ->
  ?additional_solutions:cp_solver_solution list ->
  ?tightened_variables:integer_variable_proto list ->
  ?sufficient_assumptions_for_infeasibility:int32 list ->
  ?integer_objective:cp_objective_proto ->
  ?inner_objective_lower_bound:int64 ->
  ?num_integers:int64 ->
  ?num_booleans:int64 ->
  ?num_fixed_booleans:int64 ->
  ?num_conflicts:int64 ->
  ?num_branches:int64 ->
  ?num_binary_propagations:int64 ->
  ?num_integer_propagations:int64 ->
  ?num_restarts:int64 ->
  ?num_lp_iterations:int64 ->
  ?wall_time:float ->
  ?user_time:float ->
  ?deterministic_time:float ->
  ?gap_integral:float ->
  ?solution_info:string ->
  ?solve_log:string ->
  unit ->
  cp_solver_response
(** [make_cp_solver_response … ()] is a builder for type [cp_solver_response] *)

val copy_cp_solver_response : cp_solver_response -> cp_solver_response

val cp_solver_response_has_status : cp_solver_response -> bool
  (** presence of field "status" in [cp_solver_response] *)

val cp_solver_response_set_status : cp_solver_response -> cp_solver_status -> unit
  (** set field status in cp_solver_response *)

val cp_solver_response_set_solution : cp_solver_response -> int64 list -> unit
  (** set field solution in cp_solver_response *)

val cp_solver_response_has_objective_value : cp_solver_response -> bool
  (** presence of field "objective_value" in [cp_solver_response] *)

val cp_solver_response_set_objective_value : cp_solver_response -> float -> unit
  (** set field objective_value in cp_solver_response *)

val cp_solver_response_has_best_objective_bound : cp_solver_response -> bool
  (** presence of field "best_objective_bound" in [cp_solver_response] *)

val cp_solver_response_set_best_objective_bound : cp_solver_response -> float -> unit
  (** set field best_objective_bound in cp_solver_response *)

val cp_solver_response_set_additional_solutions : cp_solver_response -> cp_solver_solution list -> unit
  (** set field additional_solutions in cp_solver_response *)

val cp_solver_response_set_tightened_variables : cp_solver_response -> integer_variable_proto list -> unit
  (** set field tightened_variables in cp_solver_response *)

val cp_solver_response_set_sufficient_assumptions_for_infeasibility : cp_solver_response -> int32 list -> unit
  (** set field sufficient_assumptions_for_infeasibility in cp_solver_response *)

val cp_solver_response_set_integer_objective : cp_solver_response -> cp_objective_proto -> unit
  (** set field integer_objective in cp_solver_response *)

val cp_solver_response_has_inner_objective_lower_bound : cp_solver_response -> bool
  (** presence of field "inner_objective_lower_bound" in [cp_solver_response] *)

val cp_solver_response_set_inner_objective_lower_bound : cp_solver_response -> int64 -> unit
  (** set field inner_objective_lower_bound in cp_solver_response *)

val cp_solver_response_has_num_integers : cp_solver_response -> bool
  (** presence of field "num_integers" in [cp_solver_response] *)

val cp_solver_response_set_num_integers : cp_solver_response -> int64 -> unit
  (** set field num_integers in cp_solver_response *)

val cp_solver_response_has_num_booleans : cp_solver_response -> bool
  (** presence of field "num_booleans" in [cp_solver_response] *)

val cp_solver_response_set_num_booleans : cp_solver_response -> int64 -> unit
  (** set field num_booleans in cp_solver_response *)

val cp_solver_response_has_num_fixed_booleans : cp_solver_response -> bool
  (** presence of field "num_fixed_booleans" in [cp_solver_response] *)

val cp_solver_response_set_num_fixed_booleans : cp_solver_response -> int64 -> unit
  (** set field num_fixed_booleans in cp_solver_response *)

val cp_solver_response_has_num_conflicts : cp_solver_response -> bool
  (** presence of field "num_conflicts" in [cp_solver_response] *)

val cp_solver_response_set_num_conflicts : cp_solver_response -> int64 -> unit
  (** set field num_conflicts in cp_solver_response *)

val cp_solver_response_has_num_branches : cp_solver_response -> bool
  (** presence of field "num_branches" in [cp_solver_response] *)

val cp_solver_response_set_num_branches : cp_solver_response -> int64 -> unit
  (** set field num_branches in cp_solver_response *)

val cp_solver_response_has_num_binary_propagations : cp_solver_response -> bool
  (** presence of field "num_binary_propagations" in [cp_solver_response] *)

val cp_solver_response_set_num_binary_propagations : cp_solver_response -> int64 -> unit
  (** set field num_binary_propagations in cp_solver_response *)

val cp_solver_response_has_num_integer_propagations : cp_solver_response -> bool
  (** presence of field "num_integer_propagations" in [cp_solver_response] *)

val cp_solver_response_set_num_integer_propagations : cp_solver_response -> int64 -> unit
  (** set field num_integer_propagations in cp_solver_response *)

val cp_solver_response_has_num_restarts : cp_solver_response -> bool
  (** presence of field "num_restarts" in [cp_solver_response] *)

val cp_solver_response_set_num_restarts : cp_solver_response -> int64 -> unit
  (** set field num_restarts in cp_solver_response *)

val cp_solver_response_has_num_lp_iterations : cp_solver_response -> bool
  (** presence of field "num_lp_iterations" in [cp_solver_response] *)

val cp_solver_response_set_num_lp_iterations : cp_solver_response -> int64 -> unit
  (** set field num_lp_iterations in cp_solver_response *)

val cp_solver_response_has_wall_time : cp_solver_response -> bool
  (** presence of field "wall_time" in [cp_solver_response] *)

val cp_solver_response_set_wall_time : cp_solver_response -> float -> unit
  (** set field wall_time in cp_solver_response *)

val cp_solver_response_has_user_time : cp_solver_response -> bool
  (** presence of field "user_time" in [cp_solver_response] *)

val cp_solver_response_set_user_time : cp_solver_response -> float -> unit
  (** set field user_time in cp_solver_response *)

val cp_solver_response_has_deterministic_time : cp_solver_response -> bool
  (** presence of field "deterministic_time" in [cp_solver_response] *)

val cp_solver_response_set_deterministic_time : cp_solver_response -> float -> unit
  (** set field deterministic_time in cp_solver_response *)

val cp_solver_response_has_gap_integral : cp_solver_response -> bool
  (** presence of field "gap_integral" in [cp_solver_response] *)

val cp_solver_response_set_gap_integral : cp_solver_response -> float -> unit
  (** set field gap_integral in cp_solver_response *)

val cp_solver_response_has_solution_info : cp_solver_response -> bool
  (** presence of field "solution_info" in [cp_solver_response] *)

val cp_solver_response_set_solution_info : cp_solver_response -> string -> unit
  (** set field solution_info in cp_solver_response *)

val cp_solver_response_has_solve_log : cp_solver_response -> bool
  (** presence of field "solve_log" in [cp_solver_response] *)

val cp_solver_response_set_solve_log : cp_solver_response -> string -> unit
  (** set field solve_log in cp_solver_response *)


(** {2 Formatters} *)

val pp_integer_variable_proto : Format.formatter -> integer_variable_proto -> unit 
(** [pp_integer_variable_proto v] formats v *)

val pp_bool_argument_proto : Format.formatter -> bool_argument_proto -> unit 
(** [pp_bool_argument_proto v] formats v *)

val pp_linear_expression_proto : Format.formatter -> linear_expression_proto -> unit 
(** [pp_linear_expression_proto v] formats v *)

val pp_linear_argument_proto : Format.formatter -> linear_argument_proto -> unit 
(** [pp_linear_argument_proto v] formats v *)

val pp_all_different_constraint_proto : Format.formatter -> all_different_constraint_proto -> unit 
(** [pp_all_different_constraint_proto v] formats v *)

val pp_linear_constraint_proto : Format.formatter -> linear_constraint_proto -> unit 
(** [pp_linear_constraint_proto v] formats v *)

val pp_element_constraint_proto : Format.formatter -> element_constraint_proto -> unit 
(** [pp_element_constraint_proto v] formats v *)

val pp_interval_constraint_proto : Format.formatter -> interval_constraint_proto -> unit 
(** [pp_interval_constraint_proto v] formats v *)

val pp_no_overlap_constraint_proto : Format.formatter -> no_overlap_constraint_proto -> unit 
(** [pp_no_overlap_constraint_proto v] formats v *)

val pp_no_overlap2_dconstraint_proto : Format.formatter -> no_overlap2_dconstraint_proto -> unit 
(** [pp_no_overlap2_dconstraint_proto v] formats v *)

val pp_cumulative_constraint_proto : Format.formatter -> cumulative_constraint_proto -> unit 
(** [pp_cumulative_constraint_proto v] formats v *)

val pp_reservoir_constraint_proto : Format.formatter -> reservoir_constraint_proto -> unit 
(** [pp_reservoir_constraint_proto v] formats v *)

val pp_circuit_constraint_proto : Format.formatter -> circuit_constraint_proto -> unit 
(** [pp_circuit_constraint_proto v] formats v *)

val pp_routes_constraint_proto : Format.formatter -> routes_constraint_proto -> unit 
(** [pp_routes_constraint_proto v] formats v *)

val pp_table_constraint_proto : Format.formatter -> table_constraint_proto -> unit 
(** [pp_table_constraint_proto v] formats v *)

val pp_inverse_constraint_proto : Format.formatter -> inverse_constraint_proto -> unit 
(** [pp_inverse_constraint_proto v] formats v *)

val pp_automaton_constraint_proto : Format.formatter -> automaton_constraint_proto -> unit 
(** [pp_automaton_constraint_proto v] formats v *)

val pp_list_of_variables_proto : Format.formatter -> list_of_variables_proto -> unit 
(** [pp_list_of_variables_proto v] formats v *)

val pp_constraint_proto_constraint : Format.formatter -> constraint_proto_constraint -> unit 
(** [pp_constraint_proto_constraint v] formats v *)

val pp_constraint_proto : Format.formatter -> constraint_proto -> unit 
(** [pp_constraint_proto v] formats v *)

val pp_cp_objective_proto : Format.formatter -> cp_objective_proto -> unit 
(** [pp_cp_objective_proto v] formats v *)

val pp_float_objective_proto : Format.formatter -> float_objective_proto -> unit 
(** [pp_float_objective_proto v] formats v *)

val pp_decision_strategy_proto_variable_selection_strategy : Format.formatter -> decision_strategy_proto_variable_selection_strategy -> unit 
(** [pp_decision_strategy_proto_variable_selection_strategy v] formats v *)

val pp_decision_strategy_proto_domain_reduction_strategy : Format.formatter -> decision_strategy_proto_domain_reduction_strategy -> unit 
(** [pp_decision_strategy_proto_domain_reduction_strategy v] formats v *)

val pp_decision_strategy_proto : Format.formatter -> decision_strategy_proto -> unit 
(** [pp_decision_strategy_proto v] formats v *)

val pp_partial_variable_assignment : Format.formatter -> partial_variable_assignment -> unit 
(** [pp_partial_variable_assignment v] formats v *)

val pp_sparse_permutation_proto : Format.formatter -> sparse_permutation_proto -> unit 
(** [pp_sparse_permutation_proto v] formats v *)

val pp_dense_matrix_proto : Format.formatter -> dense_matrix_proto -> unit 
(** [pp_dense_matrix_proto v] formats v *)

val pp_symmetry_proto : Format.formatter -> symmetry_proto -> unit 
(** [pp_symmetry_proto v] formats v *)

val pp_cp_model_proto : Format.formatter -> cp_model_proto -> unit 
(** [pp_cp_model_proto v] formats v *)

val pp_cp_solver_status : Format.formatter -> cp_solver_status -> unit 
(** [pp_cp_solver_status v] formats v *)

val pp_cp_solver_solution : Format.formatter -> cp_solver_solution -> unit 
(** [pp_cp_solver_solution v] formats v *)

val pp_cp_solver_response : Format.formatter -> cp_solver_response -> unit 
(** [pp_cp_solver_response v] formats v *)


(** {2 Protobuf Encoding} *)

val encode_pb_integer_variable_proto : integer_variable_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_integer_variable_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_bool_argument_proto : bool_argument_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_bool_argument_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_linear_expression_proto : linear_expression_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_linear_expression_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_linear_argument_proto : linear_argument_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_linear_argument_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_all_different_constraint_proto : all_different_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_all_different_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_linear_constraint_proto : linear_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_linear_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_element_constraint_proto : element_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_element_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_interval_constraint_proto : interval_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_interval_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_no_overlap_constraint_proto : no_overlap_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_no_overlap_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_no_overlap2_dconstraint_proto : no_overlap2_dconstraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_no_overlap2_dconstraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_cumulative_constraint_proto : cumulative_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_cumulative_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_reservoir_constraint_proto : reservoir_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_reservoir_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_circuit_constraint_proto : circuit_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_circuit_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_routes_constraint_proto : routes_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_routes_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_table_constraint_proto : table_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_table_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_inverse_constraint_proto : inverse_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_inverse_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_automaton_constraint_proto : automaton_constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_automaton_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_list_of_variables_proto : list_of_variables_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_list_of_variables_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_constraint_proto_constraint : constraint_proto_constraint -> Pbrt.Encoder.t -> unit
(** [encode_pb_constraint_proto_constraint v encoder] encodes [v] with the given [encoder] *)

val encode_pb_constraint_proto : constraint_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_constraint_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_cp_objective_proto : cp_objective_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_cp_objective_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_float_objective_proto : float_objective_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_float_objective_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_decision_strategy_proto_variable_selection_strategy : decision_strategy_proto_variable_selection_strategy -> Pbrt.Encoder.t -> unit
(** [encode_pb_decision_strategy_proto_variable_selection_strategy v encoder] encodes [v] with the given [encoder] *)

val encode_pb_decision_strategy_proto_domain_reduction_strategy : decision_strategy_proto_domain_reduction_strategy -> Pbrt.Encoder.t -> unit
(** [encode_pb_decision_strategy_proto_domain_reduction_strategy v encoder] encodes [v] with the given [encoder] *)

val encode_pb_decision_strategy_proto : decision_strategy_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_decision_strategy_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_partial_variable_assignment : partial_variable_assignment -> Pbrt.Encoder.t -> unit
(** [encode_pb_partial_variable_assignment v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sparse_permutation_proto : sparse_permutation_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_sparse_permutation_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_dense_matrix_proto : dense_matrix_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_dense_matrix_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_symmetry_proto : symmetry_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_symmetry_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_cp_model_proto : cp_model_proto -> Pbrt.Encoder.t -> unit
(** [encode_pb_cp_model_proto v encoder] encodes [v] with the given [encoder] *)

val encode_pb_cp_solver_status : cp_solver_status -> Pbrt.Encoder.t -> unit
(** [encode_pb_cp_solver_status v encoder] encodes [v] with the given [encoder] *)

val encode_pb_cp_solver_solution : cp_solver_solution -> Pbrt.Encoder.t -> unit
(** [encode_pb_cp_solver_solution v encoder] encodes [v] with the given [encoder] *)

val encode_pb_cp_solver_response : cp_solver_response -> Pbrt.Encoder.t -> unit
(** [encode_pb_cp_solver_response v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_pb_integer_variable_proto : Pbrt.Decoder.t -> integer_variable_proto
(** [decode_pb_integer_variable_proto decoder] decodes a [integer_variable_proto] binary value from [decoder] *)

val decode_pb_bool_argument_proto : Pbrt.Decoder.t -> bool_argument_proto
(** [decode_pb_bool_argument_proto decoder] decodes a [bool_argument_proto] binary value from [decoder] *)

val decode_pb_linear_expression_proto : Pbrt.Decoder.t -> linear_expression_proto
(** [decode_pb_linear_expression_proto decoder] decodes a [linear_expression_proto] binary value from [decoder] *)

val decode_pb_linear_argument_proto : Pbrt.Decoder.t -> linear_argument_proto
(** [decode_pb_linear_argument_proto decoder] decodes a [linear_argument_proto] binary value from [decoder] *)

val decode_pb_all_different_constraint_proto : Pbrt.Decoder.t -> all_different_constraint_proto
(** [decode_pb_all_different_constraint_proto decoder] decodes a [all_different_constraint_proto] binary value from [decoder] *)

val decode_pb_linear_constraint_proto : Pbrt.Decoder.t -> linear_constraint_proto
(** [decode_pb_linear_constraint_proto decoder] decodes a [linear_constraint_proto] binary value from [decoder] *)

val decode_pb_element_constraint_proto : Pbrt.Decoder.t -> element_constraint_proto
(** [decode_pb_element_constraint_proto decoder] decodes a [element_constraint_proto] binary value from [decoder] *)

val decode_pb_interval_constraint_proto : Pbrt.Decoder.t -> interval_constraint_proto
(** [decode_pb_interval_constraint_proto decoder] decodes a [interval_constraint_proto] binary value from [decoder] *)

val decode_pb_no_overlap_constraint_proto : Pbrt.Decoder.t -> no_overlap_constraint_proto
(** [decode_pb_no_overlap_constraint_proto decoder] decodes a [no_overlap_constraint_proto] binary value from [decoder] *)

val decode_pb_no_overlap2_dconstraint_proto : Pbrt.Decoder.t -> no_overlap2_dconstraint_proto
(** [decode_pb_no_overlap2_dconstraint_proto decoder] decodes a [no_overlap2_dconstraint_proto] binary value from [decoder] *)

val decode_pb_cumulative_constraint_proto : Pbrt.Decoder.t -> cumulative_constraint_proto
(** [decode_pb_cumulative_constraint_proto decoder] decodes a [cumulative_constraint_proto] binary value from [decoder] *)

val decode_pb_reservoir_constraint_proto : Pbrt.Decoder.t -> reservoir_constraint_proto
(** [decode_pb_reservoir_constraint_proto decoder] decodes a [reservoir_constraint_proto] binary value from [decoder] *)

val decode_pb_circuit_constraint_proto : Pbrt.Decoder.t -> circuit_constraint_proto
(** [decode_pb_circuit_constraint_proto decoder] decodes a [circuit_constraint_proto] binary value from [decoder] *)

val decode_pb_routes_constraint_proto : Pbrt.Decoder.t -> routes_constraint_proto
(** [decode_pb_routes_constraint_proto decoder] decodes a [routes_constraint_proto] binary value from [decoder] *)

val decode_pb_table_constraint_proto : Pbrt.Decoder.t -> table_constraint_proto
(** [decode_pb_table_constraint_proto decoder] decodes a [table_constraint_proto] binary value from [decoder] *)

val decode_pb_inverse_constraint_proto : Pbrt.Decoder.t -> inverse_constraint_proto
(** [decode_pb_inverse_constraint_proto decoder] decodes a [inverse_constraint_proto] binary value from [decoder] *)

val decode_pb_automaton_constraint_proto : Pbrt.Decoder.t -> automaton_constraint_proto
(** [decode_pb_automaton_constraint_proto decoder] decodes a [automaton_constraint_proto] binary value from [decoder] *)

val decode_pb_list_of_variables_proto : Pbrt.Decoder.t -> list_of_variables_proto
(** [decode_pb_list_of_variables_proto decoder] decodes a [list_of_variables_proto] binary value from [decoder] *)

val decode_pb_constraint_proto_constraint : Pbrt.Decoder.t -> constraint_proto_constraint
(** [decode_pb_constraint_proto_constraint decoder] decodes a [constraint_proto_constraint] binary value from [decoder] *)

val decode_pb_constraint_proto : Pbrt.Decoder.t -> constraint_proto
(** [decode_pb_constraint_proto decoder] decodes a [constraint_proto] binary value from [decoder] *)

val decode_pb_cp_objective_proto : Pbrt.Decoder.t -> cp_objective_proto
(** [decode_pb_cp_objective_proto decoder] decodes a [cp_objective_proto] binary value from [decoder] *)

val decode_pb_float_objective_proto : Pbrt.Decoder.t -> float_objective_proto
(** [decode_pb_float_objective_proto decoder] decodes a [float_objective_proto] binary value from [decoder] *)

val decode_pb_decision_strategy_proto_variable_selection_strategy : Pbrt.Decoder.t -> decision_strategy_proto_variable_selection_strategy
(** [decode_pb_decision_strategy_proto_variable_selection_strategy decoder] decodes a [decision_strategy_proto_variable_selection_strategy] binary value from [decoder] *)

val decode_pb_decision_strategy_proto_domain_reduction_strategy : Pbrt.Decoder.t -> decision_strategy_proto_domain_reduction_strategy
(** [decode_pb_decision_strategy_proto_domain_reduction_strategy decoder] decodes a [decision_strategy_proto_domain_reduction_strategy] binary value from [decoder] *)

val decode_pb_decision_strategy_proto : Pbrt.Decoder.t -> decision_strategy_proto
(** [decode_pb_decision_strategy_proto decoder] decodes a [decision_strategy_proto] binary value from [decoder] *)

val decode_pb_partial_variable_assignment : Pbrt.Decoder.t -> partial_variable_assignment
(** [decode_pb_partial_variable_assignment decoder] decodes a [partial_variable_assignment] binary value from [decoder] *)

val decode_pb_sparse_permutation_proto : Pbrt.Decoder.t -> sparse_permutation_proto
(** [decode_pb_sparse_permutation_proto decoder] decodes a [sparse_permutation_proto] binary value from [decoder] *)

val decode_pb_dense_matrix_proto : Pbrt.Decoder.t -> dense_matrix_proto
(** [decode_pb_dense_matrix_proto decoder] decodes a [dense_matrix_proto] binary value from [decoder] *)

val decode_pb_symmetry_proto : Pbrt.Decoder.t -> symmetry_proto
(** [decode_pb_symmetry_proto decoder] decodes a [symmetry_proto] binary value from [decoder] *)

val decode_pb_cp_model_proto : Pbrt.Decoder.t -> cp_model_proto
(** [decode_pb_cp_model_proto decoder] decodes a [cp_model_proto] binary value from [decoder] *)

val decode_pb_cp_solver_status : Pbrt.Decoder.t -> cp_solver_status
(** [decode_pb_cp_solver_status decoder] decodes a [cp_solver_status] binary value from [decoder] *)

val decode_pb_cp_solver_solution : Pbrt.Decoder.t -> cp_solver_solution
(** [decode_pb_cp_solver_solution decoder] decodes a [cp_solver_solution] binary value from [decoder] *)

val decode_pb_cp_solver_response : Pbrt.Decoder.t -> cp_solver_response
(** [decode_pb_cp_solver_response decoder] decodes a [cp_solver_response] binary value from [decoder] *)
