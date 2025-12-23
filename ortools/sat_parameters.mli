
(** Code for sat_parameters.proto *)

(* generated from "ortools/sat/sat_parameters.proto", do not edit *)



(** {2 Types} *)

type sat_parameters_variable_order =
  | In_order 
  | In_reverse_order 
  | In_random_order 

type sat_parameters_polarity =
  | Polarity_true 
  | Polarity_false 
  | Polarity_random 

type sat_parameters_conflict_minimization_algorithm =
  | None 
  | Simple 
  | Recursive 
  | Experimental 

type sat_parameters_binary_minization_algorithm =
  | No_binary_minimization 
  | Binary_minimization_first 
  | Binary_minimization_first_with_transitive_reduction 
  | Binary_minimization_with_reachability 
  | Experimental_binary_minimization 

type sat_parameters_clause_protection =
  | Protection_none 
  | Protection_always 
  | Protection_lbd 

type sat_parameters_clause_ordering =
  | Clause_activity 
  | Clause_lbd 

type sat_parameters_restart_algorithm =
  | No_restart 
  | Luby_restart 
  | Dl_moving_average_restart 
  | Lbd_moving_average_restart 
  | Fixed_restart 

type sat_parameters_max_sat_assumption_order =
  | Default_assumption_order 
  | Order_assumption_by_depth 
  | Order_assumption_by_weight 

type sat_parameters_max_sat_stratification_algorithm =
  | Stratification_none 
  | Stratification_descent 
  | Stratification_ascent 

type sat_parameters_search_branching =
  | Automatic_search 
  | Fixed_search 
  | Portfolio_search 
  | Lp_search 
  | Pseudo_cost_search 
  | Portfolio_with_quick_restart_search 
  | Hint_search 
  | Partial_fixed_search 
  | Randomized_search 

type sat_parameters_shared_tree_split_strategy =
  | Split_strategy_auto 
  | Split_strategy_discrepancy 
  | Split_strategy_objective_lb 
  | Split_strategy_balanced_tree 
  | Split_strategy_first_proposal 

type sat_parameters_fprounding_method =
  | Nearest_integer 
  | Lock_based 
  | Active_lock_based 
  | Propagation_assisted 

type sat_parameters = private {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 62 fields *)
  mutable name : string;
  mutable preferred_variable_order : sat_parameters_variable_order;
  mutable initial_polarity : sat_parameters_polarity;
  mutable use_phase_saving : bool;
  mutable polarity_rephase_increment : int32;
  mutable polarity_exploit_ls_hints : bool;
  mutable random_polarity_ratio : float;
  mutable random_branches_ratio : float;
  mutable use_erwa_heuristic : bool;
  mutable initial_variables_activity : float;
  mutable also_bump_variables_in_conflict_reasons : bool;
  mutable minimization_algorithm : sat_parameters_conflict_minimization_algorithm;
  mutable binary_minimization_algorithm : sat_parameters_binary_minization_algorithm;
  mutable subsumption_during_conflict_analysis : bool;
  mutable clause_cleanup_period : int32;
  mutable clause_cleanup_target : int32;
  mutable clause_cleanup_ratio : float;
  mutable clause_cleanup_protection : sat_parameters_clause_protection;
  mutable clause_cleanup_lbd_bound : int32;
  mutable clause_cleanup_ordering : sat_parameters_clause_ordering;
  mutable pb_cleanup_increment : int32;
  mutable pb_cleanup_ratio : float;
  mutable variable_activity_decay : float;
  mutable max_variable_activity_value : float;
  mutable glucose_max_decay : float;
  mutable glucose_decay_increment : float;
  mutable glucose_decay_increment_period : int32;
  mutable clause_activity_decay : float;
  mutable max_clause_activity_value : float;
  mutable restart_algorithms : sat_parameters_restart_algorithm list;
  mutable default_restart_algorithms : string;
  mutable restart_period : int32;
  mutable restart_running_window_size : int32;
  mutable restart_dl_average_ratio : float;
  mutable restart_lbd_average_ratio : float;
  mutable use_blocking_restart : bool;
  mutable blocking_restart_window_size : int32;
  mutable blocking_restart_multiplier : float;
  mutable num_conflicts_before_strategy_changes : int32;
  mutable strategy_change_increase_ratio : float;
  mutable max_time_in_seconds : float;
  mutable max_deterministic_time : float;
  mutable max_num_deterministic_batches : int32;
  mutable max_number_of_conflicts : int64;
  mutable max_memory_in_mb : int64;
  mutable absolute_gap_limit : float;
  mutable relative_gap_limit : float;
  mutable random_seed : int32;
  mutable permute_variable_randomly : bool;
  mutable permute_presolve_constraint_order : bool;
  mutable use_absl_random : bool;
  mutable log_search_progress : bool;
  mutable log_subsolver_statistics : bool;
  mutable log_prefix : string;
  mutable log_to_stdout : bool;
  mutable log_to_response : bool;
  mutable use_pb_resolution : bool;
  mutable minimize_reduction_during_pb_resolution : bool;
  mutable count_assumption_levels_in_lbd : bool;
  mutable presolve_bve_threshold : int32;
  mutable presolve_bve_clause_weight : int32;
  mutable probing_deterministic_time_limit : float;
  mutable presolve_probing_deterministic_time_limit : float;
  mutable presolve_blocked_clause : bool option;
  mutable presolve_use_bva : bool option;
  mutable presolve_bva_threshold : int32 option;
  mutable max_presolve_iterations : int32 option;
  mutable cp_model_presolve : bool option;
  mutable cp_model_probing_level : int32 option;
  mutable cp_model_use_sat_presolve : bool option;
  mutable remove_fixed_variables_early : bool option;
  mutable detect_table_with_cost : bool option;
  mutable table_compression_level : int32 option;
  mutable expand_alldiff_constraints : bool option;
  mutable expand_reservoir_constraints : bool option;
  mutable expand_reservoir_using_circuit : bool option;
  mutable encode_cumulative_as_reservoir : bool option;
  mutable max_lin_max_size_for_expansion : int32 option;
  mutable disable_constraint_expansion : bool option;
  mutable encode_complex_linear_constraint_with_integer : bool option;
  mutable merge_no_overlap_work_limit : float option;
  mutable merge_at_most_one_work_limit : float option;
  mutable presolve_substitution_level : int32 option;
  mutable presolve_extract_integer_enforcement : bool option;
  mutable presolve_inclusion_work_limit : int64 option;
  mutable ignore_names : bool option;
  mutable infer_all_diffs : bool option;
  mutable find_big_linear_overlap : bool option;
  mutable use_sat_inprocessing : bool option;
  mutable inprocessing_dtime_ratio : float option;
  mutable inprocessing_probing_dtime : float option;
  mutable inprocessing_minimization_dtime : float option;
  mutable inprocessing_minimization_use_conflict_analysis : bool option;
  mutable inprocessing_minimization_use_all_orderings : bool option;
  mutable num_workers : int32 option;
  mutable num_search_workers : int32 option;
  mutable num_full_subsolvers : int32 option;
  mutable subsolvers : string list;
  mutable extra_subsolvers : string list;
  mutable ignore_subsolvers : string list;
  mutable filter_subsolvers : string list;
  mutable subsolver_params : sat_parameters list;
  mutable interleave_search : bool option;
  mutable interleave_batch_size : int32 option;
  mutable share_objective_bounds : bool option;
  mutable share_level_zero_bounds : bool option;
  mutable share_binary_clauses : bool option;
  mutable share_glue_clauses : bool option;
  mutable minimize_shared_clauses : bool option;
  mutable debug_postsolve_with_full_solver : bool option;
  mutable debug_max_num_presolve_operations : int32 option;
  mutable debug_crash_on_bad_hint : bool option;
  mutable debug_crash_if_presolve_breaks_hint : bool option;
  mutable use_optimization_hints : bool option;
  mutable core_minimization_level : int32 option;
  mutable find_multiple_cores : bool option;
  mutable cover_optimization : bool option;
  mutable max_sat_assumption_order : sat_parameters_max_sat_assumption_order option;
  mutable max_sat_reverse_assumption_order : bool option;
  mutable max_sat_stratification : sat_parameters_max_sat_stratification_algorithm option;
  mutable propagation_loop_detection_factor : float option;
  mutable use_precedences_in_disjunctive_constraint : bool option;
  mutable max_size_to_create_precedence_literals_in_disjunctive : int32 option;
  mutable use_strong_propagation_in_disjunctive : bool option;
  mutable use_dynamic_precedence_in_disjunctive : bool option;
  mutable use_dynamic_precedence_in_cumulative : bool option;
  mutable use_overload_checker_in_cumulative : bool option;
  mutable use_conservative_scale_overload_checker : bool option;
  mutable use_timetable_edge_finding_in_cumulative : bool option;
  mutable max_num_intervals_for_timetable_edge_finding : int32 option;
  mutable use_hard_precedences_in_cumulative : bool option;
  mutable exploit_all_precedences : bool option;
  mutable use_disjunctive_constraint_in_cumulative : bool option;
  mutable use_timetabling_in_no_overlap_2d : bool option;
  mutable use_energetic_reasoning_in_no_overlap_2d : bool option;
  mutable use_area_energetic_reasoning_in_no_overlap_2d : bool option;
  mutable use_try_edge_reasoning_in_no_overlap_2d : bool option;
  mutable max_pairs_pairwise_reasoning_in_no_overlap_2d : int32 option;
  mutable maximum_regions_to_split_in_disconnected_no_overlap_2d : int32 option;
  mutable use_dual_scheduling_heuristics : bool option;
  mutable use_all_different_for_circuit : bool option;
  mutable routing_cut_subset_size_for_binary_relation_bound : int32 option;
  mutable routing_cut_subset_size_for_tight_binary_relation_bound : int32 option;
  mutable routing_cut_dp_effort : float option;
  mutable search_branching : sat_parameters_search_branching option;
  mutable hint_conflict_limit : int32 option;
  mutable repair_hint : bool option;
  mutable fix_variables_to_their_hinted_value : bool option;
  mutable use_probing_search : bool option;
  mutable use_extended_probing : bool option;
  mutable probing_num_combinations_limit : int32 option;
  mutable use_shaving_in_probing_search : bool option;
  mutable shaving_search_deterministic_time : float option;
  mutable shaving_search_threshold : int64 option;
  mutable use_objective_lb_search : bool option;
  mutable use_objective_shaving_search : bool option;
  mutable use_variables_shaving_search : bool option;
  mutable pseudo_cost_reliability_threshold : int64 option;
  mutable optimize_with_core : bool option;
  mutable optimize_with_lb_tree_search : bool option;
  mutable save_lp_basis_in_lb_tree_search : bool option;
  mutable binary_search_num_conflicts : int32 option;
  mutable optimize_with_max_hs : bool option;
  mutable use_feasibility_jump : bool option;
  mutable use_ls_only : bool option;
  mutable feasibility_jump_decay : float option;
  mutable feasibility_jump_linearization_level : int32 option;
  mutable feasibility_jump_restart_factor : int32 option;
  mutable feasibility_jump_batch_dtime : float option;
  mutable feasibility_jump_var_randomization_probability : float option;
  mutable feasibility_jump_var_perburbation_range_ratio : float option;
  mutable feasibility_jump_enable_restarts : bool option;
  mutable feasibility_jump_max_expanded_constraint_size : int32 option;
  mutable num_violation_ls : int32 option;
  mutable violation_ls_perturbation_period : int32 option;
  mutable violation_ls_compound_move_probability : float option;
  mutable shared_tree_num_workers : int32 option;
  mutable use_shared_tree_search : bool option;
  mutable shared_tree_worker_min_restarts_per_subtree : int32 option;
  mutable shared_tree_worker_enable_trail_sharing : bool option;
  mutable shared_tree_worker_enable_phase_sharing : bool option;
  mutable shared_tree_open_leaves_per_worker : float option;
  mutable shared_tree_max_nodes_per_worker : int32 option;
  mutable shared_tree_split_strategy : sat_parameters_shared_tree_split_strategy option;
  mutable shared_tree_balance_tolerance : int32 option;
  mutable enumerate_all_solutions : bool option;
  mutable keep_all_feasible_solutions_in_presolve : bool option;
  mutable fill_tightened_domains_in_response : bool option;
  mutable fill_additional_solutions_in_response : bool option;
  mutable instantiate_all_variables : bool option;
  mutable auto_detect_greater_than_at_least_one_of : bool option;
  mutable stop_after_first_solution : bool option;
  mutable stop_after_presolve : bool option;
  mutable stop_after_root_propagation : bool option;
  mutable lns_initial_difficulty : float option;
  mutable lns_initial_deterministic_limit : float option;
  mutable use_lns : bool option;
  mutable use_lns_only : bool option;
  mutable solution_pool_size : int32 option;
  mutable use_rins_lns : bool option;
  mutable use_feasibility_pump : bool option;
  mutable use_lb_relax_lns : bool option;
  mutable lb_relax_num_workers_threshold : int32 option;
  mutable fp_rounding : sat_parameters_fprounding_method option;
  mutable diversify_lns_params : bool option;
  mutable randomize_search : bool option;
  mutable search_random_variable_pool_size : int64 option;
  mutable push_all_tasks_toward_start : bool option;
  mutable use_optional_variables : bool option;
  mutable use_exact_lp_reason : bool option;
  mutable use_combined_no_overlap : bool option;
  mutable at_most_one_max_expansion_size : int32 option;
  mutable catch_sigint_signal : bool option;
  mutable use_implied_bounds : bool option;
  mutable polish_lp_solution : bool option;
  mutable lp_primal_tolerance : float option;
  mutable lp_dual_tolerance : float option;
  mutable convert_intervals : bool option;
  mutable symmetry_level : int32 option;
  mutable use_symmetry_in_lp : bool option;
  mutable keep_symmetry_in_presolve : bool option;
  mutable symmetry_detection_deterministic_time_limit : float option;
  mutable new_linear_propagation : bool option;
  mutable linear_split_size : int32 option;
  mutable linearization_level : int32 option;
  mutable boolean_encoding_level : int32 option;
  mutable max_domain_size_when_encoding_eq_neq_constraints : int32 option;
  mutable max_num_cuts : int32 option;
  mutable cut_level : int32 option;
  mutable only_add_cuts_at_level_zero : bool option;
  mutable add_objective_cut : bool option;
  mutable add_cg_cuts : bool option;
  mutable add_mir_cuts : bool option;
  mutable add_zero_half_cuts : bool option;
  mutable add_clique_cuts : bool option;
  mutable add_rlt_cuts : bool option;
  mutable max_all_diff_cut_size : int32 option;
  mutable add_lin_max_cuts : bool option;
  mutable max_integer_rounding_scaling : int32 option;
  mutable add_lp_constraints_lazily : bool option;
  mutable root_lp_iterations : int32 option;
  mutable min_orthogonality_for_lp_constraints : float option;
  mutable max_cut_rounds_at_level_zero : int32 option;
  mutable max_consecutive_inactive_count : int32 option;
  mutable cut_max_active_count_value : float option;
  mutable cut_active_count_decay : float option;
  mutable cut_cleanup_target : int32 option;
  mutable new_constraints_batch_size : int32 option;
  mutable exploit_integer_lp_solution : bool option;
  mutable exploit_all_lp_solution : bool option;
  mutable exploit_best_solution : bool option;
  mutable exploit_relaxation_solution : bool option;
  mutable exploit_objective : bool option;
  mutable detect_linearized_product : bool option;
  mutable mip_max_bound : float option;
  mutable mip_var_scaling : float option;
  mutable mip_scale_large_domain : bool option;
  mutable mip_automatically_scale_variables : bool option;
  mutable only_solve_ip : bool option;
  mutable mip_wanted_precision : float option;
  mutable mip_max_activity_exponent : int32 option;
  mutable mip_check_precision : float option;
  mutable mip_compute_true_objective_bound : bool option;
  mutable mip_max_valid_magnitude : float option;
  mutable mip_treat_high_magnitude_bounds_as_infinity : bool option;
  mutable mip_drop_tolerance : float option;
  mutable mip_presolve_level : int32 option;
}


