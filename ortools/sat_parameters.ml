[@@@ocaml.warning "-23-27-30-39-44"]

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

type sat_parameters = {
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

let default_sat_parameters_variable_order () = (In_order:sat_parameters_variable_order)

let default_sat_parameters_polarity () = (Polarity_true:sat_parameters_polarity)

let default_sat_parameters_conflict_minimization_algorithm () = (None:sat_parameters_conflict_minimization_algorithm)

let default_sat_parameters_binary_minization_algorithm () = (No_binary_minimization:sat_parameters_binary_minization_algorithm)

let default_sat_parameters_clause_protection () = (Protection_none:sat_parameters_clause_protection)

let default_sat_parameters_clause_ordering () = (Clause_activity:sat_parameters_clause_ordering)

let default_sat_parameters_restart_algorithm () = (No_restart:sat_parameters_restart_algorithm)

let default_sat_parameters_max_sat_assumption_order () = (Default_assumption_order:sat_parameters_max_sat_assumption_order)

let default_sat_parameters_max_sat_stratification_algorithm () = (Stratification_none:sat_parameters_max_sat_stratification_algorithm)

let default_sat_parameters_search_branching () = (Automatic_search:sat_parameters_search_branching)

let default_sat_parameters_shared_tree_split_strategy () = (Split_strategy_auto:sat_parameters_shared_tree_split_strategy)

let default_sat_parameters_fprounding_method () = (Nearest_integer:sat_parameters_fprounding_method)

let default_sat_parameters (): sat_parameters =
{
  _presence=Pbrt.Bitfield.empty;
  name="";
  preferred_variable_order=default_sat_parameters_variable_order ();
  initial_polarity=default_sat_parameters_polarity ();
  use_phase_saving=false;
  polarity_rephase_increment=0l;
  polarity_exploit_ls_hints=false;
  random_polarity_ratio=0.;
  random_branches_ratio=0.;
  use_erwa_heuristic=false;
  initial_variables_activity=0.;
  also_bump_variables_in_conflict_reasons=false;
  minimization_algorithm=default_sat_parameters_conflict_minimization_algorithm ();
  binary_minimization_algorithm=default_sat_parameters_binary_minization_algorithm ();
  subsumption_during_conflict_analysis=false;
  clause_cleanup_period=0l;
  clause_cleanup_target=0l;
  clause_cleanup_ratio=0.;
  clause_cleanup_protection=default_sat_parameters_clause_protection ();
  clause_cleanup_lbd_bound=0l;
  clause_cleanup_ordering=default_sat_parameters_clause_ordering ();
  pb_cleanup_increment=0l;
  pb_cleanup_ratio=0.;
  variable_activity_decay=0.;
  max_variable_activity_value=0.;
  glucose_max_decay=0.;
  glucose_decay_increment=0.;
  glucose_decay_increment_period=0l;
  clause_activity_decay=0.;
  max_clause_activity_value=0.;
  restart_algorithms=[];
  default_restart_algorithms="";
  restart_period=0l;
  restart_running_window_size=0l;
  restart_dl_average_ratio=0.;
  restart_lbd_average_ratio=0.;
  use_blocking_restart=false;
  blocking_restart_window_size=0l;
  blocking_restart_multiplier=0.;
  num_conflicts_before_strategy_changes=0l;
  strategy_change_increase_ratio=0.;
  max_time_in_seconds=0.;
  max_deterministic_time=0.;
  max_num_deterministic_batches=0l;
  max_number_of_conflicts=0L;
  max_memory_in_mb=0L;
  absolute_gap_limit=0.;
  relative_gap_limit=0.;
  random_seed=0l;
  permute_variable_randomly=false;
  permute_presolve_constraint_order=false;
  use_absl_random=false;
  log_search_progress=false;
  log_subsolver_statistics=false;
  log_prefix="";
  log_to_stdout=false;
  log_to_response=false;
  use_pb_resolution=false;
  minimize_reduction_during_pb_resolution=false;
  count_assumption_levels_in_lbd=false;
  presolve_bve_threshold=0l;
  presolve_bve_clause_weight=0l;
  probing_deterministic_time_limit=0.;
  presolve_probing_deterministic_time_limit=0.;
  presolve_blocked_clause=None;
  presolve_use_bva=None;
  presolve_bva_threshold=None;
  max_presolve_iterations=None;
  cp_model_presolve=None;
  cp_model_probing_level=None;
  cp_model_use_sat_presolve=None;
  remove_fixed_variables_early=None;
  detect_table_with_cost=None;
  table_compression_level=None;
  expand_alldiff_constraints=None;
  expand_reservoir_constraints=None;
  expand_reservoir_using_circuit=None;
  encode_cumulative_as_reservoir=None;
  max_lin_max_size_for_expansion=None;
  disable_constraint_expansion=None;
  encode_complex_linear_constraint_with_integer=None;
  merge_no_overlap_work_limit=None;
  merge_at_most_one_work_limit=None;
  presolve_substitution_level=None;
  presolve_extract_integer_enforcement=None;
  presolve_inclusion_work_limit=None;
  ignore_names=None;
  infer_all_diffs=None;
  find_big_linear_overlap=None;
  use_sat_inprocessing=None;
  inprocessing_dtime_ratio=None;
  inprocessing_probing_dtime=None;
  inprocessing_minimization_dtime=None;
  inprocessing_minimization_use_conflict_analysis=None;
  inprocessing_minimization_use_all_orderings=None;
  num_workers=None;
  num_search_workers=None;
  num_full_subsolvers=None;
  subsolvers=[];
  extra_subsolvers=[];
  ignore_subsolvers=[];
  filter_subsolvers=[];
  subsolver_params=[];
  interleave_search=None;
  interleave_batch_size=None;
  share_objective_bounds=None;
  share_level_zero_bounds=None;
  share_binary_clauses=None;
  share_glue_clauses=None;
  minimize_shared_clauses=None;
  debug_postsolve_with_full_solver=None;
  debug_max_num_presolve_operations=None;
  debug_crash_on_bad_hint=None;
  debug_crash_if_presolve_breaks_hint=None;
  use_optimization_hints=None;
  core_minimization_level=None;
  find_multiple_cores=None;
  cover_optimization=None;
  max_sat_assumption_order=None;
  max_sat_reverse_assumption_order=None;
  max_sat_stratification=None;
  propagation_loop_detection_factor=None;
  use_precedences_in_disjunctive_constraint=None;
  max_size_to_create_precedence_literals_in_disjunctive=None;
  use_strong_propagation_in_disjunctive=None;
  use_dynamic_precedence_in_disjunctive=None;
  use_dynamic_precedence_in_cumulative=None;
  use_overload_checker_in_cumulative=None;
  use_conservative_scale_overload_checker=None;
  use_timetable_edge_finding_in_cumulative=None;
  max_num_intervals_for_timetable_edge_finding=None;
  use_hard_precedences_in_cumulative=None;
  exploit_all_precedences=None;
  use_disjunctive_constraint_in_cumulative=None;
  use_timetabling_in_no_overlap_2d=None;
  use_energetic_reasoning_in_no_overlap_2d=None;
  use_area_energetic_reasoning_in_no_overlap_2d=None;
  use_try_edge_reasoning_in_no_overlap_2d=None;
  max_pairs_pairwise_reasoning_in_no_overlap_2d=None;
  maximum_regions_to_split_in_disconnected_no_overlap_2d=None;
  use_dual_scheduling_heuristics=None;
  use_all_different_for_circuit=None;
  routing_cut_subset_size_for_binary_relation_bound=None;
  routing_cut_subset_size_for_tight_binary_relation_bound=None;
  routing_cut_dp_effort=None;
  search_branching=None;
  hint_conflict_limit=None;
  repair_hint=None;
  fix_variables_to_their_hinted_value=None;
  use_probing_search=None;
  use_extended_probing=None;
  probing_num_combinations_limit=None;
  use_shaving_in_probing_search=None;
  shaving_search_deterministic_time=None;
  shaving_search_threshold=None;
  use_objective_lb_search=None;
  use_objective_shaving_search=None;
  use_variables_shaving_search=None;
  pseudo_cost_reliability_threshold=None;
  optimize_with_core=None;
  optimize_with_lb_tree_search=None;
  save_lp_basis_in_lb_tree_search=None;
  binary_search_num_conflicts=None;
  optimize_with_max_hs=None;
  use_feasibility_jump=None;
  use_ls_only=None;
  feasibility_jump_decay=None;
  feasibility_jump_linearization_level=None;
  feasibility_jump_restart_factor=None;
  feasibility_jump_batch_dtime=None;
  feasibility_jump_var_randomization_probability=None;
  feasibility_jump_var_perburbation_range_ratio=None;
  feasibility_jump_enable_restarts=None;
  feasibility_jump_max_expanded_constraint_size=None;
  num_violation_ls=None;
  violation_ls_perturbation_period=None;
  violation_ls_compound_move_probability=None;
  shared_tree_num_workers=None;
  use_shared_tree_search=None;
  shared_tree_worker_min_restarts_per_subtree=None;
  shared_tree_worker_enable_trail_sharing=None;
  shared_tree_worker_enable_phase_sharing=None;
  shared_tree_open_leaves_per_worker=None;
  shared_tree_max_nodes_per_worker=None;
  shared_tree_split_strategy=None;
  shared_tree_balance_tolerance=None;
  enumerate_all_solutions=None;
  keep_all_feasible_solutions_in_presolve=None;
  fill_tightened_domains_in_response=None;
  fill_additional_solutions_in_response=None;
  instantiate_all_variables=None;
  auto_detect_greater_than_at_least_one_of=None;
  stop_after_first_solution=None;
  stop_after_presolve=None;
  stop_after_root_propagation=None;
  lns_initial_difficulty=None;
  lns_initial_deterministic_limit=None;
  use_lns=None;
  use_lns_only=None;
  solution_pool_size=None;
  use_rins_lns=None;
  use_feasibility_pump=None;
  use_lb_relax_lns=None;
  lb_relax_num_workers_threshold=None;
  fp_rounding=None;
  diversify_lns_params=None;
  randomize_search=None;
  search_random_variable_pool_size=None;
  push_all_tasks_toward_start=None;
  use_optional_variables=None;
  use_exact_lp_reason=None;
  use_combined_no_overlap=None;
  at_most_one_max_expansion_size=None;
  catch_sigint_signal=None;
  use_implied_bounds=None;
  polish_lp_solution=None;
  lp_primal_tolerance=None;
  lp_dual_tolerance=None;
  convert_intervals=None;
  symmetry_level=None;
  use_symmetry_in_lp=None;
  keep_symmetry_in_presolve=None;
  symmetry_detection_deterministic_time_limit=None;
  new_linear_propagation=None;
  linear_split_size=None;
  linearization_level=None;
  boolean_encoding_level=None;
  max_domain_size_when_encoding_eq_neq_constraints=None;
  max_num_cuts=None;
  cut_level=None;
  only_add_cuts_at_level_zero=None;
  add_objective_cut=None;
  add_cg_cuts=None;
  add_mir_cuts=None;
  add_zero_half_cuts=None;
  add_clique_cuts=None;
  add_rlt_cuts=None;
  max_all_diff_cut_size=None;
  add_lin_max_cuts=None;
  max_integer_rounding_scaling=None;
  add_lp_constraints_lazily=None;
  root_lp_iterations=None;
  min_orthogonality_for_lp_constraints=None;
  max_cut_rounds_at_level_zero=None;
  max_consecutive_inactive_count=None;
  cut_max_active_count_value=None;
  cut_active_count_decay=None;
  cut_cleanup_target=None;
  new_constraints_batch_size=None;
  exploit_integer_lp_solution=None;
  exploit_all_lp_solution=None;
  exploit_best_solution=None;
  exploit_relaxation_solution=None;
  exploit_objective=None;
  detect_linearized_product=None;
  mip_max_bound=None;
  mip_var_scaling=None;
  mip_scale_large_domain=None;
  mip_automatically_scale_variables=None;
  only_solve_ip=None;
  mip_wanted_precision=None;
  mip_max_activity_exponent=None;
  mip_check_precision=None;
  mip_compute_true_objective_bound=None;
  mip_max_valid_magnitude=None;
  mip_treat_high_magnitude_bounds_as_infinity=None;
  mip_drop_tolerance=None;
  mip_presolve_level=None;
}


(** {2 Make functions} *)

let[@inline] sat_parameters_has_name (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 0)
let[@inline] sat_parameters_has_preferred_variable_order (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 1)
let[@inline] sat_parameters_has_initial_polarity (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 2)
let[@inline] sat_parameters_has_use_phase_saving (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 3)
let[@inline] sat_parameters_has_polarity_rephase_increment (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 4)
let[@inline] sat_parameters_has_polarity_exploit_ls_hints (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 5)
let[@inline] sat_parameters_has_random_polarity_ratio (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 6)
let[@inline] sat_parameters_has_random_branches_ratio (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 7)
let[@inline] sat_parameters_has_use_erwa_heuristic (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 8)
let[@inline] sat_parameters_has_initial_variables_activity (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 9)
let[@inline] sat_parameters_has_also_bump_variables_in_conflict_reasons (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 10)
let[@inline] sat_parameters_has_minimization_algorithm (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 11)
let[@inline] sat_parameters_has_binary_minimization_algorithm (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 12)
let[@inline] sat_parameters_has_subsumption_during_conflict_analysis (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 13)
let[@inline] sat_parameters_has_clause_cleanup_period (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 14)
let[@inline] sat_parameters_has_clause_cleanup_target (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 15)
let[@inline] sat_parameters_has_clause_cleanup_ratio (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 16)
let[@inline] sat_parameters_has_clause_cleanup_protection (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 17)
let[@inline] sat_parameters_has_clause_cleanup_lbd_bound (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 18)
let[@inline] sat_parameters_has_clause_cleanup_ordering (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 19)
let[@inline] sat_parameters_has_pb_cleanup_increment (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 20)
let[@inline] sat_parameters_has_pb_cleanup_ratio (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 21)
let[@inline] sat_parameters_has_variable_activity_decay (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 22)
let[@inline] sat_parameters_has_max_variable_activity_value (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 23)
let[@inline] sat_parameters_has_glucose_max_decay (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 24)
let[@inline] sat_parameters_has_glucose_decay_increment (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 25)
let[@inline] sat_parameters_has_glucose_decay_increment_period (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 26)
let[@inline] sat_parameters_has_clause_activity_decay (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 27)
let[@inline] sat_parameters_has_max_clause_activity_value (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 28)
let[@inline] sat_parameters_has_default_restart_algorithms (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 29)
let[@inline] sat_parameters_has_restart_period (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 30)
let[@inline] sat_parameters_has_restart_running_window_size (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 31)
let[@inline] sat_parameters_has_restart_dl_average_ratio (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 32)
let[@inline] sat_parameters_has_restart_lbd_average_ratio (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 33)
let[@inline] sat_parameters_has_use_blocking_restart (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 34)
let[@inline] sat_parameters_has_blocking_restart_window_size (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 35)
let[@inline] sat_parameters_has_blocking_restart_multiplier (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 36)
let[@inline] sat_parameters_has_num_conflicts_before_strategy_changes (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 37)
let[@inline] sat_parameters_has_strategy_change_increase_ratio (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 38)
let[@inline] sat_parameters_has_max_time_in_seconds (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 39)
let[@inline] sat_parameters_has_max_deterministic_time (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 40)
let[@inline] sat_parameters_has_max_num_deterministic_batches (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 41)
let[@inline] sat_parameters_has_max_number_of_conflicts (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 42)
let[@inline] sat_parameters_has_max_memory_in_mb (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 43)
let[@inline] sat_parameters_has_absolute_gap_limit (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 44)
let[@inline] sat_parameters_has_relative_gap_limit (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 45)
let[@inline] sat_parameters_has_random_seed (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 46)
let[@inline] sat_parameters_has_permute_variable_randomly (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 47)
let[@inline] sat_parameters_has_permute_presolve_constraint_order (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 48)
let[@inline] sat_parameters_has_use_absl_random (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 49)
let[@inline] sat_parameters_has_log_search_progress (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 50)
let[@inline] sat_parameters_has_log_subsolver_statistics (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 51)
let[@inline] sat_parameters_has_log_prefix (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 52)
let[@inline] sat_parameters_has_log_to_stdout (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 53)
let[@inline] sat_parameters_has_log_to_response (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 54)
let[@inline] sat_parameters_has_use_pb_resolution (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 55)
let[@inline] sat_parameters_has_minimize_reduction_during_pb_resolution (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 56)
let[@inline] sat_parameters_has_count_assumption_levels_in_lbd (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 57)
let[@inline] sat_parameters_has_presolve_bve_threshold (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 58)
let[@inline] sat_parameters_has_presolve_bve_clause_weight (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 59)
let[@inline] sat_parameters_has_probing_deterministic_time_limit (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 60)
let[@inline] sat_parameters_has_presolve_probing_deterministic_time_limit (self:sat_parameters) : bool = (Pbrt.Bitfield.get self._presence 61)

let[@inline] sat_parameters_set_name (self:sat_parameters) (x:string) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.name <- x
let[@inline] sat_parameters_set_preferred_variable_order (self:sat_parameters) (x:sat_parameters_variable_order) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 1); self.preferred_variable_order <- x
let[@inline] sat_parameters_set_initial_polarity (self:sat_parameters) (x:sat_parameters_polarity) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 2); self.initial_polarity <- x
let[@inline] sat_parameters_set_use_phase_saving (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 3); self.use_phase_saving <- x
let[@inline] sat_parameters_set_polarity_rephase_increment (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 4); self.polarity_rephase_increment <- x
let[@inline] sat_parameters_set_polarity_exploit_ls_hints (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 5); self.polarity_exploit_ls_hints <- x
let[@inline] sat_parameters_set_random_polarity_ratio (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 6); self.random_polarity_ratio <- x
let[@inline] sat_parameters_set_random_branches_ratio (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 7); self.random_branches_ratio <- x
let[@inline] sat_parameters_set_use_erwa_heuristic (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 8); self.use_erwa_heuristic <- x
let[@inline] sat_parameters_set_initial_variables_activity (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 9); self.initial_variables_activity <- x
let[@inline] sat_parameters_set_also_bump_variables_in_conflict_reasons (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 10); self.also_bump_variables_in_conflict_reasons <- x
let[@inline] sat_parameters_set_minimization_algorithm (self:sat_parameters) (x:sat_parameters_conflict_minimization_algorithm) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 11); self.minimization_algorithm <- x
let[@inline] sat_parameters_set_binary_minimization_algorithm (self:sat_parameters) (x:sat_parameters_binary_minization_algorithm) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 12); self.binary_minimization_algorithm <- x
let[@inline] sat_parameters_set_subsumption_during_conflict_analysis (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 13); self.subsumption_during_conflict_analysis <- x
let[@inline] sat_parameters_set_clause_cleanup_period (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 14); self.clause_cleanup_period <- x
let[@inline] sat_parameters_set_clause_cleanup_target (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 15); self.clause_cleanup_target <- x
let[@inline] sat_parameters_set_clause_cleanup_ratio (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 16); self.clause_cleanup_ratio <- x
let[@inline] sat_parameters_set_clause_cleanup_protection (self:sat_parameters) (x:sat_parameters_clause_protection) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 17); self.clause_cleanup_protection <- x
let[@inline] sat_parameters_set_clause_cleanup_lbd_bound (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 18); self.clause_cleanup_lbd_bound <- x
let[@inline] sat_parameters_set_clause_cleanup_ordering (self:sat_parameters) (x:sat_parameters_clause_ordering) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 19); self.clause_cleanup_ordering <- x
let[@inline] sat_parameters_set_pb_cleanup_increment (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 20); self.pb_cleanup_increment <- x
let[@inline] sat_parameters_set_pb_cleanup_ratio (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 21); self.pb_cleanup_ratio <- x
let[@inline] sat_parameters_set_variable_activity_decay (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 22); self.variable_activity_decay <- x
let[@inline] sat_parameters_set_max_variable_activity_value (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 23); self.max_variable_activity_value <- x
let[@inline] sat_parameters_set_glucose_max_decay (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 24); self.glucose_max_decay <- x
let[@inline] sat_parameters_set_glucose_decay_increment (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 25); self.glucose_decay_increment <- x
let[@inline] sat_parameters_set_glucose_decay_increment_period (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 26); self.glucose_decay_increment_period <- x
let[@inline] sat_parameters_set_clause_activity_decay (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 27); self.clause_activity_decay <- x
let[@inline] sat_parameters_set_max_clause_activity_value (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 28); self.max_clause_activity_value <- x
let[@inline] sat_parameters_set_restart_algorithms (self:sat_parameters) (x:sat_parameters_restart_algorithm list) : unit =
  self.restart_algorithms <- x
let[@inline] sat_parameters_set_default_restart_algorithms (self:sat_parameters) (x:string) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 29); self.default_restart_algorithms <- x
let[@inline] sat_parameters_set_restart_period (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 30); self.restart_period <- x
let[@inline] sat_parameters_set_restart_running_window_size (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 31); self.restart_running_window_size <- x
let[@inline] sat_parameters_set_restart_dl_average_ratio (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 32); self.restart_dl_average_ratio <- x
let[@inline] sat_parameters_set_restart_lbd_average_ratio (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 33); self.restart_lbd_average_ratio <- x
let[@inline] sat_parameters_set_use_blocking_restart (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 34); self.use_blocking_restart <- x
let[@inline] sat_parameters_set_blocking_restart_window_size (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 35); self.blocking_restart_window_size <- x
let[@inline] sat_parameters_set_blocking_restart_multiplier (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 36); self.blocking_restart_multiplier <- x
let[@inline] sat_parameters_set_num_conflicts_before_strategy_changes (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 37); self.num_conflicts_before_strategy_changes <- x
let[@inline] sat_parameters_set_strategy_change_increase_ratio (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 38); self.strategy_change_increase_ratio <- x
let[@inline] sat_parameters_set_max_time_in_seconds (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 39); self.max_time_in_seconds <- x
let[@inline] sat_parameters_set_max_deterministic_time (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 40); self.max_deterministic_time <- x
let[@inline] sat_parameters_set_max_num_deterministic_batches (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 41); self.max_num_deterministic_batches <- x
let[@inline] sat_parameters_set_max_number_of_conflicts (self:sat_parameters) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 42); self.max_number_of_conflicts <- x
let[@inline] sat_parameters_set_max_memory_in_mb (self:sat_parameters) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 43); self.max_memory_in_mb <- x
let[@inline] sat_parameters_set_absolute_gap_limit (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 44); self.absolute_gap_limit <- x
let[@inline] sat_parameters_set_relative_gap_limit (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 45); self.relative_gap_limit <- x
let[@inline] sat_parameters_set_random_seed (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 46); self.random_seed <- x
let[@inline] sat_parameters_set_permute_variable_randomly (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 47); self.permute_variable_randomly <- x
let[@inline] sat_parameters_set_permute_presolve_constraint_order (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 48); self.permute_presolve_constraint_order <- x
let[@inline] sat_parameters_set_use_absl_random (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 49); self.use_absl_random <- x
let[@inline] sat_parameters_set_log_search_progress (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 50); self.log_search_progress <- x
let[@inline] sat_parameters_set_log_subsolver_statistics (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 51); self.log_subsolver_statistics <- x
let[@inline] sat_parameters_set_log_prefix (self:sat_parameters) (x:string) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 52); self.log_prefix <- x
let[@inline] sat_parameters_set_log_to_stdout (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 53); self.log_to_stdout <- x
let[@inline] sat_parameters_set_log_to_response (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 54); self.log_to_response <- x
let[@inline] sat_parameters_set_use_pb_resolution (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 55); self.use_pb_resolution <- x
let[@inline] sat_parameters_set_minimize_reduction_during_pb_resolution (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 56); self.minimize_reduction_during_pb_resolution <- x
let[@inline] sat_parameters_set_count_assumption_levels_in_lbd (self:sat_parameters) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 57); self.count_assumption_levels_in_lbd <- x
let[@inline] sat_parameters_set_presolve_bve_threshold (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 58); self.presolve_bve_threshold <- x
let[@inline] sat_parameters_set_presolve_bve_clause_weight (self:sat_parameters) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 59); self.presolve_bve_clause_weight <- x
let[@inline] sat_parameters_set_probing_deterministic_time_limit (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 60); self.probing_deterministic_time_limit <- x
let[@inline] sat_parameters_set_presolve_probing_deterministic_time_limit (self:sat_parameters) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 61); self.presolve_probing_deterministic_time_limit <- x
let[@inline] sat_parameters_set_presolve_blocked_clause (self:sat_parameters) (x:bool) : unit =
  self.presolve_blocked_clause <- Some x
let[@inline] sat_parameters_set_presolve_use_bva (self:sat_parameters) (x:bool) : unit =
  self.presolve_use_bva <- Some x
let[@inline] sat_parameters_set_presolve_bva_threshold (self:sat_parameters) (x:int32) : unit =
  self.presolve_bva_threshold <- Some x
let[@inline] sat_parameters_set_max_presolve_iterations (self:sat_parameters) (x:int32) : unit =
  self.max_presolve_iterations <- Some x
let[@inline] sat_parameters_set_cp_model_presolve (self:sat_parameters) (x:bool) : unit =
  self.cp_model_presolve <- Some x
let[@inline] sat_parameters_set_cp_model_probing_level (self:sat_parameters) (x:int32) : unit =
  self.cp_model_probing_level <- Some x
let[@inline] sat_parameters_set_cp_model_use_sat_presolve (self:sat_parameters) (x:bool) : unit =
  self.cp_model_use_sat_presolve <- Some x
let[@inline] sat_parameters_set_remove_fixed_variables_early (self:sat_parameters) (x:bool) : unit =
  self.remove_fixed_variables_early <- Some x
let[@inline] sat_parameters_set_detect_table_with_cost (self:sat_parameters) (x:bool) : unit =
  self.detect_table_with_cost <- Some x
let[@inline] sat_parameters_set_table_compression_level (self:sat_parameters) (x:int32) : unit =
  self.table_compression_level <- Some x
let[@inline] sat_parameters_set_expand_alldiff_constraints (self:sat_parameters) (x:bool) : unit =
  self.expand_alldiff_constraints <- Some x
let[@inline] sat_parameters_set_expand_reservoir_constraints (self:sat_parameters) (x:bool) : unit =
  self.expand_reservoir_constraints <- Some x
let[@inline] sat_parameters_set_expand_reservoir_using_circuit (self:sat_parameters) (x:bool) : unit =
  self.expand_reservoir_using_circuit <- Some x
let[@inline] sat_parameters_set_encode_cumulative_as_reservoir (self:sat_parameters) (x:bool) : unit =
  self.encode_cumulative_as_reservoir <- Some x
let[@inline] sat_parameters_set_max_lin_max_size_for_expansion (self:sat_parameters) (x:int32) : unit =
  self.max_lin_max_size_for_expansion <- Some x
let[@inline] sat_parameters_set_disable_constraint_expansion (self:sat_parameters) (x:bool) : unit =
  self.disable_constraint_expansion <- Some x
let[@inline] sat_parameters_set_encode_complex_linear_constraint_with_integer (self:sat_parameters) (x:bool) : unit =
  self.encode_complex_linear_constraint_with_integer <- Some x
let[@inline] sat_parameters_set_merge_no_overlap_work_limit (self:sat_parameters) (x:float) : unit =
  self.merge_no_overlap_work_limit <- Some x
let[@inline] sat_parameters_set_merge_at_most_one_work_limit (self:sat_parameters) (x:float) : unit =
  self.merge_at_most_one_work_limit <- Some x
let[@inline] sat_parameters_set_presolve_substitution_level (self:sat_parameters) (x:int32) : unit =
  self.presolve_substitution_level <- Some x
let[@inline] sat_parameters_set_presolve_extract_integer_enforcement (self:sat_parameters) (x:bool) : unit =
  self.presolve_extract_integer_enforcement <- Some x
let[@inline] sat_parameters_set_presolve_inclusion_work_limit (self:sat_parameters) (x:int64) : unit =
  self.presolve_inclusion_work_limit <- Some x
let[@inline] sat_parameters_set_ignore_names (self:sat_parameters) (x:bool) : unit =
  self.ignore_names <- Some x
let[@inline] sat_parameters_set_infer_all_diffs (self:sat_parameters) (x:bool) : unit =
  self.infer_all_diffs <- Some x
let[@inline] sat_parameters_set_find_big_linear_overlap (self:sat_parameters) (x:bool) : unit =
  self.find_big_linear_overlap <- Some x
let[@inline] sat_parameters_set_use_sat_inprocessing (self:sat_parameters) (x:bool) : unit =
  self.use_sat_inprocessing <- Some x
let[@inline] sat_parameters_set_inprocessing_dtime_ratio (self:sat_parameters) (x:float) : unit =
  self.inprocessing_dtime_ratio <- Some x
let[@inline] sat_parameters_set_inprocessing_probing_dtime (self:sat_parameters) (x:float) : unit =
  self.inprocessing_probing_dtime <- Some x