(** {2 Basic values} *)

val default_sat_parameters_variable_order : unit -> sat_parameters_variable_order
(** [default_sat_parameters_variable_order ()] is a new empty value for type [sat_parameters_variable_order] *)

val default_sat_parameters_polarity : unit -> sat_parameters_polarity
(** [default_sat_parameters_polarity ()] is a new empty value for type [sat_parameters_polarity] *)

val default_sat_parameters_conflict_minimization_algorithm : unit -> sat_parameters_conflict_minimization_algorithm
(** [default_sat_parameters_conflict_minimization_algorithm ()] is a new empty value for type [sat_parameters_conflict_minimization_algorithm] *)

val default_sat_parameters_binary_minization_algorithm : unit -> sat_parameters_binary_minization_algorithm
(** [default_sat_parameters_binary_minization_algorithm ()] is a new empty value for type [sat_parameters_binary_minization_algorithm] *)

val default_sat_parameters_clause_protection : unit -> sat_parameters_clause_protection
(** [default_sat_parameters_clause_protection ()] is a new empty value for type [sat_parameters_clause_protection] *)

val default_sat_parameters_clause_ordering : unit -> sat_parameters_clause_ordering
(** [default_sat_parameters_clause_ordering ()] is a new empty value for type [sat_parameters_clause_ordering] *)

val default_sat_parameters_restart_algorithm : unit -> sat_parameters_restart_algorithm
(** [default_sat_parameters_restart_algorithm ()] is a new empty value for type [sat_parameters_restart_algorithm] *)

val default_sat_parameters_max_sat_assumption_order : unit -> sat_parameters_max_sat_assumption_order
(** [default_sat_parameters_max_sat_assumption_order ()] is a new empty value for type [sat_parameters_max_sat_assumption_order] *)

val default_sat_parameters_max_sat_stratification_algorithm : unit -> sat_parameters_max_sat_stratification_algorithm
(** [default_sat_parameters_max_sat_stratification_algorithm ()] is a new empty value for type [sat_parameters_max_sat_stratification_algorithm] *)

val default_sat_parameters_search_branching : unit -> sat_parameters_search_branching
(** [default_sat_parameters_search_branching ()] is a new empty value for type [sat_parameters_search_branching] *)

val default_sat_parameters_shared_tree_split_strategy : unit -> sat_parameters_shared_tree_split_strategy
(** [default_sat_parameters_shared_tree_split_strategy ()] is a new empty value for type [sat_parameters_shared_tree_split_strategy] *)

val default_sat_parameters_fprounding_method : unit -> sat_parameters_fprounding_method
(** [default_sat_parameters_fprounding_method ()] is a new empty value for type [sat_parameters_fprounding_method] *)

val default_sat_parameters : unit -> sat_parameters 
(** [default_sat_parameters ()] is a new empty value for type [sat_parameters] *)


(** {2 Make functions} *)