let[@inline] sat_parameters_set_inprocessing_minimization_dtime (self:sat_parameters) (x:float) : unit =
  self.inprocessing_minimization_dtime <- Some x
let[@inline] sat_parameters_set_inprocessing_minimization_use_conflict_analysis (self:sat_parameters) (x:bool) : unit =
  self.inprocessing_minimization_use_conflict_analysis <- Some x
let[@inline] sat_parameters_set_inprocessing_minimization_use_all_orderings (self:sat_parameters) (x:bool) : unit =
  self.inprocessing_minimization_use_all_orderings <- Some x
let[@inline] sat_parameters_set_num_workers (self:sat_parameters) (x:int32) : unit =
  self.num_workers <- Some x
let[@inline] sat_parameters_set_num_search_workers (self:sat_parameters) (x:int32) : unit =
  self.num_search_workers <- Some x
let[@inline] sat_parameters_set_num_full_subsolvers (self:sat_parameters) (x:int32) : unit =
  self.num_full_subsolvers <- Some x
let[@inline] sat_parameters_set_subsolvers (self:sat_parameters) (x:string list) : unit =
  self.subsolvers <- x
let[@inline] sat_parameters_set_extra_subsolvers (self:sat_parameters) (x:string list) : unit =
  self.extra_subsolvers <- x
let[@inline] sat_parameters_set_ignore_subsolvers (self:sat_parameters) (x:string list) : unit =
  self.ignore_subsolvers <- x
let[@inline] sat_parameters_set_filter_subsolvers (self:sat_parameters) (x:string list) : unit =
  self.filter_subsolvers <- x
let[@inline] sat_parameters_set_subsolver_params (self:sat_parameters) (x:sat_parameters list) : unit =
  self.subsolver_params <- x
let[@inline] sat_parameters_set_interleave_search (self:sat_parameters) (x:bool) : unit =
  self.interleave_search <- Some x
let[@inline] sat_parameters_set_interleave_batch_size (self:sat_parameters) (x:int32) : unit =
  self.interleave_batch_size <- Some x
let[@inline] sat_parameters_set_share_objective_bounds (self:sat_parameters) (x:bool) : unit =
  self.share_objective_bounds <- Some x
let[@inline] sat_parameters_set_share_level_zero_bounds (self:sat_parameters) (x:bool) : unit =
  self.share_level_zero_bounds <- Some x
let[@inline] sat_parameters_set_share_binary_clauses (self:sat_parameters) (x:bool) : unit =
  self.share_binary_clauses <- Some x
let[@inline] sat_parameters_set_share_glue_clauses (self:sat_parameters) (x:bool) : unit =
  self.share_glue_clauses <- Some x
let[@inline] sat_parameters_set_minimize_shared_clauses (self:sat_parameters) (x:bool) : unit =
  self.minimize_shared_clauses <- Some x
let[@inline] sat_parameters_set_debug_postsolve_with_full_solver (self:sat_parameters) (x:bool) : unit =
  self.debug_postsolve_with_full_solver <- Some x
let[@inline] sat_parameters_set_debug_max_num_presolve_operations (self:sat_parameters) (x:int32) : unit =
  self.debug_max_num_presolve_operations <- Some x
let[@inline] sat_parameters_set_debug_crash_on_bad_hint (self:sat_parameters) (x:bool) : unit =
  self.debug_crash_on_bad_hint <- Some x
let[@inline] sat_parameters_set_debug_crash_if_presolve_breaks_hint (self:sat_parameters) (x:bool) : unit =
  self.debug_crash_if_presolve_breaks_hint <- Some x
let[@inline] sat_parameters_set_use_optimization_hints (self:sat_parameters) (x:bool) : unit =
  self.use_optimization_hints <- Some x
let[@inline] sat_parameters_set_core_minimization_level (self:sat_parameters) (x:int32) : unit =
  self.core_minimization_level <- Some x
let[@inline] sat_parameters_set_find_multiple_cores (self:sat_parameters) (x:bool) : unit =
  self.find_multiple_cores <- Some x
let[@inline] sat_parameters_set_cover_optimization (self:sat_parameters) (x:bool) : unit =
  self.cover_optimization <- Some x
let[@inline] sat_parameters_set_max_sat_assumption_order (self:sat_parameters) (x:sat_parameters_max_sat_assumption_order) : unit =
  self.max_sat_assumption_order <- Some x
let[@inline] sat_parameters_set_max_sat_reverse_assumption_order (self:sat_parameters) (x:bool) : unit =
  self.max_sat_reverse_assumption_order <- Some x
let[@inline] sat_parameters_set_max_sat_stratification (self:sat_parameters) (x:sat_parameters_max_sat_stratification_algorithm) : unit =
  self.max_sat_stratification <- Some x
let[@inline] sat_parameters_set_propagation_loop_detection_factor (self:sat_parameters) (x:float) : unit =
  self.propagation_loop_detection_factor <- Some x
let[@inline] sat_parameters_set_use_precedences_in_disjunctive_constraint (self:sat_parameters) (x:bool) : unit =
  self.use_precedences_in_disjunctive_constraint <- Some x
let[@inline] sat_parameters_set_max_size_to_create_precedence_literals_in_disjunctive (self:sat_parameters) (x:int32) : unit =
  self.max_size_to_create_precedence_literals_in_disjunctive <- Some x
let[@inline] sat_parameters_set_use_strong_propagation_in_disjunctive (self:sat_parameters) (x:bool) : unit =
  self.use_strong_propagation_in_disjunctive <- Some x
let[@inline] sat_parameters_set_use_dynamic_precedence_in_disjunctive (self:sat_parameters) (x:bool) : unit =
  self.use_dynamic_precedence_in_disjunctive <- Some x
let[@inline] sat_parameters_set_use_dynamic_precedence_in_cumulative (self:sat_parameters) (x:bool) : unit =
  self.use_dynamic_precedence_in_cumulative <- Some x
let[@inline] sat_parameters_set_use_overload_checker_in_cumulative (self:sat_parameters) (x:bool) : unit =
  self.use_overload_checker_in_cumulative <- Some x
let[@inline] sat_parameters_set_use_conservative_scale_overload_checker (self:sat_parameters) (x:bool) : unit =
  self.use_conservative_scale_overload_checker <- Some x
let[@inline] sat_parameters_set_use_timetable_edge_finding_in_cumulative (self:sat_parameters) (x:bool) : unit =
  self.use_timetable_edge_finding_in_cumulative <- Some x
let[@inline] sat_parameters_set_max_num_intervals_for_timetable_edge_finding (self:sat_parameters) (x:int32) : unit =
  self.max_num_intervals_for_timetable_edge_finding <- Some x
let[@inline] sat_parameters_set_use_hard_precedences_in_cumulative (self:sat_parameters) (x:bool) : unit =
  self.use_hard_precedences_in_cumulative <- Some x
let[@inline] sat_parameters_set_exploit_all_precedences (self:sat_parameters) (x:bool) : unit =
  self.exploit_all_precedences <- Some x
let[@inline] sat_parameters_set_use_disjunctive_constraint_in_cumulative (self:sat_parameters) (x:bool) : unit =
  self.use_disjunctive_constraint_in_cumulative <- Some x
let[@inline] sat_parameters_set_use_timetabling_in_no_overlap_2d (self:sat_parameters) (x:bool) : unit =
  self.use_timetabling_in_no_overlap_2d <- Some x
let[@inline] sat_parameters_set_use_energetic_reasoning_in_no_overlap_2d (self:sat_parameters) (x:bool) : unit =
  self.use_energetic_reasoning_in_no_overlap_2d <- Some x
let[@inline] sat_parameters_set_use_area_energetic_reasoning_in_no_overlap_2d (self:sat_parameters) (x:bool) : unit =
  self.use_area_energetic_reasoning_in_no_overlap_2d <- Some x
let[@inline] sat_parameters_set_use_try_edge_reasoning_in_no_overlap_2d (self:sat_parameters) (x:bool) : unit =
  self.use_try_edge_reasoning_in_no_overlap_2d <- Some x
let[@inline] sat_parameters_set_max_pairs_pairwise_reasoning_in_no_overlap_2d (self:sat_parameters) (x:int32) : unit =
  self.max_pairs_pairwise_reasoning_in_no_overlap_2d <- Some x
let[@inline] sat_parameters_set_maximum_regions_to_split_in_disconnected_no_overlap_2d (self:sat_parameters) (x:int32) : unit =
  self.maximum_regions_to_split_in_disconnected_no_overlap_2d <- Some x
let[@inline] sat_parameters_set_use_dual_scheduling_heuristics (self:sat_parameters) (x:bool) : unit =
  self.use_dual_scheduling_heuristics <- Some x
let[@inline] sat_parameters_set_use_all_different_for_circuit (self:sat_parameters) (x:bool) : unit =
  self.use_all_different_for_circuit <- Some x
let[@inline] sat_parameters_set_routing_cut_subset_size_for_binary_relation_bound (self:sat_parameters) (x:int32) : unit =
  self.routing_cut_subset_size_for_binary_relation_bound <- Some x
let[@inline] sat_parameters_set_routing_cut_subset_size_for_tight_binary_relation_bound (self:sat_parameters) (x:int32) : unit =
  self.routing_cut_subset_size_for_tight_binary_relation_bound <- Some x
let[@inline] sat_parameters_set_routing_cut_dp_effort (self:sat_parameters) (x:float) : unit =
  self.routing_cut_dp_effort <- Some x
let[@inline] sat_parameters_set_search_branching (self:sat_parameters) (x:sat_parameters_search_branching) : unit =
  self.search_branching <- Some x
let[@inline] sat_parameters_set_hint_conflict_limit (self:sat_parameters) (x:int32) : unit =
  self.hint_conflict_limit <- Some x
let[@inline] sat_parameters_set_repair_hint (self:sat_parameters) (x:bool) : unit =
  self.repair_hint <- Some x
let[@inline] sat_parameters_set_fix_variables_to_their_hinted_value (self:sat_parameters) (x:bool) : unit =
  self.fix_variables_to_their_hinted_value <- Some x
let[@inline] sat_parameters_set_use_probing_search (self:sat_parameters) (x:bool) : unit =
  self.use_probing_search <- Some x
let[@inline] sat_parameters_set_use_extended_probing (self:sat_parameters) (x:bool) : unit =
  self.use_extended_probing <- Some x
let[@inline] sat_parameters_set_probing_num_combinations_limit (self:sat_parameters) (x:int32) : unit =
  self.probing_num_combinations_limit <- Some x
let[@inline] sat_parameters_set_use_shaving_in_probing_search (self:sat_parameters) (x:bool) : unit =
  self.use_shaving_in_probing_search <- Some x
let[@inline] sat_parameters_set_shaving_search_deterministic_time (self:sat_parameters) (x:float) : unit =
  self.shaving_search_deterministic_time <- Some x
let[@inline] sat_parameters_set_shaving_search_threshold (self:sat_parameters) (x:int64) : unit =
  self.shaving_search_threshold <- Some x
let[@inline] sat_parameters_set_use_objective_lb_search (self:sat_parameters) (x:bool) : unit =
  self.use_objective_lb_search <- Some x
let[@inline] sat_parameters_set_use_objective_shaving_search (self:sat_parameters) (x:bool) : unit =
  self.use_objective_shaving_search <- Some x
let[@inline] sat_parameters_set_use_variables_shaving_search (self:sat_parameters) (x:bool) : unit =
  self.use_variables_shaving_search <- Some x
let[@inline] sat_parameters_set_pseudo_cost_reliability_threshold (self:sat_parameters) (x:int64) : unit =
  self.pseudo_cost_reliability_threshold <- Some x
let[@inline] sat_parameters_set_optimize_with_core (self:sat_parameters) (x:bool) : unit =
  self.optimize_with_core <- Some x
let[@inline] sat_parameters_set_optimize_with_lb_tree_search (self:sat_parameters) (x:bool) : unit =
  self.optimize_with_lb_tree_search <- Some x
let[@inline] sat_parameters_set_save_lp_basis_in_lb_tree_search (self:sat_parameters) (x:bool) : unit =
  self.save_lp_basis_in_lb_tree_search <- Some x
let[@inline] sat_parameters_set_binary_search_num_conflicts (self:sat_parameters) (x:int32) : unit =
  self.binary_search_num_conflicts <- Some x
let[@inline] sat_parameters_set_optimize_with_max_hs (self:sat_parameters) (x:bool) : unit =
  self.optimize_with_max_hs <- Some x
let[@inline] sat_parameters_set_use_feasibility_jump (self:sat_parameters) (x:bool) : unit =
  self.use_feasibility_jump <- Some x
let[@inline] sat_parameters_set_use_ls_only (self:sat_parameters) (x:bool) : unit =
  self.use_ls_only <- Some x
let[@inline] sat_parameters_set_feasibility_jump_decay (self:sat_parameters) (x:float) : unit =
  self.feasibility_jump_decay <- Some x
let[@inline] sat_parameters_set_feasibility_jump_linearization_level (self:sat_parameters) (x:int32) : unit =
  self.feasibility_jump_linearization_level <- Some x
let[@inline] sat_parameters_set_feasibility_jump_restart_factor (self:sat_parameters) (x:int32) : unit =
  self.feasibility_jump_restart_factor <- Some x
let[@inline] sat_parameters_set_feasibility_jump_batch_dtime (self:sat_parameters) (x:float) : unit =
  self.feasibility_jump_batch_dtime <- Some x
let[@inline] sat_parameters_set_feasibility_jump_var_randomization_probability (self:sat_parameters) (x:float) : unit =
  self.feasibility_jump_var_randomization_probability <- Some x
let[@inline] sat_parameters_set_feasibility_jump_var_perburbation_range_ratio (self:sat_parameters) (x:float) : unit =
  self.feasibility_jump_var_perburbation_range_ratio <- Some x
let[@inline] sat_parameters_set_feasibility_jump_enable_restarts (self:sat_parameters) (x:bool) : unit =
  self.feasibility_jump_enable_restarts <- Some x
let[@inline] sat_parameters_set_feasibility_jump_max_expanded_constraint_size (self:sat_parameters) (x:int32) : unit =
  self.feasibility_jump_max_expanded_constraint_size <- Some x
let[@inline] sat_parameters_set_num_violation_ls (self:sat_parameters) (x:int32) : unit =
  self.num_violation_ls <- Some x
let[@inline] sat_parameters_set_violation_ls_perturbation_period (self:sat_parameters) (x:int32) : unit =
  self.violation_ls_perturbation_period <- Some x
let[@inline] sat_parameters_set_violation_ls_compound_move_probability (self:sat_parameters) (x:float) : unit =
  self.violation_ls_compound_move_probability <- Some x
let[@inline] sat_parameters_set_shared_tree_num_workers (self:sat_parameters) (x:int32) : unit =
  self.shared_tree_num_workers <- Some x
let[@inline] sat_parameters_set_use_shared_tree_search (self:sat_parameters) (x:bool) : unit =
  self.use_shared_tree_search <- Some x
let[@inline] sat_parameters_set_shared_tree_worker_min_restarts_per_subtree (self:sat_parameters) (x:int32) : unit =
  self.shared_tree_worker_min_restarts_per_subtree <- Some x
let[@inline] sat_parameters_set_shared_tree_worker_enable_trail_sharing (self:sat_parameters) (x:bool) : unit =
  self.shared_tree_worker_enable_trail_sharing <- Some x
let[@inline] sat_parameters_set_shared_tree_worker_enable_phase_sharing (self:sat_parameters) (x:bool) : unit =
  self.shared_tree_worker_enable_phase_sharing <- Some x
let[@inline] sat_parameters_set_shared_tree_open_leaves_per_worker (self:sat_parameters) (x:float) : unit =
  self.shared_tree_open_leaves_per_worker <- Some x
let[@inline] sat_parameters_set_shared_tree_max_nodes_per_worker (self:sat_parameters) (x:int32) : unit =
  self.shared_tree_max_nodes_per_worker <- Some x
let[@inline] sat_parameters_set_shared_tree_split_strategy (self:sat_parameters) (x:sat_parameters_shared_tree_split_strategy) : unit =
  self.shared_tree_split_strategy <- Some x
let[@inline] sat_parameters_set_shared_tree_balance_tolerance (self:sat_parameters) (x:int32) : unit =
  self.shared_tree_balance_tolerance <- Some x
let[@inline] sat_parameters_set_enumerate_all_solutions (self:sat_parameters) (x:bool) : unit =
  self.enumerate_all_solutions <- Some x
let[@inline] sat_parameters_set_keep_all_feasible_solutions_in_presolve (self:sat_parameters) (x:bool) : unit =
  self.keep_all_feasible_solutions_in_presolve <- Some x
let[@inline] sat_parameters_set_fill_tightened_domains_in_response (self:sat_parameters) (x:bool) : unit =
  self.fill_tightened_domains_in_response <- Some x
let[@inline] sat_parameters_set_fill_additional_solutions_in_response (self:sat_parameters) (x:bool) : unit =
  self.fill_additional_solutions_in_response <- Some x
let[@inline] sat_parameters_set_instantiate_all_variables (self:sat_parameters) (x:bool) : unit =
  self.instantiate_all_variables <- Some x
let[@inline] sat_parameters_set_auto_detect_greater_than_at_least_one_of (self:sat_parameters) (x:bool) : unit =
  self.auto_detect_greater_than_at_least_one_of <- Some x
let[@inline] sat_parameters_set_stop_after_first_solution (self:sat_parameters) (x:bool) : unit =
  self.stop_after_first_solution <- Some x
let[@inline] sat_parameters_set_stop_after_presolve (self:sat_parameters) (x:bool) : unit =
  self.stop_after_presolve <- Some x
let[@inline] sat_parameters_set_stop_after_root_propagation (self:sat_parameters) (x:bool) : unit =
  self.stop_after_root_propagation <- Some x
let[@inline] sat_parameters_set_lns_initial_difficulty (self:sat_parameters) (x:float) : unit =
  self.lns_initial_difficulty <- Some x
let[@inline] sat_parameters_set_lns_initial_deterministic_limit (self:sat_parameters) (x:float) : unit =
  self.lns_initial_deterministic_limit <- Some x
let[@inline] sat_parameters_set_use_lns (self:sat_parameters) (x:bool) : unit =
  self.use_lns <- Some x
let[@inline] sat_parameters_set_use_lns_only (self:sat_parameters) (x:bool) : unit =
  self.use_lns_only <- Some x
let[@inline] sat_parameters_set_solution_pool_size (self:sat_parameters) (x:int32) : unit =
  self.solution_pool_size <- Some x
let[@inline] sat_parameters_set_use_rins_lns (self:sat_parameters) (x:bool) : unit =
  self.use_rins_lns <- Some x
let[@inline] sat_parameters_set_use_feasibility_pump (self:sat_parameters) (x:bool) : unit =
  self.use_feasibility_pump <- Some x
let[@inline] sat_parameters_set_use_lb_relax_lns (self:sat_parameters) (x:bool) : unit =
  self.use_lb_relax_lns <- Some x
let[@inline] sat_parameters_set_lb_relax_num_workers_threshold (self:sat_parameters) (x:int32) : unit =
  self.lb_relax_num_workers_threshold <- Some x
let[@inline] sat_parameters_set_fp_rounding (self:sat_parameters) (x:sat_parameters_fprounding_method) : unit =
  self.fp_rounding <- Some x
let[@inline] sat_parameters_set_diversify_lns_params (self:sat_parameters) (x:bool) : unit =
  self.diversify_lns_params <- Some x
let[@inline] sat_parameters_set_randomize_search (self:sat_parameters) (x:bool) : unit =
  self.randomize_search <- Some x
let[@inline] sat_parameters_set_search_random_variable_pool_size (self:sat_parameters) (x:int64) : unit =
  self.search_random_variable_pool_size <- Some x
let[@inline] sat_parameters_set_push_all_tasks_toward_start (self:sat_parameters) (x:bool) : unit =
  self.push_all_tasks_toward_start <- Some x
let[@inline] sat_parameters_set_use_optional_variables (self:sat_parameters) (x:bool) : unit =
  self.use_optional_variables <- Some x
let[@inline] sat_parameters_set_use_exact_lp_reason (self:sat_parameters) (x:bool) : unit =
  self.use_exact_lp_reason <- Some x
let[@inline] sat_parameters_set_use_combined_no_overlap (self:sat_parameters) (x:bool) : unit =
  self.use_combined_no_overlap <- Some x
let[@inline] sat_parameters_set_at_most_one_max_expansion_size (self:sat_parameters) (x:int32) : unit =
  self.at_most_one_max_expansion_size <- Some x
let[@inline] sat_parameters_set_catch_sigint_signal (self:sat_parameters) (x:bool) : unit =
  self.catch_sigint_signal <- Some x
let[@inline] sat_parameters_set_use_implied_bounds (self:sat_parameters) (x:bool) : unit =
  self.use_implied_bounds <- Some x
let[@inline] sat_parameters_set_polish_lp_solution (self:sat_parameters) (x:bool) : unit =
  self.polish_lp_solution <- Some x
let[@inline] sat_parameters_set_lp_primal_tolerance (self:sat_parameters) (x:float) : unit =
  self.lp_primal_tolerance <- Some x
let[@inline] sat_parameters_set_lp_dual_tolerance (self:sat_parameters) (x:float) : unit =
  self.lp_dual_tolerance <- Some x
let[@inline] sat_parameters_set_convert_intervals (self:sat_parameters) (x:bool) : unit =
  self.convert_intervals <- Some x
let[@inline] sat_parameters_set_symmetry_level (self:sat_parameters) (x:int32) : unit =
  self.symmetry_level <- Some x
let[@inline] sat_parameters_set_use_symmetry_in_lp (self:sat_parameters) (x:bool) : unit =
  self.use_symmetry_in_lp <- Some x
let[@inline] sat_parameters_set_keep_symmetry_in_presolve (self:sat_parameters) (x:bool) : unit =
  self.keep_symmetry_in_presolve <- Some x
let[@inline] sat_parameters_set_symmetry_detection_deterministic_time_limit (self:sat_parameters) (x:float) : unit =
  self.symmetry_detection_deterministic_time_limit <- Some x
let[@inline] sat_parameters_set_new_linear_propagation (self:sat_parameters) (x:bool) : unit =
  self.new_linear_propagation <- Some x
let[@inline] sat_parameters_set_linear_split_size (self:sat_parameters) (x:int32) : unit =
  self.linear_split_size <- Some x
let[@inline] sat_parameters_set_linearization_level (self:sat_parameters) (x:int32) : unit =
  self.linearization_level <- Some x
let[@inline] sat_parameters_set_boolean_encoding_level (self:sat_parameters) (x:int32) : unit =
  self.boolean_encoding_level <- Some x
let[@inline] sat_parameters_set_max_domain_size_when_encoding_eq_neq_constraints (self:sat_parameters) (x:int32) : unit =
  self.max_domain_size_when_encoding_eq_neq_constraints <- Some x
let[@inline] sat_parameters_set_max_num_cuts (self:sat_parameters) (x:int32) : unit =
  self.max_num_cuts <- Some x
let[@inline] sat_parameters_set_cut_level (self:sat_parameters) (x:int32) : unit =
  self.cut_level <- Some x
let[@inline] sat_parameters_set_only_add_cuts_at_level_zero (self:sat_parameters) (x:bool) : unit =
  self.only_add_cuts_at_level_zero <- Some x
let[@inline] sat_parameters_set_add_objective_cut (self:sat_parameters) (x:bool) : unit =
  self.add_objective_cut <- Some x
let[@inline] sat_parameters_set_add_cg_cuts (self:sat_parameters) (x:bool) : unit =
  self.add_cg_cuts <- Some x
let[@inline] sat_parameters_set_add_mir_cuts (self:sat_parameters) (x:bool) : unit =
  self.add_mir_cuts <- Some x
let[@inline] sat_parameters_set_add_zero_half_cuts (self:sat_parameters) (x:bool) : unit =
  self.add_zero_half_cuts <- Some x
let[@inline] sat_parameters_set_add_clique_cuts (self:sat_parameters) (x:bool) : unit =
  self.add_clique_cuts <- Some x
let[@inline] sat_parameters_set_add_rlt_cuts (self:sat_parameters) (x:bool) : unit =
  self.add_rlt_cuts <- Some x
let[@inline] sat_parameters_set_max_all_diff_cut_size (self:sat_parameters) (x:int32) : unit =
  self.max_all_diff_cut_size <- Some x
let[@inline] sat_parameters_set_add_lin_max_cuts (self:sat_parameters) (x:bool) : unit =
  self.add_lin_max_cuts <- Some x
let[@inline] sat_parameters_set_max_integer_rounding_scaling (self:sat_parameters) (x:int32) : unit =
  self.max_integer_rounding_scaling <- Some x
let[@inline] sat_parameters_set_add_lp_constraints_lazily (self:sat_parameters) (x:bool) : unit =
  self.add_lp_constraints_lazily <- Some x
let[@inline] sat_parameters_set_root_lp_iterations (self:sat_parameters) (x:int32) : unit =
  self.root_lp_iterations <- Some x
let[@inline] sat_parameters_set_min_orthogonality_for_lp_constraints (self:sat_parameters) (x:float) : unit =
  self.min_orthogonality_for_lp_constraints <- Some x
let[@inline] sat_parameters_set_max_cut_rounds_at_level_zero (self:sat_parameters) (x:int32) : unit =
  self.max_cut_rounds_at_level_zero <- Some x
let[@inline] sat_parameters_set_max_consecutive_inactive_count (self:sat_parameters) (x:int32) : unit =
  self.max_consecutive_inactive_count <- Some x
let[@inline] sat_parameters_set_cut_max_active_count_value (self:sat_parameters) (x:float) : unit =
  self.cut_max_active_count_value <- Some x
let[@inline] sat_parameters_set_cut_active_count_decay (self:sat_parameters) (x:float) : unit =
  self.cut_active_count_decay <- Some x
let[@inline] sat_parameters_set_cut_cleanup_target (self:sat_parameters) (x:int32) : unit =
  self.cut_cleanup_target <- Some x
let[@inline] sat_parameters_set_new_constraints_batch_size (self:sat_parameters) (x:int32) : unit =
  self.new_constraints_batch_size <- Some x
let[@inline] sat_parameters_set_exploit_integer_lp_solution (self:sat_parameters) (x:bool) : unit =
  self.exploit_integer_lp_solution <- Some x
let[@inline] sat_parameters_set_exploit_all_lp_solution (self:sat_parameters) (x:bool) : unit =
  self.exploit_all_lp_solution <- Some x
let[@inline] sat_parameters_set_exploit_best_solution (self:sat_parameters) (x:bool) : unit =
  self.exploit_best_solution <- Some x
let[@inline] sat_parameters_set_exploit_relaxation_solution (self:sat_parameters) (x:bool) : unit =
  self.exploit_relaxation_solution <- Some x
let[@inline] sat_parameters_set_exploit_objective (self:sat_parameters) (x:bool) : unit =
  self.exploit_objective <- Some x
let[@inline] sat_parameters_set_detect_linearized_product (self:sat_parameters) (x:bool) : unit =
  self.detect_linearized_product <- Some x
let[@inline] sat_parameters_set_mip_max_bound (self:sat_parameters) (x:float) : unit =
  self.mip_max_bound <- Some x
let[@inline] sat_parameters_set_mip_var_scaling (self:sat_parameters) (x:float) : unit =
  self.mip_var_scaling <- Some x
let[@inline] sat_parameters_set_mip_scale_large_domain (self:sat_parameters) (x:bool) : unit =
  self.mip_scale_large_domain <- Some x
let[@inline] sat_parameters_set_mip_automatically_scale_variables (self:sat_parameters) (x:bool) : unit =
  self.mip_automatically_scale_variables <- Some x
let[@inline] sat_parameters_set_only_solve_ip (self:sat_parameters) (x:bool) : unit =
  self.only_solve_ip <- Some x
let[@inline] sat_parameters_set_mip_wanted_precision (self:sat_parameters) (x:float) : unit =
  self.mip_wanted_precision <- Some x
let[@inline] sat_parameters_set_mip_max_activity_exponent (self:sat_parameters) (x:int32) : unit =
  self.mip_max_activity_exponent <- Some x
let[@inline] sat_parameters_set_mip_check_precision (self:sat_parameters) (x:float) : unit =
  self.mip_check_precision <- Some x
let[@inline] sat_parameters_set_mip_compute_true_objective_bound (self:sat_parameters) (x:bool) : unit =
  self.mip_compute_true_objective_bound <- Some x
let[@inline] sat_parameters_set_mip_max_valid_magnitude (self:sat_parameters) (x:float) : unit =
  self.mip_max_valid_magnitude <- Some x
let[@inline] sat_parameters_set_mip_treat_high_magnitude_bounds_as_infinity (self:sat_parameters) (x:bool) : unit =
  self.mip_treat_high_magnitude_bounds_as_infinity <- Some x
let[@inline] sat_parameters_set_mip_drop_tolerance (self:sat_parameters) (x:float) : unit =
  self.mip_drop_tolerance <- Some x