val make_sat_parameters : 
  ?name:string ->
  ?preferred_variable_order:sat_parameters_variable_order ->
  ?initial_polarity:sat_parameters_polarity ->
  ?use_phase_saving:bool ->
  ?polarity_rephase_increment:int32 ->
  ?polarity_exploit_ls_hints:bool ->
  ?random_polarity_ratio:float ->
  ?random_branches_ratio:float ->
  ?use_erwa_heuristic:bool ->
  ?initial_variables_activity:float ->
  ?also_bump_variables_in_conflict_reasons:bool ->
  ?minimization_algorithm:sat_parameters_conflict_minimization_algorithm ->
  ?binary_minimization_algorithm:sat_parameters_binary_minization_algorithm ->
  ?subsumption_during_conflict_analysis:bool ->
  ?clause_cleanup_period:int32 ->
  ?clause_cleanup_target:int32 ->
  ?clause_cleanup_ratio:float ->
  ?clause_cleanup_protection:sat_parameters_clause_protection ->
  ?clause_cleanup_lbd_bound:int32 ->
  ?clause_cleanup_ordering:sat_parameters_clause_ordering ->
  ?pb_cleanup_increment:int32 ->
  ?pb_cleanup_ratio:float ->
  ?variable_activity_decay:float ->
  ?max_variable_activity_value:float ->
  ?glucose_max_decay:float ->
  ?glucose_decay_increment:float ->
  ?glucose_decay_increment_period:int32 ->
  ?clause_activity_decay:float ->
  ?max_clause_activity_value:float ->
  ?restart_algorithms:sat_parameters_restart_algorithm list ->
  ?default_restart_algorithms:string ->
  ?restart_period:int32 ->
  ?restart_running_window_size:int32 ->
  ?restart_dl_average_ratio:float ->
  ?restart_lbd_average_ratio:float ->
  ?use_blocking_restart:bool ->
  ?blocking_restart_window_size:int32 ->
  ?blocking_restart_multiplier:float ->
  ?num_conflicts_before_strategy_changes:int32 ->
  ?strategy_change_increase_ratio:float ->
  ?max_time_in_seconds:float ->
  ?max_deterministic_time:float ->
  ?max_num_deterministic_batches:int32 ->
  ?max_number_of_conflicts:int64 ->
  ?max_memory_in_mb:int64 ->
  ?absolute_gap_limit:float ->
  ?relative_gap_limit:float ->
  ?random_seed:int32 ->
  ?permute_variable_randomly:bool ->
  ?permute_presolve_constraint_order:bool ->
  ?use_absl_random:bool ->
  ?log_search_progress:bool ->
  ?log_subsolver_statistics:bool ->
  ?log_prefix:string ->
  ?log_to_stdout:bool ->
  ?log_to_response:bool ->
  ?use_pb_resolution:bool ->
  ?minimize_reduction_during_pb_resolution:bool ->
  ?count_assumption_levels_in_lbd:bool ->
  ?presolve_bve_threshold:int32 ->
  ?presolve_bve_clause_weight:int32 ->
  ?probing_deterministic_time_limit:float ->
  ?presolve_probing_deterministic_time_limit:float ->
  ?presolve_blocked_clause:bool ->
  ?presolve_use_bva:bool ->
  ?presolve_bva_threshold:int32 ->
  ?max_presolve_iterations:int32 ->
  ?cp_model_presolve:bool ->
  ?cp_model_probing_level:int32 ->
  ?cp_model_use_sat_presolve:bool ->
  ?remove_fixed_variables_early:bool ->
  ?detect_table_with_cost:bool ->
  ?table_compression_level:int32 ->
  ?expand_alldiff_constraints:bool ->
  ?expand_reservoir_constraints:bool ->
  ?expand_reservoir_using_circuit:bool ->
  ?encode_cumulative_as_reservoir:bool ->
  ?max_lin_max_size_for_expansion:int32 ->
  ?disable_constraint_expansion:bool ->
  ?encode_complex_linear_constraint_with_integer:bool ->
  ?merge_no_overlap_work_limit:float ->
  ?merge_at_most_one_work_limit:float ->
  ?presolve_substitution_level:int32 ->
  ?presolve_extract_integer_enforcement:bool ->
  ?presolve_inclusion_work_limit:int64 ->
  ?ignore_names:bool ->
  ?infer_all_diffs:bool ->
  ?find_big_linear_overlap:bool ->
  ?use_sat_inprocessing:bool ->
  ?inprocessing_dtime_ratio:float ->
  ?inprocessing_probing_dtime:float ->
  ?inprocessing_minimization_dtime:float ->
  ?inprocessing_minimization_use_conflict_analysis:bool ->
  ?inprocessing_minimization_use_all_orderings:bool ->
  ?num_workers:int32 ->
  ?num_search_workers:int32 ->
  ?num_full_subsolvers:int32 ->
  ?subsolvers:string list ->
  ?extra_subsolvers:string list ->
  ?ignore_subsolvers:string list ->
  ?filter_subsolvers:string list ->
  ?subsolver_params:sat_parameters list ->
  ?interleave_search:bool ->
  ?interleave_batch_size:int32 ->
  ?share_objective_bounds:bool ->
  ?share_level_zero_bounds:bool ->
  ?share_binary_clauses:bool ->
  ?share_glue_clauses:bool ->
  ?minimize_shared_clauses:bool ->
  ?debug_postsolve_with_full_solver:bool ->
  ?debug_max_num_presolve_operations:int32 ->
  ?debug_crash_on_bad_hint:bool ->
  ?debug_crash_if_presolve_breaks_hint:bool ->
  ?use_optimization_hints:bool ->
  ?core_minimization_level:int32 ->
  ?find_multiple_cores:bool ->
  ?cover_optimization:bool ->
  ?max_sat_assumption_order:sat_parameters_max_sat_assumption_order ->
  ?max_sat_reverse_assumption_order:bool ->
  ?max_sat_stratification:sat_parameters_max_sat_stratification_algorithm ->
  ?propagation_loop_detection_factor:float ->
  ?use_precedences_in_disjunctive_constraint:bool ->
  ?max_size_to_create_precedence_literals_in_disjunctive:int32 ->
  ?use_strong_propagation_in_disjunctive:bool ->
  ?use_dynamic_precedence_in_disjunctive:bool ->
  ?use_dynamic_precedence_in_cumulative:bool ->
  ?use_overload_checker_in_cumulative:bool ->
  ?use_conservative_scale_overload_checker:bool ->
  ?use_timetable_edge_finding_in_cumulative:bool ->
  ?max_num_intervals_for_timetable_edge_finding:int32 ->
  ?use_hard_precedences_in_cumulative:bool ->
  ?exploit_all_precedences:bool ->
  ?use_disjunctive_constraint_in_cumulative:bool ->
  ?use_timetabling_in_no_overlap_2d:bool ->
  ?use_energetic_reasoning_in_no_overlap_2d:bool ->
  ?use_area_energetic_reasoning_in_no_overlap_2d:bool ->
  ?use_try_edge_reasoning_in_no_overlap_2d:bool ->
  ?max_pairs_pairwise_reasoning_in_no_overlap_2d:int32 ->
  ?maximum_regions_to_split_in_disconnected_no_overlap_2d:int32 ->
  ?use_dual_scheduling_heuristics:bool ->
  ?use_all_different_for_circuit:bool ->
  ?routing_cut_subset_size_for_binary_relation_bound:int32 ->
  ?routing_cut_subset_size_for_tight_binary_relation_bound:int32 ->
  ?routing_cut_dp_effort:float ->
  ?search_branching:sat_parameters_search_branching ->
  ?hint_conflict_limit:int32 ->
  ?repair_hint:bool ->
  ?fix_variables_to_their_hinted_value:bool ->
  ?use_probing_search:bool ->
  ?use_extended_probing:bool ->
  ?probing_num_combinations_limit:int32 ->
  ?use_shaving_in_probing_search:bool ->
  ?shaving_search_deterministic_time:float ->
  ?shaving_search_threshold:int64 ->
  ?use_objective_lb_search:bool ->
  ?use_objective_shaving_search:bool ->
  ?use_variables_shaving_search:bool ->
  ?pseudo_cost_reliability_threshold:int64 ->
  ?optimize_with_core:bool ->
  ?optimize_with_lb_tree_search:bool ->
  ?save_lp_basis_in_lb_tree_search:bool ->
  ?binary_search_num_conflicts:int32 ->
  ?optimize_with_max_hs:bool ->
  ?use_feasibility_jump:bool ->
  ?use_ls_only:bool ->
  ?feasibility_jump_decay:float ->
  ?feasibility_jump_linearization_level:int32 ->
  ?feasibility_jump_restart_factor:int32 ->
  ?feasibility_jump_batch_dtime:float ->
  ?feasibility_jump_var_randomization_probability:float ->
  ?feasibility_jump_var_perburbation_range_ratio:float ->
  ?feasibility_jump_enable_restarts:bool ->
  ?feasibility_jump_max_expanded_constraint_size:int32 ->
  ?num_violation_ls:int32 ->
  ?violation_ls_perturbation_period:int32 ->
  ?violation_ls_compound_move_probability:float ->
  ?shared_tree_num_workers:int32 ->
  ?use_shared_tree_search:bool ->
  ?shared_tree_worker_min_restarts_per_subtree:int32 ->
  ?shared_tree_worker_enable_trail_sharing:bool ->
  ?shared_tree_worker_enable_phase_sharing:bool ->
  ?shared_tree_open_leaves_per_worker:float ->
  ?shared_tree_max_nodes_per_worker:int32 ->
  ?shared_tree_split_strategy:sat_parameters_shared_tree_split_strategy ->
  ?shared_tree_balance_tolerance:int32 ->
  ?enumerate_all_solutions:bool ->
  ?keep_all_feasible_solutions_in_presolve:bool ->
  ?fill_tightened_domains_in_response:bool ->
  ?fill_additional_solutions_in_response:bool ->
  ?instantiate_all_variables:bool ->
  ?auto_detect_greater_than_at_least_one_of:bool ->
  ?stop_after_first_solution:bool ->
  ?stop_after_presolve:bool ->
  ?stop_after_root_propagation:bool ->
  ?lns_initial_difficulty:float ->
  ?lns_initial_deterministic_limit:float ->
  ?use_lns:bool ->
  ?use_lns_only:bool ->
  ?solution_pool_size:int32 ->
  ?use_rins_lns:bool ->
  ?use_feasibility_pump:bool ->
  ?use_lb_relax_lns:bool ->
  ?lb_relax_num_workers_threshold:int32 ->
  ?fp_rounding:sat_parameters_fprounding_method ->
  ?diversify_lns_params:bool ->
  ?randomize_search:bool ->
  ?search_random_variable_pool_size:int64 ->
  ?push_all_tasks_toward_start:bool ->
  ?use_optional_variables:bool ->
  ?use_exact_lp_reason:bool ->
  ?use_combined_no_overlap:bool ->
  ?at_most_one_max_expansion_size:int32 ->
  ?catch_sigint_signal:bool ->
  ?use_implied_bounds:bool ->
  ?polish_lp_solution:bool ->
  ?lp_primal_tolerance:float ->
  ?lp_dual_tolerance:float ->
  ?convert_intervals:bool ->
  ?symmetry_level:int32 ->
  ?use_symmetry_in_lp:bool ->
  ?keep_symmetry_in_presolve:bool ->
  ?symmetry_detection_deterministic_time_limit:float ->
  ?new_linear_propagation:bool ->
  ?linear_split_size:int32 ->
  ?linearization_level:int32 ->
  ?boolean_encoding_level:int32 ->
  ?max_domain_size_when_encoding_eq_neq_constraints:int32 ->
  ?max_num_cuts:int32 ->
  ?cut_level:int32 ->
  ?only_add_cuts_at_level_zero:bool ->
  ?add_objective_cut:bool ->
  ?add_cg_cuts:bool ->
  ?add_mir_cuts:bool ->
  ?add_zero_half_cuts:bool ->
  ?add_clique_cuts:bool ->
  ?add_rlt_cuts:bool ->
  ?max_all_diff_cut_size:int32 ->
  ?add_lin_max_cuts:bool ->
  ?max_integer_rounding_scaling:int32 ->
  ?add_lp_constraints_lazily:bool ->
  ?root_lp_iterations:int32 ->
  ?min_orthogonality_for_lp_constraints:float ->
  ?max_cut_rounds_at_level_zero:int32 ->
  ?max_consecutive_inactive_count:int32 ->
  ?cut_max_active_count_value:float ->
  ?cut_active_count_decay:float ->
  ?cut_cleanup_target:int32 ->
  ?new_constraints_batch_size:int32 ->
  ?exploit_integer_lp_solution:bool ->
  ?exploit_all_lp_solution:bool ->
  ?exploit_best_solution:bool ->
  ?exploit_relaxation_solution:bool ->
  ?exploit_objective:bool ->
  ?detect_linearized_product:bool ->
  ?mip_max_bound:float ->
  ?mip_var_scaling:float ->
  ?mip_scale_large_domain:bool ->
  ?mip_automatically_scale_variables:bool ->
  ?only_solve_ip:bool ->
  ?mip_wanted_precision:float ->
  ?mip_max_activity_exponent:int32 ->
  ?mip_check_precision:float ->
  ?mip_compute_true_objective_bound:bool ->
  ?mip_max_valid_magnitude:float ->
  ?mip_treat_high_magnitude_bounds_as_infinity:bool ->
  ?mip_drop_tolerance:float ->
  ?mip_presolve_level:int32 ->
  unit ->
  sat_parameters
(** [make_sat_parameters … ()] is a builder for type [sat_parameters] *)

val copy_sat_parameters : sat_parameters -> sat_parameters

val sat_parameters_has_name : sat_parameters -> bool
  (** presence of field "name" in [sat_parameters] *)

val sat_parameters_set_name : sat_parameters -> string -> unit
  (** set field name in sat_parameters *)

val sat_parameters_has_preferred_variable_order : sat_parameters -> bool
  (** presence of field "preferred_variable_order" in [sat_parameters] *)

val sat_parameters_set_preferred_variable_order : sat_parameters -> sat_parameters_variable_order -> unit
  (** set field preferred_variable_order in sat_parameters *)

val sat_parameters_has_initial_polarity : sat_parameters -> bool
  (** presence of field "initial_polarity" in [sat_parameters] *)

val sat_parameters_set_initial_polarity : sat_parameters -> sat_parameters_polarity -> unit
  (** set field initial_polarity in sat_parameters *)

val sat_parameters_has_use_phase_saving : sat_parameters -> bool
  (** presence of field "use_phase_saving" in [sat_parameters] *)

val sat_parameters_set_use_phase_saving : sat_parameters -> bool -> unit
  (** set field use_phase_saving in sat_parameters *)

val sat_parameters_has_polarity_rephase_increment : sat_parameters -> bool
  (** presence of field "polarity_rephase_increment" in [sat_parameters] *)

val sat_parameters_set_polarity_rephase_increment : sat_parameters -> int32 -> unit
  (** set field polarity_rephase_increment in sat_parameters *)

val sat_parameters_has_polarity_exploit_ls_hints : sat_parameters -> bool
  (** presence of field "polarity_exploit_ls_hints" in [sat_parameters] *)

val sat_parameters_set_polarity_exploit_ls_hints : sat_parameters -> bool -> unit
  (** set field polarity_exploit_ls_hints in sat_parameters *)

val sat_parameters_has_random_polarity_ratio : sat_parameters -> bool
  (** presence of field "random_polarity_ratio" in [sat_parameters] *)

val sat_parameters_set_random_polarity_ratio : sat_parameters -> float -> unit
  (** set field random_polarity_ratio in sat_parameters *)

val sat_parameters_has_random_branches_ratio : sat_parameters -> bool
  (** presence of field "random_branches_ratio" in [sat_parameters] *)

val sat_parameters_set_random_branches_ratio : sat_parameters -> float -> unit
  (** set field random_branches_ratio in sat_parameters *)

val sat_parameters_has_use_erwa_heuristic : sat_parameters -> bool
  (** presence of field "use_erwa_heuristic" in [sat_parameters] *)

val sat_parameters_set_use_erwa_heuristic : sat_parameters -> bool -> unit
  (** set field use_erwa_heuristic in sat_parameters *)

val sat_parameters_has_initial_variables_activity : sat_parameters -> bool
  (** presence of field "initial_variables_activity" in [sat_parameters] *)

val sat_parameters_set_initial_variables_activity : sat_parameters -> float -> unit
  (** set field initial_variables_activity in sat_parameters *)

val sat_parameters_has_also_bump_variables_in_conflict_reasons : sat_parameters -> bool
  (** presence of field "also_bump_variables_in_conflict_reasons" in [sat_parameters] *)

val sat_parameters_set_also_bump_variables_in_conflict_reasons : sat_parameters -> bool -> unit
  (** set field also_bump_variables_in_conflict_reasons in sat_parameters *)

val sat_parameters_has_minimization_algorithm : sat_parameters -> bool
  (** presence of field "minimization_algorithm" in [sat_parameters] *)

val sat_parameters_set_minimization_algorithm : sat_parameters -> sat_parameters_conflict_minimization_algorithm -> unit
  (** set field minimization_algorithm in sat_parameters *)

val sat_parameters_has_binary_minimization_algorithm : sat_parameters -> bool
  (** presence of field "binary_minimization_algorithm" in [sat_parameters] *)

val sat_parameters_set_binary_minimization_algorithm : sat_parameters -> sat_parameters_binary_minization_algorithm -> unit
  (** set field binary_minimization_algorithm in sat_parameters *)

val sat_parameters_has_subsumption_during_conflict_analysis : sat_parameters -> bool
  (** presence of field "subsumption_during_conflict_analysis" in [sat_parameters] *)

val sat_parameters_set_subsumption_during_conflict_analysis : sat_parameters -> bool -> unit
  (** set field subsumption_during_conflict_analysis in sat_parameters *)

val sat_parameters_has_clause_cleanup_period : sat_parameters -> bool
  (** presence of field "clause_cleanup_period" in [sat_parameters] *)

val sat_parameters_set_clause_cleanup_period : sat_parameters -> int32 -> unit
  (** set field clause_cleanup_period in sat_parameters *)

val sat_parameters_has_clause_cleanup_target : sat_parameters -> bool
  (** presence of field "clause_cleanup_target" in [sat_parameters] *)

val sat_parameters_set_clause_cleanup_target : sat_parameters -> int32 -> unit
  (** set field clause_cleanup_target in sat_parameters *)

val sat_parameters_has_clause_cleanup_ratio : sat_parameters -> bool
  (** presence of field "clause_cleanup_ratio" in [sat_parameters] *)

val sat_parameters_set_clause_cleanup_ratio : sat_parameters -> float -> unit
  (** set field clause_cleanup_ratio in sat_parameters *)

val sat_parameters_has_clause_cleanup_protection : sat_parameters -> bool
  (** presence of field "clause_cleanup_protection" in [sat_parameters] *)

val sat_parameters_set_clause_cleanup_protection : sat_parameters -> sat_parameters_clause_protection -> unit
  (** set field clause_cleanup_protection in sat_parameters *)

val sat_parameters_has_clause_cleanup_lbd_bound : sat_parameters -> bool
  (** presence of field "clause_cleanup_lbd_bound" in [sat_parameters] *)

val sat_parameters_set_clause_cleanup_lbd_bound : sat_parameters -> int32 -> unit
  (** set field clause_cleanup_lbd_bound in sat_parameters *)

val sat_parameters_has_clause_cleanup_ordering : sat_parameters -> bool
  (** presence of field "clause_cleanup_ordering" in [sat_parameters] *)

val sat_parameters_set_clause_cleanup_ordering : sat_parameters -> sat_parameters_clause_ordering -> unit
  (** set field clause_cleanup_ordering in sat_parameters *)

val sat_parameters_has_pb_cleanup_increment : sat_parameters -> bool
  (** presence of field "pb_cleanup_increment" in [sat_parameters] *)

val sat_parameters_set_pb_cleanup_increment : sat_parameters -> int32 -> unit
  (** set field pb_cleanup_increment in sat_parameters *)

val sat_parameters_has_pb_cleanup_ratio : sat_parameters -> bool
  (** presence of field "pb_cleanup_ratio" in [sat_parameters] *)

val sat_parameters_set_pb_cleanup_ratio : sat_parameters -> float -> unit
  (** set field pb_cleanup_ratio in sat_parameters *)

val sat_parameters_has_variable_activity_decay : sat_parameters -> bool
  (** presence of field "variable_activity_decay" in [sat_parameters] *)

val sat_parameters_set_variable_activity_decay : sat_parameters -> float -> unit
  (** set field variable_activity_decay in sat_parameters *)

val sat_parameters_has_max_variable_activity_value : sat_parameters -> bool
  (** presence of field "max_variable_activity_value" in [sat_parameters] *)

val sat_parameters_set_max_variable_activity_value : sat_parameters -> float -> unit
  (** set field max_variable_activity_value in sat_parameters *)

val sat_parameters_has_glucose_max_decay : sat_parameters -> bool
  (** presence of field "glucose_max_decay" in [sat_parameters] *)

val sat_parameters_set_glucose_max_decay : sat_parameters -> float -> unit
  (** set field glucose_max_decay in sat_parameters *)

val sat_parameters_has_glucose_decay_increment : sat_parameters -> bool
  (** presence of field "glucose_decay_increment" in [sat_parameters] *)

val sat_parameters_set_glucose_decay_increment : sat_parameters -> float -> unit
  (** set field glucose_decay_increment in sat_parameters *)

val sat_parameters_has_glucose_decay_increment_period : sat_parameters -> bool
  (** presence of field "glucose_decay_increment_period" in [sat_parameters] *)

val sat_parameters_set_glucose_decay_increment_period : sat_parameters -> int32 -> unit
  (** set field glucose_decay_increment_period in sat_parameters *)

val sat_parameters_has_clause_activity_decay : sat_parameters -> bool
  (** presence of field "clause_activity_decay" in [sat_parameters] *)

val sat_parameters_set_clause_activity_decay : sat_parameters -> float -> unit
  (** set field clause_activity_decay in sat_parameters *)

val sat_parameters_has_max_clause_activity_value : sat_parameters -> bool
  (** presence of field "max_clause_activity_value" in [sat_parameters] *)

val sat_parameters_set_max_clause_activity_value : sat_parameters -> float -> unit
  (** set field max_clause_activity_value in sat_parameters *)

val sat_parameters_set_restart_algorithms : sat_parameters -> sat_parameters_restart_algorithm list -> unit
  (** set field restart_algorithms in sat_parameters *)

val sat_parameters_has_default_restart_algorithms : sat_parameters -> bool
  (** presence of field "default_restart_algorithms" in [sat_parameters] *)

val sat_parameters_set_default_restart_algorithms : sat_parameters -> string -> unit
  (** set field default_restart_algorithms in sat_parameters *)

val sat_parameters_has_restart_period : sat_parameters -> bool
  (** presence of field "restart_period" in [sat_parameters] *)

val sat_parameters_set_restart_period : sat_parameters -> int32 -> unit
  (** set field restart_period in sat_parameters *)

val sat_parameters_has_restart_running_window_size : sat_parameters -> bool
  (** presence of field "restart_running_window_size" in [sat_parameters] *)

val sat_parameters_set_restart_running_window_size : sat_parameters -> int32 -> unit
  (** set field restart_running_window_size in sat_parameters *)

val sat_parameters_has_restart_dl_average_ratio : sat_parameters -> bool
  (** presence of field "restart_dl_average_ratio" in [sat_parameters] *)

val sat_parameters_set_restart_dl_average_ratio : sat_parameters -> float -> unit
  (** set field restart_dl_average_ratio in sat_parameters *)

val sat_parameters_has_restart_lbd_average_ratio : sat_parameters -> bool
  (** presence of field "restart_lbd_average_ratio" in [sat_parameters] *)

val sat_parameters_set_restart_lbd_average_ratio : sat_parameters -> float -> unit
  (** set field restart_lbd_average_ratio in sat_parameters *)

val sat_parameters_has_use_blocking_restart : sat_parameters -> bool
  (** presence of field "use_blocking_restart" in [sat_parameters] *)

val sat_parameters_set_use_blocking_restart : sat_parameters -> bool -> unit
  (** set field use_blocking_restart in sat_parameters *)

val sat_parameters_has_blocking_restart_window_size : sat_parameters -> bool
  (** presence of field "blocking_restart_window_size" in [sat_parameters] *)

val sat_parameters_set_blocking_restart_window_size : sat_parameters -> int32 -> unit
  (** set field blocking_restart_window_size in sat_parameters *)

val sat_parameters_has_blocking_restart_multiplier : sat_parameters -> bool
  (** presence of field "blocking_restart_multiplier" in [sat_parameters] *)

val sat_parameters_set_blocking_restart_multiplier : sat_parameters -> float -> unit
  (** set field blocking_restart_multiplier in sat_parameters *)

val sat_parameters_has_num_conflicts_before_strategy_changes : sat_parameters -> bool
  (** presence of field "num_conflicts_before_strategy_changes" in [sat_parameters] *)

val sat_parameters_set_num_conflicts_before_strategy_changes : sat_parameters -> int32 -> unit
  (** set field num_conflicts_before_strategy_changes in sat_parameters *)

val sat_parameters_has_strategy_change_increase_ratio : sat_parameters -> bool
  (** presence of field "strategy_change_increase_ratio" in [sat_parameters] *)

val sat_parameters_set_strategy_change_increase_ratio : sat_parameters -> float -> unit
  (** set field strategy_change_increase_ratio in sat_parameters *)

val sat_parameters_has_max_time_in_seconds : sat_parameters -> bool
  (** presence of field "max_time_in_seconds" in [sat_parameters] *)

val sat_parameters_set_max_time_in_seconds : sat_parameters -> float -> unit
  (** set field max_time_in_seconds in sat_parameters *)

val sat_parameters_has_max_deterministic_time : sat_parameters -> bool
  (** presence of field "max_deterministic_time" in [sat_parameters] *)

val sat_parameters_set_max_deterministic_time : sat_parameters -> float -> unit
  (** set field max_deterministic_time in sat_parameters *)

val sat_parameters_has_max_num_deterministic_batches : sat_parameters -> bool
  (** presence of field "max_num_deterministic_batches" in [sat_parameters] *)