let[@inline] sat_parameters_set_mip_presolve_level (self:sat_parameters) (x:int32) : unit =
  self.mip_presolve_level <- Some x

let copy_sat_parameters (self:sat_parameters) : sat_parameters =
  { self with name = self.name }

let make_sat_parameters 
  ?(name:string option)
  ?(preferred_variable_order:sat_parameters_variable_order option)
  ?(initial_polarity:sat_parameters_polarity option)
  ?(use_phase_saving:bool option)
  ?(polarity_rephase_increment:int32 option)
  ?(polarity_exploit_ls_hints:bool option)
  ?(random_polarity_ratio:float option)
  ?(random_branches_ratio:float option)
  ?(use_erwa_heuristic:bool option)
  ?(initial_variables_activity:float option)
  ?(also_bump_variables_in_conflict_reasons:bool option)
  ?(minimization_algorithm:sat_parameters_conflict_minimization_algorithm option)
  ?(binary_minimization_algorithm:sat_parameters_binary_minization_algorithm option)
  ?(subsumption_during_conflict_analysis:bool option)
  ?(clause_cleanup_period:int32 option)
  ?(clause_cleanup_target:int32 option)
  ?(clause_cleanup_ratio:float option)
  ?(clause_cleanup_protection:sat_parameters_clause_protection option)
  ?(clause_cleanup_lbd_bound:int32 option)
  ?(clause_cleanup_ordering:sat_parameters_clause_ordering option)
  ?(pb_cleanup_increment:int32 option)
  ?(pb_cleanup_ratio:float option)
  ?(variable_activity_decay:float option)
  ?(max_variable_activity_value:float option)
  ?(glucose_max_decay:float option)
  ?(glucose_decay_increment:float option)
  ?(glucose_decay_increment_period:int32 option)
  ?(clause_activity_decay:float option)
  ?(max_clause_activity_value:float option)
  ?(restart_algorithms=[])
  ?(default_restart_algorithms:string option)
  ?(restart_period:int32 option)
  ?(restart_running_window_size:int32 option)
  ?(restart_dl_average_ratio:float option)
  ?(restart_lbd_average_ratio:float option)
  ?(use_blocking_restart:bool option)
  ?(blocking_restart_window_size:int32 option)
  ?(blocking_restart_multiplier:float option)
  ?(num_conflicts_before_strategy_changes:int32 option)
  ?(strategy_change_increase_ratio:float option)
  ?(max_time_in_seconds:float option)
  ?(max_deterministic_time:float option)
  ?(max_num_deterministic_batches:int32 option)
  ?(max_number_of_conflicts:int64 option)
  ?(max_memory_in_mb:int64 option)
  ?(absolute_gap_limit:float option)
  ?(relative_gap_limit:float option)
  ?(random_seed:int32 option)
  ?(permute_variable_randomly:bool option)
  ?(permute_presolve_constraint_order:bool option)
  ?(use_absl_random:bool option)
  ?(log_search_progress:bool option)
  ?(log_subsolver_statistics:bool option)
  ?(log_prefix:string option)
  ?(log_to_stdout:bool option)
  ?(log_to_response:bool option)
  ?(use_pb_resolution:bool option)
  ?(minimize_reduction_during_pb_resolution:bool option)
  ?(count_assumption_levels_in_lbd:bool option)
  ?(presolve_bve_threshold:int32 option)
  ?(presolve_bve_clause_weight:int32 option)
  ?(probing_deterministic_time_limit:float option)
  ?(presolve_probing_deterministic_time_limit:float option)
  ?(presolve_blocked_clause:bool option)
  ?(presolve_use_bva:bool option)
  ?(presolve_bva_threshold:int32 option)
  ?(max_presolve_iterations:int32 option)
  ?(cp_model_presolve:bool option)
  ?(cp_model_probing_level:int32 option)
  ?(cp_model_use_sat_presolve:bool option)
  ?(remove_fixed_variables_early:bool option)
  ?(detect_table_with_cost:bool option)
  ?(table_compression_level:int32 option)
  ?(expand_alldiff_constraints:bool option)
  ?(expand_reservoir_constraints:bool option)
  ?(expand_reservoir_using_circuit:bool option)
  ?(encode_cumulative_as_reservoir:bool option)
  ?(max_lin_max_size_for_expansion:int32 option)
  ?(disable_constraint_expansion:bool option)
  ?(encode_complex_linear_constraint_with_integer:bool option)
  ?(merge_no_overlap_work_limit:float option)
  ?(merge_at_most_one_work_limit:float option)
  ?(presolve_substitution_level:int32 option)
  ?(presolve_extract_integer_enforcement:bool option)
  ?(presolve_inclusion_work_limit:int64 option)
  ?(ignore_names:bool option)
  ?(infer_all_diffs:bool option)
  ?(find_big_linear_overlap:bool option)
  ?(use_sat_inprocessing:bool option)
  ?(inprocessing_dtime_ratio:float option)
  ?(inprocessing_probing_dtime:float option)
  ?(inprocessing_minimization_dtime:float option)
  ?(inprocessing_minimization_use_conflict_analysis:bool option)
  ?(inprocessing_minimization_use_all_orderings:bool option)
  ?(num_workers:int32 option)
  ?(num_search_workers:int32 option)
  ?(num_full_subsolvers:int32 option)
  ?(subsolvers=[])
  ?(extra_subsolvers=[])
  ?(ignore_subsolvers=[])
  ?(filter_subsolvers=[])
  ?(subsolver_params=[])
  ?(interleave_search:bool option)
  ?(interleave_batch_size:int32 option)
  ?(share_objective_bounds:bool option)
  ?(share_level_zero_bounds:bool option)
  ?(share_binary_clauses:bool option)
  ?(share_glue_clauses:bool option)
  ?(minimize_shared_clauses:bool option)
  ?(debug_postsolve_with_full_solver:bool option)
  ?(debug_max_num_presolve_operations:int32 option)
  ?(debug_crash_on_bad_hint:bool option)
  ?(debug_crash_if_presolve_breaks_hint:bool option)
  ?(use_optimization_hints:bool option)
  ?(core_minimization_level:int32 option)
  ?(find_multiple_cores:bool option)
  ?(cover_optimization:bool option)
  ?(max_sat_assumption_order:sat_parameters_max_sat_assumption_order option)
  ?(max_sat_reverse_assumption_order:bool option)
  ?(max_sat_stratification:sat_parameters_max_sat_stratification_algorithm option)
  ?(propagation_loop_detection_factor:float option)
  ?(use_precedences_in_disjunctive_constraint:bool option)
  ?(max_size_to_create_precedence_literals_in_disjunctive:int32 option)
  ?(use_strong_propagation_in_disjunctive:bool option)
  ?(use_dynamic_precedence_in_disjunctive:bool option)
  ?(use_dynamic_precedence_in_cumulative:bool option)
  ?(use_overload_checker_in_cumulative:bool option)
  ?(use_conservative_scale_overload_checker:bool option)
  ?(use_timetable_edge_finding_in_cumulative:bool option)
  ?(max_num_intervals_for_timetable_edge_finding:int32 option)
  ?(use_hard_precedences_in_cumulative:bool option)
  ?(exploit_all_precedences:bool option)
  ?(use_disjunctive_constraint_in_cumulative:bool option)
  ?(use_timetabling_in_no_overlap_2d:bool option)
  ?(use_energetic_reasoning_in_no_overlap_2d:bool option)
  ?(use_area_energetic_reasoning_in_no_overlap_2d:bool option)
  ?(use_try_edge_reasoning_in_no_overlap_2d:bool option)
  ?(max_pairs_pairwise_reasoning_in_no_overlap_2d:int32 option)
  ?(maximum_regions_to_split_in_disconnected_no_overlap_2d:int32 option)
  ?(use_dual_scheduling_heuristics:bool option)
  ?(use_all_different_for_circuit:bool option)
  ?(routing_cut_subset_size_for_binary_relation_bound:int32 option)
  ?(routing_cut_subset_size_for_tight_binary_relation_bound:int32 option)
  ?(routing_cut_dp_effort:float option)
  ?(search_branching:sat_parameters_search_branching option)
  ?(hint_conflict_limit:int32 option)
  ?(repair_hint:bool option)
  ?(fix_variables_to_their_hinted_value:bool option)
  ?(use_probing_search:bool option)
  ?(use_extended_probing:bool option)
  ?(probing_num_combinations_limit:int32 option)
  ?(use_shaving_in_probing_search:bool option)
  ?(shaving_search_deterministic_time:float option)
  ?(shaving_search_threshold:int64 option)
  ?(use_objective_lb_search:bool option)
  ?(use_objective_shaving_search:bool option)
  ?(use_variables_shaving_search:bool option)
  ?(pseudo_cost_reliability_threshold:int64 option)
  ?(optimize_with_core:bool option)
  ?(optimize_with_lb_tree_search:bool option)
  ?(save_lp_basis_in_lb_tree_search:bool option)
  ?(binary_search_num_conflicts:int32 option)
  ?(optimize_with_max_hs:bool option)
  ?(use_feasibility_jump:bool option)
  ?(use_ls_only:bool option)
  ?(feasibility_jump_decay:float option)
  ?(feasibility_jump_linearization_level:int32 option)
  ?(feasibility_jump_restart_factor:int32 option)
  ?(feasibility_jump_batch_dtime:float option)
  ?(feasibility_jump_var_randomization_probability:float option)
  ?(feasibility_jump_var_perburbation_range_ratio:float option)
  ?(feasibility_jump_enable_restarts:bool option)
  ?(feasibility_jump_max_expanded_constraint_size:int32 option)
  ?(num_violation_ls:int32 option)
  ?(violation_ls_perturbation_period:int32 option)
  ?(violation_ls_compound_move_probability:float option)
  ?(shared_tree_num_workers:int32 option)
  ?(use_shared_tree_search:bool option)
  ?(shared_tree_worker_min_restarts_per_subtree:int32 option)
  ?(shared_tree_worker_enable_trail_sharing:bool option)
  ?(shared_tree_worker_enable_phase_sharing:bool option)
  ?(shared_tree_open_leaves_per_worker:float option)
  ?(shared_tree_max_nodes_per_worker:int32 option)
  ?(shared_tree_split_strategy:sat_parameters_shared_tree_split_strategy option)
  ?(shared_tree_balance_tolerance:int32 option)
  ?(enumerate_all_solutions:bool option)
  ?(keep_all_feasible_solutions_in_presolve:bool option)
  ?(fill_tightened_domains_in_response:bool option)
  ?(fill_additional_solutions_in_response:bool option)
  ?(instantiate_all_variables:bool option)
  ?(auto_detect_greater_than_at_least_one_of:bool option)
  ?(stop_after_first_solution:bool option)
  ?(stop_after_presolve:bool option)
  ?(stop_after_root_propagation:bool option)
  ?(lns_initial_difficulty:float option)
  ?(lns_initial_deterministic_limit:float option)
  ?(use_lns:bool option)
  ?(use_lns_only:bool option)
  ?(solution_pool_size:int32 option)
  ?(use_rins_lns:bool option)
  ?(use_feasibility_pump:bool option)
  ?(use_lb_relax_lns:bool option)
  ?(lb_relax_num_workers_threshold:int32 option)
  ?(fp_rounding:sat_parameters_fprounding_method option)
  ?(diversify_lns_params:bool option)
  ?(randomize_search:bool option)
  ?(search_random_variable_pool_size:int64 option)
  ?(push_all_tasks_toward_start:bool option)
  ?(use_optional_variables:bool option)
  ?(use_exact_lp_reason:bool option)
  ?(use_combined_no_overlap:bool option)
  ?(at_most_one_max_expansion_size:int32 option)
  ?(catch_sigint_signal:bool option)
  ?(use_implied_bounds:bool option)
  ?(polish_lp_solution:bool option)
  ?(lp_primal_tolerance:float option)
  ?(lp_dual_tolerance:float option)
  ?(convert_intervals:bool option)
  ?(symmetry_level:int32 option)
  ?(use_symmetry_in_lp:bool option)
  ?(keep_symmetry_in_presolve:bool option)
  ?(symmetry_detection_deterministic_time_limit:float option)
  ?(new_linear_propagation:bool option)
  ?(linear_split_size:int32 option)
  ?(linearization_level:int32 option)
  ?(boolean_encoding_level:int32 option)
  ?(max_domain_size_when_encoding_eq_neq_constraints:int32 option)
  ?(max_num_cuts:int32 option)
  ?(cut_level:int32 option)
  ?(only_add_cuts_at_level_zero:bool option)
  ?(add_objective_cut:bool option)
  ?(add_cg_cuts:bool option)
  ?(add_mir_cuts:bool option)
  ?(add_zero_half_cuts:bool option)
  ?(add_clique_cuts:bool option)
  ?(add_rlt_cuts:bool option)
  ?(max_all_diff_cut_size:int32 option)
  ?(add_lin_max_cuts:bool option)
  ?(max_integer_rounding_scaling:int32 option)
  ?(add_lp_constraints_lazily:bool option)
  ?(root_lp_iterations:int32 option)
  ?(min_orthogonality_for_lp_constraints:float option)
  ?(max_cut_rounds_at_level_zero:int32 option)
  ?(max_consecutive_inactive_count:int32 option)
  ?(cut_max_active_count_value:float option)
  ?(cut_active_count_decay:float option)
  ?(cut_cleanup_target:int32 option)
  ?(new_constraints_batch_size:int32 option)
  ?(exploit_integer_lp_solution:bool option)
  ?(exploit_all_lp_solution:bool option)
  ?(exploit_best_solution:bool option)
  ?(exploit_relaxation_solution:bool option)
  ?(exploit_objective:bool option)
  ?(detect_linearized_product:bool option)
  ?(mip_max_bound:float option)
  ?(mip_var_scaling:float option)
  ?(mip_scale_large_domain:bool option)
  ?(mip_automatically_scale_variables:bool option)
  ?(only_solve_ip:bool option)
  ?(mip_wanted_precision:float option)
  ?(mip_max_activity_exponent:int32 option)
  ?(mip_check_precision:float option)
  ?(mip_compute_true_objective_bound:bool option)
  ?(mip_max_valid_magnitude:float option)
  ?(mip_treat_high_magnitude_bounds_as_infinity:bool option)
  ?(mip_drop_tolerance:float option)
  ?(mip_presolve_level:int32 option)
  () : sat_parameters  =
  let _res = default_sat_parameters () in
  (match name with
  | None -> ()
  | Some v -> sat_parameters_set_name _res v);
  (match preferred_variable_order with
  | None -> ()
  | Some v -> sat_parameters_set_preferred_variable_order _res v);
  (match initial_polarity with
  | None -> ()
  | Some v -> sat_parameters_set_initial_polarity _res v);
  (match use_phase_saving with
  | None -> ()
  | Some v -> sat_parameters_set_use_phase_saving _res v);
  (match polarity_rephase_increment with
  | None -> ()
  | Some v -> sat_parameters_set_polarity_rephase_increment _res v);
  (match polarity_exploit_ls_hints with
  | None -> ()
  | Some v -> sat_parameters_set_polarity_exploit_ls_hints _res v);
  (match random_polarity_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_random_polarity_ratio _res v);
  (match random_branches_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_random_branches_ratio _res v);
  (match use_erwa_heuristic with
  | None -> ()
  | Some v -> sat_parameters_set_use_erwa_heuristic _res v);
  (match initial_variables_activity with
  | None -> ()
  | Some v -> sat_parameters_set_initial_variables_activity _res v);
  (match also_bump_variables_in_conflict_reasons with
  | None -> ()
  | Some v -> sat_parameters_set_also_bump_variables_in_conflict_reasons _res v);
  (match minimization_algorithm with
  | None -> ()
  | Some v -> sat_parameters_set_minimization_algorithm _res v);
  (match binary_minimization_algorithm with
  | None -> ()
  | Some v -> sat_parameters_set_binary_minimization_algorithm _res v);
  (match subsumption_during_conflict_analysis with
  | None -> ()
  | Some v -> sat_parameters_set_subsumption_during_conflict_analysis _res v);
  (match clause_cleanup_period with
  | None -> ()
  | Some v -> sat_parameters_set_clause_cleanup_period _res v);
  (match clause_cleanup_target with
  | None -> ()
  | Some v -> sat_parameters_set_clause_cleanup_target _res v);
  (match clause_cleanup_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_clause_cleanup_ratio _res v);
  (match clause_cleanup_protection with
  | None -> ()
  | Some v -> sat_parameters_set_clause_cleanup_protection _res v);
  (match clause_cleanup_lbd_bound with
  | None -> ()
  | Some v -> sat_parameters_set_clause_cleanup_lbd_bound _res v);
  (match clause_cleanup_ordering with
  | None -> ()
  | Some v -> sat_parameters_set_clause_cleanup_ordering _res v);
  (match pb_cleanup_increment with
  | None -> ()
  | Some v -> sat_parameters_set_pb_cleanup_increment _res v);
  (match pb_cleanup_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_pb_cleanup_ratio _res v);
  (match variable_activity_decay with
  | None -> ()
  | Some v -> sat_parameters_set_variable_activity_decay _res v);
  (match max_variable_activity_value with
  | None -> ()
  | Some v -> sat_parameters_set_max_variable_activity_value _res v);
  (match glucose_max_decay with
  | None -> ()
  | Some v -> sat_parameters_set_glucose_max_decay _res v);
  (match glucose_decay_increment with
  | None -> ()
  | Some v -> sat_parameters_set_glucose_decay_increment _res v);
  (match glucose_decay_increment_period with
  | None -> ()
  | Some v -> sat_parameters_set_glucose_decay_increment_period _res v);
  (match clause_activity_decay with
  | None -> ()
  | Some v -> sat_parameters_set_clause_activity_decay _res v);
  (match max_clause_activity_value with
  | None -> ()
  | Some v -> sat_parameters_set_max_clause_activity_value _res v);
  sat_parameters_set_restart_algorithms _res restart_algorithms;
  (match default_restart_algorithms with
  | None -> ()
  | Some v -> sat_parameters_set_default_restart_algorithms _res v);
  (match restart_period with
  | None -> ()
  | Some v -> sat_parameters_set_restart_period _res v);
  (match restart_running_window_size with
  | None -> ()
  | Some v -> sat_parameters_set_restart_running_window_size _res v);
  (match restart_dl_average_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_restart_dl_average_ratio _res v);
  (match restart_lbd_average_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_restart_lbd_average_ratio _res v);
  (match use_blocking_restart with
  | None -> ()
  | Some v -> sat_parameters_set_use_blocking_restart _res v);
  (match blocking_restart_window_size with
  | None -> ()
  | Some v -> sat_parameters_set_blocking_restart_window_size _res v);
  (match blocking_restart_multiplier with
  | None -> ()
  | Some v -> sat_parameters_set_blocking_restart_multiplier _res v);
  (match num_conflicts_before_strategy_changes with
  | None -> ()
  | Some v -> sat_parameters_set_num_conflicts_before_strategy_changes _res v);
  (match strategy_change_increase_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_strategy_change_increase_ratio _res v);
  (match max_time_in_seconds with
  | None -> ()
  | Some v -> sat_parameters_set_max_time_in_seconds _res v);
  (match max_deterministic_time with
  | None -> ()
  | Some v -> sat_parameters_set_max_deterministic_time _res v);
  (match max_num_deterministic_batches with
  | None -> ()
  | Some v -> sat_parameters_set_max_num_deterministic_batches _res v);
  (match max_number_of_conflicts with
  | None -> ()
  | Some v -> sat_parameters_set_max_number_of_conflicts _res v);
  (match max_memory_in_mb with
  | None -> ()
  | Some v -> sat_parameters_set_max_memory_in_mb _res v);
  (match absolute_gap_limit with
  | None -> ()
  | Some v -> sat_parameters_set_absolute_gap_limit _res v);
  (match relative_gap_limit with
  | None -> ()
  | Some v -> sat_parameters_set_relative_gap_limit _res v);
  (match random_seed with
  | None -> ()
  | Some v -> sat_parameters_set_random_seed _res v);
  (match permute_variable_randomly with
  | None -> ()
  | Some v -> sat_parameters_set_permute_variable_randomly _res v);
  (match permute_presolve_constraint_order with
  | None -> ()
  | Some v -> sat_parameters_set_permute_presolve_constraint_order _res v);
  (match use_absl_random with
  | None -> ()
  | Some v -> sat_parameters_set_use_absl_random _res v);
  (match log_search_progress with
  | None -> ()
  | Some v -> sat_parameters_set_log_search_progress _res v);
  (match log_subsolver_statistics with
  | None -> ()
  | Some v -> sat_parameters_set_log_subsolver_statistics _res v);
  (match log_prefix with
  | None -> ()
  | Some v -> sat_parameters_set_log_prefix _res v);
  (match log_to_stdout with
  | None -> ()
  | Some v -> sat_parameters_set_log_to_stdout _res v);
  (match log_to_response with
  | None -> ()
  | Some v -> sat_parameters_set_log_to_response _res v);
  (match use_pb_resolution with
  | None -> ()
  | Some v -> sat_parameters_set_use_pb_resolution _res v);
  (match minimize_reduction_during_pb_resolution with
  | None -> ()
  | Some v -> sat_parameters_set_minimize_reduction_during_pb_resolution _res v);
  (match count_assumption_levels_in_lbd with
  | None -> ()
  | Some v -> sat_parameters_set_count_assumption_levels_in_lbd _res v);
  (match presolve_bve_threshold with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_bve_threshold _res v);
  (match presolve_bve_clause_weight with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_bve_clause_weight _res v);
  (match probing_deterministic_time_limit with
  | None -> ()
  | Some v -> sat_parameters_set_probing_deterministic_time_limit _res v);
  (match presolve_probing_deterministic_time_limit with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_probing_deterministic_time_limit _res v);
  (match presolve_blocked_clause with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_blocked_clause _res v);
  (match presolve_use_bva with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_use_bva _res v);
  (match presolve_bva_threshold with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_bva_threshold _res v);
  (match max_presolve_iterations with
  | None -> ()
  | Some v -> sat_parameters_set_max_presolve_iterations _res v);
  (match cp_model_presolve with
  | None -> ()
  | Some v -> sat_parameters_set_cp_model_presolve _res v);
  (match cp_model_probing_level with
  | None -> ()
  | Some v -> sat_parameters_set_cp_model_probing_level _res v);
  (match cp_model_use_sat_presolve with
  | None -> ()
  | Some v -> sat_parameters_set_cp_model_use_sat_presolve _res v);
  (match remove_fixed_variables_early with
  | None -> ()
  | Some v -> sat_parameters_set_remove_fixed_variables_early _res v);
  (match detect_table_with_cost with
  | None -> ()
  | Some v -> sat_parameters_set_detect_table_with_cost _res v);
  (match table_compression_level with
  | None -> ()
  | Some v -> sat_parameters_set_table_compression_level _res v);
  (match expand_alldiff_constraints with
  | None -> ()
  | Some v -> sat_parameters_set_expand_alldiff_constraints _res v);
  (match expand_reservoir_constraints with
  | None -> ()
  | Some v -> sat_parameters_set_expand_reservoir_constraints _res v);
  (match expand_reservoir_using_circuit with
  | None -> ()
  | Some v -> sat_parameters_set_expand_reservoir_using_circuit _res v);
  (match encode_cumulative_as_reservoir with
  | None -> ()
  | Some v -> sat_parameters_set_encode_cumulative_as_reservoir _res v);
  (match max_lin_max_size_for_expansion with
  | None -> ()
  | Some v -> sat_parameters_set_max_lin_max_size_for_expansion _res v);
  (match disable_constraint_expansion with
  | None -> ()
  | Some v -> sat_parameters_set_disable_constraint_expansion _res v);
  (match encode_complex_linear_constraint_with_integer with
  | None -> ()
  | Some v -> sat_parameters_set_encode_complex_linear_constraint_with_integer _res v);
  (match merge_no_overlap_work_limit with
  | None -> ()
  | Some v -> sat_parameters_set_merge_no_overlap_work_limit _res v);
  (match merge_at_most_one_work_limit with
  | None -> ()
  | Some v -> sat_parameters_set_merge_at_most_one_work_limit _res v);
  (match presolve_substitution_level with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_substitution_level _res v);
  (match presolve_extract_integer_enforcement with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_extract_integer_enforcement _res v);
  (match presolve_inclusion_work_limit with
  | None -> ()
  | Some v -> sat_parameters_set_presolve_inclusion_work_limit _res v);
  (match ignore_names with
  | None -> ()
  | Some v -> sat_parameters_set_ignore_names _res v);
  (match infer_all_diffs with
  | None -> ()
  | Some v -> sat_parameters_set_infer_all_diffs _res v);
  (match find_big_linear_overlap with
  | None -> ()
  | Some v -> sat_parameters_set_find_big_linear_overlap _res v);
  (match use_sat_inprocessing with
  | None -> ()
  | Some v -> sat_parameters_set_use_sat_inprocessing _res v);
  (match inprocessing_dtime_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_inprocessing_dtime_ratio _res v);
  (match inprocessing_probing_dtime with
  | None -> ()
  | Some v -> sat_parameters_set_inprocessing_probing_dtime _res v);
  (match inprocessing_minimization_dtime with
  | None -> ()
  | Some v -> sat_parameters_set_inprocessing_minimization_dtime _res v);
  (match inprocessing_minimization_use_conflict_analysis with
  | None -> ()
  | Some v -> sat_parameters_set_inprocessing_minimization_use_conflict_analysis _res v);
  (match inprocessing_minimization_use_all_orderings with
  | None -> ()
  | Some v -> sat_parameters_set_inprocessing_minimization_use_all_orderings _res v);
  (match num_workers with
  | None -> ()
  | Some v -> sat_parameters_set_num_workers _res v);
  (match num_search_workers with
  | None -> ()
  | Some v -> sat_parameters_set_num_search_workers _res v);
  (match num_full_subsolvers with
  | None -> ()
  | Some v -> sat_parameters_set_num_full_subsolvers _res v);
  sat_parameters_set_subsolvers _res subsolvers;
  sat_parameters_set_extra_subsolvers _res extra_subsolvers;
  sat_parameters_set_ignore_subsolvers _res ignore_subsolvers;
  sat_parameters_set_filter_subsolvers _res filter_subsolvers;
  sat_parameters_set_subsolver_params _res subsolver_params;
  (match interleave_search with
  | None -> ()
  | Some v -> sat_parameters_set_interleave_search _res v);
  (match interleave_batch_size with
  | None -> ()
  | Some v -> sat_parameters_set_interleave_batch_size _res v);
  (match share_objective_bounds with
  | None -> ()
  | Some v -> sat_parameters_set_share_objective_bounds _res v);
  (match share_level_zero_bounds with
  | None -> ()
  | Some v -> sat_parameters_set_share_level_zero_bounds _res v);
  (match share_binary_clauses with
  | None -> ()
  | Some v -> sat_parameters_set_share_binary_clauses _res v);
  (match share_glue_clauses with
  | None -> ()
  | Some v -> sat_parameters_set_share_glue_clauses _res v);
  (match minimize_shared_clauses with
  | None -> ()
  | Some v -> sat_parameters_set_minimize_shared_clauses _res v);
  (match debug_postsolve_with_full_solver with
  | None -> ()
  | Some v -> sat_parameters_set_debug_postsolve_with_full_solver _res v);
  (match debug_max_num_presolve_operations with
  | None -> ()
  | Some v -> sat_parameters_set_debug_max_num_presolve_operations _res v);
  (match debug_crash_on_bad_hint with
  | None -> ()
  | Some v -> sat_parameters_set_debug_crash_on_bad_hint _res v);
  (match debug_crash_if_presolve_breaks_hint with
  | None -> ()
  | Some v -> sat_parameters_set_debug_crash_if_presolve_breaks_hint _res v);
  (match use_optimization_hints with
  | None -> ()
  | Some v -> sat_parameters_set_use_optimization_hints _res v);
  (match core_minimization_level with
  | None -> ()
  | Some v -> sat_parameters_set_core_minimization_level _res v);
  (match find_multiple_cores with
  | None -> ()
  | Some v -> sat_parameters_set_find_multiple_cores _res v);
  (match cover_optimization with
  | None -> ()
  | Some v -> sat_parameters_set_cover_optimization _res v);
  (match max_sat_assumption_order with
  | None -> ()
  | Some v -> sat_parameters_set_max_sat_assumption_order _res v);
  (match max_sat_reverse_assumption_order with
  | None -> ()
  | Some v -> sat_parameters_set_max_sat_reverse_assumption_order _res v);
  (match max_sat_stratification with
  | None -> ()
  | Some v -> sat_parameters_set_max_sat_stratification _res v);
  (match propagation_loop_detection_factor with
  | None -> ()
  | Some v -> sat_parameters_set_propagation_loop_detection_factor _res v);
  (match use_precedences_in_disjunctive_constraint with
  | None -> ()
  | Some v -> sat_parameters_set_use_precedences_in_disjunctive_constraint _res v);
  (match max_size_to_create_precedence_literals_in_disjunctive with
  | None -> ()
  | Some v -> sat_parameters_set_max_size_to_create_precedence_literals_in_disjunctive _res v);
  (match use_strong_propagation_in_disjunctive with
  | None -> ()
  | Some v -> sat_parameters_set_use_strong_propagation_in_disjunctive _res v);
  (match use_dynamic_precedence_in_disjunctive with
  | None -> ()
  | Some v -> sat_parameters_set_use_dynamic_precedence_in_disjunctive _res v);
  (match use_dynamic_precedence_in_cumulative with
  | None -> ()
  | Some v -> sat_parameters_set_use_dynamic_precedence_in_cumulative _res v);
  (match use_overload_checker_in_cumulative with
  | None -> ()
  | Some v -> sat_parameters_set_use_overload_checker_in_cumulative _res v);
  (match use_conservative_scale_overload_checker with
  | None -> ()
  | Some v -> sat_parameters_set_use_conservative_scale_overload_checker _res v);
  (match use_timetable_edge_finding_in_cumulative with
  | None -> ()
  | Some v -> sat_parameters_set_use_timetable_edge_finding_in_cumulative _res v);
  (match max_num_intervals_for_timetable_edge_finding with
  | None -> ()
  | Some v -> sat_parameters_set_max_num_intervals_for_timetable_edge_finding _res v);
  (match use_hard_precedences_in_cumulative with
  | None -> ()
  | Some v -> sat_parameters_set_use_hard_precedences_in_cumulative _res v);
  (match exploit_all_precedences with
  | None -> ()
  | Some v -> sat_parameters_set_exploit_all_precedences _res v);
  (match use_disjunctive_constraint_in_cumulative with
  | None -> ()
  | Some v -> sat_parameters_set_use_disjunctive_constraint_in_cumulative _res v);
  (match use_timetabling_in_no_overlap_2d with
  | None -> ()
  | Some v -> sat_parameters_set_use_timetabling_in_no_overlap_2d _res v);
  (match use_energetic_reasoning_in_no_overlap_2d with
  | None -> ()
  | Some v -> sat_parameters_set_use_energetic_reasoning_in_no_overlap_2d _res v);
  (match use_area_energetic_reasoning_in_no_overlap_2d with
  | None -> ()
  | Some v -> sat_parameters_set_use_area_energetic_reasoning_in_no_overlap_2d _res v);
  (match use_try_edge_reasoning_in_no_overlap_2d with
  | None -> ()
  | Some v -> sat_parameters_set_use_try_edge_reasoning_in_no_overlap_2d _res v);
  (match max_pairs_pairwise_reasoning_in_no_overlap_2d with
  | None -> ()
  | Some v -> sat_parameters_set_max_pairs_pairwise_reasoning_in_no_overlap_2d _res v);
  (match maximum_regions_to_split_in_disconnected_no_overlap_2d with
  | None -> ()
  | Some v -> sat_parameters_set_maximum_regions_to_split_in_disconnected_no_overlap_2d _res v);
  (match use_dual_scheduling_heuristics with
  | None -> ()
  | Some v -> sat_parameters_set_use_dual_scheduling_heuristics _res v);
  (match use_all_different_for_circuit with
  | None -> ()
  | Some v -> sat_parameters_set_use_all_different_for_circuit _res v);
  (match routing_cut_subset_size_for_binary_relation_bound with
  | None -> ()
  | Some v -> sat_parameters_set_routing_cut_subset_size_for_binary_relation_bound _res v);
  (match routing_cut_subset_size_for_tight_binary_relation_bound with
  | None -> ()
  | Some v -> sat_parameters_set_routing_cut_subset_size_for_tight_binary_relation_bound _res v);
  (match routing_cut_dp_effort with
  | None -> ()
  | Some v -> sat_parameters_set_routing_cut_dp_effort _res v);
  (match search_branching with
  | None -> ()
  | Some v -> sat_parameters_set_search_branching _res v);
  (match hint_conflict_limit with
  | None -> ()
  | Some v -> sat_parameters_set_hint_conflict_limit _res v);
  (match repair_hint with
  | None -> ()
  | Some v -> sat_parameters_set_repair_hint _res v);
  (match fix_variables_to_their_hinted_value with
  | None -> ()
  | Some v -> sat_parameters_set_fix_variables_to_their_hinted_value _res v);
  (match use_probing_search with
  | None -> ()
  | Some v -> sat_parameters_set_use_probing_search _res v);
  (match use_extended_probing with
  | None -> ()
  | Some v -> sat_parameters_set_use_extended_probing _res v);
  (match probing_num_combinations_limit with
  | None -> ()
  | Some v -> sat_parameters_set_probing_num_combinations_limit _res v);
  (match use_shaving_in_probing_search with
  | None -> ()
  | Some v -> sat_parameters_set_use_shaving_in_probing_search _res v);
  (match shaving_search_deterministic_time with
  | None -> ()
  | Some v -> sat_parameters_set_shaving_search_deterministic_time _res v);
  (match shaving_search_threshold with
  | None -> ()
  | Some v -> sat_parameters_set_shaving_search_threshold _res v);
  (match use_objective_lb_search with
  | None -> ()
  | Some v -> sat_parameters_set_use_objective_lb_search _res v);
  (match use_objective_shaving_search with
  | None -> ()
  | Some v -> sat_parameters_set_use_objective_shaving_search _res v);
  (match use_variables_shaving_search with
  | None -> ()
  | Some v -> sat_parameters_set_use_variables_shaving_search _res v);
  (match pseudo_cost_reliability_threshold with
  | None -> ()
  | Some v -> sat_parameters_set_pseudo_cost_reliability_threshold _res v);
  (match optimize_with_core with
  | None -> ()
  | Some v -> sat_parameters_set_optimize_with_core _res v);
  (match optimize_with_lb_tree_search with
  | None -> ()
  | Some v -> sat_parameters_set_optimize_with_lb_tree_search _res v);
  (match save_lp_basis_in_lb_tree_search with
  | None -> ()
  | Some v -> sat_parameters_set_save_lp_basis_in_lb_tree_search _res v);
  (match binary_search_num_conflicts with
  | None -> ()
  | Some v -> sat_parameters_set_binary_search_num_conflicts _res v);
  (match optimize_with_max_hs with
  | None -> ()
  | Some v -> sat_parameters_set_optimize_with_max_hs _res v);
  (match use_feasibility_jump with
  | None -> ()
  | Some v -> sat_parameters_set_use_feasibility_jump _res v);
  (match use_ls_only with
  | None -> ()
  | Some v -> sat_parameters_set_use_ls_only _res v);
  (match feasibility_jump_decay with
  | None -> ()
  | Some v -> sat_parameters_set_feasibility_jump_decay _res v);
  (match feasibility_jump_linearization_level with
  | None -> ()
  | Some v -> sat_parameters_set_feasibility_jump_linearization_level _res v);
  (match feasibility_jump_restart_factor with
  | None -> ()
  | Some v -> sat_parameters_set_feasibility_jump_restart_factor _res v);
  (match feasibility_jump_batch_dtime with
  | None -> ()
  | Some v -> sat_parameters_set_feasibility_jump_batch_dtime _res v);
  (match feasibility_jump_var_randomization_probability with
  | None -> ()
  | Some v -> sat_parameters_set_feasibility_jump_var_randomization_probability _res v);
  (match feasibility_jump_var_perburbation_range_ratio with
  | None -> ()
  | Some v -> sat_parameters_set_feasibility_jump_var_perburbation_range_ratio _res v);
  (match feasibility_jump_enable_restarts with
  | None -> ()
  | Some v -> sat_parameters_set_feasibility_jump_enable_restarts _res v);
  (match feasibility_jump_max_expanded_constraint_size with
  | None -> ()
  | Some v -> sat_parameters_set_feasibility_jump_max_expanded_constraint_size _res v);
  (match num_violation_ls with
  | None -> ()
  | Some v -> sat_parameters_set_num_violation_ls _res v);
  (match violation_ls_perturbation_period with
  | None -> ()
  | Some v -> sat_parameters_set_violation_ls_perturbation_period _res v);
  (match violation_ls_compound_move_probability with
  | None -> ()
  | Some v -> sat_parameters_set_violation_ls_compound_move_probability _res v);
  (match shared_tree_num_workers with
  | None -> ()
  | Some v -> sat_parameters_set_shared_tree_num_workers _res v);
  (match use_shared_tree_search with
  | None -> ()
  | Some v -> sat_parameters_set_use_shared_tree_search _res v);
  (match shared_tree_worker_min_restarts_per_subtree with
  | None -> ()
  | Some v -> sat_parameters_set_shared_tree_worker_min_restarts_per_subtree _res v);
  (match shared_tree_worker_enable_trail_sharing with
  | None -> ()
  | Some v -> sat_parameters_set_shared_tree_worker_enable_trail_sharing _res v);
  (match shared_tree_worker_enable_phase_sharing with
  | None -> ()
  | Some v -> sat_parameters_set_shared_tree_worker_enable_phase_sharing _res v);
  (match shared_tree_open_leaves_per_worker with
  | None -> ()
  | Some v -> sat_parameters_set_shared_tree_open_leaves_per_worker _res v);
  (match shared_tree_max_nodes_per_worker with
  | None -> ()
  | Some v -> sat_parameters_set_shared_tree_max_nodes_per_worker _res v);
  (match shared_tree_split_strategy with
  | None -> ()
  | Some v -> sat_parameters_set_shared_tree_split_strategy _res v);
  (match shared_tree_balance_tolerance with
  | None -> ()
  | Some v -> sat_parameters_set_shared_tree_balance_tolerance _res v);
  (match enumerate_all_solutions with
  | None -> ()
  | Some v -> sat_parameters_set_enumerate_all_solutions _res v);
  (match keep_all_feasible_solutions_in_presolve with
  | None -> ()
  | Some v -> sat_parameters_set_keep_all_feasible_solutions_in_presolve _res v);
  (match fill_tightened_domains_in_response with
  | None -> ()
  | Some v -> sat_parameters_set_fill_tightened_domains_in_response _res v);
  (match fill_additional_solutions_in_response with
  | None -> ()
  | Some v -> sat_parameters_set_fill_additional_solutions_in_response _res v);
  (match instantiate_all_variables with
  | None -> ()
  | Some v -> sat_parameters_set_instantiate_all_variables _res v);
  (match auto_detect_greater_than_at_least_one_of with
  | None -> ()
  | Some v -> sat_parameters_set_auto_detect_greater_than_at_least_one_of _res v);
  (match stop_after_first_solution with
  | None -> ()
  | Some v -> sat_parameters_set_stop_after_first_solution _res v);
  (match stop_after_presolve with
  | None -> ()
  | Some v -> sat_parameters_set_stop_after_presolve _res v);
  (match stop_after_root_propagation with
  | None -> ()
  | Some v -> sat_parameters_set_stop_after_root_propagation _res v);
  (match lns_initial_difficulty with
  | None -> ()
  | Some v -> sat_parameters_set_lns_initial_difficulty _res v);
  (match lns_initial_deterministic_limit with
  | None -> ()
  | Some v -> sat_parameters_set_lns_initial_deterministic_limit _res v);
  (match use_lns with
  | None -> ()
  | Some v -> sat_parameters_set_use_lns _res v);
  (match use_lns_only with
  | None -> ()
  | Some v -> sat_parameters_set_use_lns_only _res v);
  (match solution_pool_size with
  | None -> ()
  | Some v -> sat_parameters_set_solution_pool_size _res v);
  (match use_rins_lns with
  | None -> ()
  | Some v -> sat_parameters_set_use_rins_lns _res v);
  (match use_feasibility_pump with
  | None -> ()
  | Some v -> sat_parameters_set_use_feasibility_pump _res v);
  (match use_lb_relax_lns with
  | None -> ()
  | Some v -> sat_parameters_set_use_lb_relax_lns _res v);
  (match lb_relax_num_workers_threshold with
  | None -> ()
  | Some v -> sat_parameters_set_lb_relax_num_workers_threshold _res v);
  (match fp_rounding with
  | None -> ()
  | Some v -> sat_parameters_set_fp_rounding _res v);
  (match diversify_lns_params with
  | None -> ()
  | Some v -> sat_parameters_set_diversify_lns_params _res v);
  (match randomize_search with
  | None -> ()
  | Some v -> sat_parameters_set_randomize_search _res v);
  (match search_random_variable_pool_size with
  | None -> ()
  | Some v -> sat_parameters_set_search_random_variable_pool_size _res v);
  (match push_all_tasks_toward_start with
  | None -> ()
  | Some v -> sat_parameters_set_push_all_tasks_toward_start _res v);
  (match use_optional_variables with
  | None -> ()
  | Some v -> sat_parameters_set_use_optional_variables _res v);
  (match use_exact_lp_reason with
  | None -> ()
  | Some v -> sat_parameters_set_use_exact_lp_reason _res v);
  (match use_combined_no_overlap with
  | None -> ()
  | Some v -> sat_parameters_set_use_combined_no_overlap _res v);
  (match at_most_one_max_expansion_size with
  | None -> ()
  | Some v -> sat_parameters_set_at_most_one_max_expansion_size _res v);
  (match catch_sigint_signal with
  | None -> ()
  | Some v -> sat_parameters_set_catch_sigint_signal _res v);
  (match use_implied_bounds with
  | None -> ()
  | Some v -> sat_parameters_set_use_implied_bounds _res v);
  (match polish_lp_solution with
  | None -> ()
  | Some v -> sat_parameters_set_polish_lp_solution _res v);
  (match lp_primal_tolerance with
  | None -> ()
  | Some v -> sat_parameters_set_lp_primal_tolerance _res v);
  (match lp_dual_tolerance with
  | None -> ()
  | Some v -> sat_parameters_set_lp_dual_tolerance _res v);
  (match convert_intervals with
  | None -> ()
  | Some v -> sat_parameters_set_convert_intervals _res v);
  (match symmetry_level with
  | None -> ()
  | Some v -> sat_parameters_set_symmetry_level _res v);
  (match use_symmetry_in_lp with
  | None -> ()
  | Some v -> sat_parameters_set_use_symmetry_in_lp _res v);
  (match keep_symmetry_in_presolve with
  | None -> ()
  | Some v -> sat_parameters_set_keep_symmetry_in_presolve _res v);
  (match symmetry_detection_deterministic_time_limit with
  | None -> ()
  | Some v -> sat_parameters_set_symmetry_detection_deterministic_time_limit _res v);
  (match new_linear_propagation with
  | None -> ()
  | Some v -> sat_parameters_set_new_linear_propagation _res v);
  (match linear_split_size with
  | None -> ()
  | Some v -> sat_parameters_set_linear_split_size _res v);
  (match linearization_level with
  | None -> ()
  | Some v -> sat_parameters_set_linearization_level _res v);
  (match boolean_encoding_level with
  | None -> ()
  | Some v -> sat_parameters_set_boolean_encoding_level _res v);
  (match max_domain_size_when_encoding_eq_neq_constraints with
  | None -> ()
  | Some v -> sat_parameters_set_max_domain_size_when_encoding_eq_neq_constraints _res v);
  (match max_num_cuts with
  | None -> ()
  | Some v -> sat_parameters_set_max_num_cuts _res v);
  (match cut_level with
  | None -> ()
  | Some v -> sat_parameters_set_cut_level _res v);
  (match only_add_cuts_at_level_zero with
  | None -> ()
  | Some v -> sat_parameters_set_only_add_cuts_at_level_zero _res v);
  (match add_objective_cut with
  | None -> ()
  | Some v -> sat_parameters_set_add_objective_cut _res v);
  (match add_cg_cuts with
  | None -> ()
  | Some v -> sat_parameters_set_add_cg_cuts _res v);
  (match add_mir_cuts with
  | None -> ()
  | Some v -> sat_parameters_set_add_mir_cuts _res v);
  (match add_zero_half_cuts with
  | None -> ()
  | Some v -> sat_parameters_set_add_zero_half_cuts _res v);
  (match add_clique_cuts with
  | None -> ()
  | Some v -> sat_parameters_set_add_clique_cuts _res v);
  (match add_rlt_cuts with
  | None -> ()
  | Some v -> sat_parameters_set_add_rlt_cuts _res v);
  (match max_all_diff_cut_size with
  | None -> ()
  | Some v -> sat_parameters_set_max_all_diff_cut_size _res v);
  (match add_lin_max_cuts with
  | None -> ()
  | Some v -> sat_parameters_set_add_lin_max_cuts _res v);
  (match max_integer_rounding_scaling with
  | None -> ()
  | Some v -> sat_parameters_set_max_integer_rounding_scaling _res v);
  (match add_lp_constraints_lazily with
  | None -> ()
  | Some v -> sat_parameters_set_add_lp_constraints_lazily _res v);
  (match root_lp_iterations with
  | None -> ()
  | Some v -> sat_parameters_set_root_lp_iterations _res v);
  (match min_orthogonality_for_lp_constraints with
  | None -> ()
  | Some v -> sat_parameters_set_min_orthogonality_for_lp_constraints _res v);
  (match max_cut_rounds_at_level_zero with
  | None -> ()
  | Some v -> sat_parameters_set_max_cut_rounds_at_level_zero _res v);
  (match max_consecutive_inactive_count with
  | None -> ()
  | Some v -> sat_parameters_set_max_consecutive_inactive_count _res v);
  (match cut_max_active_count_value with
  | None -> ()
  | Some v -> sat_parameters_set_cut_max_active_count_value _res v);
  (match cut_active_count_decay with
  | None -> ()
  | Some v -> sat_parameters_set_cut_active_count_decay _res v);
  (match cut_cleanup_target with
  | None -> ()
  | Some v -> sat_parameters_set_cut_cleanup_target _res v);
  (match new_constraints_batch_size with
  | None -> ()
  | Some v -> sat_parameters_set_new_constraints_batch_size _res v);
  (match exploit_integer_lp_solution with
  | None -> ()
  | Some v -> sat_parameters_set_exploit_integer_lp_solution _res v);
  (match exploit_all_lp_solution with
  | None -> ()
  | Some v -> sat_parameters_set_exploit_all_lp_solution _res v);
  (match exploit_best_solution with
  | None -> ()
  | Some v -> sat_parameters_set_exploit_best_solution _res v);
  (match exploit_relaxation_solution with
  | None -> ()
  | Some v -> sat_parameters_set_exploit_relaxation_solution _res v);
  (match exploit_objective with
  | None -> ()
  | Some v -> sat_parameters_set_exploit_objective _res v);
  (match detect_linearized_product with
  | None -> ()
  | Some v -> sat_parameters_set_detect_linearized_product _res v);
  (match mip_max_bound with
  | None -> ()
  | Some v -> sat_parameters_set_mip_max_bound _res v);
  (match mip_var_scaling with
  | None -> ()
  | Some v -> sat_parameters_set_mip_var_scaling _res v);
  (match mip_scale_large_domain with
  | None -> ()
  | Some v -> sat_parameters_set_mip_scale_large_domain _res v);
  (match mip_automatically_scale_variables with
  | None -> ()
  | Some v -> sat_parameters_set_mip_automatically_scale_variables _res v);
  (match only_solve_ip with
  | None -> ()
  | Some v -> sat_parameters_set_only_solve_ip _res v);
  (match mip_wanted_precision with
  | None -> ()
  | Some v -> sat_parameters_set_mip_wanted_precision _res v);
  (match mip_max_activity_exponent with
  | None -> ()
  | Some v -> sat_parameters_set_mip_max_activity_exponent _res v);
  (match mip_check_precision with
  | None -> ()
  | Some v -> sat_parameters_set_mip_check_precision _res v);
  (match mip_compute_true_objective_bound with
  | None -> ()
  | Some v -> sat_parameters_set_mip_compute_true_objective_bound _res v);
  (match mip_max_valid_magnitude with
  | None -> ()
  | Some v -> sat_parameters_set_mip_max_valid_magnitude _res v);
  (match mip_treat_high_magnitude_bounds_as_infinity with
  | None -> ()
  | Some v -> sat_parameters_set_mip_treat_high_magnitude_bounds_as_infinity _res v);
  (match mip_drop_tolerance with
  | None -> ()
  | Some v -> sat_parameters_set_mip_drop_tolerance _res v);
  (match mip_presolve_level with
  | None -> ()
  | Some v -> sat_parameters_set_mip_presolve_level _res v);
  _res