val sat_parameters_set_max_num_deterministic_batches : sat_parameters -> int32 -> unit
  (** set field max_num_deterministic_batches in sat_parameters *)

val sat_parameters_has_max_number_of_conflicts : sat_parameters -> bool
  (** presence of field "max_number_of_conflicts" in [sat_parameters] *)

val sat_parameters_set_max_number_of_conflicts : sat_parameters -> int64 -> unit
  (** set field max_number_of_conflicts in sat_parameters *)

val sat_parameters_has_max_memory_in_mb : sat_parameters -> bool
  (** presence of field "max_memory_in_mb" in [sat_parameters] *)

val sat_parameters_set_max_memory_in_mb : sat_parameters -> int64 -> unit
  (** set field max_memory_in_mb in sat_parameters *)

val sat_parameters_has_absolute_gap_limit : sat_parameters -> bool
  (** presence of field "absolute_gap_limit" in [sat_parameters] *)

val sat_parameters_set_absolute_gap_limit : sat_parameters -> float -> unit
  (** set field absolute_gap_limit in sat_parameters *)

val sat_parameters_has_relative_gap_limit : sat_parameters -> bool
  (** presence of field "relative_gap_limit" in [sat_parameters] *)

val sat_parameters_set_relative_gap_limit : sat_parameters -> float -> unit
  (** set field relative_gap_limit in sat_parameters *)

val sat_parameters_has_random_seed : sat_parameters -> bool
  (** presence of field "random_seed" in [sat_parameters] *)

val sat_parameters_set_random_seed : sat_parameters -> int32 -> unit
  (** set field random_seed in sat_parameters *)

val sat_parameters_has_permute_variable_randomly : sat_parameters -> bool
  (** presence of field "permute_variable_randomly" in [sat_parameters] *)

val sat_parameters_set_permute_variable_randomly : sat_parameters -> bool -> unit
  (** set field permute_variable_randomly in sat_parameters *)

val sat_parameters_has_permute_presolve_constraint_order : sat_parameters -> bool
  (** presence of field "permute_presolve_constraint_order" in [sat_parameters] *)

val sat_parameters_set_permute_presolve_constraint_order : sat_parameters -> bool -> unit
  (** set field permute_presolve_constraint_order in sat_parameters *)

val sat_parameters_has_use_absl_random : sat_parameters -> bool
  (** presence of field "use_absl_random" in [sat_parameters] *)

val sat_parameters_set_use_absl_random : sat_parameters -> bool -> unit
  (** set field use_absl_random in sat_parameters *)

val sat_parameters_has_log_search_progress : sat_parameters -> bool
  (** presence of field "log_search_progress" in [sat_parameters] *)

val sat_parameters_set_log_search_progress : sat_parameters -> bool -> unit
  (** set field log_search_progress in sat_parameters *)

val sat_parameters_has_log_subsolver_statistics : sat_parameters -> bool
  (** presence of field "log_subsolver_statistics" in [sat_parameters] *)

val sat_parameters_set_log_subsolver_statistics : sat_parameters -> bool -> unit
  (** set field log_subsolver_statistics in sat_parameters *)

val sat_parameters_has_log_prefix : sat_parameters -> bool
  (** presence of field "log_prefix" in [sat_parameters] *)

val sat_parameters_set_log_prefix : sat_parameters -> string -> unit
  (** set field log_prefix in sat_parameters *)

val sat_parameters_has_log_to_stdout : sat_parameters -> bool
  (** presence of field "log_to_stdout" in [sat_parameters] *)

val sat_parameters_set_log_to_stdout : sat_parameters -> bool -> unit
  (** set field log_to_stdout in sat_parameters *)

val sat_parameters_has_log_to_response : sat_parameters -> bool
  (** presence of field "log_to_response" in [sat_parameters] *)

val sat_parameters_set_log_to_response : sat_parameters -> bool -> unit
  (** set field log_to_response in sat_parameters *)

val sat_parameters_has_use_pb_resolution : sat_parameters -> bool
  (** presence of field "use_pb_resolution" in [sat_parameters] *)

val sat_parameters_set_use_pb_resolution : sat_parameters -> bool -> unit
  (** set field use_pb_resolution in sat_parameters *)

val sat_parameters_has_minimize_reduction_during_pb_resolution : sat_parameters -> bool
  (** presence of field "minimize_reduction_during_pb_resolution" in [sat_parameters] *)

val sat_parameters_set_minimize_reduction_during_pb_resolution : sat_parameters -> bool -> unit
  (** set field minimize_reduction_during_pb_resolution in sat_parameters *)

val sat_parameters_has_count_assumption_levels_in_lbd : sat_parameters -> bool
  (** presence of field "count_assumption_levels_in_lbd" in [sat_parameters] *)

val sat_parameters_set_count_assumption_levels_in_lbd : sat_parameters -> bool -> unit
  (** set field count_assumption_levels_in_lbd in sat_parameters *)

val sat_parameters_has_presolve_bve_threshold : sat_parameters -> bool
  (** presence of field "presolve_bve_threshold" in [sat_parameters] *)

val sat_parameters_set_presolve_bve_threshold : sat_parameters -> int32 -> unit
  (** set field presolve_bve_threshold in sat_parameters *)

val sat_parameters_has_presolve_bve_clause_weight : sat_parameters -> bool
  (** presence of field "presolve_bve_clause_weight" in [sat_parameters] *)

val sat_parameters_set_presolve_bve_clause_weight : sat_parameters -> int32 -> unit
  (** set field presolve_bve_clause_weight in sat_parameters *)

val sat_parameters_has_probing_deterministic_time_limit : sat_parameters -> bool
  (** presence of field "probing_deterministic_time_limit" in [sat_parameters] *)

val sat_parameters_set_probing_deterministic_time_limit : sat_parameters -> float -> unit
  (** set field probing_deterministic_time_limit in sat_parameters *)

val sat_parameters_has_presolve_probing_deterministic_time_limit : sat_parameters -> bool
  (** presence of field "presolve_probing_deterministic_time_limit" in [sat_parameters] *)

val sat_parameters_set_presolve_probing_deterministic_time_limit : sat_parameters -> float -> unit
  (** set field presolve_probing_deterministic_time_limit in sat_parameters *)

val sat_parameters_set_presolve_blocked_clause : sat_parameters -> bool -> unit
  (** set field presolve_blocked_clause in sat_parameters *)

val sat_parameters_set_presolve_use_bva : sat_parameters -> bool -> unit
  (** set field presolve_use_bva in sat_parameters *)

val sat_parameters_set_presolve_bva_threshold : sat_parameters -> int32 -> unit
  (** set field presolve_bva_threshold in sat_parameters *)

val sat_parameters_set_max_presolve_iterations : sat_parameters -> int32 -> unit
  (** set field max_presolve_iterations in sat_parameters *)

val sat_parameters_set_cp_model_presolve : sat_parameters -> bool -> unit
  (** set field cp_model_presolve in sat_parameters *)

val sat_parameters_set_cp_model_probing_level : sat_parameters -> int32 -> unit
  (** set field cp_model_probing_level in sat_parameters *)

val sat_parameters_set_cp_model_use_sat_presolve : sat_parameters -> bool -> unit
  (** set field cp_model_use_sat_presolve in sat_parameters *)

val sat_parameters_set_remove_fixed_variables_early : sat_parameters -> bool -> unit
  (** set field remove_fixed_variables_early in sat_parameters *)

val sat_parameters_set_detect_table_with_cost : sat_parameters -> bool -> unit
  (** set field detect_table_with_cost in sat_parameters *)

val sat_parameters_set_table_compression_level : sat_parameters -> int32 -> unit
  (** set field table_compression_level in sat_parameters *)

val sat_parameters_set_expand_alldiff_constraints : sat_parameters -> bool -> unit
  (** set field expand_alldiff_constraints in sat_parameters *)

val sat_parameters_set_expand_reservoir_constraints : sat_parameters -> bool -> unit
  (** set field expand_reservoir_constraints in sat_parameters *)

val sat_parameters_set_expand_reservoir_using_circuit : sat_parameters -> bool -> unit
  (** set field expand_reservoir_using_circuit in sat_parameters *)

val sat_parameters_set_encode_cumulative_as_reservoir : sat_parameters -> bool -> unit
  (** set field encode_cumulative_as_reservoir in sat_parameters *)

val sat_parameters_set_max_lin_max_size_for_expansion : sat_parameters -> int32 -> unit
  (** set field max_lin_max_size_for_expansion in sat_parameters *)

val sat_parameters_set_disable_constraint_expansion : sat_parameters -> bool -> unit
  (** set field disable_constraint_expansion in sat_parameters *)

val sat_parameters_set_encode_complex_linear_constraint_with_integer : sat_parameters -> bool -> unit
  (** set field encode_complex_linear_constraint_with_integer in sat_parameters *)

val sat_parameters_set_merge_no_overlap_work_limit : sat_parameters -> float -> unit
  (** set field merge_no_overlap_work_limit in sat_parameters *)

val sat_parameters_set_merge_at_most_one_work_limit : sat_parameters -> float -> unit
  (** set field merge_at_most_one_work_limit in sat_parameters *)

val sat_parameters_set_presolve_substitution_level : sat_parameters -> int32 -> unit
  (** set field presolve_substitution_level in sat_parameters *)

val sat_parameters_set_presolve_extract_integer_enforcement : sat_parameters -> bool -> unit
  (** set field presolve_extract_integer_enforcement in sat_parameters *)

val sat_parameters_set_presolve_inclusion_work_limit : sat_parameters -> int64 -> unit
  (** set field presolve_inclusion_work_limit in sat_parameters *)

val sat_parameters_set_ignore_names : sat_parameters -> bool -> unit
  (** set field ignore_names in sat_parameters *)

val sat_parameters_set_infer_all_diffs : sat_parameters -> bool -> unit
  (** set field infer_all_diffs in sat_parameters *)

val sat_parameters_set_find_big_linear_overlap : sat_parameters -> bool -> unit
  (** set field find_big_linear_overlap in sat_parameters *)

val sat_parameters_set_use_sat_inprocessing : sat_parameters -> bool -> unit
  (** set field use_sat_inprocessing in sat_parameters *)

val sat_parameters_set_inprocessing_dtime_ratio : sat_parameters -> float -> unit
  (** set field inprocessing_dtime_ratio in sat_parameters *)

val sat_parameters_set_inprocessing_probing_dtime : sat_parameters -> float -> unit
  (** set field inprocessing_probing_dtime in sat_parameters *)

val sat_parameters_set_inprocessing_minimization_dtime : sat_parameters -> float -> unit
  (** set field inprocessing_minimization_dtime in sat_parameters *)

val sat_parameters_set_inprocessing_minimization_use_conflict_analysis : sat_parameters -> bool -> unit
  (** set field inprocessing_minimization_use_conflict_analysis in sat_parameters *)

val sat_parameters_set_inprocessing_minimization_use_all_orderings : sat_parameters -> bool -> unit
  (** set field inprocessing_minimization_use_all_orderings in sat_parameters *)

val sat_parameters_set_num_workers : sat_parameters -> int32 -> unit
  (** set field num_workers in sat_parameters *)

val sat_parameters_set_num_search_workers : sat_parameters -> int32 -> unit
  (** set field num_search_workers in sat_parameters *)

val sat_parameters_set_num_full_subsolvers : sat_parameters -> int32 -> unit
  (** set field num_full_subsolvers in sat_parameters *)