[@@@ocaml.warning "-23-27-30-39"]

(** {2 Formatters} *)

let rec pp_sat_parameters_variable_order fmt (v:sat_parameters_variable_order) =
  match v with
  | In_order -> Format.fprintf fmt "In_order"
  | In_reverse_order -> Format.fprintf fmt "In_reverse_order"
  | In_random_order -> Format.fprintf fmt "In_random_order"

let rec pp_sat_parameters_polarity fmt (v:sat_parameters_polarity) =
  match v with
  | Polarity_true -> Format.fprintf fmt "Polarity_true"
  | Polarity_false -> Format.fprintf fmt "Polarity_false"
  | Polarity_random -> Format.fprintf fmt "Polarity_random"

let rec pp_sat_parameters_conflict_minimization_algorithm fmt (v:sat_parameters_conflict_minimization_algorithm) =
  match v with
  | None -> Format.fprintf fmt "None"
  | Simple -> Format.fprintf fmt "Simple"
  | Recursive -> Format.fprintf fmt "Recursive"
  | Experimental -> Format.fprintf fmt "Experimental"

let rec pp_sat_parameters_binary_minization_algorithm fmt (v:sat_parameters_binary_minization_algorithm) =
  match v with
  | No_binary_minimization -> Format.fprintf fmt "No_binary_minimization"
  | Binary_minimization_first -> Format.fprintf fmt "Binary_minimization_first"
  | Binary_minimization_first_with_transitive_reduction -> Format.fprintf fmt "Binary_minimization_first_with_transitive_reduction"
  | Binary_minimization_with_reachability -> Format.fprintf fmt "Binary_minimization_with_reachability"
  | Experimental_binary_minimization -> Format.fprintf fmt "Experimental_binary_minimization"

let rec pp_sat_parameters_clause_protection fmt (v:sat_parameters_clause_protection) =
  match v with
  | Protection_none -> Format.fprintf fmt "Protection_none"
  | Protection_always -> Format.fprintf fmt "Protection_always"
  | Protection_lbd -> Format.fprintf fmt "Protection_lbd"

let rec pp_sat_parameters_clause_ordering fmt (v:sat_parameters_clause_ordering) =
  match v with
  | Clause_activity -> Format.fprintf fmt "Clause_activity"
  | Clause_lbd -> Format.fprintf fmt "Clause_lbd"

let rec pp_sat_parameters_restart_algorithm fmt (v:sat_parameters_restart_algorithm) =
  match v with
  | No_restart -> Format.fprintf fmt "No_restart"
  | Luby_restart -> Format.fprintf fmt "Luby_restart"
  | Dl_moving_average_restart -> Format.fprintf fmt "Dl_moving_average_restart"
  | Lbd_moving_average_restart -> Format.fprintf fmt "Lbd_moving_average_restart"
  | Fixed_restart -> Format.fprintf fmt "Fixed_restart"

let rec pp_sat_parameters_max_sat_assumption_order fmt (v:sat_parameters_max_sat_assumption_order) =
  match v with
  | Default_assumption_order -> Format.fprintf fmt "Default_assumption_order"
  | Order_assumption_by_depth -> Format.fprintf fmt "Order_assumption_by_depth"
  | Order_assumption_by_weight -> Format.fprintf fmt "Order_assumption_by_weight"

let rec pp_sat_parameters_max_sat_stratification_algorithm fmt (v:sat_parameters_max_sat_stratification_algorithm) =
  match v with
  | Stratification_none -> Format.fprintf fmt "Stratification_none"
  | Stratification_descent -> Format.fprintf fmt "Stratification_descent"
  | Stratification_ascent -> Format.fprintf fmt "Stratification_ascent"

let rec pp_sat_parameters_search_branching fmt (v:sat_parameters_search_branching) =
  match v with
  | Automatic_search -> Format.fprintf fmt "Automatic_search"
  | Fixed_search -> Format.fprintf fmt "Fixed_search"
  | Portfolio_search -> Format.fprintf fmt "Portfolio_search"
  | Lp_search -> Format.fprintf fmt "Lp_search"
  | Pseudo_cost_search -> Format.fprintf fmt "Pseudo_cost_search"
  | Portfolio_with_quick_restart_search -> Format.fprintf fmt "Portfolio_with_quick_restart_search"
  | Hint_search -> Format.fprintf fmt "Hint_search"
  | Partial_fixed_search -> Format.fprintf fmt "Partial_fixed_search"
  | Randomized_search -> Format.fprintf fmt "Randomized_search"

let rec pp_sat_parameters_shared_tree_split_strategy fmt (v:sat_parameters_shared_tree_split_strategy) =
  match v with
  | Split_strategy_auto -> Format.fprintf fmt "Split_strategy_auto"
  | Split_strategy_discrepancy -> Format.fprintf fmt "Split_strategy_discrepancy"
  | Split_strategy_objective_lb -> Format.fprintf fmt "Split_strategy_objective_lb"
  | Split_strategy_balanced_tree -> Format.fprintf fmt "Split_strategy_balanced_tree"
  | Split_strategy_first_proposal -> Format.fprintf fmt "Split_strategy_first_proposal"

let rec pp_sat_parameters_fprounding_method fmt (v:sat_parameters_fprounding_method) =
  match v with
  | Nearest_integer -> Format.fprintf fmt "Nearest_integer"
  | Lock_based -> Format.fprintf fmt "Lock_based"
  | Active_lock_based -> Format.fprintf fmt "Active_lock_based"
  | Propagation_assisted -> Format.fprintf fmt "Propagation_assisted"