val sat_parameters_set_subsolvers : sat_parameters -> string list -> unit
  (** set field subsolvers in sat_parameters *)

val sat_parameters_set_extra_subsolvers : sat_parameters -> string list -> unit
  (** set field extra_subsolvers in sat_parameters *)

val sat_parameters_set_ignore_subsolvers : sat_parameters -> string list -> unit
  (** set field ignore_subsolvers in sat_parameters *)

val sat_parameters_set_filter_subsolvers : sat_parameters -> string list -> unit
  (** set field filter_subsolvers in sat_parameters *)

val sat_parameters_set_subsolver_params : sat_parameters -> sat_parameters list -> unit
  (** set field subsolver_params in sat_parameters *)

val sat_parameters_set_interleave_search : sat_parameters -> bool -> unit
  (** set field interleave_search in sat_parameters *)

val sat_parameters_set_interleave_batch_size : sat_parameters -> int32 -> unit
  (** set field interleave_batch_size in sat_parameters *)

val sat_parameters_set_share_objective_bounds : sat_parameters -> bool -> unit
  (** set field share_objective_bounds in sat_parameters *)

val sat_parameters_set_share_level_zero_bounds : sat_parameters -> bool -> unit
  (** set field share_level_zero_bounds in sat_parameters *)

val sat_parameters_set_share_binary_clauses : sat_parameters -> bool -> unit
  (** set field share_binary_clauses in sat_parameters *)

val sat_parameters_set_share_glue_clauses : sat_parameters -> bool -> unit
  (** set field share_glue_clauses in sat_parameters *)

val sat_parameters_set_minimize_shared_clauses : sat_parameters -> bool -> unit
  (** set field minimize_shared_clauses in sat_parameters *)

val sat_parameters_set_debug_postsolve_with_full_solver : sat_parameters -> bool -> unit
  (** set field debug_postsolve_with_full_solver in sat_parameters *)

val sat_parameters_set_debug_max_num_presolve_operations : sat_parameters -> int32 -> unit
  (** set field debug_max_num_presolve_operations in sat_parameters *)

val sat_parameters_set_debug_crash_on_bad_hint : sat_parameters -> bool -> unit
  (** set field debug_crash_on_bad_hint in sat_parameters *)

val sat_parameters_set_debug_crash_if_presolve_breaks_hint : sat_parameters -> bool -> unit
  (** set field debug_crash_if_presolve_breaks_hint in sat_parameters *)

val sat_parameters_set_use_optimization_hints : sat_parameters -> bool -> unit
  (** set field use_optimization_hints in sat_parameters *)

val sat_parameters_set_core_minimization_level : sat_parameters -> int32 -> unit
  (** set field core_minimization_level in sat_parameters *)

val sat_parameters_set_find_multiple_cores : sat_parameters -> bool -> unit
  (** set field find_multiple_cores in sat_parameters *)

val sat_parameters_set_cover_optimization : sat_parameters -> bool -> unit
  (** set field cover_optimization in sat_parameters *)

val sat_parameters_set_max_sat_assumption_order : sat_parameters -> sat_parameters_max_sat_assumption_order -> unit
  (** set field max_sat_assumption_order in sat_parameters *)

val sat_parameters_set_max_sat_reverse_assumption_order : sat_parameters -> bool -> unit
  (** set field max_sat_reverse_assumption_order in sat_parameters *)

val sat_parameters_set_max_sat_stratification : sat_parameters -> sat_parameters_max_sat_stratification_algorithm -> unit
  (** set field max_sat_stratification in sat_parameters *)

val sat_parameters_set_propagation_loop_detection_factor : sat_parameters -> float -> unit
  (** set field propagation_loop_detection_factor in sat_parameters *)

val sat_parameters_set_use_precedences_in_disjunctive_constraint : sat_parameters -> bool -> unit
  (** set field use_precedences_in_disjunctive_constraint in sat_parameters *)

val sat_parameters_set_max_size_to_create_precedence_literals_in_disjunctive : sat_parameters -> int32 -> unit
  (** set field max_size_to_create_precedence_literals_in_disjunctive in sat_parameters *)

val sat_parameters_set_use_strong_propagation_in_disjunctive : sat_parameters -> bool -> unit
  (** set field use_strong_propagation_in_disjunctive in sat_parameters *)

val sat_parameters_set_use_dynamic_precedence_in_disjunctive : sat_parameters -> bool -> unit
  (** set field use_dynamic_precedence_in_disjunctive in sat_parameters *)

val sat_parameters_set_use_dynamic_precedence_in_cumulative : sat_parameters -> bool -> unit
  (** set field use_dynamic_precedence_in_cumulative in sat_parameters *)

val sat_parameters_set_use_overload_checker_in_cumulative : sat_parameters -> bool -> unit
  (** set field use_overload_checker_in_cumulative in sat_parameters *)

val sat_parameters_set_use_conservative_scale_overload_checker : sat_parameters -> bool -> unit
  (** set field use_conservative_scale_overload_checker in sat_parameters *)

val sat_parameters_set_use_timetable_edge_finding_in_cumulative : sat_parameters -> bool -> unit
  (** set field use_timetable_edge_finding_in_cumulative in sat_parameters *)

val sat_parameters_set_max_num_intervals_for_timetable_edge_finding : sat_parameters -> int32 -> unit
  (** set field max_num_intervals_for_timetable_edge_finding in sat_parameters *)

val sat_parameters_set_use_hard_precedences_in_cumulative : sat_parameters -> bool -> unit
  (** set field use_hard_precedences_in_cumulative in sat_parameters *)

val sat_parameters_set_exploit_all_precedences : sat_parameters -> bool -> unit
  (** set field exploit_all_precedences in sat_parameters *)

val sat_parameters_set_use_disjunctive_constraint_in_cumulative : sat_parameters -> bool -> unit
  (** set field use_disjunctive_constraint_in_cumulative in sat_parameters *)

val sat_parameters_set_use_timetabling_in_no_overlap_2d : sat_parameters -> bool -> unit
  (** set field use_timetabling_in_no_overlap_2d in sat_parameters *)

val sat_parameters_set_use_energetic_reasoning_in_no_overlap_2d : sat_parameters -> bool -> unit
  (** set field use_energetic_reasoning_in_no_overlap_2d in sat_parameters *)

val sat_parameters_set_use_area_energetic_reasoning_in_no_overlap_2d : sat_parameters -> bool -> unit
  (** set field use_area_energetic_reasoning_in_no_overlap_2d in sat_parameters *)

val sat_parameters_set_use_try_edge_reasoning_in_no_overlap_2d : sat_parameters -> bool -> unit
  (** set field use_try_edge_reasoning_in_no_overlap_2d in sat_parameters *)

val sat_parameters_set_max_pairs_pairwise_reasoning_in_no_overlap_2d : sat_parameters -> int32 -> unit
  (** set field max_pairs_pairwise_reasoning_in_no_overlap_2d in sat_parameters *)

val sat_parameters_set_maximum_regions_to_split_in_disconnected_no_overlap_2d : sat_parameters -> int32 -> unit
  (** set field maximum_regions_to_split_in_disconnected_no_overlap_2d in sat_parameters *)

val sat_parameters_set_use_dual_scheduling_heuristics : sat_parameters -> bool -> unit
  (** set field use_dual_scheduling_heuristics in sat_parameters *)

val sat_parameters_set_use_all_different_for_circuit : sat_parameters -> bool -> unit
  (** set field use_all_different_for_circuit in sat_parameters *)

val sat_parameters_set_routing_cut_subset_size_for_binary_relation_bound : sat_parameters -> int32 -> unit
  (** set field routing_cut_subset_size_for_binary_relation_bound in sat_parameters *)

val sat_parameters_set_routing_cut_subset_size_for_tight_binary_relation_bound : sat_parameters -> int32 -> unit
  (** set field routing_cut_subset_size_for_tight_binary_relation_bound in sat_parameters *)

val sat_parameters_set_routing_cut_dp_effort : sat_parameters -> float -> unit
  (** set field routing_cut_dp_effort in sat_parameters *)

val sat_parameters_set_search_branching : sat_parameters -> sat_parameters_search_branching -> unit
  (** set field search_branching in sat_parameters *)

val sat_parameters_set_hint_conflict_limit : sat_parameters -> int32 -> unit
  (** set field hint_conflict_limit in sat_parameters *)

val sat_parameters_set_repair_hint : sat_parameters -> bool -> unit
  (** set field repair_hint in sat_parameters *)

val sat_parameters_set_fix_variables_to_their_hinted_value : sat_parameters -> bool -> unit
  (** set field fix_variables_to_their_hinted_value in sat_parameters *)

val sat_parameters_set_use_probing_search : sat_parameters -> bool -> unit
  (** set field use_probing_search in sat_parameters *)

val sat_parameters_set_use_extended_probing : sat_parameters -> bool -> unit
  (** set field use_extended_probing in sat_parameters *)

val sat_parameters_set_probing_num_combinations_limit : sat_parameters -> int32 -> unit
  (** set field probing_num_combinations_limit in sat_parameters *)

val sat_parameters_set_use_shaving_in_probing_search : sat_parameters -> bool -> unit
  (** set field use_shaving_in_probing_search in sat_parameters *)

val sat_parameters_set_shaving_search_deterministic_time : sat_parameters -> float -> unit
  (** set field shaving_search_deterministic_time in sat_parameters *)

val sat_parameters_set_shaving_search_threshold : sat_parameters -> int64 -> unit
  (** set field shaving_search_threshold in sat_parameters *)

val sat_parameters_set_use_objective_lb_search : sat_parameters -> bool -> unit
  (** set field use_objective_lb_search in sat_parameters *)

val sat_parameters_set_use_objective_shaving_search : sat_parameters -> bool -> unit
  (** set field use_objective_shaving_search in sat_parameters *)

val sat_parameters_set_use_variables_shaving_search : sat_parameters -> bool -> unit
  (** set field use_variables_shaving_search in sat_parameters *)

val sat_parameters_set_pseudo_cost_reliability_threshold : sat_parameters -> int64 -> unit
  (** set field pseudo_cost_reliability_threshold in sat_parameters *)

val sat_parameters_set_optimize_with_core : sat_parameters -> bool -> unit
  (** set field optimize_with_core in sat_parameters *)

val sat_parameters_set_optimize_with_lb_tree_search : sat_parameters -> bool -> unit
  (** set field optimize_with_lb_tree_search in sat_parameters *)

val sat_parameters_set_save_lp_basis_in_lb_tree_search : sat_parameters -> bool -> unit
  (** set field save_lp_basis_in_lb_tree_search in sat_parameters *)

val sat_parameters_set_binary_search_num_conflicts : sat_parameters -> int32 -> unit
  (** set field binary_search_num_conflicts in sat_parameters *)

val sat_parameters_set_optimize_with_max_hs : sat_parameters -> bool -> unit
  (** set field optimize_with_max_hs in sat_parameters *)

val sat_parameters_set_use_feasibility_jump : sat_parameters -> bool -> unit
  (** set field use_feasibility_jump in sat_parameters *)

val sat_parameters_set_use_ls_only : sat_parameters -> bool -> unit
  (** set field use_ls_only in sat_parameters *)

val sat_parameters_set_feasibility_jump_decay : sat_parameters -> float -> unit
  (** set field feasibility_jump_decay in sat_parameters *)

val sat_parameters_set_feasibility_jump_linearization_level : sat_parameters -> int32 -> unit
  (** set field feasibility_jump_linearization_level in sat_parameters *)

val sat_parameters_set_feasibility_jump_restart_factor : sat_parameters -> int32 -> unit
  (** set field feasibility_jump_restart_factor in sat_parameters *)

val sat_parameters_set_feasibility_jump_batch_dtime : sat_parameters -> float -> unit
  (** set field feasibility_jump_batch_dtime in sat_parameters *)

val sat_parameters_set_feasibility_jump_var_randomization_probability : sat_parameters -> float -> unit
  (** set field feasibility_jump_var_randomization_probability in sat_parameters *)

val sat_parameters_set_feasibility_jump_var_perburbation_range_ratio : sat_parameters -> float -> unit
  (** set field feasibility_jump_var_perburbation_range_ratio in sat_parameters *)

val sat_parameters_set_feasibility_jump_enable_restarts : sat_parameters -> bool -> unit
  (** set field feasibility_jump_enable_restarts in sat_parameters *)

val sat_parameters_set_feasibility_jump_max_expanded_constraint_size : sat_parameters -> int32 -> unit
  (** set field feasibility_jump_max_expanded_constraint_size in sat_parameters *)

val sat_parameters_set_num_violation_ls : sat_parameters -> int32 -> unit
  (** set field num_violation_ls in sat_parameters *)

val sat_parameters_set_violation_ls_perturbation_period : sat_parameters -> int32 -> unit
  (** set field violation_ls_perturbation_period in sat_parameters *)

val sat_parameters_set_violation_ls_compound_move_probability : sat_parameters -> float -> unit
  (** set field violation_ls_compound_move_probability in sat_parameters *)

val sat_parameters_set_shared_tree_num_workers : sat_parameters -> int32 -> unit
  (** set field shared_tree_num_workers in sat_parameters *)

val sat_parameters_set_use_shared_tree_search : sat_parameters -> bool -> unit
  (** set field use_shared_tree_search in sat_parameters *)

val sat_parameters_set_shared_tree_worker_min_restarts_per_subtree : sat_parameters -> int32 -> unit
  (** set field shared_tree_worker_min_restarts_per_subtree in sat_parameters *)

val sat_parameters_set_shared_tree_worker_enable_trail_sharing : sat_parameters -> bool -> unit
  (** set field shared_tree_worker_enable_trail_sharing in sat_parameters *)

val sat_parameters_set_shared_tree_worker_enable_phase_sharing : sat_parameters -> bool -> unit
  (** set field shared_tree_worker_enable_phase_sharing in sat_parameters *)

val sat_parameters_set_shared_tree_open_leaves_per_worker : sat_parameters -> float -> unit
  (** set field shared_tree_open_leaves_per_worker in sat_parameters *)

val sat_parameters_set_shared_tree_max_nodes_per_worker : sat_parameters -> int32 -> unit
  (** set field shared_tree_max_nodes_per_worker in sat_parameters *)

val sat_parameters_set_shared_tree_split_strategy : sat_parameters -> sat_parameters_shared_tree_split_strategy -> unit
  (** set field shared_tree_split_strategy in sat_parameters *)

val sat_parameters_set_shared_tree_balance_tolerance : sat_parameters -> int32 -> unit
  (** set field shared_tree_balance_tolerance in sat_parameters *)

val sat_parameters_set_enumerate_all_solutions : sat_parameters -> bool -> unit
  (** set field enumerate_all_solutions in sat_parameters *)

val sat_parameters_set_keep_all_feasible_solutions_in_presolve : sat_parameters -> bool -> unit
  (** set field keep_all_feasible_solutions_in_presolve in sat_parameters *)

val sat_parameters_set_fill_tightened_domains_in_response : sat_parameters -> bool -> unit
  (** set field fill_tightened_domains_in_response in sat_parameters *)

val sat_parameters_set_fill_additional_solutions_in_response : sat_parameters -> bool -> unit
  (** set field fill_additional_solutions_in_response in sat_parameters *)

val sat_parameters_set_instantiate_all_variables : sat_parameters -> bool -> unit
  (** set field instantiate_all_variables in sat_parameters *)

val sat_parameters_set_auto_detect_greater_than_at_least_one_of : sat_parameters -> bool -> unit
  (** set field auto_detect_greater_than_at_least_one_of in sat_parameters *)

val sat_parameters_set_stop_after_first_solution : sat_parameters -> bool -> unit
  (** set field stop_after_first_solution in sat_parameters *)

val sat_parameters_set_stop_after_presolve : sat_parameters -> bool -> unit
  (** set field stop_after_presolve in sat_parameters *)

val sat_parameters_set_stop_after_root_propagation : sat_parameters -> bool -> unit
  (** set field stop_after_root_propagation in sat_parameters *)

val sat_parameters_set_lns_initial_difficulty : sat_parameters -> float -> unit
  (** set field lns_initial_difficulty in sat_parameters *)

val sat_parameters_set_lns_initial_deterministic_limit : sat_parameters -> float -> unit
  (** set field lns_initial_deterministic_limit in sat_parameters *)

val sat_parameters_set_use_lns : sat_parameters -> bool -> unit
  (** set field use_lns in sat_parameters *)

val sat_parameters_set_use_lns_only : sat_parameters -> bool -> unit
  (** set field use_lns_only in sat_parameters *)

val sat_parameters_set_solution_pool_size : sat_parameters -> int32 -> unit
  (** set field solution_pool_size in sat_parameters *)

val sat_parameters_set_use_rins_lns : sat_parameters -> bool -> unit
  (** set field use_rins_lns in sat_parameters *)

val sat_parameters_set_use_feasibility_pump : sat_parameters -> bool -> unit
  (** set field use_feasibility_pump in sat_parameters *)

val sat_parameters_set_use_lb_relax_lns : sat_parameters -> bool -> unit
  (** set field use_lb_relax_lns in sat_parameters *)

val sat_parameters_set_lb_relax_num_workers_threshold : sat_parameters -> int32 -> unit
  (** set field lb_relax_num_workers_threshold in sat_parameters *)

val sat_parameters_set_fp_rounding : sat_parameters -> sat_parameters_fprounding_method -> unit
  (** set field fp_rounding in sat_parameters *)

val sat_parameters_set_diversify_lns_params : sat_parameters -> bool -> unit
  (** set field diversify_lns_params in sat_parameters *)

val sat_parameters_set_randomize_search : sat_parameters -> bool -> unit
  (** set field randomize_search in sat_parameters *)

val sat_parameters_set_search_random_variable_pool_size : sat_parameters -> int64 -> unit
  (** set field search_random_variable_pool_size in sat_parameters *)

val sat_parameters_set_push_all_tasks_toward_start : sat_parameters -> bool -> unit
  (** set field push_all_tasks_toward_start in sat_parameters *)

val sat_parameters_set_use_optional_variables : sat_parameters -> bool -> unit
  (** set field use_optional_variables in sat_parameters *)

val sat_parameters_set_use_exact_lp_reason : sat_parameters -> bool -> unit
  (** set field use_exact_lp_reason in sat_parameters *)

val sat_parameters_set_use_combined_no_overlap : sat_parameters -> bool -> unit
  (** set field use_combined_no_overlap in sat_parameters *)

val sat_parameters_set_at_most_one_max_expansion_size : sat_parameters -> int32 -> unit
  (** set field at_most_one_max_expansion_size in sat_parameters *)

val sat_parameters_set_catch_sigint_signal : sat_parameters -> bool -> unit
  (** set field catch_sigint_signal in sat_parameters *)

val sat_parameters_set_use_implied_bounds : sat_parameters -> bool -> unit
  (** set field use_implied_bounds in sat_parameters *)

val sat_parameters_set_polish_lp_solution : sat_parameters -> bool -> unit
  (** set field polish_lp_solution in sat_parameters *)

val sat_parameters_set_lp_primal_tolerance : sat_parameters -> float -> unit
  (** set field lp_primal_tolerance in sat_parameters *)

val sat_parameters_set_lp_dual_tolerance : sat_parameters -> float -> unit
  (** set field lp_dual_tolerance in sat_parameters *)

val sat_parameters_set_convert_intervals : sat_parameters -> bool -> unit
  (** set field convert_intervals in sat_parameters *)

val sat_parameters_set_symmetry_level : sat_parameters -> int32 -> unit
  (** set field symmetry_level in sat_parameters *)

val sat_parameters_set_use_symmetry_in_lp : sat_parameters -> bool -> unit
  (** set field use_symmetry_in_lp in sat_parameters *)

val sat_parameters_set_keep_symmetry_in_presolve : sat_parameters -> bool -> unit
  (** set field keep_symmetry_in_presolve in sat_parameters *)

val sat_parameters_set_symmetry_detection_deterministic_time_limit : sat_parameters -> float -> unit
  (** set field symmetry_detection_deterministic_time_limit in sat_parameters *)

val sat_parameters_set_new_linear_propagation : sat_parameters -> bool -> unit
  (** set field new_linear_propagation in sat_parameters *)

val sat_parameters_set_linear_split_size : sat_parameters -> int32 -> unit
  (** set field linear_split_size in sat_parameters *)

val sat_parameters_set_linearization_level : sat_parameters -> int32 -> unit
  (** set field linearization_level in sat_parameters *)

val sat_parameters_set_boolean_encoding_level : sat_parameters -> int32 -> unit
  (** set field boolean_encoding_level in sat_parameters *)

val sat_parameters_set_max_domain_size_when_encoding_eq_neq_constraints : sat_parameters -> int32 -> unit
  (** set field max_domain_size_when_encoding_eq_neq_constraints in sat_parameters *)

val sat_parameters_set_max_num_cuts : sat_parameters -> int32 -> unit
  (** set field max_num_cuts in sat_parameters *)

val sat_parameters_set_cut_level : sat_parameters -> int32 -> unit
  (** set field cut_level in sat_parameters *)

val sat_parameters_set_only_add_cuts_at_level_zero : sat_parameters -> bool -> unit
  (** set field only_add_cuts_at_level_zero in sat_parameters *)

val sat_parameters_set_add_objective_cut : sat_parameters -> bool -> unit
  (** set field add_objective_cut in sat_parameters *)

val sat_parameters_set_add_cg_cuts : sat_parameters -> bool -> unit
  (** set field add_cg_cuts in sat_parameters *)

val sat_parameters_set_add_mir_cuts : sat_parameters -> bool -> unit
  (** set field add_mir_cuts in sat_parameters *)

val sat_parameters_set_add_zero_half_cuts : sat_parameters -> bool -> unit
  (** set field add_zero_half_cuts in sat_parameters *)

val sat_parameters_set_add_clique_cuts : sat_parameters -> bool -> unit
  (** set field add_clique_cuts in sat_parameters *)

val sat_parameters_set_add_rlt_cuts : sat_parameters -> bool -> unit
  (** set field add_rlt_cuts in sat_parameters *)

val sat_parameters_set_max_all_diff_cut_size : sat_parameters -> int32 -> unit
  (** set field max_all_diff_cut_size in sat_parameters *)

val sat_parameters_set_add_lin_max_cuts : sat_parameters -> bool -> unit
  (** set field add_lin_max_cuts in sat_parameters *)

val sat_parameters_set_max_integer_rounding_scaling : sat_parameters -> int32 -> unit
  (** set field max_integer_rounding_scaling in sat_parameters *)

val sat_parameters_set_add_lp_constraints_lazily : sat_parameters -> bool -> unit
  (** set field add_lp_constraints_lazily in sat_parameters *)