let rec pp_sat_parameters fmt (v:sat_parameters) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_name v)) ~first:true "name" Pbrt.Pp.pp_string fmt v.name;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_preferred_variable_order v)) ~first:false "preferred_variable_order" pp_sat_parameters_variable_order fmt v.preferred_variable_order;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_initial_polarity v)) ~first:false "initial_polarity" pp_sat_parameters_polarity fmt v.initial_polarity;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_use_phase_saving v)) ~first:false "use_phase_saving" Pbrt.Pp.pp_bool fmt v.use_phase_saving;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_polarity_rephase_increment v)) ~first:false "polarity_rephase_increment" Pbrt.Pp.pp_int32 fmt v.polarity_rephase_increment;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_polarity_exploit_ls_hints v)) ~first:false "polarity_exploit_ls_hints" Pbrt.Pp.pp_bool fmt v.polarity_exploit_ls_hints;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_random_polarity_ratio v)) ~first:false "random_polarity_ratio" Pbrt.Pp.pp_float fmt v.random_polarity_ratio;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_random_branches_ratio v)) ~first:false "random_branches_ratio" Pbrt.Pp.pp_float fmt v.random_branches_ratio;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_use_erwa_heuristic v)) ~first:false "use_erwa_heuristic" Pbrt.Pp.pp_bool fmt v.use_erwa_heuristic;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_initial_variables_activity v)) ~first:false "initial_variables_activity" Pbrt.Pp.pp_float fmt v.initial_variables_activity;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_also_bump_variables_in_conflict_reasons v)) ~first:false "also_bump_variables_in_conflict_reasons" Pbrt.Pp.pp_bool fmt v.also_bump_variables_in_conflict_reasons;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_minimization_algorithm v)) ~first:false "minimization_algorithm" pp_sat_parameters_conflict_minimization_algorithm fmt v.minimization_algorithm;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_binary_minimization_algorithm v)) ~first:false "binary_minimization_algorithm" pp_sat_parameters_binary_minization_algorithm fmt v.binary_minimization_algorithm;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_subsumption_during_conflict_analysis v)) ~first:false "subsumption_during_conflict_analysis" Pbrt.Pp.pp_bool fmt v.subsumption_during_conflict_analysis;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_clause_cleanup_period v)) ~first:false "clause_cleanup_period" Pbrt.Pp.pp_int32 fmt v.clause_cleanup_period;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_clause_cleanup_target v)) ~first:false "clause_cleanup_target" Pbrt.Pp.pp_int32 fmt v.clause_cleanup_target;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_clause_cleanup_ratio v)) ~first:false "clause_cleanup_ratio" Pbrt.Pp.pp_float fmt v.clause_cleanup_ratio;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_clause_cleanup_protection v)) ~first:false "clause_cleanup_protection" pp_sat_parameters_clause_protection fmt v.clause_cleanup_protection;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_clause_cleanup_lbd_bound v)) ~first:false "clause_cleanup_lbd_bound" Pbrt.Pp.pp_int32 fmt v.clause_cleanup_lbd_bound;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_clause_cleanup_ordering v)) ~first:false "clause_cleanup_ordering" pp_sat_parameters_clause_ordering fmt v.clause_cleanup_ordering;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_pb_cleanup_increment v)) ~first:false "pb_cleanup_increment" Pbrt.Pp.pp_int32 fmt v.pb_cleanup_increment;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_pb_cleanup_ratio v)) ~first:false "pb_cleanup_ratio" Pbrt.Pp.pp_float fmt v.pb_cleanup_ratio;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_variable_activity_decay v)) ~first:false "variable_activity_decay" Pbrt.Pp.pp_float fmt v.variable_activity_decay;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_max_variable_activity_value v)) ~first:false "max_variable_activity_value" Pbrt.Pp.pp_float fmt v.max_variable_activity_value;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_glucose_max_decay v)) ~first:false "glucose_max_decay" Pbrt.Pp.pp_float fmt v.glucose_max_decay;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_glucose_decay_increment v)) ~first:false "glucose_decay_increment" Pbrt.Pp.pp_float fmt v.glucose_decay_increment;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_glucose_decay_increment_period v)) ~first:false "glucose_decay_increment_period" Pbrt.Pp.pp_int32 fmt v.glucose_decay_increment_period;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_clause_activity_decay v)) ~first:false "clause_activity_decay" Pbrt.Pp.pp_float fmt v.clause_activity_decay;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_max_clause_activity_value v)) ~first:false "max_clause_activity_value" Pbrt.Pp.pp_float fmt v.max_clause_activity_value;
    Pbrt.Pp.pp_record_field ~first:false "restart_algorithms" (Pbrt.Pp.pp_list pp_sat_parameters_restart_algorithm) fmt v.restart_algorithms;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_default_restart_algorithms v)) ~first:false "default_restart_algorithms" Pbrt.Pp.pp_string fmt v.default_restart_algorithms;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_restart_period v)) ~first:false "restart_period" Pbrt.Pp.pp_int32 fmt v.restart_period;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_restart_running_window_size v)) ~first:false "restart_running_window_size" Pbrt.Pp.pp_int32 fmt v.restart_running_window_size;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_restart_dl_average_ratio v)) ~first:false "restart_dl_average_ratio" Pbrt.Pp.pp_float fmt v.restart_dl_average_ratio;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_restart_lbd_average_ratio v)) ~first:false "restart_lbd_average_ratio" Pbrt.Pp.pp_float fmt v.restart_lbd_average_ratio;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_use_blocking_restart v)) ~first:false "use_blocking_restart" Pbrt.Pp.pp_bool fmt v.use_blocking_restart;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_blocking_restart_window_size v)) ~first:false "blocking_restart_window_size" Pbrt.Pp.pp_int32 fmt v.blocking_restart_window_size;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_blocking_restart_multiplier v)) ~first:false "blocking_restart_multiplier" Pbrt.Pp.pp_float fmt v.blocking_restart_multiplier;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_num_conflicts_before_strategy_changes v)) ~first:false "num_conflicts_before_strategy_changes" Pbrt.Pp.pp_int32 fmt v.num_conflicts_before_strategy_changes;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_strategy_change_increase_ratio v)) ~first:false "strategy_change_increase_ratio" Pbrt.Pp.pp_float fmt v.strategy_change_increase_ratio;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_max_time_in_seconds v)) ~first:false "max_time_in_seconds" Pbrt.Pp.pp_float fmt v.max_time_in_seconds;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_max_deterministic_time v)) ~first:false "max_deterministic_time" Pbrt.Pp.pp_float fmt v.max_deterministic_time;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_max_num_deterministic_batches v)) ~first:false "max_num_deterministic_batches" Pbrt.Pp.pp_int32 fmt v.max_num_deterministic_batches;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_max_number_of_conflicts v)) ~first:false "max_number_of_conflicts" Pbrt.Pp.pp_int64 fmt v.max_number_of_conflicts;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_max_memory_in_mb v)) ~first:false "max_memory_in_mb" Pbrt.Pp.pp_int64 fmt v.max_memory_in_mb;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_absolute_gap_limit v)) ~first:false "absolute_gap_limit" Pbrt.Pp.pp_float fmt v.absolute_gap_limit;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_relative_gap_limit v)) ~first:false "relative_gap_limit" Pbrt.Pp.pp_float fmt v.relative_gap_limit;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_random_seed v)) ~first:false "random_seed" Pbrt.Pp.pp_int32 fmt v.random_seed;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_permute_variable_randomly v)) ~first:false "permute_variable_randomly" Pbrt.Pp.pp_bool fmt v.permute_variable_randomly;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_permute_presolve_constraint_order v)) ~first:false "permute_presolve_constraint_order" Pbrt.Pp.pp_bool fmt v.permute_presolve_constraint_order;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_use_absl_random v)) ~first:false "use_absl_random" Pbrt.Pp.pp_bool fmt v.use_absl_random;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_log_search_progress v)) ~first:false "log_search_progress" Pbrt.Pp.pp_bool fmt v.log_search_progress;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_log_subsolver_statistics v)) ~first:false "log_subsolver_statistics" Pbrt.Pp.pp_bool fmt v.log_subsolver_statistics;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_log_prefix v)) ~first:false "log_prefix" Pbrt.Pp.pp_string fmt v.log_prefix;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_log_to_stdout v)) ~first:false "log_to_stdout" Pbrt.Pp.pp_bool fmt v.log_to_stdout;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_log_to_response v)) ~first:false "log_to_response" Pbrt.Pp.pp_bool fmt v.log_to_response;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_use_pb_resolution v)) ~first:false "use_pb_resolution" Pbrt.Pp.pp_bool fmt v.use_pb_resolution;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_minimize_reduction_during_pb_resolution v)) ~first:false "minimize_reduction_during_pb_resolution" Pbrt.Pp.pp_bool fmt v.minimize_reduction_during_pb_resolution;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_count_assumption_levels_in_lbd v)) ~first:false "count_assumption_levels_in_lbd" Pbrt.Pp.pp_bool fmt v.count_assumption_levels_in_lbd;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_presolve_bve_threshold v)) ~first:false "presolve_bve_threshold" Pbrt.Pp.pp_int32 fmt v.presolve_bve_threshold;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_presolve_bve_clause_weight v)) ~first:false "presolve_bve_clause_weight" Pbrt.Pp.pp_int32 fmt v.presolve_bve_clause_weight;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_probing_deterministic_time_limit v)) ~first:false "probing_deterministic_time_limit" Pbrt.Pp.pp_float fmt v.probing_deterministic_time_limit;
    Pbrt.Pp.pp_record_field ~absent:(not (sat_parameters_has_presolve_probing_deterministic_time_limit v)) ~first:false "presolve_probing_deterministic_time_limit" Pbrt.Pp.pp_float fmt v.presolve_probing_deterministic_time_limit;
    Pbrt.Pp.pp_record_field ~first:false "presolve_blocked_clause" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.presolve_blocked_clause;
    Pbrt.Pp.pp_record_field ~first:false "presolve_use_bva" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.presolve_use_bva;
    Pbrt.Pp.pp_record_field ~first:false "presolve_bva_threshold" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.presolve_bva_threshold;
    Pbrt.Pp.pp_record_field ~first:false "max_presolve_iterations" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_presolve_iterations;
    Pbrt.Pp.pp_record_field ~first:false "cp_model_presolve" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.cp_model_presolve;
    Pbrt.Pp.pp_record_field ~first:false "cp_model_probing_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.cp_model_probing_level;
    Pbrt.Pp.pp_record_field ~first:false "cp_model_use_sat_presolve" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.cp_model_use_sat_presolve;
    Pbrt.Pp.pp_record_field ~first:false "remove_fixed_variables_early" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.remove_fixed_variables_early;
    Pbrt.Pp.pp_record_field ~first:false "detect_table_with_cost" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.detect_table_with_cost;
    Pbrt.Pp.pp_record_field ~first:false "table_compression_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.table_compression_level;
    Pbrt.Pp.pp_record_field ~first:false "expand_alldiff_constraints" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.expand_alldiff_constraints;
    Pbrt.Pp.pp_record_field ~first:false "expand_reservoir_constraints" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.expand_reservoir_constraints;
    Pbrt.Pp.pp_record_field ~first:false "expand_reservoir_using_circuit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.expand_reservoir_using_circuit;
    Pbrt.Pp.pp_record_field ~first:false "encode_cumulative_as_reservoir" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.encode_cumulative_as_reservoir;
    Pbrt.Pp.pp_record_field ~first:false "max_lin_max_size_for_expansion" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_lin_max_size_for_expansion;
    Pbrt.Pp.pp_record_field ~first:false "disable_constraint_expansion" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.disable_constraint_expansion;
    Pbrt.Pp.pp_record_field ~first:false "encode_complex_linear_constraint_with_integer" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.encode_complex_linear_constraint_with_integer;
    Pbrt.Pp.pp_record_field ~first:false "merge_no_overlap_work_limit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.merge_no_overlap_work_limit;
    Pbrt.Pp.pp_record_field ~first:false "merge_at_most_one_work_limit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.merge_at_most_one_work_limit;
    Pbrt.Pp.pp_record_field ~first:false "presolve_substitution_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.presolve_substitution_level;
    Pbrt.Pp.pp_record_field ~first:false "presolve_extract_integer_enforcement" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.presolve_extract_integer_enforcement;
    Pbrt.Pp.pp_record_field ~first:false "presolve_inclusion_work_limit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64) fmt v.presolve_inclusion_work_limit;
    Pbrt.Pp.pp_record_field ~first:false "ignore_names" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.ignore_names;
    Pbrt.Pp.pp_record_field ~first:false "infer_all_diffs" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.infer_all_diffs;
    Pbrt.Pp.pp_record_field ~first:false "find_big_linear_overlap" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.find_big_linear_overlap;
    Pbrt.Pp.pp_record_field ~first:false "use_sat_inprocessing" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_sat_inprocessing;
    Pbrt.Pp.pp_record_field ~first:false "inprocessing_dtime_ratio" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.inprocessing_dtime_ratio;
    Pbrt.Pp.pp_record_field ~first:false "inprocessing_probing_dtime" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.inprocessing_probing_dtime;
    Pbrt.Pp.pp_record_field ~first:false "inprocessing_minimization_dtime" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.inprocessing_minimization_dtime;
    Pbrt.Pp.pp_record_field ~first:false "inprocessing_minimization_use_conflict_analysis" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.inprocessing_minimization_use_conflict_analysis;
    Pbrt.Pp.pp_record_field ~first:false "inprocessing_minimization_use_all_orderings" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.inprocessing_minimization_use_all_orderings;
    Pbrt.Pp.pp_record_field ~first:false "num_workers" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.num_workers;
    Pbrt.Pp.pp_record_field ~first:false "num_search_workers" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.num_search_workers;
    Pbrt.Pp.pp_record_field ~first:false "num_full_subsolvers" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.num_full_subsolvers;
    Pbrt.Pp.pp_record_field ~first:false "subsolvers" (Pbrt.Pp.pp_list Pbrt.Pp.pp_string) fmt v.subsolvers;
    Pbrt.Pp.pp_record_field ~first:false "extra_subsolvers" (Pbrt.Pp.pp_list Pbrt.Pp.pp_string) fmt v.extra_subsolvers;
    Pbrt.Pp.pp_record_field ~first:false "ignore_subsolvers" (Pbrt.Pp.pp_list Pbrt.Pp.pp_string) fmt v.ignore_subsolvers;
    Pbrt.Pp.pp_record_field ~first:false "filter_subsolvers" (Pbrt.Pp.pp_list Pbrt.Pp.pp_string) fmt v.filter_subsolvers;
    Pbrt.Pp.pp_record_field ~first:false "subsolver_params" (Pbrt.Pp.pp_list pp_sat_parameters) fmt v.subsolver_params;
    Pbrt.Pp.pp_record_field ~first:false "interleave_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.interleave_search;
    Pbrt.Pp.pp_record_field ~first:false "interleave_batch_size" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.interleave_batch_size;
    Pbrt.Pp.pp_record_field ~first:false "share_objective_bounds" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.share_objective_bounds;
    Pbrt.Pp.pp_record_field ~first:false "share_level_zero_bounds" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.share_level_zero_bounds;
    Pbrt.Pp.pp_record_field ~first:false "share_binary_clauses" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.share_binary_clauses;
    Pbrt.Pp.pp_record_field ~first:false "share_glue_clauses" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.share_glue_clauses;
    Pbrt.Pp.pp_record_field ~first:false "minimize_shared_clauses" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.minimize_shared_clauses;
    Pbrt.Pp.pp_record_field ~first:false "debug_postsolve_with_full_solver" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.debug_postsolve_with_full_solver;
    Pbrt.Pp.pp_record_field ~first:false "debug_max_num_presolve_operations" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.debug_max_num_presolve_operations;
    Pbrt.Pp.pp_record_field ~first:false "debug_crash_on_bad_hint" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.debug_crash_on_bad_hint;
    Pbrt.Pp.pp_record_field ~first:false "debug_crash_if_presolve_breaks_hint" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.debug_crash_if_presolve_breaks_hint;
    Pbrt.Pp.pp_record_field ~first:false "use_optimization_hints" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_optimization_hints;
    Pbrt.Pp.pp_record_field ~first:false "core_minimization_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.core_minimization_level;
    Pbrt.Pp.pp_record_field ~first:false "find_multiple_cores" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.find_multiple_cores;
    Pbrt.Pp.pp_record_field ~first:false "cover_optimization" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.cover_optimization;
    Pbrt.Pp.pp_record_field ~first:false "max_sat_assumption_order" (Pbrt.Pp.pp_option pp_sat_parameters_max_sat_assumption_order) fmt v.max_sat_assumption_order;
    Pbrt.Pp.pp_record_field ~first:false "max_sat_reverse_assumption_order" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.max_sat_reverse_assumption_order;
    Pbrt.Pp.pp_record_field ~first:false "max_sat_stratification" (Pbrt.Pp.pp_option pp_sat_parameters_max_sat_stratification_algorithm) fmt v.max_sat_stratification;
    Pbrt.Pp.pp_record_field ~first:false "propagation_loop_detection_factor" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.propagation_loop_detection_factor;
    Pbrt.Pp.pp_record_field ~first:false "use_precedences_in_disjunctive_constraint" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_precedences_in_disjunctive_constraint;
    Pbrt.Pp.pp_record_field ~first:false "max_size_to_create_precedence_literals_in_disjunctive" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_size_to_create_precedence_literals_in_disjunctive;
    Pbrt.Pp.pp_record_field ~first:false "use_strong_propagation_in_disjunctive" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_strong_propagation_in_disjunctive;
    Pbrt.Pp.pp_record_field ~first:false "use_dynamic_precedence_in_disjunctive" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_dynamic_precedence_in_disjunctive;
    Pbrt.Pp.pp_record_field ~first:false "use_dynamic_precedence_in_cumulative" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_dynamic_precedence_in_cumulative;
    Pbrt.Pp.pp_record_field ~first:false "use_overload_checker_in_cumulative" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_overload_checker_in_cumulative;
    Pbrt.Pp.pp_record_field ~first:false "use_conservative_scale_overload_checker" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_conservative_scale_overload_checker;
    Pbrt.Pp.pp_record_field ~first:false "use_timetable_edge_finding_in_cumulative" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_timetable_edge_finding_in_cumulative;
    Pbrt.Pp.pp_record_field ~first:false "max_num_intervals_for_timetable_edge_finding" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_num_intervals_for_timetable_edge_finding;
    Pbrt.Pp.pp_record_field ~first:false "use_hard_precedences_in_cumulative" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_hard_precedences_in_cumulative;
    Pbrt.Pp.pp_record_field ~first:false "exploit_all_precedences" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.exploit_all_precedences;
    Pbrt.Pp.pp_record_field ~first:false "use_disjunctive_constraint_in_cumulative" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_disjunctive_constraint_in_cumulative;
    Pbrt.Pp.pp_record_field ~first:false "use_timetabling_in_no_overlap_2d" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_timetabling_in_no_overlap_2d;
    Pbrt.Pp.pp_record_field ~first:false "use_energetic_reasoning_in_no_overlap_2d" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_energetic_reasoning_in_no_overlap_2d;
    Pbrt.Pp.pp_record_field ~first:false "use_area_energetic_reasoning_in_no_overlap_2d" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_area_energetic_reasoning_in_no_overlap_2d;
    Pbrt.Pp.pp_record_field ~first:false "use_try_edge_reasoning_in_no_overlap_2d" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_try_edge_reasoning_in_no_overlap_2d;
    Pbrt.Pp.pp_record_field ~first:false "max_pairs_pairwise_reasoning_in_no_overlap_2d" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_pairs_pairwise_reasoning_in_no_overlap_2d;
    Pbrt.Pp.pp_record_field ~first:false "maximum_regions_to_split_in_disconnected_no_overlap_2d" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.maximum_regions_to_split_in_disconnected_no_overlap_2d;
    Pbrt.Pp.pp_record_field ~first:false "use_dual_scheduling_heuristics" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_dual_scheduling_heuristics;
    Pbrt.Pp.pp_record_field ~first:false "use_all_different_for_circuit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_all_different_for_circuit;
    Pbrt.Pp.pp_record_field ~first:false "routing_cut_subset_size_for_binary_relation_bound" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.routing_cut_subset_size_for_binary_relation_bound;
    Pbrt.Pp.pp_record_field ~first:false "routing_cut_subset_size_for_tight_binary_relation_bound" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.routing_cut_subset_size_for_tight_binary_relation_bound;
    Pbrt.Pp.pp_record_field ~first:false "routing_cut_dp_effort" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.routing_cut_dp_effort;
    Pbrt.Pp.pp_record_field ~first:false "search_branching" (Pbrt.Pp.pp_option pp_sat_parameters_search_branching) fmt v.search_branching;
    Pbrt.Pp.pp_record_field ~first:false "hint_conflict_limit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.hint_conflict_limit;
    Pbrt.Pp.pp_record_field ~first:false "repair_hint" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.repair_hint;
    Pbrt.Pp.pp_record_field ~first:false "fix_variables_to_their_hinted_value" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.fix_variables_to_their_hinted_value;
    Pbrt.Pp.pp_record_field ~first:false "use_probing_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_probing_search;
    Pbrt.Pp.pp_record_field ~first:false "use_extended_probing" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_extended_probing;
    Pbrt.Pp.pp_record_field ~first:false "probing_num_combinations_limit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.probing_num_combinations_limit;
    Pbrt.Pp.pp_record_field ~first:false "use_shaving_in_probing_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_shaving_in_probing_search;
    Pbrt.Pp.pp_record_field ~first:false "shaving_search_deterministic_time" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.shaving_search_deterministic_time;
    Pbrt.Pp.pp_record_field ~first:false "shaving_search_threshold" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64) fmt v.shaving_search_threshold;
    Pbrt.Pp.pp_record_field ~first:false "use_objective_lb_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_objective_lb_search;
    Pbrt.Pp.pp_record_field ~first:false "use_objective_shaving_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_objective_shaving_search;
    Pbrt.Pp.pp_record_field ~first:false "use_variables_shaving_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_variables_shaving_search;
    Pbrt.Pp.pp_record_field ~first:false "pseudo_cost_reliability_threshold" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64) fmt v.pseudo_cost_reliability_threshold;
    Pbrt.Pp.pp_record_field ~first:false "optimize_with_core" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.optimize_with_core;
    Pbrt.Pp.pp_record_field ~first:false "optimize_with_lb_tree_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.optimize_with_lb_tree_search;
    Pbrt.Pp.pp_record_field ~first:false "save_lp_basis_in_lb_tree_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.save_lp_basis_in_lb_tree_search;
    Pbrt.Pp.pp_record_field ~first:false "binary_search_num_conflicts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.binary_search_num_conflicts;
    Pbrt.Pp.pp_record_field ~first:false "optimize_with_max_hs" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.optimize_with_max_hs;
    Pbrt.Pp.pp_record_field ~first:false "use_feasibility_jump" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_feasibility_jump;
    Pbrt.Pp.pp_record_field ~first:false "use_ls_only" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_ls_only;
    Pbrt.Pp.pp_record_field ~first:false "feasibility_jump_decay" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.feasibility_jump_decay;
    Pbrt.Pp.pp_record_field ~first:false "feasibility_jump_linearization_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.feasibility_jump_linearization_level;
    Pbrt.Pp.pp_record_field ~first:false "feasibility_jump_restart_factor" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.feasibility_jump_restart_factor;
    Pbrt.Pp.pp_record_field ~first:false "feasibility_jump_batch_dtime" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.feasibility_jump_batch_dtime;
    Pbrt.Pp.pp_record_field ~first:false "feasibility_jump_var_randomization_probability" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.feasibility_jump_var_randomization_probability;
    Pbrt.Pp.pp_record_field ~first:false "feasibility_jump_var_perburbation_range_ratio" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.feasibility_jump_var_perburbation_range_ratio;
    Pbrt.Pp.pp_record_field ~first:false "feasibility_jump_enable_restarts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.feasibility_jump_enable_restarts;
    Pbrt.Pp.pp_record_field ~first:false "feasibility_jump_max_expanded_constraint_size" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.feasibility_jump_max_expanded_constraint_size;
    Pbrt.Pp.pp_record_field ~first:false "num_violation_ls" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.num_violation_ls;
    Pbrt.Pp.pp_record_field ~first:false "violation_ls_perturbation_period" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.violation_ls_perturbation_period;
    Pbrt.Pp.pp_record_field ~first:false "violation_ls_compound_move_probability" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.violation_ls_compound_move_probability;
    Pbrt.Pp.pp_record_field ~first:false "shared_tree_num_workers" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.shared_tree_num_workers;
    Pbrt.Pp.pp_record_field ~first:false "use_shared_tree_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_shared_tree_search;
    Pbrt.Pp.pp_record_field ~first:false "shared_tree_worker_min_restarts_per_subtree" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.shared_tree_worker_min_restarts_per_subtree;
    Pbrt.Pp.pp_record_field ~first:false "shared_tree_worker_enable_trail_sharing" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.shared_tree_worker_enable_trail_sharing;
    Pbrt.Pp.pp_record_field ~first:false "shared_tree_worker_enable_phase_sharing" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.shared_tree_worker_enable_phase_sharing;
    Pbrt.Pp.pp_record_field ~first:false "shared_tree_open_leaves_per_worker" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.shared_tree_open_leaves_per_worker;
    Pbrt.Pp.pp_record_field ~first:false "shared_tree_max_nodes_per_worker" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.shared_tree_max_nodes_per_worker;
    Pbrt.Pp.pp_record_field ~first:false "shared_tree_split_strategy" (Pbrt.Pp.pp_option pp_sat_parameters_shared_tree_split_strategy) fmt v.shared_tree_split_strategy;
    Pbrt.Pp.pp_record_field ~first:false "shared_tree_balance_tolerance" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.shared_tree_balance_tolerance;
    Pbrt.Pp.pp_record_field ~first:false "enumerate_all_solutions" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.enumerate_all_solutions;
    Pbrt.Pp.pp_record_field ~first:false "keep_all_feasible_solutions_in_presolve" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.keep_all_feasible_solutions_in_presolve;
    Pbrt.Pp.pp_record_field ~first:false "fill_tightened_domains_in_response" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.fill_tightened_domains_in_response;
    Pbrt.Pp.pp_record_field ~first:false "fill_additional_solutions_in_response" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.fill_additional_solutions_in_response;
    Pbrt.Pp.pp_record_field ~first:false "instantiate_all_variables" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.instantiate_all_variables;
    Pbrt.Pp.pp_record_field ~first:false "auto_detect_greater_than_at_least_one_of" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.auto_detect_greater_than_at_least_one_of;
    Pbrt.Pp.pp_record_field ~first:false "stop_after_first_solution" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.stop_after_first_solution;
    Pbrt.Pp.pp_record_field ~first:false "stop_after_presolve" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.stop_after_presolve;
    Pbrt.Pp.pp_record_field ~first:false "stop_after_root_propagation" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.stop_after_root_propagation;
    Pbrt.Pp.pp_record_field ~first:false "lns_initial_difficulty" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.lns_initial_difficulty;
    Pbrt.Pp.pp_record_field ~first:false "lns_initial_deterministic_limit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.lns_initial_deterministic_limit;
    Pbrt.Pp.pp_record_field ~first:false "use_lns" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_lns;
    Pbrt.Pp.pp_record_field ~first:false "use_lns_only" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_lns_only;
    Pbrt.Pp.pp_record_field ~first:false "solution_pool_size" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.solution_pool_size;
    Pbrt.Pp.pp_record_field ~first:false "use_rins_lns" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_rins_lns;
    Pbrt.Pp.pp_record_field ~first:false "use_feasibility_pump" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_feasibility_pump;
    Pbrt.Pp.pp_record_field ~first:false "use_lb_relax_lns" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_lb_relax_lns;
    Pbrt.Pp.pp_record_field ~first:false "lb_relax_num_workers_threshold" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.lb_relax_num_workers_threshold;
    Pbrt.Pp.pp_record_field ~first:false "fp_rounding" (Pbrt.Pp.pp_option pp_sat_parameters_fprounding_method) fmt v.fp_rounding;
    Pbrt.Pp.pp_record_field ~first:false "diversify_lns_params" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.diversify_lns_params;
    Pbrt.Pp.pp_record_field ~first:false "randomize_search" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.randomize_search;
    Pbrt.Pp.pp_record_field ~first:false "search_random_variable_pool_size" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64) fmt v.search_random_variable_pool_size;
    Pbrt.Pp.pp_record_field ~first:false "push_all_tasks_toward_start" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.push_all_tasks_toward_start;
    Pbrt.Pp.pp_record_field ~first:false "use_optional_variables" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_optional_variables;
    Pbrt.Pp.pp_record_field ~first:false "use_exact_lp_reason" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_exact_lp_reason;
    Pbrt.Pp.pp_record_field ~first:false "use_combined_no_overlap" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_combined_no_overlap;
    Pbrt.Pp.pp_record_field ~first:false "at_most_one_max_expansion_size" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.at_most_one_max_expansion_size;
    Pbrt.Pp.pp_record_field ~first:false "catch_sigint_signal" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.catch_sigint_signal;
    Pbrt.Pp.pp_record_field ~first:false "use_implied_bounds" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_implied_bounds;
    Pbrt.Pp.pp_record_field ~first:false "polish_lp_solution" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.polish_lp_solution;
    Pbrt.Pp.pp_record_field ~first:false "lp_primal_tolerance" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.lp_primal_tolerance;
    Pbrt.Pp.pp_record_field ~first:false "lp_dual_tolerance" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.lp_dual_tolerance;
    Pbrt.Pp.pp_record_field ~first:false "convert_intervals" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.convert_intervals;
    Pbrt.Pp.pp_record_field ~first:false "symmetry_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.symmetry_level;
    Pbrt.Pp.pp_record_field ~first:false "use_symmetry_in_lp" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.use_symmetry_in_lp;
    Pbrt.Pp.pp_record_field ~first:false "keep_symmetry_in_presolve" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.keep_symmetry_in_presolve;
    Pbrt.Pp.pp_record_field ~first:false "symmetry_detection_deterministic_time_limit" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.symmetry_detection_deterministic_time_limit;
    Pbrt.Pp.pp_record_field ~first:false "new_linear_propagation" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.new_linear_propagation;
    Pbrt.Pp.pp_record_field ~first:false "linear_split_size" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.linear_split_size;
    Pbrt.Pp.pp_record_field ~first:false "linearization_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.linearization_level;
    Pbrt.Pp.pp_record_field ~first:false "boolean_encoding_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.boolean_encoding_level;
    Pbrt.Pp.pp_record_field ~first:false "max_domain_size_when_encoding_eq_neq_constraints" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_domain_size_when_encoding_eq_neq_constraints;
    Pbrt.Pp.pp_record_field ~first:false "max_num_cuts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_num_cuts;
    Pbrt.Pp.pp_record_field ~first:false "cut_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.cut_level;
    Pbrt.Pp.pp_record_field ~first:false "only_add_cuts_at_level_zero" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.only_add_cuts_at_level_zero;
    Pbrt.Pp.pp_record_field ~first:false "add_objective_cut" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.add_objective_cut;
    Pbrt.Pp.pp_record_field ~first:false "add_cg_cuts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.add_cg_cuts;
    Pbrt.Pp.pp_record_field ~first:false "add_mir_cuts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.add_mir_cuts;
    Pbrt.Pp.pp_record_field ~first:false "add_zero_half_cuts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.add_zero_half_cuts;
    Pbrt.Pp.pp_record_field ~first:false "add_clique_cuts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.add_clique_cuts;
    Pbrt.Pp.pp_record_field ~first:false "add_rlt_cuts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.add_rlt_cuts;
    Pbrt.Pp.pp_record_field ~first:false "max_all_diff_cut_size" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_all_diff_cut_size;
    Pbrt.Pp.pp_record_field ~first:false "add_lin_max_cuts" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.add_lin_max_cuts;
    Pbrt.Pp.pp_record_field ~first:false "max_integer_rounding_scaling" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_integer_rounding_scaling;
    Pbrt.Pp.pp_record_field ~first:false "add_lp_constraints_lazily" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.add_lp_constraints_lazily;
    Pbrt.Pp.pp_record_field ~first:false "root_lp_iterations" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.root_lp_iterations;
    Pbrt.Pp.pp_record_field ~first:false "min_orthogonality_for_lp_constraints" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.min_orthogonality_for_lp_constraints;
    Pbrt.Pp.pp_record_field ~first:false "max_cut_rounds_at_level_zero" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_cut_rounds_at_level_zero;
    Pbrt.Pp.pp_record_field ~first:false "max_consecutive_inactive_count" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.max_consecutive_inactive_count;
    Pbrt.Pp.pp_record_field ~first:false "cut_max_active_count_value" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.cut_max_active_count_value;
    Pbrt.Pp.pp_record_field ~first:false "cut_active_count_decay" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.cut_active_count_decay;
    Pbrt.Pp.pp_record_field ~first:false "cut_cleanup_target" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.cut_cleanup_target;
    Pbrt.Pp.pp_record_field ~first:false "new_constraints_batch_size" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.new_constraints_batch_size;
    Pbrt.Pp.pp_record_field ~first:false "exploit_integer_lp_solution" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.exploit_integer_lp_solution;
    Pbrt.Pp.pp_record_field ~first:false "exploit_all_lp_solution" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.exploit_all_lp_solution;
    Pbrt.Pp.pp_record_field ~first:false "exploit_best_solution" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.exploit_best_solution;
    Pbrt.Pp.pp_record_field ~first:false "exploit_relaxation_solution" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.exploit_relaxation_solution;
    Pbrt.Pp.pp_record_field ~first:false "exploit_objective" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.exploit_objective;
    Pbrt.Pp.pp_record_field ~first:false "detect_linearized_product" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.detect_linearized_product;
    Pbrt.Pp.pp_record_field ~first:false "mip_max_bound" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.mip_max_bound;
    Pbrt.Pp.pp_record_field ~first:false "mip_var_scaling" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.mip_var_scaling;
    Pbrt.Pp.pp_record_field ~first:false "mip_scale_large_domain" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.mip_scale_large_domain;
    Pbrt.Pp.pp_record_field ~first:false "mip_automatically_scale_variables" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.mip_automatically_scale_variables;
    Pbrt.Pp.pp_record_field ~first:false "only_solve_ip" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.only_solve_ip;
    Pbrt.Pp.pp_record_field ~first:false "mip_wanted_precision" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.mip_wanted_precision;
    Pbrt.Pp.pp_record_field ~first:false "mip_max_activity_exponent" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.mip_max_activity_exponent;
    Pbrt.Pp.pp_record_field ~first:false "mip_check_precision" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.mip_check_precision;
    Pbrt.Pp.pp_record_field ~first:false "mip_compute_true_objective_bound" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.mip_compute_true_objective_bound;
    Pbrt.Pp.pp_record_field ~first:false "mip_max_valid_magnitude" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.mip_max_valid_magnitude;
    Pbrt.Pp.pp_record_field ~first:false "mip_treat_high_magnitude_bounds_as_infinity" (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool) fmt v.mip_treat_high_magnitude_bounds_as_infinity;
    Pbrt.Pp.pp_record_field ~first:false "mip_drop_tolerance" (Pbrt.Pp.pp_option Pbrt.Pp.pp_float) fmt v.mip_drop_tolerance;
    Pbrt.Pp.pp_record_field ~first:false "mip_presolve_level" (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32) fmt v.mip_presolve_level;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