val sat_parameters_set_root_lp_iterations : sat_parameters -> int32 -> unit
  (** set field root_lp_iterations in sat_parameters *)

val sat_parameters_set_min_orthogonality_for_lp_constraints : sat_parameters -> float -> unit
  (** set field min_orthogonality_for_lp_constraints in sat_parameters *)

val sat_parameters_set_max_cut_rounds_at_level_zero : sat_parameters -> int32 -> unit
  (** set field max_cut_rounds_at_level_zero in sat_parameters *)

val sat_parameters_set_max_consecutive_inactive_count : sat_parameters -> int32 -> unit
  (** set field max_consecutive_inactive_count in sat_parameters *)

val sat_parameters_set_cut_max_active_count_value : sat_parameters -> float -> unit
  (** set field cut_max_active_count_value in sat_parameters *)

val sat_parameters_set_cut_active_count_decay : sat_parameters -> float -> unit
  (** set field cut_active_count_decay in sat_parameters *)

val sat_parameters_set_cut_cleanup_target : sat_parameters -> int32 -> unit
  (** set field cut_cleanup_target in sat_parameters *)

val sat_parameters_set_new_constraints_batch_size : sat_parameters -> int32 -> unit
  (** set field new_constraints_batch_size in sat_parameters *)

val sat_parameters_set_exploit_integer_lp_solution : sat_parameters -> bool -> unit
  (** set field exploit_integer_lp_solution in sat_parameters *)

val sat_parameters_set_exploit_all_lp_solution : sat_parameters -> bool -> unit
  (** set field exploit_all_lp_solution in sat_parameters *)

val sat_parameters_set_exploit_best_solution : sat_parameters -> bool -> unit
  (** set field exploit_best_solution in sat_parameters *)

val sat_parameters_set_exploit_relaxation_solution : sat_parameters -> bool -> unit
  (** set field exploit_relaxation_solution in sat_parameters *)

val sat_parameters_set_exploit_objective : sat_parameters -> bool -> unit
  (** set field exploit_objective in sat_parameters *)

val sat_parameters_set_detect_linearized_product : sat_parameters -> bool -> unit
  (** set field detect_linearized_product in sat_parameters *)

val sat_parameters_set_mip_max_bound : sat_parameters -> float -> unit
  (** set field mip_max_bound in sat_parameters *)

val sat_parameters_set_mip_var_scaling : sat_parameters -> float -> unit
  (** set field mip_var_scaling in sat_parameters *)

val sat_parameters_set_mip_scale_large_domain : sat_parameters -> bool -> unit
  (** set field mip_scale_large_domain in sat_parameters *)

val sat_parameters_set_mip_automatically_scale_variables : sat_parameters -> bool -> unit
  (** set field mip_automatically_scale_variables in sat_parameters *)

val sat_parameters_set_only_solve_ip : sat_parameters -> bool -> unit
  (** set field only_solve_ip in sat_parameters *)

val sat_parameters_set_mip_wanted_precision : sat_parameters -> float -> unit
  (** set field mip_wanted_precision in sat_parameters *)

val sat_parameters_set_mip_max_activity_exponent : sat_parameters -> int32 -> unit
  (** set field mip_max_activity_exponent in sat_parameters *)

val sat_parameters_set_mip_check_precision : sat_parameters -> float -> unit
  (** set field mip_check_precision in sat_parameters *)

val sat_parameters_set_mip_compute_true_objective_bound : sat_parameters -> bool -> unit
  (** set field mip_compute_true_objective_bound in sat_parameters *)

val sat_parameters_set_mip_max_valid_magnitude : sat_parameters -> float -> unit
  (** set field mip_max_valid_magnitude in sat_parameters *)

val sat_parameters_set_mip_treat_high_magnitude_bounds_as_infinity : sat_parameters -> bool -> unit
  (** set field mip_treat_high_magnitude_bounds_as_infinity in sat_parameters *)

val sat_parameters_set_mip_drop_tolerance : sat_parameters -> float -> unit
  (** set field mip_drop_tolerance in sat_parameters *)

val sat_parameters_set_mip_presolve_level : sat_parameters -> int32 -> unit
  (** set field mip_presolve_level in sat_parameters *)


(** {2 Formatters} *)

val pp_sat_parameters_variable_order : Format.formatter -> sat_parameters_variable_order -> unit 
(** [pp_sat_parameters_variable_order v] formats v *)

val pp_sat_parameters_polarity : Format.formatter -> sat_parameters_polarity -> unit 
(** [pp_sat_parameters_polarity v] formats v *)

val pp_sat_parameters_conflict_minimization_algorithm : Format.formatter -> sat_parameters_conflict_minimization_algorithm -> unit 
(** [pp_sat_parameters_conflict_minimization_algorithm v] formats v *)

val pp_sat_parameters_binary_minization_algorithm : Format.formatter -> sat_parameters_binary_minization_algorithm -> unit 
(** [pp_sat_parameters_binary_minization_algorithm v] formats v *)

val pp_sat_parameters_clause_protection : Format.formatter -> sat_parameters_clause_protection -> unit 
(** [pp_sat_parameters_clause_protection v] formats v *)

val pp_sat_parameters_clause_ordering : Format.formatter -> sat_parameters_clause_ordering -> unit 
(** [pp_sat_parameters_clause_ordering v] formats v *)

val pp_sat_parameters_restart_algorithm : Format.formatter -> sat_parameters_restart_algorithm -> unit 
(** [pp_sat_parameters_restart_algorithm v] formats v *)

val pp_sat_parameters_max_sat_assumption_order : Format.formatter -> sat_parameters_max_sat_assumption_order -> unit 
(** [pp_sat_parameters_max_sat_assumption_order v] formats v *)

val pp_sat_parameters_max_sat_stratification_algorithm : Format.formatter -> sat_parameters_max_sat_stratification_algorithm -> unit 
(** [pp_sat_parameters_max_sat_stratification_algorithm v] formats v *)

val pp_sat_parameters_search_branching : Format.formatter -> sat_parameters_search_branching -> unit 
(** [pp_sat_parameters_search_branching v] formats v *)

val pp_sat_parameters_shared_tree_split_strategy : Format.formatter -> sat_parameters_shared_tree_split_strategy -> unit 
(** [pp_sat_parameters_shared_tree_split_strategy v] formats v *)

val pp_sat_parameters_fprounding_method : Format.formatter -> sat_parameters_fprounding_method -> unit 
(** [pp_sat_parameters_fprounding_method v] formats v *)

val pp_sat_parameters : Format.formatter -> sat_parameters -> unit 
(** [pp_sat_parameters v] formats v *)


(** {2 Protobuf Encoding} *)

val encode_pb_sat_parameters_variable_order : sat_parameters_variable_order -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_variable_order v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_polarity : sat_parameters_polarity -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_polarity v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_conflict_minimization_algorithm : sat_parameters_conflict_minimization_algorithm -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_conflict_minimization_algorithm v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_binary_minization_algorithm : sat_parameters_binary_minization_algorithm -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_binary_minization_algorithm v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_clause_protection : sat_parameters_clause_protection -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_clause_protection v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_clause_ordering : sat_parameters_clause_ordering -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_clause_ordering v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_restart_algorithm : sat_parameters_restart_algorithm -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_restart_algorithm v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_max_sat_assumption_order : sat_parameters_max_sat_assumption_order -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_max_sat_assumption_order v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_max_sat_stratification_algorithm : sat_parameters_max_sat_stratification_algorithm -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_max_sat_stratification_algorithm v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_search_branching : sat_parameters_search_branching -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_search_branching v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_shared_tree_split_strategy : sat_parameters_shared_tree_split_strategy -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_shared_tree_split_strategy v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters_fprounding_method : sat_parameters_fprounding_method -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters_fprounding_method v encoder] encodes [v] with the given [encoder] *)

val encode_pb_sat_parameters : sat_parameters -> Pbrt.Encoder.t -> unit
(** [encode_pb_sat_parameters v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_pb_sat_parameters_variable_order : Pbrt.Decoder.t -> sat_parameters_variable_order
(** [decode_pb_sat_parameters_variable_order decoder] decodes a [sat_parameters_variable_order] binary value from [decoder] *)

val decode_pb_sat_parameters_polarity : Pbrt.Decoder.t -> sat_parameters_polarity
(** [decode_pb_sat_parameters_polarity decoder] decodes a [sat_parameters_polarity] binary value from [decoder] *)

val decode_pb_sat_parameters_conflict_minimization_algorithm : Pbrt.Decoder.t -> sat_parameters_conflict_minimization_algorithm
(** [decode_pb_sat_parameters_conflict_minimization_algorithm decoder] decodes a [sat_parameters_conflict_minimization_algorithm] binary value from [decoder] *)

val decode_pb_sat_parameters_binary_minization_algorithm : Pbrt.Decoder.t -> sat_parameters_binary_minization_algorithm
(** [decode_pb_sat_parameters_binary_minization_algorithm decoder] decodes a [sat_parameters_binary_minization_algorithm] binary value from [decoder] *)

val decode_pb_sat_parameters_clause_protection : Pbrt.Decoder.t -> sat_parameters_clause_protection
(** [decode_pb_sat_parameters_clause_protection decoder] decodes a [sat_parameters_clause_protection] binary value from [decoder] *)

val decode_pb_sat_parameters_clause_ordering : Pbrt.Decoder.t -> sat_parameters_clause_ordering
(** [decode_pb_sat_parameters_clause_ordering decoder] decodes a [sat_parameters_clause_ordering] binary value from [decoder] *)

val decode_pb_sat_parameters_restart_algorithm : Pbrt.Decoder.t -> sat_parameters_restart_algorithm
(** [decode_pb_sat_parameters_restart_algorithm decoder] decodes a [sat_parameters_restart_algorithm] binary value from [decoder] *)

val decode_pb_sat_parameters_max_sat_assumption_order : Pbrt.Decoder.t -> sat_parameters_max_sat_assumption_order
(** [decode_pb_sat_parameters_max_sat_assumption_order decoder] decodes a [sat_parameters_max_sat_assumption_order] binary value from [decoder] *)

val decode_pb_sat_parameters_max_sat_stratification_algorithm : Pbrt.Decoder.t -> sat_parameters_max_sat_stratification_algorithm
(** [decode_pb_sat_parameters_max_sat_stratification_algorithm decoder] decodes a [sat_parameters_max_sat_stratification_algorithm] binary value from [decoder] *)

val decode_pb_sat_parameters_search_branching : Pbrt.Decoder.t -> sat_parameters_search_branching
(** [decode_pb_sat_parameters_search_branching decoder] decodes a [sat_parameters_search_branching] binary value from [decoder] *)

val decode_pb_sat_parameters_shared_tree_split_strategy : Pbrt.Decoder.t -> sat_parameters_shared_tree_split_strategy
(** [decode_pb_sat_parameters_shared_tree_split_strategy decoder] decodes a [sat_parameters_shared_tree_split_strategy] binary value from [decoder] *)

val decode_pb_sat_parameters_fprounding_method : Pbrt.Decoder.t -> sat_parameters_fprounding_method
(** [decode_pb_sat_parameters_fprounding_method decoder] decodes a [sat_parameters_fprounding_method] binary value from [decoder] *)

val decode_pb_sat_parameters : Pbrt.Decoder.t -> sat_parameters
(** [decode_pb_sat_parameters decoder] decodes a [sat_parameters] binary value from [decoder] *)