[@@@ocaml.warning "-23-27-30-39"]

(** {2 Protobuf Encoding} *)

let rec encode_pb_sat_parameters_variable_order (v:sat_parameters_variable_order) encoder =
  match v with
  | In_order -> Pbrt.Encoder.int_as_varint (0) encoder
  | In_reverse_order -> Pbrt.Encoder.int_as_varint 1 encoder
  | In_random_order -> Pbrt.Encoder.int_as_varint 2 encoder

let rec encode_pb_sat_parameters_polarity (v:sat_parameters_polarity) encoder =
  match v with
  | Polarity_true -> Pbrt.Encoder.int_as_varint (0) encoder
  | Polarity_false -> Pbrt.Encoder.int_as_varint 1 encoder
  | Polarity_random -> Pbrt.Encoder.int_as_varint 2 encoder

let rec encode_pb_sat_parameters_conflict_minimization_algorithm (v:sat_parameters_conflict_minimization_algorithm) encoder =
  match v with
  | None -> Pbrt.Encoder.int_as_varint (0) encoder
  | Simple -> Pbrt.Encoder.int_as_varint 1 encoder
  | Recursive -> Pbrt.Encoder.int_as_varint 2 encoder
  | Experimental -> Pbrt.Encoder.int_as_varint 3 encoder

let rec encode_pb_sat_parameters_binary_minization_algorithm (v:sat_parameters_binary_minization_algorithm) encoder =
  match v with
  | No_binary_minimization -> Pbrt.Encoder.int_as_varint (0) encoder
  | Binary_minimization_first -> Pbrt.Encoder.int_as_varint 1 encoder
  | Binary_minimization_first_with_transitive_reduction -> Pbrt.Encoder.int_as_varint 4 encoder
  | Binary_minimization_with_reachability -> Pbrt.Encoder.int_as_varint 2 encoder
  | Experimental_binary_minimization -> Pbrt.Encoder.int_as_varint 3 encoder

let rec encode_pb_sat_parameters_clause_protection (v:sat_parameters_clause_protection) encoder =
  match v with
  | Protection_none -> Pbrt.Encoder.int_as_varint (0) encoder
  | Protection_always -> Pbrt.Encoder.int_as_varint 1 encoder
  | Protection_lbd -> Pbrt.Encoder.int_as_varint 2 encoder

let rec encode_pb_sat_parameters_clause_ordering (v:sat_parameters_clause_ordering) encoder =
  match v with
  | Clause_activity -> Pbrt.Encoder.int_as_varint (0) encoder
  | Clause_lbd -> Pbrt.Encoder.int_as_varint 1 encoder

let rec encode_pb_sat_parameters_restart_algorithm (v:sat_parameters_restart_algorithm) encoder =
  match v with
  | No_restart -> Pbrt.Encoder.int_as_varint (0) encoder
  | Luby_restart -> Pbrt.Encoder.int_as_varint 1 encoder
  | Dl_moving_average_restart -> Pbrt.Encoder.int_as_varint 2 encoder
  | Lbd_moving_average_restart -> Pbrt.Encoder.int_as_varint 3 encoder
  | Fixed_restart -> Pbrt.Encoder.int_as_varint 4 encoder

let rec encode_pb_sat_parameters_max_sat_assumption_order (v:sat_parameters_max_sat_assumption_order) encoder =
  match v with
  | Default_assumption_order -> Pbrt.Encoder.int_as_varint (0) encoder
  | Order_assumption_by_depth -> Pbrt.Encoder.int_as_varint 1 encoder
  | Order_assumption_by_weight -> Pbrt.Encoder.int_as_varint 2 encoder

let rec encode_pb_sat_parameters_max_sat_stratification_algorithm (v:sat_parameters_max_sat_stratification_algorithm) encoder =
  match v with
  | Stratification_none -> Pbrt.Encoder.int_as_varint (0) encoder
  | Stratification_descent -> Pbrt.Encoder.int_as_varint 1 encoder
  | Stratification_ascent -> Pbrt.Encoder.int_as_varint 2 encoder

let rec encode_pb_sat_parameters_search_branching (v:sat_parameters_search_branching) encoder =
  match v with
  | Automatic_search -> Pbrt.Encoder.int_as_varint (0) encoder
  | Fixed_search -> Pbrt.Encoder.int_as_varint 1 encoder
  | Portfolio_search -> Pbrt.Encoder.int_as_varint 2 encoder
  | Lp_search -> Pbrt.Encoder.int_as_varint 3 encoder
  | Pseudo_cost_search -> Pbrt.Encoder.int_as_varint 4 encoder
  | Portfolio_with_quick_restart_search -> Pbrt.Encoder.int_as_varint 5 encoder
  | Hint_search -> Pbrt.Encoder.int_as_varint 6 encoder
  | Partial_fixed_search -> Pbrt.Encoder.int_as_varint 7 encoder
  | Randomized_search -> Pbrt.Encoder.int_as_varint 8 encoder

let rec encode_pb_sat_parameters_shared_tree_split_strategy (v:sat_parameters_shared_tree_split_strategy) encoder =
  match v with
  | Split_strategy_auto -> Pbrt.Encoder.int_as_varint (0) encoder
  | Split_strategy_discrepancy -> Pbrt.Encoder.int_as_varint 1 encoder
  | Split_strategy_objective_lb -> Pbrt.Encoder.int_as_varint 2 encoder
  | Split_strategy_balanced_tree -> Pbrt.Encoder.int_as_varint 3 encoder
  | Split_strategy_first_proposal -> Pbrt.Encoder.int_as_varint 4 encoder

let rec encode_pb_sat_parameters_fprounding_method (v:sat_parameters_fprounding_method) encoder =
  match v with
  | Nearest_integer -> Pbrt.Encoder.int_as_varint (0) encoder
  | Lock_based -> Pbrt.Encoder.int_as_varint 1 encoder
  | Active_lock_based -> Pbrt.Encoder.int_as_varint 3 encoder
  | Propagation_assisted -> Pbrt.Encoder.int_as_varint 2 encoder

let rec encode_pb_sat_parameters (v:sat_parameters) encoder = 
  if sat_parameters_has_name v then (
    Pbrt.Encoder.string v.name encoder;
    Pbrt.Encoder.key 171 Pbrt.Bytes encoder; 
  );
  if sat_parameters_has_preferred_variable_order v then (
    encode_pb_sat_parameters_variable_order v.preferred_variable_order encoder;
    Pbrt.Encoder.key 1 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_initial_polarity v then (
    encode_pb_sat_parameters_polarity v.initial_polarity encoder;
    Pbrt.Encoder.key 2 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_use_phase_saving v then (
    Pbrt.Encoder.bool v.use_phase_saving encoder;
    Pbrt.Encoder.key 44 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_polarity_rephase_increment v then (
    Pbrt.Encoder.int32_as_varint v.polarity_rephase_increment encoder;
    Pbrt.Encoder.key 168 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_polarity_exploit_ls_hints v then (
    Pbrt.Encoder.bool v.polarity_exploit_ls_hints encoder;
    Pbrt.Encoder.key 309 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_random_polarity_ratio v then (
    Pbrt.Encoder.float_as_bits64 v.random_polarity_ratio encoder;
    Pbrt.Encoder.key 45 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_random_branches_ratio v then (
    Pbrt.Encoder.float_as_bits64 v.random_branches_ratio encoder;
    Pbrt.Encoder.key 32 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_use_erwa_heuristic v then (
    Pbrt.Encoder.bool v.use_erwa_heuristic encoder;
    Pbrt.Encoder.key 75 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_initial_variables_activity v then (
    Pbrt.Encoder.float_as_bits64 v.initial_variables_activity encoder;
    Pbrt.Encoder.key 76 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_also_bump_variables_in_conflict_reasons v then (
    Pbrt.Encoder.bool v.also_bump_variables_in_conflict_reasons encoder;
    Pbrt.Encoder.key 77 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_minimization_algorithm v then (
    encode_pb_sat_parameters_conflict_minimization_algorithm v.minimization_algorithm encoder;
    Pbrt.Encoder.key 4 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_binary_minimization_algorithm v then (
    encode_pb_sat_parameters_binary_minization_algorithm v.binary_minimization_algorithm encoder;
    Pbrt.Encoder.key 34 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_subsumption_during_conflict_analysis v then (
    Pbrt.Encoder.bool v.subsumption_during_conflict_analysis encoder;
    Pbrt.Encoder.key 56 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_clause_cleanup_period v then (
    Pbrt.Encoder.int32_as_varint v.clause_cleanup_period encoder;
    Pbrt.Encoder.key 11 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_clause_cleanup_target v then (
    Pbrt.Encoder.int32_as_varint v.clause_cleanup_target encoder;
    Pbrt.Encoder.key 13 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_clause_cleanup_ratio v then (
    Pbrt.Encoder.float_as_bits64 v.clause_cleanup_ratio encoder;
    Pbrt.Encoder.key 190 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_clause_cleanup_protection v then (
    encode_pb_sat_parameters_clause_protection v.clause_cleanup_protection encoder;
    Pbrt.Encoder.key 58 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_clause_cleanup_lbd_bound v then (
    Pbrt.Encoder.int32_as_varint v.clause_cleanup_lbd_bound encoder;
    Pbrt.Encoder.key 59 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_clause_cleanup_ordering v then (
    encode_pb_sat_parameters_clause_ordering v.clause_cleanup_ordering encoder;
    Pbrt.Encoder.key 60 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_pb_cleanup_increment v then (
    Pbrt.Encoder.int32_as_varint v.pb_cleanup_increment encoder;
    Pbrt.Encoder.key 46 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_pb_cleanup_ratio v then (
    Pbrt.Encoder.float_as_bits64 v.pb_cleanup_ratio encoder;
    Pbrt.Encoder.key 47 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_variable_activity_decay v then (
    Pbrt.Encoder.float_as_bits64 v.variable_activity_decay encoder;
    Pbrt.Encoder.key 15 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_max_variable_activity_value v then (
    Pbrt.Encoder.float_as_bits64 v.max_variable_activity_value encoder;
    Pbrt.Encoder.key 16 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_glucose_max_decay v then (
    Pbrt.Encoder.float_as_bits64 v.glucose_max_decay encoder;
    Pbrt.Encoder.key 22 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_glucose_decay_increment v then (
    Pbrt.Encoder.float_as_bits64 v.glucose_decay_increment encoder;
    Pbrt.Encoder.key 23 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_glucose_decay_increment_period v then (
    Pbrt.Encoder.int32_as_varint v.glucose_decay_increment_period encoder;
    Pbrt.Encoder.key 24 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_clause_activity_decay v then (
    Pbrt.Encoder.float_as_bits64 v.clause_activity_decay encoder;
    Pbrt.Encoder.key 17 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_max_clause_activity_value v then (
    Pbrt.Encoder.float_as_bits64 v.max_clause_activity_value encoder;
    Pbrt.Encoder.key 18 Pbrt.Bits64 encoder; 
  );
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    encode_pb_sat_parameters_restart_algorithm x encoder;
    Pbrt.Encoder.key 61 Pbrt.Varint encoder; 
  ) v.restart_algorithms encoder;
  if sat_parameters_has_default_restart_algorithms v then (
    Pbrt.Encoder.string v.default_restart_algorithms encoder;
    Pbrt.Encoder.key 70 Pbrt.Bytes encoder; 
  );
  if sat_parameters_has_restart_period v then (
    Pbrt.Encoder.int32_as_varint v.restart_period encoder;
    Pbrt.Encoder.key 30 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_restart_running_window_size v then (
    Pbrt.Encoder.int32_as_varint v.restart_running_window_size encoder;
    Pbrt.Encoder.key 62 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_restart_dl_average_ratio v then (
    Pbrt.Encoder.float_as_bits64 v.restart_dl_average_ratio encoder;
    Pbrt.Encoder.key 63 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_restart_lbd_average_ratio v then (
    Pbrt.Encoder.float_as_bits64 v.restart_lbd_average_ratio encoder;
    Pbrt.Encoder.key 71 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_use_blocking_restart v then (
    Pbrt.Encoder.bool v.use_blocking_restart encoder;
    Pbrt.Encoder.key 64 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_blocking_restart_window_size v then (
    Pbrt.Encoder.int32_as_varint v.blocking_restart_window_size encoder;
    Pbrt.Encoder.key 65 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_blocking_restart_multiplier v then (
    Pbrt.Encoder.float_as_bits64 v.blocking_restart_multiplier encoder;
    Pbrt.Encoder.key 66 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_num_conflicts_before_strategy_changes v then (
    Pbrt.Encoder.int32_as_varint v.num_conflicts_before_strategy_changes encoder;
    Pbrt.Encoder.key 68 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_strategy_change_increase_ratio v then (
    Pbrt.Encoder.float_as_bits64 v.strategy_change_increase_ratio encoder;
    Pbrt.Encoder.key 69 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_max_time_in_seconds v then (
    Pbrt.Encoder.float_as_bits64 v.max_time_in_seconds encoder;
    Pbrt.Encoder.key 36 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_max_deterministic_time v then (
    Pbrt.Encoder.float_as_bits64 v.max_deterministic_time encoder;
    Pbrt.Encoder.key 67 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_max_num_deterministic_batches v then (
    Pbrt.Encoder.int32_as_varint v.max_num_deterministic_batches encoder;
    Pbrt.Encoder.key 291 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_max_number_of_conflicts v then (
    Pbrt.Encoder.int64_as_varint v.max_number_of_conflicts encoder;
    Pbrt.Encoder.key 37 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_max_memory_in_mb v then (
    Pbrt.Encoder.int64_as_varint v.max_memory_in_mb encoder;
    Pbrt.Encoder.key 40 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_absolute_gap_limit v then (
    Pbrt.Encoder.float_as_bits64 v.absolute_gap_limit encoder;
    Pbrt.Encoder.key 159 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_relative_gap_limit v then (
    Pbrt.Encoder.float_as_bits64 v.relative_gap_limit encoder;
    Pbrt.Encoder.key 160 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_random_seed v then (
    Pbrt.Encoder.int32_as_varint v.random_seed encoder;
    Pbrt.Encoder.key 31 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_permute_variable_randomly v then (
    Pbrt.Encoder.bool v.permute_variable_randomly encoder;
    Pbrt.Encoder.key 178 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_permute_presolve_constraint_order v then (
    Pbrt.Encoder.bool v.permute_presolve_constraint_order encoder;
    Pbrt.Encoder.key 179 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_use_absl_random v then (
    Pbrt.Encoder.bool v.use_absl_random encoder;
    Pbrt.Encoder.key 180 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_log_search_progress v then (
    Pbrt.Encoder.bool v.log_search_progress encoder;
    Pbrt.Encoder.key 41 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_log_subsolver_statistics v then (
    Pbrt.Encoder.bool v.log_subsolver_statistics encoder;
    Pbrt.Encoder.key 189 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_log_prefix v then (
    Pbrt.Encoder.string v.log_prefix encoder;
    Pbrt.Encoder.key 185 Pbrt.Bytes encoder; 
  );
  if sat_parameters_has_log_to_stdout v then (
    Pbrt.Encoder.bool v.log_to_stdout encoder;
    Pbrt.Encoder.key 186 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_log_to_response v then (
    Pbrt.Encoder.bool v.log_to_response encoder;
    Pbrt.Encoder.key 187 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_use_pb_resolution v then (
    Pbrt.Encoder.bool v.use_pb_resolution encoder;
    Pbrt.Encoder.key 43 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_minimize_reduction_during_pb_resolution v then (
    Pbrt.Encoder.bool v.minimize_reduction_during_pb_resolution encoder;
    Pbrt.Encoder.key 48 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_count_assumption_levels_in_lbd v then (
    Pbrt.Encoder.bool v.count_assumption_levels_in_lbd encoder;
    Pbrt.Encoder.key 49 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_presolve_bve_threshold v then (
    Pbrt.Encoder.int32_as_varint v.presolve_bve_threshold encoder;
    Pbrt.Encoder.key 54 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_presolve_bve_clause_weight v then (
    Pbrt.Encoder.int32_as_varint v.presolve_bve_clause_weight encoder;
    Pbrt.Encoder.key 55 Pbrt.Varint encoder; 
  );
  if sat_parameters_has_probing_deterministic_time_limit v then (
    Pbrt.Encoder.float_as_bits64 v.probing_deterministic_time_limit encoder;
    Pbrt.Encoder.key 226 Pbrt.Bits64 encoder; 
  );
  if sat_parameters_has_presolve_probing_deterministic_time_limit v then (
    Pbrt.Encoder.float_as_bits64 v.presolve_probing_deterministic_time_limit encoder;
    Pbrt.Encoder.key 57 Pbrt.Bits64 encoder; 
  );
  (match v.presolve_blocked_clause with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 88 Pbrt.Varint encoder; 
  | None -> ());
  (match v.presolve_use_bva with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 72 Pbrt.Varint encoder; 
  | None -> ());
  (match v.presolve_bva_threshold with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 73 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_presolve_iterations with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 138 Pbrt.Varint encoder; 
  | None -> ());
  (match v.cp_model_presolve with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 86 Pbrt.Varint encoder; 
  | None -> ());
  (match v.cp_model_probing_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 110 Pbrt.Varint encoder; 
  | None -> ());
  (match v.cp_model_use_sat_presolve with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 93 Pbrt.Varint encoder; 
  | None -> ());
  (match v.remove_fixed_variables_early with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 310 Pbrt.Varint encoder; 
  | None -> ());
  (match v.detect_table_with_cost with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 216 Pbrt.Varint encoder; 
  | None -> ());
  (match v.table_compression_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 217 Pbrt.Varint encoder; 
  | None -> ());
  (match v.expand_alldiff_constraints with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 170 Pbrt.Varint encoder; 
  | None -> ());
  (match v.expand_reservoir_constraints with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 182 Pbrt.Varint encoder; 
  | None -> ());
  (match v.expand_reservoir_using_circuit with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 288 Pbrt.Varint encoder; 
  | None -> ());
  (match v.encode_cumulative_as_reservoir with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 287 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_lin_max_size_for_expansion with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 280 Pbrt.Varint encoder; 
  | None -> ());
  (match v.disable_constraint_expansion with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 181 Pbrt.Varint encoder; 
  | None -> ());
  (match v.encode_complex_linear_constraint_with_integer with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 223 Pbrt.Varint encoder; 
  | None -> ());
  (match v.merge_no_overlap_work_limit with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 145 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.merge_at_most_one_work_limit with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 146 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.presolve_substitution_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 147 Pbrt.Varint encoder; 
  | None -> ());
  (match v.presolve_extract_integer_enforcement with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 174 Pbrt.Varint encoder; 
  | None -> ());
  (match v.presolve_inclusion_work_limit with Some v ->
    Pbrt.Encoder.int64_as_varint v encoder;
    Pbrt.Encoder.key 201 Pbrt.Varint encoder; 
  | None -> ());
  (match v.ignore_names with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 202 Pbrt.Varint encoder; 
  | None -> ());
  (match v.infer_all_diffs with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 233 Pbrt.Varint encoder; 
  | None -> ());
  (match v.find_big_linear_overlap with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 234 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_sat_inprocessing with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 163 Pbrt.Varint encoder; 
  | None -> ());
  (match v.inprocessing_dtime_ratio with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 273 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.inprocessing_probing_dtime with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 274 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.inprocessing_minimization_dtime with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 275 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.inprocessing_minimization_use_conflict_analysis with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 297 Pbrt.Varint encoder; 
  | None -> ());
  (match v.inprocessing_minimization_use_all_orderings with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 298 Pbrt.Varint encoder; 
  | None -> ());
  (match v.num_workers with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 206 Pbrt.Varint encoder; 
  | None -> ());
  (match v.num_search_workers with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 100 Pbrt.Varint encoder; 
  | None -> ());
  (match v.num_full_subsolvers with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 294 Pbrt.Varint encoder; 
  | None -> ());
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.string x encoder;
    Pbrt.Encoder.key 207 Pbrt.Bytes encoder; 
  ) v.subsolvers encoder;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.string x encoder;
    Pbrt.Encoder.key 219 Pbrt.Bytes encoder; 
  ) v.extra_subsolvers encoder;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.string x encoder;
    Pbrt.Encoder.key 209 Pbrt.Bytes encoder; 
  ) v.ignore_subsolvers encoder;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.string x encoder;
    Pbrt.Encoder.key 293 Pbrt.Bytes encoder; 
  ) v.filter_subsolvers encoder;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_sat_parameters x encoder;
    Pbrt.Encoder.key 210 Pbrt.Bytes encoder; 
  ) v.subsolver_params encoder;
  (match v.interleave_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 136 Pbrt.Varint encoder; 
  | None -> ());
  (match v.interleave_batch_size with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 134 Pbrt.Varint encoder; 
  | None -> ());
  (match v.share_objective_bounds with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 113 Pbrt.Varint encoder; 
  | None -> ());
  (match v.share_level_zero_bounds with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 114 Pbrt.Varint encoder; 
  | None -> ());
  (match v.share_binary_clauses with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 203 Pbrt.Varint encoder; 
  | None -> ());
  (match v.share_glue_clauses with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 285 Pbrt.Varint encoder; 
  | None -> ());
  (match v.minimize_shared_clauses with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 300 Pbrt.Varint encoder; 
  | None -> ());
  (match v.debug_postsolve_with_full_solver with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 162 Pbrt.Varint encoder; 
  | None -> ());
  (match v.debug_max_num_presolve_operations with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 151 Pbrt.Varint encoder; 
  | None -> ());
  (match v.debug_crash_on_bad_hint with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 195 Pbrt.Varint encoder; 
  | None -> ());
  (match v.debug_crash_if_presolve_breaks_hint with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 306 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_optimization_hints with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 35 Pbrt.Varint encoder; 
  | None -> ());
  (match v.core_minimization_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 50 Pbrt.Varint encoder; 
  | None -> ());
  (match v.find_multiple_cores with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 84 Pbrt.Varint encoder; 
  | None -> ());
  (match v.cover_optimization with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 89 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_sat_assumption_order with Some v ->
    encode_pb_sat_parameters_max_sat_assumption_order v encoder;
    Pbrt.Encoder.key 51 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_sat_reverse_assumption_order with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 52 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_sat_stratification with Some v ->
    encode_pb_sat_parameters_max_sat_stratification_algorithm v encoder;
    Pbrt.Encoder.key 53 Pbrt.Varint encoder; 
  | None -> ());
  (match v.propagation_loop_detection_factor with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 221 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.use_precedences_in_disjunctive_constraint with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 74 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_size_to_create_precedence_literals_in_disjunctive with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 229 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_strong_propagation_in_disjunctive with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 230 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_dynamic_precedence_in_disjunctive with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 263 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_dynamic_precedence_in_cumulative with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 268 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_overload_checker_in_cumulative with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 78 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_conservative_scale_overload_checker with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 286 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_timetable_edge_finding_in_cumulative with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 79 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_num_intervals_for_timetable_edge_finding with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 260 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_hard_precedences_in_cumulative with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 215 Pbrt.Varint encoder; 
  | None -> ());
  (match v.exploit_all_precedences with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 220 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_disjunctive_constraint_in_cumulative with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 80 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_timetabling_in_no_overlap_2d with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 200 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_energetic_reasoning_in_no_overlap_2d with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 213 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_area_energetic_reasoning_in_no_overlap_2d with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 271 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_try_edge_reasoning_in_no_overlap_2d with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 299 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_pairs_pairwise_reasoning_in_no_overlap_2d with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 276 Pbrt.Varint encoder; 
  | None -> ());
  (match v.maximum_regions_to_split_in_disconnected_no_overlap_2d with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 315 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_dual_scheduling_heuristics with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 214 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_all_different_for_circuit with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 311 Pbrt.Varint encoder; 
  | None -> ());
  (match v.routing_cut_subset_size_for_binary_relation_bound with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 312 Pbrt.Varint encoder; 
  | None -> ());
  (match v.routing_cut_subset_size_for_tight_binary_relation_bound with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 313 Pbrt.Varint encoder; 
  | None -> ());
  (match v.routing_cut_dp_effort with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 314 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.search_branching with Some v ->
    encode_pb_sat_parameters_search_branching v encoder;
    Pbrt.Encoder.key 82 Pbrt.Varint encoder; 
  | None -> ());
  (match v.hint_conflict_limit with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 153 Pbrt.Varint encoder; 
  | None -> ());
  (match v.repair_hint with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 167 Pbrt.Varint encoder; 
  | None -> ());
  (match v.fix_variables_to_their_hinted_value with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 192 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_probing_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 176 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_extended_probing with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 269 Pbrt.Varint encoder; 
  | None -> ());
  (match v.probing_num_combinations_limit with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 272 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_shaving_in_probing_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 204 Pbrt.Varint encoder; 
  | None -> ());
  (match v.shaving_search_deterministic_time with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 205 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.shaving_search_threshold with Some v ->
    Pbrt.Encoder.int64_as_varint v encoder;
    Pbrt.Encoder.key 290 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_objective_lb_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 228 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_objective_shaving_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 253 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_variables_shaving_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 289 Pbrt.Varint encoder; 
  | None -> ());
  (match v.pseudo_cost_reliability_threshold with Some v ->
    Pbrt.Encoder.int64_as_varint v encoder;
    Pbrt.Encoder.key 123 Pbrt.Varint encoder; 
  | None -> ());
  (match v.optimize_with_core with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 83 Pbrt.Varint encoder; 
  | None -> ());
  (match v.optimize_with_lb_tree_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 188 Pbrt.Varint encoder; 
  | None -> ());
  (match v.save_lp_basis_in_lb_tree_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 284 Pbrt.Varint encoder; 
  | None -> ());
  (match v.binary_search_num_conflicts with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 99 Pbrt.Varint encoder; 
  | None -> ());
  (match v.optimize_with_max_hs with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 85 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_feasibility_jump with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 265 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_ls_only with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 240 Pbrt.Varint encoder; 
  | None -> ());
  (match v.feasibility_jump_decay with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 242 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.feasibility_jump_linearization_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 257 Pbrt.Varint encoder; 
  | None -> ());
  (match v.feasibility_jump_restart_factor with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 258 Pbrt.Varint encoder; 
  | None -> ());
  (match v.feasibility_jump_batch_dtime with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 292 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.feasibility_jump_var_randomization_probability with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 247 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.feasibility_jump_var_perburbation_range_ratio with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 248 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.feasibility_jump_enable_restarts with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 250 Pbrt.Varint encoder; 
  | None -> ());
  (match v.feasibility_jump_max_expanded_constraint_size with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 264 Pbrt.Varint encoder; 
  | None -> ());
  (match v.num_violation_ls with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 244 Pbrt.Varint encoder; 
  | None -> ());
  (match v.violation_ls_perturbation_period with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 249 Pbrt.Varint encoder; 
  | None -> ());
  (match v.violation_ls_compound_move_probability with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 259 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.shared_tree_num_workers with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 235 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_shared_tree_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 236 Pbrt.Varint encoder; 
  | None -> ());
  (match v.shared_tree_worker_min_restarts_per_subtree with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 282 Pbrt.Varint encoder; 
  | None -> ());
  (match v.shared_tree_worker_enable_trail_sharing with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 295 Pbrt.Varint encoder; 
  | None -> ());
  (match v.shared_tree_worker_enable_phase_sharing with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 304 Pbrt.Varint encoder; 
  | None -> ());
  (match v.shared_tree_open_leaves_per_worker with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 281 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.shared_tree_max_nodes_per_worker with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 238 Pbrt.Varint encoder; 
  | None -> ());
  (match v.shared_tree_split_strategy with Some v ->
    encode_pb_sat_parameters_shared_tree_split_strategy v encoder;
    Pbrt.Encoder.key 239 Pbrt.Varint encoder; 
  | None -> ());
  (match v.shared_tree_balance_tolerance with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 305 Pbrt.Varint encoder; 
  | None -> ());
  (match v.enumerate_all_solutions with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 87 Pbrt.Varint encoder; 
  | None -> ());
  (match v.keep_all_feasible_solutions_in_presolve with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 173 Pbrt.Varint encoder; 
  | None -> ());
  (match v.fill_tightened_domains_in_response with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 132 Pbrt.Varint encoder; 
  | None -> ());
  (match v.fill_additional_solutions_in_response with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 194 Pbrt.Varint encoder; 
  | None -> ());
  (match v.instantiate_all_variables with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 106 Pbrt.Varint encoder; 
  | None -> ());
  (match v.auto_detect_greater_than_at_least_one_of with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 95 Pbrt.Varint encoder; 
  | None -> ());
  (match v.stop_after_first_solution with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 98 Pbrt.Varint encoder; 
  | None -> ());
  (match v.stop_after_presolve with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 149 Pbrt.Varint encoder; 
  | None -> ());
  (match v.stop_after_root_propagation with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 252 Pbrt.Varint encoder; 
  | None -> ());
  (match v.lns_initial_difficulty with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 307 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.lns_initial_deterministic_limit with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 308 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.use_lns with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 283 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_lns_only with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 101 Pbrt.Varint encoder; 
  | None -> ());
  (match v.solution_pool_size with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 193 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_rins_lns with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 129 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_feasibility_pump with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 164 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_lb_relax_lns with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 255 Pbrt.Varint encoder; 
  | None -> ());
  (match v.lb_relax_num_workers_threshold with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 296 Pbrt.Varint encoder; 
  | None -> ());
  (match v.fp_rounding with Some v ->
    encode_pb_sat_parameters_fprounding_method v encoder;
    Pbrt.Encoder.key 165 Pbrt.Varint encoder; 
  | None -> ());
  (match v.diversify_lns_params with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 137 Pbrt.Varint encoder; 
  | None -> ());
  (match v.randomize_search with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 103 Pbrt.Varint encoder; 
  | None -> ());
  (match v.search_random_variable_pool_size with Some v ->
    Pbrt.Encoder.int64_as_varint v encoder;
    Pbrt.Encoder.key 104 Pbrt.Varint encoder; 
  | None -> ());
  (match v.push_all_tasks_toward_start with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 262 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_optional_variables with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 108 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_exact_lp_reason with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 109 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_combined_no_overlap with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 133 Pbrt.Varint encoder; 
  | None -> ());
  (match v.at_most_one_max_expansion_size with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 270 Pbrt.Varint encoder; 
  | None -> ());
  (match v.catch_sigint_signal with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 135 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_implied_bounds with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 144 Pbrt.Varint encoder; 
  | None -> ());
  (match v.polish_lp_solution with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 175 Pbrt.Varint encoder; 
  | None -> ());
  (match v.lp_primal_tolerance with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 266 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.lp_dual_tolerance with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 267 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.convert_intervals with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 177 Pbrt.Varint encoder; 
  | None -> ());
  (match v.symmetry_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 183 Pbrt.Varint encoder; 
  | None -> ());
  (match v.use_symmetry_in_lp with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 301 Pbrt.Varint encoder; 
  | None -> ());
  (match v.keep_symmetry_in_presolve with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 303 Pbrt.Varint encoder; 
  | None -> ());
  (match v.symmetry_detection_deterministic_time_limit with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 302 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.new_linear_propagation with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 224 Pbrt.Varint encoder; 
  | None -> ());
  (match v.linear_split_size with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 256 Pbrt.Varint encoder; 
  | None -> ());
  (match v.linearization_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 90 Pbrt.Varint encoder; 
  | None -> ());
  (match v.boolean_encoding_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 107 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_domain_size_when_encoding_eq_neq_constraints with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 191 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_num_cuts with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 91 Pbrt.Varint encoder; 
  | None -> ());
  (match v.cut_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 196 Pbrt.Varint encoder; 
  | None -> ());
  (match v.only_add_cuts_at_level_zero with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 92 Pbrt.Varint encoder; 
  | None -> ());
  (match v.add_objective_cut with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 197 Pbrt.Varint encoder; 
  | None -> ());
  (match v.add_cg_cuts with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 117 Pbrt.Varint encoder; 
  | None -> ());
  (match v.add_mir_cuts with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 120 Pbrt.Varint encoder; 
  | None -> ());
  (match v.add_zero_half_cuts with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 169 Pbrt.Varint encoder; 
  | None -> ());
  (match v.add_clique_cuts with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 172 Pbrt.Varint encoder; 
  | None -> ());
  (match v.add_rlt_cuts with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 279 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_all_diff_cut_size with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 148 Pbrt.Varint encoder; 
  | None -> ());
  (match v.add_lin_max_cuts with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 152 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_integer_rounding_scaling with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 119 Pbrt.Varint encoder; 
  | None -> ());
  (match v.add_lp_constraints_lazily with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 112 Pbrt.Varint encoder; 
  | None -> ());
  (match v.root_lp_iterations with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 227 Pbrt.Varint encoder; 
  | None -> ());
  (match v.min_orthogonality_for_lp_constraints with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 115 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.max_cut_rounds_at_level_zero with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 154 Pbrt.Varint encoder; 
  | None -> ());
  (match v.max_consecutive_inactive_count with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 121 Pbrt.Varint encoder; 
  | None -> ());
  (match v.cut_max_active_count_value with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 155 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.cut_active_count_decay with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 156 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.cut_cleanup_target with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 157 Pbrt.Varint encoder; 
  | None -> ());
  (match v.new_constraints_batch_size with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 122 Pbrt.Varint encoder; 
  | None -> ());
  (match v.exploit_integer_lp_solution with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 94 Pbrt.Varint encoder; 
  | None -> ());
  (match v.exploit_all_lp_solution with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 116 Pbrt.Varint encoder; 
  | None -> ());
  (match v.exploit_best_solution with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 130 Pbrt.Varint encoder; 
  | None -> ());
  (match v.exploit_relaxation_solution with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 161 Pbrt.Varint encoder; 
  | None -> ());
  (match v.exploit_objective with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 131 Pbrt.Varint encoder; 
  | None -> ());
  (match v.detect_linearized_product with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 277 Pbrt.Varint encoder; 
  | None -> ());
  (match v.mip_max_bound with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 124 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.mip_var_scaling with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 125 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.mip_scale_large_domain with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 225 Pbrt.Varint encoder; 
  | None -> ());
  (match v.mip_automatically_scale_variables with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 166 Pbrt.Varint encoder; 
  | None -> ());
  (match v.only_solve_ip with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 222 Pbrt.Varint encoder; 
  | None -> ());
  (match v.mip_wanted_precision with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 126 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.mip_max_activity_exponent with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 127 Pbrt.Varint encoder; 
  | None -> ());
  (match v.mip_check_precision with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 128 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.mip_compute_true_objective_bound with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 198 Pbrt.Varint encoder; 
  | None -> ());
  (match v.mip_max_valid_magnitude with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 199 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.mip_treat_high_magnitude_bounds_as_infinity with Some v ->
    Pbrt.Encoder.bool v encoder;
    Pbrt.Encoder.key 278 Pbrt.Varint encoder; 
  | None -> ());
  (match v.mip_drop_tolerance with Some v ->
    Pbrt.Encoder.float_as_bits64 v encoder;
    Pbrt.Encoder.key 232 Pbrt.Bits64 encoder; 
  | None -> ());
  (match v.mip_presolve_level with Some v ->
    Pbrt.Encoder.int32_as_varint v encoder;
    Pbrt.Encoder.key 261 Pbrt.Varint encoder; 
  | None -> ());
  ()

[@@@ocaml.warning "-23-27-30-39"]

(** {2 Protobuf Decoding} *)

let rec decode_pb_sat_parameters_variable_order d : sat_parameters_variable_order = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> In_order
  | 1 -> In_reverse_order
  | 2 -> In_random_order
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_variable_order"

let rec decode_pb_sat_parameters_polarity d : sat_parameters_polarity = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Polarity_true
  | 1 -> Polarity_false
  | 2 -> Polarity_random
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_polarity"

let rec decode_pb_sat_parameters_conflict_minimization_algorithm d : sat_parameters_conflict_minimization_algorithm = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> None
  | 1 -> Simple
  | 2 -> Recursive
  | 3 -> Experimental
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_conflict_minimization_algorithm"

let rec decode_pb_sat_parameters_binary_minization_algorithm d : sat_parameters_binary_minization_algorithm = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> No_binary_minimization
  | 1 -> Binary_minimization_first
  | 4 -> Binary_minimization_first_with_transitive_reduction
  | 2 -> Binary_minimization_with_reachability
  | 3 -> Experimental_binary_minimization
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_binary_minization_algorithm"

let rec decode_pb_sat_parameters_clause_protection d : sat_parameters_clause_protection = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Protection_none
  | 1 -> Protection_always
  | 2 -> Protection_lbd
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_clause_protection"

let rec decode_pb_sat_parameters_clause_ordering d : sat_parameters_clause_ordering = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Clause_activity
  | 1 -> Clause_lbd
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_clause_ordering"

let rec decode_pb_sat_parameters_restart_algorithm d : sat_parameters_restart_algorithm = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> No_restart
  | 1 -> Luby_restart
  | 2 -> Dl_moving_average_restart
  | 3 -> Lbd_moving_average_restart
  | 4 -> Fixed_restart
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_restart_algorithm"

let rec decode_pb_sat_parameters_max_sat_assumption_order d : sat_parameters_max_sat_assumption_order = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Default_assumption_order
  | 1 -> Order_assumption_by_depth
  | 2 -> Order_assumption_by_weight
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_max_sat_assumption_order"

let rec decode_pb_sat_parameters_max_sat_stratification_algorithm d : sat_parameters_max_sat_stratification_algorithm = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Stratification_none
  | 1 -> Stratification_descent
  | 2 -> Stratification_ascent
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_max_sat_stratification_algorithm"

let rec decode_pb_sat_parameters_search_branching d : sat_parameters_search_branching = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Automatic_search
  | 1 -> Fixed_search
  | 2 -> Portfolio_search
  | 3 -> Lp_search
  | 4 -> Pseudo_cost_search
  | 5 -> Portfolio_with_quick_restart_search
  | 6 -> Hint_search
  | 7 -> Partial_fixed_search
  | 8 -> Randomized_search
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_search_branching"

let rec decode_pb_sat_parameters_shared_tree_split_strategy d : sat_parameters_shared_tree_split_strategy = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Split_strategy_auto
  | 1 -> Split_strategy_discrepancy
  | 2 -> Split_strategy_objective_lb
  | 3 -> Split_strategy_balanced_tree
  | 4 -> Split_strategy_first_proposal
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_shared_tree_split_strategy"

let rec decode_pb_sat_parameters_fprounding_method d : sat_parameters_fprounding_method = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Nearest_integer
  | 1 -> Lock_based
  | 3 -> Active_lock_based
  | 2 -> Propagation_assisted
  | _ -> Pbrt.Decoder.malformed_variant "sat_parameters_fprounding_method"

let rec decode_pb_sat_parameters d =
  let v = default_sat_parameters () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      sat_parameters_set_subsolver_params v (List.rev v.subsolver_params);
      sat_parameters_set_filter_subsolvers v (List.rev v.filter_subsolvers);
      sat_parameters_set_ignore_subsolvers v (List.rev v.ignore_subsolvers);
      sat_parameters_set_extra_subsolvers v (List.rev v.extra_subsolvers);
      sat_parameters_set_subsolvers v (List.rev v.subsolvers);
      sat_parameters_set_restart_algorithms v (List.rev v.restart_algorithms);
    ); continue__ := false
    | Some (171, Pbrt.Bytes) -> begin
      sat_parameters_set_name v (Pbrt.Decoder.string d);
    end
    | Some (171, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 171 pk
    | Some (1, Pbrt.Varint) -> begin
      sat_parameters_set_preferred_variable_order v (decode_pb_sat_parameters_variable_order d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 1 pk
    | Some (2, Pbrt.Varint) -> begin
      sat_parameters_set_initial_polarity v (decode_pb_sat_parameters_polarity d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 2 pk
    | Some (44, Pbrt.Varint) -> begin
      sat_parameters_set_use_phase_saving v (Pbrt.Decoder.bool d);
    end
    | Some (44, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 44 pk
    | Some (168, Pbrt.Varint) -> begin
      sat_parameters_set_polarity_rephase_increment v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (168, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 168 pk
    | Some (309, Pbrt.Varint) -> begin
      sat_parameters_set_polarity_exploit_ls_hints v (Pbrt.Decoder.bool d);
    end
    | Some (309, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 309 pk
    | Some (45, Pbrt.Bits64) -> begin
      sat_parameters_set_random_polarity_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (45, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 45 pk
    | Some (32, Pbrt.Bits64) -> begin
      sat_parameters_set_random_branches_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (32, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 32 pk
    | Some (75, Pbrt.Varint) -> begin
      sat_parameters_set_use_erwa_heuristic v (Pbrt.Decoder.bool d);
    end
    | Some (75, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 75 pk
    | Some (76, Pbrt.Bits64) -> begin
      sat_parameters_set_initial_variables_activity v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (76, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 76 pk
    | Some (77, Pbrt.Varint) -> begin
      sat_parameters_set_also_bump_variables_in_conflict_reasons v (Pbrt.Decoder.bool d);
    end
    | Some (77, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 77 pk
    | Some (4, Pbrt.Varint) -> begin
      sat_parameters_set_minimization_algorithm v (decode_pb_sat_parameters_conflict_minimization_algorithm d);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 4 pk
    | Some (34, Pbrt.Varint) -> begin
      sat_parameters_set_binary_minimization_algorithm v (decode_pb_sat_parameters_binary_minization_algorithm d);
    end
    | Some (34, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 34 pk
    | Some (56, Pbrt.Varint) -> begin
      sat_parameters_set_subsumption_during_conflict_analysis v (Pbrt.Decoder.bool d);
    end
    | Some (56, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 56 pk
    | Some (11, Pbrt.Varint) -> begin
      sat_parameters_set_clause_cleanup_period v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (11, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 11 pk
    | Some (13, Pbrt.Varint) -> begin
      sat_parameters_set_clause_cleanup_target v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (13, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 13 pk
    | Some (190, Pbrt.Bits64) -> begin
      sat_parameters_set_clause_cleanup_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (190, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 190 pk
    | Some (58, Pbrt.Varint) -> begin
      sat_parameters_set_clause_cleanup_protection v (decode_pb_sat_parameters_clause_protection d);
    end
    | Some (58, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 58 pk
    | Some (59, Pbrt.Varint) -> begin
      sat_parameters_set_clause_cleanup_lbd_bound v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (59, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 59 pk
    | Some (60, Pbrt.Varint) -> begin
      sat_parameters_set_clause_cleanup_ordering v (decode_pb_sat_parameters_clause_ordering d);
    end
    | Some (60, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 60 pk
    | Some (46, Pbrt.Varint) -> begin
      sat_parameters_set_pb_cleanup_increment v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (46, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 46 pk
    | Some (47, Pbrt.Bits64) -> begin
      sat_parameters_set_pb_cleanup_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (47, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 47 pk
    | Some (15, Pbrt.Bits64) -> begin
      sat_parameters_set_variable_activity_decay v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (15, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 15 pk
    | Some (16, Pbrt.Bits64) -> begin
      sat_parameters_set_max_variable_activity_value v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (16, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 16 pk
    | Some (22, Pbrt.Bits64) -> begin
      sat_parameters_set_glucose_max_decay v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (22, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 22 pk
    | Some (23, Pbrt.Bits64) -> begin
      sat_parameters_set_glucose_decay_increment v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (23, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 23 pk
    | Some (24, Pbrt.Varint) -> begin
      sat_parameters_set_glucose_decay_increment_period v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (24, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 24 pk
    | Some (17, Pbrt.Bits64) -> begin
      sat_parameters_set_clause_activity_decay v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (17, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 17 pk
    | Some (18, Pbrt.Bits64) -> begin
      sat_parameters_set_max_clause_activity_value v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (18, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 18 pk
    | Some (61, Pbrt.Varint) -> begin
      sat_parameters_set_restart_algorithms v ((decode_pb_sat_parameters_restart_algorithm d) :: v.restart_algorithms);
    end
    | Some (61, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 61 pk
    | Some (70, Pbrt.Bytes) -> begin
      sat_parameters_set_default_restart_algorithms v (Pbrt.Decoder.string d);
    end
    | Some (70, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 70 pk
    | Some (30, Pbrt.Varint) -> begin
      sat_parameters_set_restart_period v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (30, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 30 pk
    | Some (62, Pbrt.Varint) -> begin
      sat_parameters_set_restart_running_window_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (62, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 62 pk
    | Some (63, Pbrt.Bits64) -> begin
      sat_parameters_set_restart_dl_average_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (63, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 63 pk
    | Some (71, Pbrt.Bits64) -> begin
      sat_parameters_set_restart_lbd_average_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (71, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 71 pk
    | Some (64, Pbrt.Varint) -> begin
      sat_parameters_set_use_blocking_restart v (Pbrt.Decoder.bool d);
    end
    | Some (64, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 64 pk
    | Some (65, Pbrt.Varint) -> begin
      sat_parameters_set_blocking_restart_window_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (65, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 65 pk
    | Some (66, Pbrt.Bits64) -> begin
      sat_parameters_set_blocking_restart_multiplier v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (66, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 66 pk
    | Some (68, Pbrt.Varint) -> begin
      sat_parameters_set_num_conflicts_before_strategy_changes v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (68, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 68 pk
    | Some (69, Pbrt.Bits64) -> begin
      sat_parameters_set_strategy_change_increase_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (69, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 69 pk
    | Some (36, Pbrt.Bits64) -> begin
      sat_parameters_set_max_time_in_seconds v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (36, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 36 pk
    | Some (67, Pbrt.Bits64) -> begin
      sat_parameters_set_max_deterministic_time v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (67, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 67 pk
    | Some (291, Pbrt.Varint) -> begin
      sat_parameters_set_max_num_deterministic_batches v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (291, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 291 pk
    | Some (37, Pbrt.Varint) -> begin
      sat_parameters_set_max_number_of_conflicts v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (37, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 37 pk
    | Some (40, Pbrt.Varint) -> begin
      sat_parameters_set_max_memory_in_mb v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (40, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 40 pk
    | Some (159, Pbrt.Bits64) -> begin
      sat_parameters_set_absolute_gap_limit v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (159, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 159 pk
    | Some (160, Pbrt.Bits64) -> begin
      sat_parameters_set_relative_gap_limit v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (160, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 160 pk
    | Some (31, Pbrt.Varint) -> begin
      sat_parameters_set_random_seed v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (31, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 31 pk
    | Some (178, Pbrt.Varint) -> begin
      sat_parameters_set_permute_variable_randomly v (Pbrt.Decoder.bool d);
    end
    | Some (178, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 178 pk
    | Some (179, Pbrt.Varint) -> begin
      sat_parameters_set_permute_presolve_constraint_order v (Pbrt.Decoder.bool d);
    end
    | Some (179, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 179 pk
    | Some (180, Pbrt.Varint) -> begin
      sat_parameters_set_use_absl_random v (Pbrt.Decoder.bool d);
    end
    | Some (180, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 180 pk
    | Some (41, Pbrt.Varint) -> begin
      sat_parameters_set_log_search_progress v (Pbrt.Decoder.bool d);
    end
    | Some (41, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 41 pk
    | Some (189, Pbrt.Varint) -> begin
      sat_parameters_set_log_subsolver_statistics v (Pbrt.Decoder.bool d);
    end
    | Some (189, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 189 pk
    | Some (185, Pbrt.Bytes) -> begin
      sat_parameters_set_log_prefix v (Pbrt.Decoder.string d);
    end
    | Some (185, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 185 pk
    | Some (186, Pbrt.Varint) -> begin
      sat_parameters_set_log_to_stdout v (Pbrt.Decoder.bool d);
    end
    | Some (186, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 186 pk
    | Some (187, Pbrt.Varint) -> begin
      sat_parameters_set_log_to_response v (Pbrt.Decoder.bool d);
    end
    | Some (187, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 187 pk
    | Some (43, Pbrt.Varint) -> begin
      sat_parameters_set_use_pb_resolution v (Pbrt.Decoder.bool d);
    end
    | Some (43, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 43 pk
    | Some (48, Pbrt.Varint) -> begin
      sat_parameters_set_minimize_reduction_during_pb_resolution v (Pbrt.Decoder.bool d);
    end
    | Some (48, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 48 pk
    | Some (49, Pbrt.Varint) -> begin
      sat_parameters_set_count_assumption_levels_in_lbd v (Pbrt.Decoder.bool d);
    end
    | Some (49, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 49 pk
    | Some (54, Pbrt.Varint) -> begin
      sat_parameters_set_presolve_bve_threshold v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (54, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 54 pk
    | Some (55, Pbrt.Varint) -> begin
      sat_parameters_set_presolve_bve_clause_weight v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (55, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 55 pk
    | Some (226, Pbrt.Bits64) -> begin
      sat_parameters_set_probing_deterministic_time_limit v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (226, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 226 pk
    | Some (57, Pbrt.Bits64) -> begin
      sat_parameters_set_presolve_probing_deterministic_time_limit v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (57, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 57 pk
    | Some (88, Pbrt.Varint) -> begin
      sat_parameters_set_presolve_blocked_clause v (Pbrt.Decoder.bool d);
    end
    | Some (88, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 88 pk
    | Some (72, Pbrt.Varint) -> begin
      sat_parameters_set_presolve_use_bva v (Pbrt.Decoder.bool d);
    end
    | Some (72, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 72 pk
    | Some (73, Pbrt.Varint) -> begin
      sat_parameters_set_presolve_bva_threshold v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (73, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 73 pk
    | Some (138, Pbrt.Varint) -> begin
      sat_parameters_set_max_presolve_iterations v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (138, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 138 pk
    | Some (86, Pbrt.Varint) -> begin
      sat_parameters_set_cp_model_presolve v (Pbrt.Decoder.bool d);
    end
    | Some (86, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 86 pk
    | Some (110, Pbrt.Varint) -> begin
      sat_parameters_set_cp_model_probing_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (110, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 110 pk
    | Some (93, Pbrt.Varint) -> begin
      sat_parameters_set_cp_model_use_sat_presolve v (Pbrt.Decoder.bool d);
    end
    | Some (93, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 93 pk
    | Some (310, Pbrt.Varint) -> begin
      sat_parameters_set_remove_fixed_variables_early v (Pbrt.Decoder.bool d);
    end
    | Some (310, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 310 pk
    | Some (216, Pbrt.Varint) -> begin
      sat_parameters_set_detect_table_with_cost v (Pbrt.Decoder.bool d);
    end
    | Some (216, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 216 pk
    | Some (217, Pbrt.Varint) -> begin
      sat_parameters_set_table_compression_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (217, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 217 pk
    | Some (170, Pbrt.Varint) -> begin
      sat_parameters_set_expand_alldiff_constraints v (Pbrt.Decoder.bool d);
    end
    | Some (170, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 170 pk
    | Some (182, Pbrt.Varint) -> begin
      sat_parameters_set_expand_reservoir_constraints v (Pbrt.Decoder.bool d);
    end
    | Some (182, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 182 pk
    | Some (288, Pbrt.Varint) -> begin
      sat_parameters_set_expand_reservoir_using_circuit v (Pbrt.Decoder.bool d);
    end
    | Some (288, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 288 pk
    | Some (287, Pbrt.Varint) -> begin
      sat_parameters_set_encode_cumulative_as_reservoir v (Pbrt.Decoder.bool d);
    end
    | Some (287, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 287 pk
    | Some (280, Pbrt.Varint) -> begin
      sat_parameters_set_max_lin_max_size_for_expansion v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (280, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 280 pk
    | Some (181, Pbrt.Varint) -> begin
      sat_parameters_set_disable_constraint_expansion v (Pbrt.Decoder.bool d);
    end
    | Some (181, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 181 pk
    | Some (223, Pbrt.Varint) -> begin
      sat_parameters_set_encode_complex_linear_constraint_with_integer v (Pbrt.Decoder.bool d);
    end
    | Some (223, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 223 pk
    | Some (145, Pbrt.Bits64) -> begin
      sat_parameters_set_merge_no_overlap_work_limit v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (145, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 145 pk
    | Some (146, Pbrt.Bits64) -> begin
      sat_parameters_set_merge_at_most_one_work_limit v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (146, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 146 pk
    | Some (147, Pbrt.Varint) -> begin
      sat_parameters_set_presolve_substitution_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (147, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 147 pk
    | Some (174, Pbrt.Varint) -> begin
      sat_parameters_set_presolve_extract_integer_enforcement v (Pbrt.Decoder.bool d);
    end
    | Some (174, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 174 pk
    | Some (201, Pbrt.Varint) -> begin
      sat_parameters_set_presolve_inclusion_work_limit v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (201, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 201 pk
    | Some (202, Pbrt.Varint) -> begin
      sat_parameters_set_ignore_names v (Pbrt.Decoder.bool d);
    end
    | Some (202, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 202 pk
    | Some (233, Pbrt.Varint) -> begin
      sat_parameters_set_infer_all_diffs v (Pbrt.Decoder.bool d);
    end
    | Some (233, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 233 pk
    | Some (234, Pbrt.Varint) -> begin
      sat_parameters_set_find_big_linear_overlap v (Pbrt.Decoder.bool d);
    end
    | Some (234, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 234 pk
    | Some (163, Pbrt.Varint) -> begin
      sat_parameters_set_use_sat_inprocessing v (Pbrt.Decoder.bool d);
    end
    | Some (163, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 163 pk
    | Some (273, Pbrt.Bits64) -> begin
      sat_parameters_set_inprocessing_dtime_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (273, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 273 pk
    | Some (274, Pbrt.Bits64) -> begin
      sat_parameters_set_inprocessing_probing_dtime v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (274, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 274 pk
    | Some (275, Pbrt.Bits64) -> begin
      sat_parameters_set_inprocessing_minimization_dtime v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (275, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 275 pk
    | Some (297, Pbrt.Varint) -> begin
      sat_parameters_set_inprocessing_minimization_use_conflict_analysis v (Pbrt.Decoder.bool d);
    end
    | Some (297, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 297 pk
    | Some (298, Pbrt.Varint) -> begin
      sat_parameters_set_inprocessing_minimization_use_all_orderings v (Pbrt.Decoder.bool d);
    end
    | Some (298, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 298 pk
    | Some (206, Pbrt.Varint) -> begin
      sat_parameters_set_num_workers v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (206, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 206 pk
    | Some (100, Pbrt.Varint) -> begin
      sat_parameters_set_num_search_workers v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (100, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 100 pk
    | Some (294, Pbrt.Varint) -> begin
      sat_parameters_set_num_full_subsolvers v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (294, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 294 pk
    | Some (207, Pbrt.Bytes) -> begin
      sat_parameters_set_subsolvers v ((Pbrt.Decoder.string d) :: v.subsolvers);
    end
    | Some (207, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 207 pk
    | Some (219, Pbrt.Bytes) -> begin
      sat_parameters_set_extra_subsolvers v ((Pbrt.Decoder.string d) :: v.extra_subsolvers);
    end
    | Some (219, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 219 pk
    | Some (209, Pbrt.Bytes) -> begin
      sat_parameters_set_ignore_subsolvers v ((Pbrt.Decoder.string d) :: v.ignore_subsolvers);
    end
    | Some (209, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 209 pk
    | Some (293, Pbrt.Bytes) -> begin
      sat_parameters_set_filter_subsolvers v ((Pbrt.Decoder.string d) :: v.filter_subsolvers);
    end
    | Some (293, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 293 pk
    | Some (210, Pbrt.Bytes) -> begin
      sat_parameters_set_subsolver_params v ((decode_pb_sat_parameters (Pbrt.Decoder.nested d)) :: v.subsolver_params);
    end
    | Some (210, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 210 pk
    | Some (136, Pbrt.Varint) -> begin
      sat_parameters_set_interleave_search v (Pbrt.Decoder.bool d);
    end
    | Some (136, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 136 pk
    | Some (134, Pbrt.Varint) -> begin
      sat_parameters_set_interleave_batch_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (134, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 134 pk
    | Some (113, Pbrt.Varint) -> begin
      sat_parameters_set_share_objective_bounds v (Pbrt.Decoder.bool d);
    end
    | Some (113, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 113 pk
    | Some (114, Pbrt.Varint) -> begin
      sat_parameters_set_share_level_zero_bounds v (Pbrt.Decoder.bool d);
    end
    | Some (114, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 114 pk
    | Some (203, Pbrt.Varint) -> begin
      sat_parameters_set_share_binary_clauses v (Pbrt.Decoder.bool d);
    end
    | Some (203, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 203 pk
    | Some (285, Pbrt.Varint) -> begin
      sat_parameters_set_share_glue_clauses v (Pbrt.Decoder.bool d);
    end
    | Some (285, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 285 pk
    | Some (300, Pbrt.Varint) -> begin
      sat_parameters_set_minimize_shared_clauses v (Pbrt.Decoder.bool d);
    end
    | Some (300, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 300 pk
    | Some (162, Pbrt.Varint) -> begin
      sat_parameters_set_debug_postsolve_with_full_solver v (Pbrt.Decoder.bool d);
    end
    | Some (162, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 162 pk
    | Some (151, Pbrt.Varint) -> begin
      sat_parameters_set_debug_max_num_presolve_operations v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (151, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 151 pk
    | Some (195, Pbrt.Varint) -> begin
      sat_parameters_set_debug_crash_on_bad_hint v (Pbrt.Decoder.bool d);
    end
    | Some (195, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 195 pk
    | Some (306, Pbrt.Varint) -> begin
      sat_parameters_set_debug_crash_if_presolve_breaks_hint v (Pbrt.Decoder.bool d);
    end
    | Some (306, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 306 pk
    | Some (35, Pbrt.Varint) -> begin
      sat_parameters_set_use_optimization_hints v (Pbrt.Decoder.bool d);
    end
    | Some (35, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 35 pk
    | Some (50, Pbrt.Varint) -> begin
      sat_parameters_set_core_minimization_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (50, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 50 pk
    | Some (84, Pbrt.Varint) -> begin
      sat_parameters_set_find_multiple_cores v (Pbrt.Decoder.bool d);
    end
    | Some (84, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 84 pk
    | Some (89, Pbrt.Varint) -> begin
      sat_parameters_set_cover_optimization v (Pbrt.Decoder.bool d);
    end
    | Some (89, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 89 pk
    | Some (51, Pbrt.Varint) -> begin
      sat_parameters_set_max_sat_assumption_order v (decode_pb_sat_parameters_max_sat_assumption_order d);
    end
    | Some (51, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 51 pk
    | Some (52, Pbrt.Varint) -> begin
      sat_parameters_set_max_sat_reverse_assumption_order v (Pbrt.Decoder.bool d);
    end
    | Some (52, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 52 pk
    | Some (53, Pbrt.Varint) -> begin
      sat_parameters_set_max_sat_stratification v (decode_pb_sat_parameters_max_sat_stratification_algorithm d);
    end
    | Some (53, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 53 pk
    | Some (221, Pbrt.Bits64) -> begin
      sat_parameters_set_propagation_loop_detection_factor v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (221, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 221 pk
    | Some (74, Pbrt.Varint) -> begin
      sat_parameters_set_use_precedences_in_disjunctive_constraint v (Pbrt.Decoder.bool d);
    end
    | Some (74, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 74 pk
    | Some (229, Pbrt.Varint) -> begin
      sat_parameters_set_max_size_to_create_precedence_literals_in_disjunctive v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (229, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 229 pk
    | Some (230, Pbrt.Varint) -> begin
      sat_parameters_set_use_strong_propagation_in_disjunctive v (Pbrt.Decoder.bool d);
    end
    | Some (230, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 230 pk
    | Some (263, Pbrt.Varint) -> begin
      sat_parameters_set_use_dynamic_precedence_in_disjunctive v (Pbrt.Decoder.bool d);
    end
    | Some (263, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 263 pk
    | Some (268, Pbrt.Varint) -> begin
      sat_parameters_set_use_dynamic_precedence_in_cumulative v (Pbrt.Decoder.bool d);
    end
    | Some (268, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 268 pk
    | Some (78, Pbrt.Varint) -> begin
      sat_parameters_set_use_overload_checker_in_cumulative v (Pbrt.Decoder.bool d);
    end
    | Some (78, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 78 pk
    | Some (286, Pbrt.Varint) -> begin
      sat_parameters_set_use_conservative_scale_overload_checker v (Pbrt.Decoder.bool d);
    end
    | Some (286, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 286 pk
    | Some (79, Pbrt.Varint) -> begin
      sat_parameters_set_use_timetable_edge_finding_in_cumulative v (Pbrt.Decoder.bool d);
    end
    | Some (79, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 79 pk
    | Some (260, Pbrt.Varint) -> begin
      sat_parameters_set_max_num_intervals_for_timetable_edge_finding v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (260, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 260 pk
    | Some (215, Pbrt.Varint) -> begin
      sat_parameters_set_use_hard_precedences_in_cumulative v (Pbrt.Decoder.bool d);
    end
    | Some (215, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 215 pk
    | Some (220, Pbrt.Varint) -> begin
      sat_parameters_set_exploit_all_precedences v (Pbrt.Decoder.bool d);
    end
    | Some (220, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 220 pk
    | Some (80, Pbrt.Varint) -> begin
      sat_parameters_set_use_disjunctive_constraint_in_cumulative v (Pbrt.Decoder.bool d);
    end
    | Some (80, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 80 pk
    | Some (200, Pbrt.Varint) -> begin
      sat_parameters_set_use_timetabling_in_no_overlap_2d v (Pbrt.Decoder.bool d);
    end
    | Some (200, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 200 pk
    | Some (213, Pbrt.Varint) -> begin
      sat_parameters_set_use_energetic_reasoning_in_no_overlap_2d v (Pbrt.Decoder.bool d);
    end
    | Some (213, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 213 pk
    | Some (271, Pbrt.Varint) -> begin
      sat_parameters_set_use_area_energetic_reasoning_in_no_overlap_2d v (Pbrt.Decoder.bool d);
    end
    | Some (271, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 271 pk
    | Some (299, Pbrt.Varint) -> begin
      sat_parameters_set_use_try_edge_reasoning_in_no_overlap_2d v (Pbrt.Decoder.bool d);
    end
    | Some (299, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 299 pk
    | Some (276, Pbrt.Varint) -> begin
      sat_parameters_set_max_pairs_pairwise_reasoning_in_no_overlap_2d v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (276, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 276 pk
    | Some (315, Pbrt.Varint) -> begin
      sat_parameters_set_maximum_regions_to_split_in_disconnected_no_overlap_2d v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (315, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 315 pk
    | Some (214, Pbrt.Varint) -> begin
      sat_parameters_set_use_dual_scheduling_heuristics v (Pbrt.Decoder.bool d);
    end
    | Some (214, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 214 pk
    | Some (311, Pbrt.Varint) -> begin
      sat_parameters_set_use_all_different_for_circuit v (Pbrt.Decoder.bool d);
    end
    | Some (311, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 311 pk
    | Some (312, Pbrt.Varint) -> begin
      sat_parameters_set_routing_cut_subset_size_for_binary_relation_bound v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (312, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 312 pk
    | Some (313, Pbrt.Varint) -> begin
      sat_parameters_set_routing_cut_subset_size_for_tight_binary_relation_bound v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (313, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 313 pk
    | Some (314, Pbrt.Bits64) -> begin
      sat_parameters_set_routing_cut_dp_effort v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (314, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 314 pk
    | Some (82, Pbrt.Varint) -> begin
      sat_parameters_set_search_branching v (decode_pb_sat_parameters_search_branching d);
    end
    | Some (82, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 82 pk
    | Some (153, Pbrt.Varint) -> begin
      sat_parameters_set_hint_conflict_limit v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (153, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 153 pk
    | Some (167, Pbrt.Varint) -> begin
      sat_parameters_set_repair_hint v (Pbrt.Decoder.bool d);
    end
    | Some (167, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 167 pk
    | Some (192, Pbrt.Varint) -> begin
      sat_parameters_set_fix_variables_to_their_hinted_value v (Pbrt.Decoder.bool d);
    end
    | Some (192, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 192 pk
    | Some (176, Pbrt.Varint) -> begin
      sat_parameters_set_use_probing_search v (Pbrt.Decoder.bool d);
    end
    | Some (176, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 176 pk
    | Some (269, Pbrt.Varint) -> begin
      sat_parameters_set_use_extended_probing v (Pbrt.Decoder.bool d);
    end
    | Some (269, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 269 pk
    | Some (272, Pbrt.Varint) -> begin
      sat_parameters_set_probing_num_combinations_limit v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (272, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 272 pk
    | Some (204, Pbrt.Varint) -> begin
      sat_parameters_set_use_shaving_in_probing_search v (Pbrt.Decoder.bool d);
    end
    | Some (204, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 204 pk
    | Some (205, Pbrt.Bits64) -> begin
      sat_parameters_set_shaving_search_deterministic_time v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (205, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 205 pk
    | Some (290, Pbrt.Varint) -> begin
      sat_parameters_set_shaving_search_threshold v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (290, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 290 pk
    | Some (228, Pbrt.Varint) -> begin
      sat_parameters_set_use_objective_lb_search v (Pbrt.Decoder.bool d);
    end
    | Some (228, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 228 pk
    | Some (253, Pbrt.Varint) -> begin
      sat_parameters_set_use_objective_shaving_search v (Pbrt.Decoder.bool d);
    end
    | Some (253, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 253 pk
    | Some (289, Pbrt.Varint) -> begin
      sat_parameters_set_use_variables_shaving_search v (Pbrt.Decoder.bool d);
    end
    | Some (289, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 289 pk
    | Some (123, Pbrt.Varint) -> begin
      sat_parameters_set_pseudo_cost_reliability_threshold v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (123, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 123 pk
    | Some (83, Pbrt.Varint) -> begin
      sat_parameters_set_optimize_with_core v (Pbrt.Decoder.bool d);
    end
    | Some (83, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 83 pk
    | Some (188, Pbrt.Varint) -> begin
      sat_parameters_set_optimize_with_lb_tree_search v (Pbrt.Decoder.bool d);
    end
    | Some (188, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 188 pk
    | Some (284, Pbrt.Varint) -> begin
      sat_parameters_set_save_lp_basis_in_lb_tree_search v (Pbrt.Decoder.bool d);
    end
    | Some (284, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 284 pk
    | Some (99, Pbrt.Varint) -> begin
      sat_parameters_set_binary_search_num_conflicts v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (99, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 99 pk
    | Some (85, Pbrt.Varint) -> begin
      sat_parameters_set_optimize_with_max_hs v (Pbrt.Decoder.bool d);
    end
    | Some (85, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 85 pk
    | Some (265, Pbrt.Varint) -> begin
      sat_parameters_set_use_feasibility_jump v (Pbrt.Decoder.bool d);
    end
    | Some (265, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 265 pk
    | Some (240, Pbrt.Varint) -> begin
      sat_parameters_set_use_ls_only v (Pbrt.Decoder.bool d);
    end
    | Some (240, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 240 pk
    | Some (242, Pbrt.Bits64) -> begin
      sat_parameters_set_feasibility_jump_decay v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (242, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 242 pk
    | Some (257, Pbrt.Varint) -> begin
      sat_parameters_set_feasibility_jump_linearization_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (257, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 257 pk
    | Some (258, Pbrt.Varint) -> begin
      sat_parameters_set_feasibility_jump_restart_factor v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (258, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 258 pk
    | Some (292, Pbrt.Bits64) -> begin
      sat_parameters_set_feasibility_jump_batch_dtime v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (292, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 292 pk
    | Some (247, Pbrt.Bits64) -> begin
      sat_parameters_set_feasibility_jump_var_randomization_probability v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (247, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 247 pk
    | Some (248, Pbrt.Bits64) -> begin
      sat_parameters_set_feasibility_jump_var_perburbation_range_ratio v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (248, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 248 pk
    | Some (250, Pbrt.Varint) -> begin
      sat_parameters_set_feasibility_jump_enable_restarts v (Pbrt.Decoder.bool d);
    end
    | Some (250, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 250 pk
    | Some (264, Pbrt.Varint) -> begin
      sat_parameters_set_feasibility_jump_max_expanded_constraint_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (264, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 264 pk
    | Some (244, Pbrt.Varint) -> begin
      sat_parameters_set_num_violation_ls v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (244, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 244 pk
    | Some (249, Pbrt.Varint) -> begin
      sat_parameters_set_violation_ls_perturbation_period v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (249, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 249 pk
    | Some (259, Pbrt.Bits64) -> begin
      sat_parameters_set_violation_ls_compound_move_probability v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (259, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 259 pk
    | Some (235, Pbrt.Varint) -> begin
      sat_parameters_set_shared_tree_num_workers v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (235, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 235 pk
    | Some (236, Pbrt.Varint) -> begin
      sat_parameters_set_use_shared_tree_search v (Pbrt.Decoder.bool d);
    end
    | Some (236, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 236 pk
    | Some (282, Pbrt.Varint) -> begin
      sat_parameters_set_shared_tree_worker_min_restarts_per_subtree v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (282, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 282 pk
    | Some (295, Pbrt.Varint) -> begin
      sat_parameters_set_shared_tree_worker_enable_trail_sharing v (Pbrt.Decoder.bool d);
    end
    | Some (295, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 295 pk
    | Some (304, Pbrt.Varint) -> begin
      sat_parameters_set_shared_tree_worker_enable_phase_sharing v (Pbrt.Decoder.bool d);
    end
    | Some (304, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 304 pk
    | Some (281, Pbrt.Bits64) -> begin
      sat_parameters_set_shared_tree_open_leaves_per_worker v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (281, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 281 pk
    | Some (238, Pbrt.Varint) -> begin
      sat_parameters_set_shared_tree_max_nodes_per_worker v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (238, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 238 pk
    | Some (239, Pbrt.Varint) -> begin
      sat_parameters_set_shared_tree_split_strategy v (decode_pb_sat_parameters_shared_tree_split_strategy d);
    end
    | Some (239, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 239 pk
    | Some (305, Pbrt.Varint) -> begin
      sat_parameters_set_shared_tree_balance_tolerance v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (305, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 305 pk
    | Some (87, Pbrt.Varint) -> begin
      sat_parameters_set_enumerate_all_solutions v (Pbrt.Decoder.bool d);
    end
    | Some (87, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 87 pk
    | Some (173, Pbrt.Varint) -> begin
      sat_parameters_set_keep_all_feasible_solutions_in_presolve v (Pbrt.Decoder.bool d);
    end
    | Some (173, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 173 pk
    | Some (132, Pbrt.Varint) -> begin
      sat_parameters_set_fill_tightened_domains_in_response v (Pbrt.Decoder.bool d);
    end
    | Some (132, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 132 pk
    | Some (194, Pbrt.Varint) -> begin
      sat_parameters_set_fill_additional_solutions_in_response v (Pbrt.Decoder.bool d);
    end
    | Some (194, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 194 pk
    | Some (106, Pbrt.Varint) -> begin
      sat_parameters_set_instantiate_all_variables v (Pbrt.Decoder.bool d);
    end
    | Some (106, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 106 pk
    | Some (95, Pbrt.Varint) -> begin
      sat_parameters_set_auto_detect_greater_than_at_least_one_of v (Pbrt.Decoder.bool d);
    end
    | Some (95, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 95 pk
    | Some (98, Pbrt.Varint) -> begin
      sat_parameters_set_stop_after_first_solution v (Pbrt.Decoder.bool d);
    end
    | Some (98, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 98 pk
    | Some (149, Pbrt.Varint) -> begin
      sat_parameters_set_stop_after_presolve v (Pbrt.Decoder.bool d);
    end
    | Some (149, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 149 pk
    | Some (252, Pbrt.Varint) -> begin
      sat_parameters_set_stop_after_root_propagation v (Pbrt.Decoder.bool d);
    end
    | Some (252, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 252 pk
    | Some (307, Pbrt.Bits64) -> begin
      sat_parameters_set_lns_initial_difficulty v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (307, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 307 pk
    | Some (308, Pbrt.Bits64) -> begin
      sat_parameters_set_lns_initial_deterministic_limit v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (308, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 308 pk
    | Some (283, Pbrt.Varint) -> begin
      sat_parameters_set_use_lns v (Pbrt.Decoder.bool d);
    end
    | Some (283, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 283 pk
    | Some (101, Pbrt.Varint) -> begin
      sat_parameters_set_use_lns_only v (Pbrt.Decoder.bool d);
    end
    | Some (101, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 101 pk
    | Some (193, Pbrt.Varint) -> begin
      sat_parameters_set_solution_pool_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (193, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 193 pk
    | Some (129, Pbrt.Varint) -> begin
      sat_parameters_set_use_rins_lns v (Pbrt.Decoder.bool d);
    end
    | Some (129, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 129 pk
    | Some (164, Pbrt.Varint) -> begin
      sat_parameters_set_use_feasibility_pump v (Pbrt.Decoder.bool d);
    end
    | Some (164, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 164 pk
    | Some (255, Pbrt.Varint) -> begin
      sat_parameters_set_use_lb_relax_lns v (Pbrt.Decoder.bool d);
    end
    | Some (255, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 255 pk
    | Some (296, Pbrt.Varint) -> begin
      sat_parameters_set_lb_relax_num_workers_threshold v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (296, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 296 pk
    | Some (165, Pbrt.Varint) -> begin
      sat_parameters_set_fp_rounding v (decode_pb_sat_parameters_fprounding_method d);
    end
    | Some (165, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 165 pk
    | Some (137, Pbrt.Varint) -> begin
      sat_parameters_set_diversify_lns_params v (Pbrt.Decoder.bool d);
    end
    | Some (137, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 137 pk
    | Some (103, Pbrt.Varint) -> begin
      sat_parameters_set_randomize_search v (Pbrt.Decoder.bool d);
    end
    | Some (103, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 103 pk
    | Some (104, Pbrt.Varint) -> begin
      sat_parameters_set_search_random_variable_pool_size v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (104, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 104 pk
    | Some (262, Pbrt.Varint) -> begin
      sat_parameters_set_push_all_tasks_toward_start v (Pbrt.Decoder.bool d);
    end
    | Some (262, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 262 pk
    | Some (108, Pbrt.Varint) -> begin
      sat_parameters_set_use_optional_variables v (Pbrt.Decoder.bool d);
    end
    | Some (108, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 108 pk
    | Some (109, Pbrt.Varint) -> begin
      sat_parameters_set_use_exact_lp_reason v (Pbrt.Decoder.bool d);
    end
    | Some (109, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 109 pk
    | Some (133, Pbrt.Varint) -> begin
      sat_parameters_set_use_combined_no_overlap v (Pbrt.Decoder.bool d);
    end
    | Some (133, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 133 pk
    | Some (270, Pbrt.Varint) -> begin
      sat_parameters_set_at_most_one_max_expansion_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (270, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 270 pk
    | Some (135, Pbrt.Varint) -> begin
      sat_parameters_set_catch_sigint_signal v (Pbrt.Decoder.bool d);
    end
    | Some (135, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 135 pk
    | Some (144, Pbrt.Varint) -> begin
      sat_parameters_set_use_implied_bounds v (Pbrt.Decoder.bool d);
    end
    | Some (144, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 144 pk
    | Some (175, Pbrt.Varint) -> begin
      sat_parameters_set_polish_lp_solution v (Pbrt.Decoder.bool d);
    end
    | Some (175, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 175 pk
    | Some (266, Pbrt.Bits64) -> begin
      sat_parameters_set_lp_primal_tolerance v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (266, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 266 pk
    | Some (267, Pbrt.Bits64) -> begin
      sat_parameters_set_lp_dual_tolerance v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (267, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 267 pk
    | Some (177, Pbrt.Varint) -> begin
      sat_parameters_set_convert_intervals v (Pbrt.Decoder.bool d);
    end
    | Some (177, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 177 pk
    | Some (183, Pbrt.Varint) -> begin
      sat_parameters_set_symmetry_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (183, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 183 pk
    | Some (301, Pbrt.Varint) -> begin
      sat_parameters_set_use_symmetry_in_lp v (Pbrt.Decoder.bool d);
    end
    | Some (301, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 301 pk
    | Some (303, Pbrt.Varint) -> begin
      sat_parameters_set_keep_symmetry_in_presolve v (Pbrt.Decoder.bool d);
    end
    | Some (303, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 303 pk
    | Some (302, Pbrt.Bits64) -> begin
      sat_parameters_set_symmetry_detection_deterministic_time_limit v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (302, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 302 pk
    | Some (224, Pbrt.Varint) -> begin
      sat_parameters_set_new_linear_propagation v (Pbrt.Decoder.bool d);
    end
    | Some (224, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 224 pk
    | Some (256, Pbrt.Varint) -> begin
      sat_parameters_set_linear_split_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (256, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 256 pk
    | Some (90, Pbrt.Varint) -> begin
      sat_parameters_set_linearization_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (90, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 90 pk
    | Some (107, Pbrt.Varint) -> begin
      sat_parameters_set_boolean_encoding_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (107, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 107 pk
    | Some (191, Pbrt.Varint) -> begin
      sat_parameters_set_max_domain_size_when_encoding_eq_neq_constraints v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (191, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 191 pk
    | Some (91, Pbrt.Varint) -> begin
      sat_parameters_set_max_num_cuts v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (91, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 91 pk
    | Some (196, Pbrt.Varint) -> begin
      sat_parameters_set_cut_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (196, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 196 pk
    | Some (92, Pbrt.Varint) -> begin
      sat_parameters_set_only_add_cuts_at_level_zero v (Pbrt.Decoder.bool d);
    end
    | Some (92, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 92 pk
    | Some (197, Pbrt.Varint) -> begin
      sat_parameters_set_add_objective_cut v (Pbrt.Decoder.bool d);
    end
    | Some (197, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 197 pk
    | Some (117, Pbrt.Varint) -> begin
      sat_parameters_set_add_cg_cuts v (Pbrt.Decoder.bool d);
    end
    | Some (117, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 117 pk
    | Some (120, Pbrt.Varint) -> begin
      sat_parameters_set_add_mir_cuts v (Pbrt.Decoder.bool d);
    end
    | Some (120, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 120 pk
    | Some (169, Pbrt.Varint) -> begin
      sat_parameters_set_add_zero_half_cuts v (Pbrt.Decoder.bool d);
    end
    | Some (169, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 169 pk
    | Some (172, Pbrt.Varint) -> begin
      sat_parameters_set_add_clique_cuts v (Pbrt.Decoder.bool d);
    end
    | Some (172, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 172 pk
    | Some (279, Pbrt.Varint) -> begin
      sat_parameters_set_add_rlt_cuts v (Pbrt.Decoder.bool d);
    end
    | Some (279, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 279 pk
    | Some (148, Pbrt.Varint) -> begin
      sat_parameters_set_max_all_diff_cut_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (148, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 148 pk
    | Some (152, Pbrt.Varint) -> begin
      sat_parameters_set_add_lin_max_cuts v (Pbrt.Decoder.bool d);
    end
    | Some (152, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 152 pk
    | Some (119, Pbrt.Varint) -> begin
      sat_parameters_set_max_integer_rounding_scaling v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (119, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 119 pk
    | Some (112, Pbrt.Varint) -> begin
      sat_parameters_set_add_lp_constraints_lazily v (Pbrt.Decoder.bool d);
    end
    | Some (112, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 112 pk
    | Some (227, Pbrt.Varint) -> begin
      sat_parameters_set_root_lp_iterations v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (227, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 227 pk
    | Some (115, Pbrt.Bits64) -> begin
      sat_parameters_set_min_orthogonality_for_lp_constraints v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (115, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 115 pk
    | Some (154, Pbrt.Varint) -> begin
      sat_parameters_set_max_cut_rounds_at_level_zero v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (154, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 154 pk
    | Some (121, Pbrt.Varint) -> begin
      sat_parameters_set_max_consecutive_inactive_count v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (121, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 121 pk
    | Some (155, Pbrt.Bits64) -> begin
      sat_parameters_set_cut_max_active_count_value v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (155, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 155 pk
    | Some (156, Pbrt.Bits64) -> begin
      sat_parameters_set_cut_active_count_decay v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (156, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 156 pk
    | Some (157, Pbrt.Varint) -> begin
      sat_parameters_set_cut_cleanup_target v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (157, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 157 pk
    | Some (122, Pbrt.Varint) -> begin
      sat_parameters_set_new_constraints_batch_size v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (122, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 122 pk
    | Some (94, Pbrt.Varint) -> begin
      sat_parameters_set_exploit_integer_lp_solution v (Pbrt.Decoder.bool d);
    end
    | Some (94, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 94 pk
    | Some (116, Pbrt.Varint) -> begin
      sat_parameters_set_exploit_all_lp_solution v (Pbrt.Decoder.bool d);
    end
    | Some (116, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 116 pk
    | Some (130, Pbrt.Varint) -> begin
      sat_parameters_set_exploit_best_solution v (Pbrt.Decoder.bool d);
    end
    | Some (130, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 130 pk
    | Some (161, Pbrt.Varint) -> begin
      sat_parameters_set_exploit_relaxation_solution v (Pbrt.Decoder.bool d);
    end
    | Some (161, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 161 pk
    | Some (131, Pbrt.Varint) -> begin
      sat_parameters_set_exploit_objective v (Pbrt.Decoder.bool d);
    end
    | Some (131, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 131 pk
    | Some (277, Pbrt.Varint) -> begin
      sat_parameters_set_detect_linearized_product v (Pbrt.Decoder.bool d);
    end
    | Some (277, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 277 pk
    | Some (124, Pbrt.Bits64) -> begin
      sat_parameters_set_mip_max_bound v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (124, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 124 pk
    | Some (125, Pbrt.Bits64) -> begin
      sat_parameters_set_mip_var_scaling v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (125, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 125 pk
    | Some (225, Pbrt.Varint) -> begin
      sat_parameters_set_mip_scale_large_domain v (Pbrt.Decoder.bool d);
    end
    | Some (225, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 225 pk
    | Some (166, Pbrt.Varint) -> begin
      sat_parameters_set_mip_automatically_scale_variables v (Pbrt.Decoder.bool d);
    end
    | Some (166, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 166 pk
    | Some (222, Pbrt.Varint) -> begin
      sat_parameters_set_only_solve_ip v (Pbrt.Decoder.bool d);
    end
    | Some (222, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 222 pk
    | Some (126, Pbrt.Bits64) -> begin
      sat_parameters_set_mip_wanted_precision v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (126, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 126 pk
    | Some (127, Pbrt.Varint) -> begin
      sat_parameters_set_mip_max_activity_exponent v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (127, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 127 pk
    | Some (128, Pbrt.Bits64) -> begin
      sat_parameters_set_mip_check_precision v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (128, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 128 pk
    | Some (198, Pbrt.Varint) -> begin
      sat_parameters_set_mip_compute_true_objective_bound v (Pbrt.Decoder.bool d);
    end
    | Some (198, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 198 pk
    | Some (199, Pbrt.Bits64) -> begin
      sat_parameters_set_mip_max_valid_magnitude v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (199, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 199 pk
    | Some (278, Pbrt.Varint) -> begin
      sat_parameters_set_mip_treat_high_magnitude_bounds_as_infinity v (Pbrt.Decoder.bool d);
    end
    | Some (278, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 278 pk
    | Some (232, Pbrt.Bits64) -> begin
      sat_parameters_set_mip_drop_tolerance v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (232, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 232 pk
    | Some (261, Pbrt.Varint) -> begin
      sat_parameters_set_mip_presolve_level v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (261, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sat_parameters" 261 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : sat_parameters)
