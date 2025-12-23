[@@@ocaml.warning "-23-27-30-39-44"]

type integer_variable_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable name : string;
  mutable domain : int64 list;
}

type bool_argument_proto = {
  mutable literals : int32 list;
}

type linear_expression_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable vars : int32 list;
  mutable coeffs : int64 list;
  mutable offset : int64;
}

type linear_argument_proto = {
  mutable target : linear_expression_proto option;
  mutable exprs : linear_expression_proto list;
}

type all_different_constraint_proto = {
  mutable exprs : linear_expression_proto list;
}

type linear_constraint_proto = {
  mutable vars : int32 list;
  mutable coeffs : int64 list;
  mutable domain : int64 list;
}

type element_constraint_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable index : int32;
  mutable target : int32;
  mutable vars : int32 list;
  mutable linear_index : linear_expression_proto option;
  mutable linear_target : linear_expression_proto option;
  mutable exprs : linear_expression_proto list;
}

type interval_constraint_proto = {
  mutable start : linear_expression_proto option;
  mutable end_ : linear_expression_proto option;
  mutable size : linear_expression_proto option;
}

type no_overlap_constraint_proto = {
  mutable intervals : int32 list;
}

type no_overlap2_dconstraint_proto = {
  mutable x_intervals : int32 list;
  mutable y_intervals : int32 list;
}

type cumulative_constraint_proto = {
  mutable capacity : linear_expression_proto option;
  mutable intervals : int32 list;
  mutable demands : linear_expression_proto list;
}

type reservoir_constraint_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable min_level : int64;
  mutable max_level : int64;
  mutable time_exprs : linear_expression_proto list;
  mutable level_changes : linear_expression_proto list;
  mutable active_literals : int32 list;
}

type circuit_constraint_proto = {
  mutable tails : int32 list;
  mutable heads : int32 list;
  mutable literals : int32 list;
}

type routes_constraint_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable tails : int32 list;
  mutable heads : int32 list;
  mutable literals : int32 list;
  mutable demands : int32 list;
  mutable capacity : int64;
}

type table_constraint_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable vars : int32 list;
  mutable values : int64 list;
  mutable exprs : linear_expression_proto list;
  mutable negated : bool;
}

type inverse_constraint_proto = {
  mutable f_direct : int32 list;
  mutable f_inverse : int32 list;
}

type automaton_constraint_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable starting_state : int64;
  mutable final_states : int64 list;
  mutable transition_tail : int64 list;
  mutable transition_head : int64 list;
  mutable transition_label : int64 list;
  mutable vars : int32 list;
  mutable exprs : linear_expression_proto list;
}

type list_of_variables_proto = {
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

and constraint_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 1 fields *)
  mutable name : string;
  mutable enforcement_literal : int32 list;
  mutable constraint_ : constraint_proto_constraint option;
}

type cp_objective_proto = {
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

type float_objective_proto = {
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

type decision_strategy_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable variables : int32 list;
  mutable exprs : linear_expression_proto list;
  mutable variable_selection_strategy : decision_strategy_proto_variable_selection_strategy;
  mutable domain_reduction_strategy : decision_strategy_proto_domain_reduction_strategy;
}

type partial_variable_assignment = {
  mutable vars : int32 list;
  mutable values : int64 list;
}

type sparse_permutation_proto = {
  mutable support : int32 list;
  mutable cycle_sizes : int32 list;
}

type dense_matrix_proto = {
  mutable _presence: Pbrt.Bitfield.t; (** presence for 2 fields *)
  mutable num_rows : int32;
  mutable num_cols : int32;
  mutable entries : int32 list;
}

type symmetry_proto = {
  mutable permutations : sparse_permutation_proto list;
  mutable orbitopes : dense_matrix_proto list;
}

type cp_model_proto = {
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

type cp_solver_solution = {
  mutable values : int64 list;
}

type cp_solver_response = {
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

let default_integer_variable_proto (): integer_variable_proto =
{
  _presence=Pbrt.Bitfield.empty;
  name="";
  domain=[];
}

let default_bool_argument_proto (): bool_argument_proto =
{
  literals=[];
}

let default_linear_expression_proto (): linear_expression_proto =
{
  _presence=Pbrt.Bitfield.empty;
  vars=[];
  coeffs=[];
  offset=0L;
}

let default_linear_argument_proto (): linear_argument_proto =
{
  target=None;
  exprs=[];
}

let default_all_different_constraint_proto (): all_different_constraint_proto =
{
  exprs=[];
}

let default_linear_constraint_proto (): linear_constraint_proto =
{
  vars=[];
  coeffs=[];
  domain=[];
}

let default_element_constraint_proto (): element_constraint_proto =
{
  _presence=Pbrt.Bitfield.empty;
  index=0l;
  target=0l;
  vars=[];
  linear_index=None;
  linear_target=None;
  exprs=[];
}

let default_interval_constraint_proto (): interval_constraint_proto =
{
  start=None;
  end_=None;
  size=None;
}

let default_no_overlap_constraint_proto (): no_overlap_constraint_proto =
{
  intervals=[];
}

let default_no_overlap2_dconstraint_proto (): no_overlap2_dconstraint_proto =
{
  x_intervals=[];
  y_intervals=[];
}

let default_cumulative_constraint_proto (): cumulative_constraint_proto =
{
  capacity=None;
  intervals=[];
  demands=[];
}

let default_reservoir_constraint_proto (): reservoir_constraint_proto =
{
  _presence=Pbrt.Bitfield.empty;
  min_level=0L;
  max_level=0L;
  time_exprs=[];
  level_changes=[];
  active_literals=[];
}

let default_circuit_constraint_proto (): circuit_constraint_proto =
{
  tails=[];
  heads=[];
  literals=[];
}

let default_routes_constraint_proto (): routes_constraint_proto =
{
  _presence=Pbrt.Bitfield.empty;
  tails=[];
  heads=[];
  literals=[];
  demands=[];
  capacity=0L;
}

let default_table_constraint_proto (): table_constraint_proto =
{
  _presence=Pbrt.Bitfield.empty;
  vars=[];
  values=[];
  exprs=[];
  negated=false;
}

let default_inverse_constraint_proto (): inverse_constraint_proto =
{
  f_direct=[];
  f_inverse=[];
}

let default_automaton_constraint_proto (): automaton_constraint_proto =
{
  _presence=Pbrt.Bitfield.empty;
  starting_state=0L;
  final_states=[];
  transition_tail=[];
  transition_head=[];
  transition_label=[];
  vars=[];
  exprs=[];
}

let default_list_of_variables_proto (): list_of_variables_proto =
{
  vars=[];
}

let default_constraint_proto_constraint (): constraint_proto_constraint = Bool_or (default_bool_argument_proto ())

let default_constraint_proto (): constraint_proto =
{
  _presence=Pbrt.Bitfield.empty;
  name="";
  enforcement_literal=[];
  constraint_=None;
}

let default_cp_objective_proto (): cp_objective_proto =
{
  _presence=Pbrt.Bitfield.empty;
  vars=[];
  coeffs=[];
  offset=0.;
  scaling_factor=0.;
  domain=[];
  scaling_was_exact=false;
  integer_before_offset=0L;
  integer_after_offset=0L;
  integer_scaling_factor=0L;
}

let default_float_objective_proto (): float_objective_proto =
{
  _presence=Pbrt.Bitfield.empty;
  vars=[];
  coeffs=[];
  offset=0.;
  maximize=false;
}

let default_decision_strategy_proto_variable_selection_strategy () = (Choose_first:decision_strategy_proto_variable_selection_strategy)

let default_decision_strategy_proto_domain_reduction_strategy () = (Select_min_value:decision_strategy_proto_domain_reduction_strategy)

let default_decision_strategy_proto (): decision_strategy_proto =
{
  _presence=Pbrt.Bitfield.empty;
  variables=[];
  exprs=[];
  variable_selection_strategy=default_decision_strategy_proto_variable_selection_strategy ();
  domain_reduction_strategy=default_decision_strategy_proto_domain_reduction_strategy ();
}

let default_partial_variable_assignment (): partial_variable_assignment =
{
  vars=[];
  values=[];
}

let default_sparse_permutation_proto (): sparse_permutation_proto =
{
  support=[];
  cycle_sizes=[];
}

let default_dense_matrix_proto (): dense_matrix_proto =
{
  _presence=Pbrt.Bitfield.empty;
  num_rows=0l;
  num_cols=0l;
  entries=[];
}

let default_symmetry_proto (): symmetry_proto =
{
  permutations=[];
  orbitopes=[];
}

let default_cp_model_proto (): cp_model_proto =
{
  _presence=Pbrt.Bitfield.empty;
  name="";
  variables=[];
  constraints=[];
  objective=None;
  floating_point_objective=None;
  search_strategy=[];
  solution_hint=None;
  assumptions=[];
  symmetry=None;
}

let default_cp_solver_status () = (Unknown:cp_solver_status)

let default_cp_solver_solution (): cp_solver_solution =
{
  values=[];
}

let default_cp_solver_response (): cp_solver_response =
{
  _presence=Pbrt.Bitfield.empty;
  status=default_cp_solver_status ();
  solution=[];
  objective_value=0.;
  best_objective_bound=0.;
  additional_solutions=[];
  tightened_variables=[];
  sufficient_assumptions_for_infeasibility=[];
  integer_objective=None;
  inner_objective_lower_bound=0L;
  num_integers=0L;
  num_booleans=0L;
  num_fixed_booleans=0L;
  num_conflicts=0L;
  num_branches=0L;
  num_binary_propagations=0L;
  num_integer_propagations=0L;
  num_restarts=0L;
  num_lp_iterations=0L;
  wall_time=0.;
  user_time=0.;
  deterministic_time=0.;
  gap_integral=0.;
  solution_info="";
  solve_log="";
}


(** {2 Make functions} *)

let[@inline] integer_variable_proto_has_name (self:integer_variable_proto) : bool = (Pbrt.Bitfield.get self._presence 0)

let[@inline] integer_variable_proto_set_name (self:integer_variable_proto) (x:string) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.name <- x
let[@inline] integer_variable_proto_set_domain (self:integer_variable_proto) (x:int64 list) : unit =
  self.domain <- x

let copy_integer_variable_proto (self:integer_variable_proto) : integer_variable_proto =
  { self with name = self.name }

let make_integer_variable_proto 
  ?(name:string option)
  ?(domain=[])
  () : integer_variable_proto  =
  let _res = default_integer_variable_proto () in
  (match name with
  | None -> ()
  | Some v -> integer_variable_proto_set_name _res v);
  integer_variable_proto_set_domain _res domain;
  _res


let[@inline] bool_argument_proto_set_literals (self:bool_argument_proto) (x:int32 list) : unit =
  self.literals <- x

let copy_bool_argument_proto (self:bool_argument_proto) : bool_argument_proto =
  { self with literals = self.literals }

let make_bool_argument_proto 
  ?(literals=[])
  () : bool_argument_proto  =
  let _res = default_bool_argument_proto () in
  bool_argument_proto_set_literals _res literals;
  _res

let[@inline] linear_expression_proto_has_offset (self:linear_expression_proto) : bool = (Pbrt.Bitfield.get self._presence 0)

let[@inline] linear_expression_proto_set_vars (self:linear_expression_proto) (x:int32 list) : unit =
  self.vars <- x
let[@inline] linear_expression_proto_set_coeffs (self:linear_expression_proto) (x:int64 list) : unit =
  self.coeffs <- x
let[@inline] linear_expression_proto_set_offset (self:linear_expression_proto) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.offset <- x

let copy_linear_expression_proto (self:linear_expression_proto) : linear_expression_proto =
  { self with vars = self.vars }

let make_linear_expression_proto 
  ?(vars=[])
  ?(coeffs=[])
  ?(offset:int64 option)
  () : linear_expression_proto  =
  let _res = default_linear_expression_proto () in
  linear_expression_proto_set_vars _res vars;
  linear_expression_proto_set_coeffs _res coeffs;
  (match offset with
  | None -> ()
  | Some v -> linear_expression_proto_set_offset _res v);
  _res


let[@inline] linear_argument_proto_set_target (self:linear_argument_proto) (x:linear_expression_proto) : unit =
  self.target <- Some x
let[@inline] linear_argument_proto_set_exprs (self:linear_argument_proto) (x:linear_expression_proto list) : unit =
  self.exprs <- x

let copy_linear_argument_proto (self:linear_argument_proto) : linear_argument_proto =
  { self with target = self.target }

let make_linear_argument_proto 
  ?(target:linear_expression_proto option)
  ?(exprs=[])
  () : linear_argument_proto  =
  let _res = default_linear_argument_proto () in
  (match target with
  | None -> ()
  | Some v -> linear_argument_proto_set_target _res v);
  linear_argument_proto_set_exprs _res exprs;
  _res


let[@inline] all_different_constraint_proto_set_exprs (self:all_different_constraint_proto) (x:linear_expression_proto list) : unit =
  self.exprs <- x

let copy_all_different_constraint_proto (self:all_different_constraint_proto) : all_different_constraint_proto =
  { self with exprs = self.exprs }

let make_all_different_constraint_proto 
  ?(exprs=[])
  () : all_different_constraint_proto  =
  let _res = default_all_different_constraint_proto () in
  all_different_constraint_proto_set_exprs _res exprs;
  _res


let[@inline] linear_constraint_proto_set_vars (self:linear_constraint_proto) (x:int32 list) : unit =
  self.vars <- x
let[@inline] linear_constraint_proto_set_coeffs (self:linear_constraint_proto) (x:int64 list) : unit =
  self.coeffs <- x
let[@inline] linear_constraint_proto_set_domain (self:linear_constraint_proto) (x:int64 list) : unit =
  self.domain <- x

let copy_linear_constraint_proto (self:linear_constraint_proto) : linear_constraint_proto =
  { self with vars = self.vars }

let make_linear_constraint_proto 
  ?(vars=[])
  ?(coeffs=[])
  ?(domain=[])
  () : linear_constraint_proto  =
  let _res = default_linear_constraint_proto () in
  linear_constraint_proto_set_vars _res vars;
  linear_constraint_proto_set_coeffs _res coeffs;
  linear_constraint_proto_set_domain _res domain;
  _res

let[@inline] element_constraint_proto_has_index (self:element_constraint_proto) : bool = (Pbrt.Bitfield.get self._presence 0)
let[@inline] element_constraint_proto_has_target (self:element_constraint_proto) : bool = (Pbrt.Bitfield.get self._presence 1)

let[@inline] element_constraint_proto_set_index (self:element_constraint_proto) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.index <- x
let[@inline] element_constraint_proto_set_target (self:element_constraint_proto) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 1); self.target <- x
let[@inline] element_constraint_proto_set_vars (self:element_constraint_proto) (x:int32 list) : unit =
  self.vars <- x
let[@inline] element_constraint_proto_set_linear_index (self:element_constraint_proto) (x:linear_expression_proto) : unit =
  self.linear_index <- Some x
let[@inline] element_constraint_proto_set_linear_target (self:element_constraint_proto) (x:linear_expression_proto) : unit =
  self.linear_target <- Some x
let[@inline] element_constraint_proto_set_exprs (self:element_constraint_proto) (x:linear_expression_proto list) : unit =
  self.exprs <- x

let copy_element_constraint_proto (self:element_constraint_proto) : element_constraint_proto =
  { self with index = self.index }

let make_element_constraint_proto 
  ?(index:int32 option)
  ?(target:int32 option)
  ?(vars=[])
  ?(linear_index:linear_expression_proto option)
  ?(linear_target:linear_expression_proto option)
  ?(exprs=[])
  () : element_constraint_proto  =
  let _res = default_element_constraint_proto () in
  (match index with
  | None -> ()
  | Some v -> element_constraint_proto_set_index _res v);
  (match target with
  | None -> ()
  | Some v -> element_constraint_proto_set_target _res v);
  element_constraint_proto_set_vars _res vars;
  (match linear_index with
  | None -> ()
  | Some v -> element_constraint_proto_set_linear_index _res v);
  (match linear_target with
  | None -> ()
  | Some v -> element_constraint_proto_set_linear_target _res v);
  element_constraint_proto_set_exprs _res exprs;
  _res


let[@inline] interval_constraint_proto_set_start (self:interval_constraint_proto) (x:linear_expression_proto) : unit =
  self.start <- Some x
let[@inline] interval_constraint_proto_set_end_ (self:interval_constraint_proto) (x:linear_expression_proto) : unit =
  self.end_ <- Some x
let[@inline] interval_constraint_proto_set_size (self:interval_constraint_proto) (x:linear_expression_proto) : unit =
  self.size <- Some x

let copy_interval_constraint_proto (self:interval_constraint_proto) : interval_constraint_proto =
  { self with start = self.start }

let make_interval_constraint_proto 
  ?(start:linear_expression_proto option)
  ?(end_:linear_expression_proto option)
  ?(size:linear_expression_proto option)
  () : interval_constraint_proto  =
  let _res = default_interval_constraint_proto () in
  (match start with
  | None -> ()
  | Some v -> interval_constraint_proto_set_start _res v);
  (match end_ with
  | None -> ()
  | Some v -> interval_constraint_proto_set_end_ _res v);
  (match size with
  | None -> ()
  | Some v -> interval_constraint_proto_set_size _res v);
  _res


let[@inline] no_overlap_constraint_proto_set_intervals (self:no_overlap_constraint_proto) (x:int32 list) : unit =
  self.intervals <- x

let copy_no_overlap_constraint_proto (self:no_overlap_constraint_proto) : no_overlap_constraint_proto =
  { self with intervals = self.intervals }

let make_no_overlap_constraint_proto 
  ?(intervals=[])
  () : no_overlap_constraint_proto  =
  let _res = default_no_overlap_constraint_proto () in
  no_overlap_constraint_proto_set_intervals _res intervals;
  _res


let[@inline] no_overlap2_dconstraint_proto_set_x_intervals (self:no_overlap2_dconstraint_proto) (x:int32 list) : unit =
  self.x_intervals <- x
let[@inline] no_overlap2_dconstraint_proto_set_y_intervals (self:no_overlap2_dconstraint_proto) (x:int32 list) : unit =
  self.y_intervals <- x

let copy_no_overlap2_dconstraint_proto (self:no_overlap2_dconstraint_proto) : no_overlap2_dconstraint_proto =
  { self with x_intervals = self.x_intervals }

let make_no_overlap2_dconstraint_proto 
  ?(x_intervals=[])
  ?(y_intervals=[])
  () : no_overlap2_dconstraint_proto  =
  let _res = default_no_overlap2_dconstraint_proto () in
  no_overlap2_dconstraint_proto_set_x_intervals _res x_intervals;
  no_overlap2_dconstraint_proto_set_y_intervals _res y_intervals;
  _res


let[@inline] cumulative_constraint_proto_set_capacity (self:cumulative_constraint_proto) (x:linear_expression_proto) : unit =
  self.capacity <- Some x
let[@inline] cumulative_constraint_proto_set_intervals (self:cumulative_constraint_proto) (x:int32 list) : unit =
  self.intervals <- x
let[@inline] cumulative_constraint_proto_set_demands (self:cumulative_constraint_proto) (x:linear_expression_proto list) : unit =
  self.demands <- x

let copy_cumulative_constraint_proto (self:cumulative_constraint_proto) : cumulative_constraint_proto =
  { self with capacity = self.capacity }

let make_cumulative_constraint_proto 
  ?(capacity:linear_expression_proto option)
  ?(intervals=[])
  ?(demands=[])
  () : cumulative_constraint_proto  =
  let _res = default_cumulative_constraint_proto () in
  (match capacity with
  | None -> ()
  | Some v -> cumulative_constraint_proto_set_capacity _res v);
  cumulative_constraint_proto_set_intervals _res intervals;
  cumulative_constraint_proto_set_demands _res demands;
  _res

let[@inline] reservoir_constraint_proto_has_min_level (self:reservoir_constraint_proto) : bool = (Pbrt.Bitfield.get self._presence 0)
let[@inline] reservoir_constraint_proto_has_max_level (self:reservoir_constraint_proto) : bool = (Pbrt.Bitfield.get self._presence 1)

let[@inline] reservoir_constraint_proto_set_min_level (self:reservoir_constraint_proto) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.min_level <- x
let[@inline] reservoir_constraint_proto_set_max_level (self:reservoir_constraint_proto) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 1); self.max_level <- x
let[@inline] reservoir_constraint_proto_set_time_exprs (self:reservoir_constraint_proto) (x:linear_expression_proto list) : unit =
  self.time_exprs <- x
let[@inline] reservoir_constraint_proto_set_level_changes (self:reservoir_constraint_proto) (x:linear_expression_proto list) : unit =
  self.level_changes <- x
let[@inline] reservoir_constraint_proto_set_active_literals (self:reservoir_constraint_proto) (x:int32 list) : unit =
  self.active_literals <- x

let copy_reservoir_constraint_proto (self:reservoir_constraint_proto) : reservoir_constraint_proto =
  { self with min_level = self.min_level }

let make_reservoir_constraint_proto 
  ?(min_level:int64 option)
  ?(max_level:int64 option)
  ?(time_exprs=[])
  ?(level_changes=[])
  ?(active_literals=[])
  () : reservoir_constraint_proto  =
  let _res = default_reservoir_constraint_proto () in
  (match min_level with
  | None -> ()
  | Some v -> reservoir_constraint_proto_set_min_level _res v);
  (match max_level with
  | None -> ()
  | Some v -> reservoir_constraint_proto_set_max_level _res v);
  reservoir_constraint_proto_set_time_exprs _res time_exprs;
  reservoir_constraint_proto_set_level_changes _res level_changes;
  reservoir_constraint_proto_set_active_literals _res active_literals;
  _res


let[@inline] circuit_constraint_proto_set_tails (self:circuit_constraint_proto) (x:int32 list) : unit =
  self.tails <- x
let[@inline] circuit_constraint_proto_set_heads (self:circuit_constraint_proto) (x:int32 list) : unit =
  self.heads <- x
let[@inline] circuit_constraint_proto_set_literals (self:circuit_constraint_proto) (x:int32 list) : unit =
  self.literals <- x

let copy_circuit_constraint_proto (self:circuit_constraint_proto) : circuit_constraint_proto =
  { self with tails = self.tails }

let make_circuit_constraint_proto 
  ?(tails=[])
  ?(heads=[])
  ?(literals=[])
  () : circuit_constraint_proto  =
  let _res = default_circuit_constraint_proto () in
  circuit_constraint_proto_set_tails _res tails;
  circuit_constraint_proto_set_heads _res heads;
  circuit_constraint_proto_set_literals _res literals;
  _res

let[@inline] routes_constraint_proto_has_capacity (self:routes_constraint_proto) : bool = (Pbrt.Bitfield.get self._presence 0)

let[@inline] routes_constraint_proto_set_tails (self:routes_constraint_proto) (x:int32 list) : unit =
  self.tails <- x
let[@inline] routes_constraint_proto_set_heads (self:routes_constraint_proto) (x:int32 list) : unit =
  self.heads <- x
let[@inline] routes_constraint_proto_set_literals (self:routes_constraint_proto) (x:int32 list) : unit =
  self.literals <- x
let[@inline] routes_constraint_proto_set_demands (self:routes_constraint_proto) (x:int32 list) : unit =
  self.demands <- x
let[@inline] routes_constraint_proto_set_capacity (self:routes_constraint_proto) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.capacity <- x

let copy_routes_constraint_proto (self:routes_constraint_proto) : routes_constraint_proto =
  { self with tails = self.tails }

let make_routes_constraint_proto 
  ?(tails=[])
  ?(heads=[])
  ?(literals=[])
  ?(demands=[])
  ?(capacity:int64 option)
  () : routes_constraint_proto  =
  let _res = default_routes_constraint_proto () in
  routes_constraint_proto_set_tails _res tails;
  routes_constraint_proto_set_heads _res heads;
  routes_constraint_proto_set_literals _res literals;
  routes_constraint_proto_set_demands _res demands;
  (match capacity with
  | None -> ()
  | Some v -> routes_constraint_proto_set_capacity _res v);
  _res

let[@inline] table_constraint_proto_has_negated (self:table_constraint_proto) : bool = (Pbrt.Bitfield.get self._presence 0)

let[@inline] table_constraint_proto_set_vars (self:table_constraint_proto) (x:int32 list) : unit =
  self.vars <- x
let[@inline] table_constraint_proto_set_values (self:table_constraint_proto) (x:int64 list) : unit =
  self.values <- x
let[@inline] table_constraint_proto_set_exprs (self:table_constraint_proto) (x:linear_expression_proto list) : unit =
  self.exprs <- x
let[@inline] table_constraint_proto_set_negated (self:table_constraint_proto) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.negated <- x

let copy_table_constraint_proto (self:table_constraint_proto) : table_constraint_proto =
  { self with vars = self.vars }

let make_table_constraint_proto 
  ?(vars=[])
  ?(values=[])
  ?(exprs=[])
  ?(negated:bool option)
  () : table_constraint_proto  =
  let _res = default_table_constraint_proto () in
  table_constraint_proto_set_vars _res vars;
  table_constraint_proto_set_values _res values;
  table_constraint_proto_set_exprs _res exprs;
  (match negated with
  | None -> ()
  | Some v -> table_constraint_proto_set_negated _res v);
  _res


let[@inline] inverse_constraint_proto_set_f_direct (self:inverse_constraint_proto) (x:int32 list) : unit =
  self.f_direct <- x
let[@inline] inverse_constraint_proto_set_f_inverse (self:inverse_constraint_proto) (x:int32 list) : unit =
  self.f_inverse <- x

let copy_inverse_constraint_proto (self:inverse_constraint_proto) : inverse_constraint_proto =
  { self with f_direct = self.f_direct }

let make_inverse_constraint_proto 
  ?(f_direct=[])
  ?(f_inverse=[])
  () : inverse_constraint_proto  =
  let _res = default_inverse_constraint_proto () in
  inverse_constraint_proto_set_f_direct _res f_direct;
  inverse_constraint_proto_set_f_inverse _res f_inverse;
  _res

let[@inline] automaton_constraint_proto_has_starting_state (self:automaton_constraint_proto) : bool = (Pbrt.Bitfield.get self._presence 0)

let[@inline] automaton_constraint_proto_set_starting_state (self:automaton_constraint_proto) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.starting_state <- x
let[@inline] automaton_constraint_proto_set_final_states (self:automaton_constraint_proto) (x:int64 list) : unit =
  self.final_states <- x
let[@inline] automaton_constraint_proto_set_transition_tail (self:automaton_constraint_proto) (x:int64 list) : unit =
  self.transition_tail <- x
let[@inline] automaton_constraint_proto_set_transition_head (self:automaton_constraint_proto) (x:int64 list) : unit =
  self.transition_head <- x
let[@inline] automaton_constraint_proto_set_transition_label (self:automaton_constraint_proto) (x:int64 list) : unit =
  self.transition_label <- x
let[@inline] automaton_constraint_proto_set_vars (self:automaton_constraint_proto) (x:int32 list) : unit =
  self.vars <- x
let[@inline] automaton_constraint_proto_set_exprs (self:automaton_constraint_proto) (x:linear_expression_proto list) : unit =
  self.exprs <- x

let copy_automaton_constraint_proto (self:automaton_constraint_proto) : automaton_constraint_proto =
  { self with starting_state = self.starting_state }

let make_automaton_constraint_proto 
  ?(starting_state:int64 option)
  ?(final_states=[])
  ?(transition_tail=[])
  ?(transition_head=[])
  ?(transition_label=[])
  ?(vars=[])
  ?(exprs=[])
  () : automaton_constraint_proto  =
  let _res = default_automaton_constraint_proto () in
  (match starting_state with
  | None -> ()
  | Some v -> automaton_constraint_proto_set_starting_state _res v);
  automaton_constraint_proto_set_final_states _res final_states;
  automaton_constraint_proto_set_transition_tail _res transition_tail;
  automaton_constraint_proto_set_transition_head _res transition_head;
  automaton_constraint_proto_set_transition_label _res transition_label;
  automaton_constraint_proto_set_vars _res vars;
  automaton_constraint_proto_set_exprs _res exprs;
  _res


let[@inline] list_of_variables_proto_set_vars (self:list_of_variables_proto) (x:int32 list) : unit =
  self.vars <- x

let copy_list_of_variables_proto (self:list_of_variables_proto) : list_of_variables_proto =
  { self with vars = self.vars }

let make_list_of_variables_proto 
  ?(vars=[])
  () : list_of_variables_proto  =
  let _res = default_list_of_variables_proto () in
  list_of_variables_proto_set_vars _res vars;
  _res

let[@inline] constraint_proto_has_name (self:constraint_proto) : bool = (Pbrt.Bitfield.get self._presence 0)

let[@inline] constraint_proto_set_name (self:constraint_proto) (x:string) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.name <- x
let[@inline] constraint_proto_set_enforcement_literal (self:constraint_proto) (x:int32 list) : unit =
  self.enforcement_literal <- x
let[@inline] constraint_proto_set_constraint_ (self:constraint_proto) (x:constraint_proto_constraint) : unit =
  self.constraint_ <- Some x

let copy_constraint_proto (self:constraint_proto) : constraint_proto =
  { self with name = self.name }

let make_constraint_proto 
  ?(name:string option)
  ?(enforcement_literal=[])
  ?(constraint_:constraint_proto_constraint option)
  () : constraint_proto  =
  let _res = default_constraint_proto () in
  (match name with
  | None -> ()
  | Some v -> constraint_proto_set_name _res v);
  constraint_proto_set_enforcement_literal _res enforcement_literal;
  (match constraint_ with
  | None -> ()
  | Some v -> constraint_proto_set_constraint_ _res v);
  _res

let[@inline] cp_objective_proto_has_offset (self:cp_objective_proto) : bool = (Pbrt.Bitfield.get self._presence 0)
let[@inline] cp_objective_proto_has_scaling_factor (self:cp_objective_proto) : bool = (Pbrt.Bitfield.get self._presence 1)
let[@inline] cp_objective_proto_has_scaling_was_exact (self:cp_objective_proto) : bool = (Pbrt.Bitfield.get self._presence 2)
let[@inline] cp_objective_proto_has_integer_before_offset (self:cp_objective_proto) : bool = (Pbrt.Bitfield.get self._presence 3)
let[@inline] cp_objective_proto_has_integer_after_offset (self:cp_objective_proto) : bool = (Pbrt.Bitfield.get self._presence 4)
let[@inline] cp_objective_proto_has_integer_scaling_factor (self:cp_objective_proto) : bool = (Pbrt.Bitfield.get self._presence 5)

let[@inline] cp_objective_proto_set_vars (self:cp_objective_proto) (x:int32 list) : unit =
  self.vars <- x
let[@inline] cp_objective_proto_set_coeffs (self:cp_objective_proto) (x:int64 list) : unit =
  self.coeffs <- x
let[@inline] cp_objective_proto_set_offset (self:cp_objective_proto) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.offset <- x
let[@inline] cp_objective_proto_set_scaling_factor (self:cp_objective_proto) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 1); self.scaling_factor <- x
let[@inline] cp_objective_proto_set_domain (self:cp_objective_proto) (x:int64 list) : unit =
  self.domain <- x
let[@inline] cp_objective_proto_set_scaling_was_exact (self:cp_objective_proto) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 2); self.scaling_was_exact <- x
let[@inline] cp_objective_proto_set_integer_before_offset (self:cp_objective_proto) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 3); self.integer_before_offset <- x
let[@inline] cp_objective_proto_set_integer_after_offset (self:cp_objective_proto) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 4); self.integer_after_offset <- x
let[@inline] cp_objective_proto_set_integer_scaling_factor (self:cp_objective_proto) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 5); self.integer_scaling_factor <- x

let copy_cp_objective_proto (self:cp_objective_proto) : cp_objective_proto =
  { self with vars = self.vars }

let make_cp_objective_proto 
  ?(vars=[])
  ?(coeffs=[])
  ?(offset:float option)
  ?(scaling_factor:float option)
  ?(domain=[])
  ?(scaling_was_exact:bool option)
  ?(integer_before_offset:int64 option)
  ?(integer_after_offset:int64 option)
  ?(integer_scaling_factor:int64 option)
  () : cp_objective_proto  =
  let _res = default_cp_objective_proto () in
  cp_objective_proto_set_vars _res vars;
  cp_objective_proto_set_coeffs _res coeffs;
  (match offset with
  | None -> ()
  | Some v -> cp_objective_proto_set_offset _res v);
  (match scaling_factor with
  | None -> ()
  | Some v -> cp_objective_proto_set_scaling_factor _res v);
  cp_objective_proto_set_domain _res domain;
  (match scaling_was_exact with
  | None -> ()
  | Some v -> cp_objective_proto_set_scaling_was_exact _res v);
  (match integer_before_offset with
  | None -> ()
  | Some v -> cp_objective_proto_set_integer_before_offset _res v);
  (match integer_after_offset with
  | None -> ()
  | Some v -> cp_objective_proto_set_integer_after_offset _res v);
  (match integer_scaling_factor with
  | None -> ()
  | Some v -> cp_objective_proto_set_integer_scaling_factor _res v);
  _res

let[@inline] float_objective_proto_has_offset (self:float_objective_proto) : bool = (Pbrt.Bitfield.get self._presence 0)
let[@inline] float_objective_proto_has_maximize (self:float_objective_proto) : bool = (Pbrt.Bitfield.get self._presence 1)

let[@inline] float_objective_proto_set_vars (self:float_objective_proto) (x:int32 list) : unit =
  self.vars <- x
let[@inline] float_objective_proto_set_coeffs (self:float_objective_proto) (x:float list) : unit =
  self.coeffs <- x
let[@inline] float_objective_proto_set_offset (self:float_objective_proto) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.offset <- x
let[@inline] float_objective_proto_set_maximize (self:float_objective_proto) (x:bool) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 1); self.maximize <- x

let copy_float_objective_proto (self:float_objective_proto) : float_objective_proto =
  { self with vars = self.vars }

let make_float_objective_proto 
  ?(vars=[])
  ?(coeffs=[])
  ?(offset:float option)
  ?(maximize:bool option)
  () : float_objective_proto  =
  let _res = default_float_objective_proto () in
  float_objective_proto_set_vars _res vars;
  float_objective_proto_set_coeffs _res coeffs;
  (match offset with
  | None -> ()
  | Some v -> float_objective_proto_set_offset _res v);
  (match maximize with
  | None -> ()
  | Some v -> float_objective_proto_set_maximize _res v);
  _res

let[@inline] decision_strategy_proto_has_variable_selection_strategy (self:decision_strategy_proto) : bool = (Pbrt.Bitfield.get self._presence 0)
let[@inline] decision_strategy_proto_has_domain_reduction_strategy (self:decision_strategy_proto) : bool = (Pbrt.Bitfield.get self._presence 1)

let[@inline] decision_strategy_proto_set_variables (self:decision_strategy_proto) (x:int32 list) : unit =
  self.variables <- x
let[@inline] decision_strategy_proto_set_exprs (self:decision_strategy_proto) (x:linear_expression_proto list) : unit =
  self.exprs <- x
let[@inline] decision_strategy_proto_set_variable_selection_strategy (self:decision_strategy_proto) (x:decision_strategy_proto_variable_selection_strategy) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.variable_selection_strategy <- x
let[@inline] decision_strategy_proto_set_domain_reduction_strategy (self:decision_strategy_proto) (x:decision_strategy_proto_domain_reduction_strategy) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 1); self.domain_reduction_strategy <- x

let copy_decision_strategy_proto (self:decision_strategy_proto) : decision_strategy_proto =
  { self with variables = self.variables }

let make_decision_strategy_proto 
  ?(variables=[])
  ?(exprs=[])
  ?(variable_selection_strategy:decision_strategy_proto_variable_selection_strategy option)
  ?(domain_reduction_strategy:decision_strategy_proto_domain_reduction_strategy option)
  () : decision_strategy_proto  =
  let _res = default_decision_strategy_proto () in
  decision_strategy_proto_set_variables _res variables;
  decision_strategy_proto_set_exprs _res exprs;
  (match variable_selection_strategy with
  | None -> ()
  | Some v -> decision_strategy_proto_set_variable_selection_strategy _res v);
  (match domain_reduction_strategy with
  | None -> ()
  | Some v -> decision_strategy_proto_set_domain_reduction_strategy _res v);
  _res


let[@inline] partial_variable_assignment_set_vars (self:partial_variable_assignment) (x:int32 list) : unit =
  self.vars <- x
let[@inline] partial_variable_assignment_set_values (self:partial_variable_assignment) (x:int64 list) : unit =
  self.values <- x

let copy_partial_variable_assignment (self:partial_variable_assignment) : partial_variable_assignment =
  { self with vars = self.vars }

let make_partial_variable_assignment 
  ?(vars=[])
  ?(values=[])
  () : partial_variable_assignment  =
  let _res = default_partial_variable_assignment () in
  partial_variable_assignment_set_vars _res vars;
  partial_variable_assignment_set_values _res values;
  _res


let[@inline] sparse_permutation_proto_set_support (self:sparse_permutation_proto) (x:int32 list) : unit =
  self.support <- x
let[@inline] sparse_permutation_proto_set_cycle_sizes (self:sparse_permutation_proto) (x:int32 list) : unit =
  self.cycle_sizes <- x

let copy_sparse_permutation_proto (self:sparse_permutation_proto) : sparse_permutation_proto =
  { self with support = self.support }

let make_sparse_permutation_proto 
  ?(support=[])
  ?(cycle_sizes=[])
  () : sparse_permutation_proto  =
  let _res = default_sparse_permutation_proto () in
  sparse_permutation_proto_set_support _res support;
  sparse_permutation_proto_set_cycle_sizes _res cycle_sizes;
  _res

let[@inline] dense_matrix_proto_has_num_rows (self:dense_matrix_proto) : bool = (Pbrt.Bitfield.get self._presence 0)
let[@inline] dense_matrix_proto_has_num_cols (self:dense_matrix_proto) : bool = (Pbrt.Bitfield.get self._presence 1)

let[@inline] dense_matrix_proto_set_num_rows (self:dense_matrix_proto) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.num_rows <- x
let[@inline] dense_matrix_proto_set_num_cols (self:dense_matrix_proto) (x:int32) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 1); self.num_cols <- x
let[@inline] dense_matrix_proto_set_entries (self:dense_matrix_proto) (x:int32 list) : unit =
  self.entries <- x

let copy_dense_matrix_proto (self:dense_matrix_proto) : dense_matrix_proto =
  { self with num_rows = self.num_rows }

let make_dense_matrix_proto 
  ?(num_rows:int32 option)
  ?(num_cols:int32 option)
  ?(entries=[])
  () : dense_matrix_proto  =
  let _res = default_dense_matrix_proto () in
  (match num_rows with
  | None -> ()
  | Some v -> dense_matrix_proto_set_num_rows _res v);
  (match num_cols with
  | None -> ()
  | Some v -> dense_matrix_proto_set_num_cols _res v);
  dense_matrix_proto_set_entries _res entries;
  _res


let[@inline] symmetry_proto_set_permutations (self:symmetry_proto) (x:sparse_permutation_proto list) : unit =
  self.permutations <- x
let[@inline] symmetry_proto_set_orbitopes (self:symmetry_proto) (x:dense_matrix_proto list) : unit =
  self.orbitopes <- x

let copy_symmetry_proto (self:symmetry_proto) : symmetry_proto =
  { self with permutations = self.permutations }

let make_symmetry_proto 
  ?(permutations=[])
  ?(orbitopes=[])
  () : symmetry_proto  =
  let _res = default_symmetry_proto () in
  symmetry_proto_set_permutations _res permutations;
  symmetry_proto_set_orbitopes _res orbitopes;
  _res

let[@inline] cp_model_proto_has_name (self:cp_model_proto) : bool = (Pbrt.Bitfield.get self._presence 0)

let[@inline] cp_model_proto_set_name (self:cp_model_proto) (x:string) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.name <- x
let[@inline] cp_model_proto_set_variables (self:cp_model_proto) (x:integer_variable_proto list) : unit =
  self.variables <- x
let[@inline] cp_model_proto_set_constraints (self:cp_model_proto) (x:constraint_proto list) : unit =
  self.constraints <- x
let[@inline] cp_model_proto_set_objective (self:cp_model_proto) (x:cp_objective_proto) : unit =
  self.objective <- Some x
let[@inline] cp_model_proto_set_floating_point_objective (self:cp_model_proto) (x:float_objective_proto) : unit =
  self.floating_point_objective <- Some x
let[@inline] cp_model_proto_set_search_strategy (self:cp_model_proto) (x:decision_strategy_proto list) : unit =
  self.search_strategy <- x
let[@inline] cp_model_proto_set_solution_hint (self:cp_model_proto) (x:partial_variable_assignment) : unit =
  self.solution_hint <- Some x
let[@inline] cp_model_proto_set_assumptions (self:cp_model_proto) (x:int32 list) : unit =
  self.assumptions <- x
let[@inline] cp_model_proto_set_symmetry (self:cp_model_proto) (x:symmetry_proto) : unit =
  self.symmetry <- Some x

let copy_cp_model_proto (self:cp_model_proto) : cp_model_proto =
  { self with name = self.name }

let make_cp_model_proto 
  ?(name:string option)
  ?(variables=[])
  ?(constraints=[])
  ?(objective:cp_objective_proto option)
  ?(floating_point_objective:float_objective_proto option)
  ?(search_strategy=[])
  ?(solution_hint:partial_variable_assignment option)
  ?(assumptions=[])
  ?(symmetry:symmetry_proto option)
  () : cp_model_proto  =
  let _res = default_cp_model_proto () in
  (match name with
  | None -> ()
  | Some v -> cp_model_proto_set_name _res v);
  cp_model_proto_set_variables _res variables;
  cp_model_proto_set_constraints _res constraints;
  (match objective with
  | None -> ()
  | Some v -> cp_model_proto_set_objective _res v);
  (match floating_point_objective with
  | None -> ()
  | Some v -> cp_model_proto_set_floating_point_objective _res v);
  cp_model_proto_set_search_strategy _res search_strategy;
  (match solution_hint with
  | None -> ()
  | Some v -> cp_model_proto_set_solution_hint _res v);
  cp_model_proto_set_assumptions _res assumptions;
  (match symmetry with
  | None -> ()
  | Some v -> cp_model_proto_set_symmetry _res v);
  _res


let[@inline] cp_solver_solution_set_values (self:cp_solver_solution) (x:int64 list) : unit =
  self.values <- x

let copy_cp_solver_solution (self:cp_solver_solution) : cp_solver_solution =
  { self with values = self.values }

let make_cp_solver_solution 
  ?(values=[])
  () : cp_solver_solution  =
  let _res = default_cp_solver_solution () in
  cp_solver_solution_set_values _res values;
  _res

let[@inline] cp_solver_response_has_status (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 0)
let[@inline] cp_solver_response_has_objective_value (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 1)
let[@inline] cp_solver_response_has_best_objective_bound (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 2)
let[@inline] cp_solver_response_has_inner_objective_lower_bound (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 3)
let[@inline] cp_solver_response_has_num_integers (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 4)
let[@inline] cp_solver_response_has_num_booleans (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 5)
let[@inline] cp_solver_response_has_num_fixed_booleans (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 6)
let[@inline] cp_solver_response_has_num_conflicts (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 7)
let[@inline] cp_solver_response_has_num_branches (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 8)
let[@inline] cp_solver_response_has_num_binary_propagations (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 9)
let[@inline] cp_solver_response_has_num_integer_propagations (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 10)
let[@inline] cp_solver_response_has_num_restarts (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 11)
let[@inline] cp_solver_response_has_num_lp_iterations (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 12)
let[@inline] cp_solver_response_has_wall_time (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 13)
let[@inline] cp_solver_response_has_user_time (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 14)
let[@inline] cp_solver_response_has_deterministic_time (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 15)
let[@inline] cp_solver_response_has_gap_integral (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 16)
let[@inline] cp_solver_response_has_solution_info (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 17)
let[@inline] cp_solver_response_has_solve_log (self:cp_solver_response) : bool = (Pbrt.Bitfield.get self._presence 18)

let[@inline] cp_solver_response_set_status (self:cp_solver_response) (x:cp_solver_status) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 0); self.status <- x
let[@inline] cp_solver_response_set_solution (self:cp_solver_response) (x:int64 list) : unit =
  self.solution <- x
let[@inline] cp_solver_response_set_objective_value (self:cp_solver_response) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 1); self.objective_value <- x
let[@inline] cp_solver_response_set_best_objective_bound (self:cp_solver_response) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 2); self.best_objective_bound <- x
let[@inline] cp_solver_response_set_additional_solutions (self:cp_solver_response) (x:cp_solver_solution list) : unit =
  self.additional_solutions <- x
let[@inline] cp_solver_response_set_tightened_variables (self:cp_solver_response) (x:integer_variable_proto list) : unit =
  self.tightened_variables <- x
let[@inline] cp_solver_response_set_sufficient_assumptions_for_infeasibility (self:cp_solver_response) (x:int32 list) : unit =
  self.sufficient_assumptions_for_infeasibility <- x
let[@inline] cp_solver_response_set_integer_objective (self:cp_solver_response) (x:cp_objective_proto) : unit =
  self.integer_objective <- Some x
let[@inline] cp_solver_response_set_inner_objective_lower_bound (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 3); self.inner_objective_lower_bound <- x
let[@inline] cp_solver_response_set_num_integers (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 4); self.num_integers <- x
let[@inline] cp_solver_response_set_num_booleans (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 5); self.num_booleans <- x
let[@inline] cp_solver_response_set_num_fixed_booleans (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 6); self.num_fixed_booleans <- x
let[@inline] cp_solver_response_set_num_conflicts (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 7); self.num_conflicts <- x
let[@inline] cp_solver_response_set_num_branches (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 8); self.num_branches <- x
let[@inline] cp_solver_response_set_num_binary_propagations (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 9); self.num_binary_propagations <- x
let[@inline] cp_solver_response_set_num_integer_propagations (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 10); self.num_integer_propagations <- x
let[@inline] cp_solver_response_set_num_restarts (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 11); self.num_restarts <- x
let[@inline] cp_solver_response_set_num_lp_iterations (self:cp_solver_response) (x:int64) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 12); self.num_lp_iterations <- x
let[@inline] cp_solver_response_set_wall_time (self:cp_solver_response) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 13); self.wall_time <- x
let[@inline] cp_solver_response_set_user_time (self:cp_solver_response) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 14); self.user_time <- x
let[@inline] cp_solver_response_set_deterministic_time (self:cp_solver_response) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 15); self.deterministic_time <- x
let[@inline] cp_solver_response_set_gap_integral (self:cp_solver_response) (x:float) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 16); self.gap_integral <- x
let[@inline] cp_solver_response_set_solution_info (self:cp_solver_response) (x:string) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 17); self.solution_info <- x
let[@inline] cp_solver_response_set_solve_log (self:cp_solver_response) (x:string) : unit =
  self._presence <- (Pbrt.Bitfield.set self._presence 18); self.solve_log <- x

let copy_cp_solver_response (self:cp_solver_response) : cp_solver_response =
  { self with status = self.status }

let make_cp_solver_response 
  ?(status:cp_solver_status option)
  ?(solution=[])
  ?(objective_value:float option)
  ?(best_objective_bound:float option)
  ?(additional_solutions=[])
  ?(tightened_variables=[])
  ?(sufficient_assumptions_for_infeasibility=[])
  ?(integer_objective:cp_objective_proto option)
  ?(inner_objective_lower_bound:int64 option)
  ?(num_integers:int64 option)
  ?(num_booleans:int64 option)
  ?(num_fixed_booleans:int64 option)
  ?(num_conflicts:int64 option)
  ?(num_branches:int64 option)
  ?(num_binary_propagations:int64 option)
  ?(num_integer_propagations:int64 option)
  ?(num_restarts:int64 option)
  ?(num_lp_iterations:int64 option)
  ?(wall_time:float option)
  ?(user_time:float option)
  ?(deterministic_time:float option)
  ?(gap_integral:float option)
  ?(solution_info:string option)
  ?(solve_log:string option)
  () : cp_solver_response  =
  let _res = default_cp_solver_response () in
  (match status with
  | None -> ()
  | Some v -> cp_solver_response_set_status _res v);
  cp_solver_response_set_solution _res solution;
  (match objective_value with
  | None -> ()
  | Some v -> cp_solver_response_set_objective_value _res v);
  (match best_objective_bound with
  | None -> ()
  | Some v -> cp_solver_response_set_best_objective_bound _res v);
  cp_solver_response_set_additional_solutions _res additional_solutions;
  cp_solver_response_set_tightened_variables _res tightened_variables;
  cp_solver_response_set_sufficient_assumptions_for_infeasibility _res sufficient_assumptions_for_infeasibility;
  (match integer_objective with
  | None -> ()
  | Some v -> cp_solver_response_set_integer_objective _res v);
  (match inner_objective_lower_bound with
  | None -> ()
  | Some v -> cp_solver_response_set_inner_objective_lower_bound _res v);
  (match num_integers with
  | None -> ()
  | Some v -> cp_solver_response_set_num_integers _res v);
  (match num_booleans with
  | None -> ()
  | Some v -> cp_solver_response_set_num_booleans _res v);
  (match num_fixed_booleans with
  | None -> ()
  | Some v -> cp_solver_response_set_num_fixed_booleans _res v);
  (match num_conflicts with
  | None -> ()
  | Some v -> cp_solver_response_set_num_conflicts _res v);
  (match num_branches with
  | None -> ()
  | Some v -> cp_solver_response_set_num_branches _res v);
  (match num_binary_propagations with
  | None -> ()
  | Some v -> cp_solver_response_set_num_binary_propagations _res v);
  (match num_integer_propagations with
  | None -> ()
  | Some v -> cp_solver_response_set_num_integer_propagations _res v);
  (match num_restarts with
  | None -> ()
  | Some v -> cp_solver_response_set_num_restarts _res v);
  (match num_lp_iterations with
  | None -> ()
  | Some v -> cp_solver_response_set_num_lp_iterations _res v);
  (match wall_time with
  | None -> ()
  | Some v -> cp_solver_response_set_wall_time _res v);
  (match user_time with
  | None -> ()
  | Some v -> cp_solver_response_set_user_time _res v);
  (match deterministic_time with
  | None -> ()
  | Some v -> cp_solver_response_set_deterministic_time _res v);
  (match gap_integral with
  | None -> ()
  | Some v -> cp_solver_response_set_gap_integral _res v);
  (match solution_info with
  | None -> ()
  | Some v -> cp_solver_response_set_solution_info _res v);
  (match solve_log with
  | None -> ()
  | Some v -> cp_solver_response_set_solve_log _res v);
  _res

[@@@ocaml.warning "-23-27-30-39"]

(** {2 Formatters} *)

let rec pp_integer_variable_proto fmt (v:integer_variable_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (integer_variable_proto_has_name v)) ~first:true "name" Pbrt.Pp.pp_string fmt v.name;
    Pbrt.Pp.pp_record_field ~first:false "domain" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.domain;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_bool_argument_proto fmt (v:bool_argument_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "literals" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.literals;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_linear_expression_proto fmt (v:linear_expression_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
    Pbrt.Pp.pp_record_field ~first:false "coeffs" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.coeffs;
    Pbrt.Pp.pp_record_field ~absent:(not (linear_expression_proto_has_offset v)) ~first:false "offset" Pbrt.Pp.pp_int64 fmt v.offset;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_linear_argument_proto fmt (v:linear_argument_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "target" (Pbrt.Pp.pp_option pp_linear_expression_proto) fmt v.target;
    Pbrt.Pp.pp_record_field ~first:false "exprs" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.exprs;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_all_different_constraint_proto fmt (v:all_different_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "exprs" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.exprs;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_linear_constraint_proto fmt (v:linear_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
    Pbrt.Pp.pp_record_field ~first:false "coeffs" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.coeffs;
    Pbrt.Pp.pp_record_field ~first:false "domain" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.domain;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_element_constraint_proto fmt (v:element_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (element_constraint_proto_has_index v)) ~first:true "index" Pbrt.Pp.pp_int32 fmt v.index;
    Pbrt.Pp.pp_record_field ~absent:(not (element_constraint_proto_has_target v)) ~first:false "target" Pbrt.Pp.pp_int32 fmt v.target;
    Pbrt.Pp.pp_record_field ~first:false "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
    Pbrt.Pp.pp_record_field ~first:false "linear_index" (Pbrt.Pp.pp_option pp_linear_expression_proto) fmt v.linear_index;
    Pbrt.Pp.pp_record_field ~first:false "linear_target" (Pbrt.Pp.pp_option pp_linear_expression_proto) fmt v.linear_target;
    Pbrt.Pp.pp_record_field ~first:false "exprs" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.exprs;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_interval_constraint_proto fmt (v:interval_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "start" (Pbrt.Pp.pp_option pp_linear_expression_proto) fmt v.start;
    Pbrt.Pp.pp_record_field ~first:false "end_" (Pbrt.Pp.pp_option pp_linear_expression_proto) fmt v.end_;
    Pbrt.Pp.pp_record_field ~first:false "size" (Pbrt.Pp.pp_option pp_linear_expression_proto) fmt v.size;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_no_overlap_constraint_proto fmt (v:no_overlap_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "intervals" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.intervals;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_no_overlap2_dconstraint_proto fmt (v:no_overlap2_dconstraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "x_intervals" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.x_intervals;
    Pbrt.Pp.pp_record_field ~first:false "y_intervals" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.y_intervals;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_cumulative_constraint_proto fmt (v:cumulative_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "capacity" (Pbrt.Pp.pp_option pp_linear_expression_proto) fmt v.capacity;
    Pbrt.Pp.pp_record_field ~first:false "intervals" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.intervals;
    Pbrt.Pp.pp_record_field ~first:false "demands" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.demands;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_reservoir_constraint_proto fmt (v:reservoir_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (reservoir_constraint_proto_has_min_level v)) ~first:true "min_level" Pbrt.Pp.pp_int64 fmt v.min_level;
    Pbrt.Pp.pp_record_field ~absent:(not (reservoir_constraint_proto_has_max_level v)) ~first:false "max_level" Pbrt.Pp.pp_int64 fmt v.max_level;
    Pbrt.Pp.pp_record_field ~first:false "time_exprs" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.time_exprs;
    Pbrt.Pp.pp_record_field ~first:false "level_changes" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.level_changes;
    Pbrt.Pp.pp_record_field ~first:false "active_literals" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.active_literals;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_circuit_constraint_proto fmt (v:circuit_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "tails" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.tails;
    Pbrt.Pp.pp_record_field ~first:false "heads" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.heads;
    Pbrt.Pp.pp_record_field ~first:false "literals" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.literals;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_routes_constraint_proto fmt (v:routes_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "tails" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.tails;
    Pbrt.Pp.pp_record_field ~first:false "heads" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.heads;
    Pbrt.Pp.pp_record_field ~first:false "literals" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.literals;
    Pbrt.Pp.pp_record_field ~first:false "demands" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.demands;
    Pbrt.Pp.pp_record_field ~absent:(not (routes_constraint_proto_has_capacity v)) ~first:false "capacity" Pbrt.Pp.pp_int64 fmt v.capacity;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_table_constraint_proto fmt (v:table_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
    Pbrt.Pp.pp_record_field ~first:false "values" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.values;
    Pbrt.Pp.pp_record_field ~first:false "exprs" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.exprs;
    Pbrt.Pp.pp_record_field ~absent:(not (table_constraint_proto_has_negated v)) ~first:false "negated" Pbrt.Pp.pp_bool fmt v.negated;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_inverse_constraint_proto fmt (v:inverse_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "f_direct" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.f_direct;
    Pbrt.Pp.pp_record_field ~first:false "f_inverse" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.f_inverse;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_automaton_constraint_proto fmt (v:automaton_constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (automaton_constraint_proto_has_starting_state v)) ~first:true "starting_state" Pbrt.Pp.pp_int64 fmt v.starting_state;
    Pbrt.Pp.pp_record_field ~first:false "final_states" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.final_states;
    Pbrt.Pp.pp_record_field ~first:false "transition_tail" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.transition_tail;
    Pbrt.Pp.pp_record_field ~first:false "transition_head" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.transition_head;
    Pbrt.Pp.pp_record_field ~first:false "transition_label" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.transition_label;
    Pbrt.Pp.pp_record_field ~first:false "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
    Pbrt.Pp.pp_record_field ~first:false "exprs" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.exprs;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_list_of_variables_proto fmt (v:list_of_variables_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_constraint_proto_constraint fmt (v:constraint_proto_constraint) =
  match v with
  | Bool_or x -> Format.fprintf fmt "@[<hv2>Bool_or(@,%a)@]" pp_bool_argument_proto x
  | Bool_and x -> Format.fprintf fmt "@[<hv2>Bool_and(@,%a)@]" pp_bool_argument_proto x
  | At_most_one x -> Format.fprintf fmt "@[<hv2>At_most_one(@,%a)@]" pp_bool_argument_proto x
  | Exactly_one x -> Format.fprintf fmt "@[<hv2>Exactly_one(@,%a)@]" pp_bool_argument_proto x
  | Bool_xor x -> Format.fprintf fmt "@[<hv2>Bool_xor(@,%a)@]" pp_bool_argument_proto x
  | Int_div x -> Format.fprintf fmt "@[<hv2>Int_div(@,%a)@]" pp_linear_argument_proto x
  | Int_mod x -> Format.fprintf fmt "@[<hv2>Int_mod(@,%a)@]" pp_linear_argument_proto x
  | Int_prod x -> Format.fprintf fmt "@[<hv2>Int_prod(@,%a)@]" pp_linear_argument_proto x
  | Lin_max x -> Format.fprintf fmt "@[<hv2>Lin_max(@,%a)@]" pp_linear_argument_proto x
  | Linear x -> Format.fprintf fmt "@[<hv2>Linear(@,%a)@]" pp_linear_constraint_proto x
  | All_diff x -> Format.fprintf fmt "@[<hv2>All_diff(@,%a)@]" pp_all_different_constraint_proto x
  | Element x -> Format.fprintf fmt "@[<hv2>Element(@,%a)@]" pp_element_constraint_proto x
  | Circuit x -> Format.fprintf fmt "@[<hv2>Circuit(@,%a)@]" pp_circuit_constraint_proto x
  | Routes x -> Format.fprintf fmt "@[<hv2>Routes(@,%a)@]" pp_routes_constraint_proto x
  | Table x -> Format.fprintf fmt "@[<hv2>Table(@,%a)@]" pp_table_constraint_proto x
  | Automaton x -> Format.fprintf fmt "@[<hv2>Automaton(@,%a)@]" pp_automaton_constraint_proto x
  | Inverse x -> Format.fprintf fmt "@[<hv2>Inverse(@,%a)@]" pp_inverse_constraint_proto x
  | Reservoir x -> Format.fprintf fmt "@[<hv2>Reservoir(@,%a)@]" pp_reservoir_constraint_proto x
  | Interval x -> Format.fprintf fmt "@[<hv2>Interval(@,%a)@]" pp_interval_constraint_proto x
  | No_overlap x -> Format.fprintf fmt "@[<hv2>No_overlap(@,%a)@]" pp_no_overlap_constraint_proto x
  | No_overlap_2d x -> Format.fprintf fmt "@[<hv2>No_overlap_2d(@,%a)@]" pp_no_overlap2_dconstraint_proto x
  | Cumulative x -> Format.fprintf fmt "@[<hv2>Cumulative(@,%a)@]" pp_cumulative_constraint_proto x
  | Dummy_constraint x -> Format.fprintf fmt "@[<hv2>Dummy_constraint(@,%a)@]" pp_list_of_variables_proto x

and pp_constraint_proto fmt (v:constraint_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (constraint_proto_has_name v)) ~first:true "name" Pbrt.Pp.pp_string fmt v.name;
    Pbrt.Pp.pp_record_field ~first:false "enforcement_literal" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.enforcement_literal;
    Pbrt.Pp.pp_record_field ~first:false "constraint_" (Pbrt.Pp.pp_option pp_constraint_proto_constraint) fmt v.constraint_;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_cp_objective_proto fmt (v:cp_objective_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
    Pbrt.Pp.pp_record_field ~first:false "coeffs" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.coeffs;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_objective_proto_has_offset v)) ~first:false "offset" Pbrt.Pp.pp_float fmt v.offset;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_objective_proto_has_scaling_factor v)) ~first:false "scaling_factor" Pbrt.Pp.pp_float fmt v.scaling_factor;
    Pbrt.Pp.pp_record_field ~first:false "domain" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.domain;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_objective_proto_has_scaling_was_exact v)) ~first:false "scaling_was_exact" Pbrt.Pp.pp_bool fmt v.scaling_was_exact;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_objective_proto_has_integer_before_offset v)) ~first:false "integer_before_offset" Pbrt.Pp.pp_int64 fmt v.integer_before_offset;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_objective_proto_has_integer_after_offset v)) ~first:false "integer_after_offset" Pbrt.Pp.pp_int64 fmt v.integer_after_offset;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_objective_proto_has_integer_scaling_factor v)) ~first:false "integer_scaling_factor" Pbrt.Pp.pp_int64 fmt v.integer_scaling_factor;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_float_objective_proto fmt (v:float_objective_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
    Pbrt.Pp.pp_record_field ~first:false "coeffs" (Pbrt.Pp.pp_list Pbrt.Pp.pp_float) fmt v.coeffs;
    Pbrt.Pp.pp_record_field ~absent:(not (float_objective_proto_has_offset v)) ~first:false "offset" Pbrt.Pp.pp_float fmt v.offset;
    Pbrt.Pp.pp_record_field ~absent:(not (float_objective_proto_has_maximize v)) ~first:false "maximize" Pbrt.Pp.pp_bool fmt v.maximize;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_decision_strategy_proto_variable_selection_strategy fmt (v:decision_strategy_proto_variable_selection_strategy) =
  match v with
  | Choose_first -> Format.fprintf fmt "Choose_first"
  | Choose_lowest_min -> Format.fprintf fmt "Choose_lowest_min"
  | Choose_highest_max -> Format.fprintf fmt "Choose_highest_max"
  | Choose_min_domain_size -> Format.fprintf fmt "Choose_min_domain_size"
  | Choose_max_domain_size -> Format.fprintf fmt "Choose_max_domain_size"

let rec pp_decision_strategy_proto_domain_reduction_strategy fmt (v:decision_strategy_proto_domain_reduction_strategy) =
  match v with
  | Select_min_value -> Format.fprintf fmt "Select_min_value"
  | Select_max_value -> Format.fprintf fmt "Select_max_value"
  | Select_lower_half -> Format.fprintf fmt "Select_lower_half"
  | Select_upper_half -> Format.fprintf fmt "Select_upper_half"
  | Select_median_value -> Format.fprintf fmt "Select_median_value"
  | Select_random_half -> Format.fprintf fmt "Select_random_half"

let rec pp_decision_strategy_proto fmt (v:decision_strategy_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "variables" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.variables;
    Pbrt.Pp.pp_record_field ~first:false "exprs" (Pbrt.Pp.pp_list pp_linear_expression_proto) fmt v.exprs;
    Pbrt.Pp.pp_record_field ~absent:(not (decision_strategy_proto_has_variable_selection_strategy v)) ~first:false "variable_selection_strategy" pp_decision_strategy_proto_variable_selection_strategy fmt v.variable_selection_strategy;
    Pbrt.Pp.pp_record_field ~absent:(not (decision_strategy_proto_has_domain_reduction_strategy v)) ~first:false "domain_reduction_strategy" pp_decision_strategy_proto_domain_reduction_strategy fmt v.domain_reduction_strategy;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_partial_variable_assignment fmt (v:partial_variable_assignment) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "vars" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.vars;
    Pbrt.Pp.pp_record_field ~first:false "values" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.values;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_sparse_permutation_proto fmt (v:sparse_permutation_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "support" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.support;
    Pbrt.Pp.pp_record_field ~first:false "cycle_sizes" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.cycle_sizes;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_dense_matrix_proto fmt (v:dense_matrix_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (dense_matrix_proto_has_num_rows v)) ~first:true "num_rows" Pbrt.Pp.pp_int32 fmt v.num_rows;
    Pbrt.Pp.pp_record_field ~absent:(not (dense_matrix_proto_has_num_cols v)) ~first:false "num_cols" Pbrt.Pp.pp_int32 fmt v.num_cols;
    Pbrt.Pp.pp_record_field ~first:false "entries" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.entries;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_symmetry_proto fmt (v:symmetry_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "permutations" (Pbrt.Pp.pp_list pp_sparse_permutation_proto) fmt v.permutations;
    Pbrt.Pp.pp_record_field ~first:false "orbitopes" (Pbrt.Pp.pp_list pp_dense_matrix_proto) fmt v.orbitopes;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_cp_model_proto fmt (v:cp_model_proto) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (cp_model_proto_has_name v)) ~first:true "name" Pbrt.Pp.pp_string fmt v.name;
    Pbrt.Pp.pp_record_field ~first:false "variables" (Pbrt.Pp.pp_list pp_integer_variable_proto) fmt v.variables;
    Pbrt.Pp.pp_record_field ~first:false "constraints" (Pbrt.Pp.pp_list pp_constraint_proto) fmt v.constraints;
    Pbrt.Pp.pp_record_field ~first:false "objective" (Pbrt.Pp.pp_option pp_cp_objective_proto) fmt v.objective;
    Pbrt.Pp.pp_record_field ~first:false "floating_point_objective" (Pbrt.Pp.pp_option pp_float_objective_proto) fmt v.floating_point_objective;
    Pbrt.Pp.pp_record_field ~first:false "search_strategy" (Pbrt.Pp.pp_list pp_decision_strategy_proto) fmt v.search_strategy;
    Pbrt.Pp.pp_record_field ~first:false "solution_hint" (Pbrt.Pp.pp_option pp_partial_variable_assignment) fmt v.solution_hint;
    Pbrt.Pp.pp_record_field ~first:false "assumptions" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.assumptions;
    Pbrt.Pp.pp_record_field ~first:false "symmetry" (Pbrt.Pp.pp_option pp_symmetry_proto) fmt v.symmetry;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_cp_solver_status fmt (v:cp_solver_status) =
  match v with
  | Unknown -> Format.fprintf fmt "Unknown"
  | Model_invalid -> Format.fprintf fmt "Model_invalid"
  | Feasible -> Format.fprintf fmt "Feasible"
  | Infeasible -> Format.fprintf fmt "Infeasible"
  | Optimal -> Format.fprintf fmt "Optimal"

let rec pp_cp_solver_solution fmt (v:cp_solver_solution) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~first:true "values" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.values;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

let rec pp_cp_solver_response fmt (v:cp_solver_response) = 
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_status v)) ~first:true "status" pp_cp_solver_status fmt v.status;
    Pbrt.Pp.pp_record_field ~first:false "solution" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int64) fmt v.solution;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_objective_value v)) ~first:false "objective_value" Pbrt.Pp.pp_float fmt v.objective_value;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_best_objective_bound v)) ~first:false "best_objective_bound" Pbrt.Pp.pp_float fmt v.best_objective_bound;
    Pbrt.Pp.pp_record_field ~first:false "additional_solutions" (Pbrt.Pp.pp_list pp_cp_solver_solution) fmt v.additional_solutions;
    Pbrt.Pp.pp_record_field ~first:false "tightened_variables" (Pbrt.Pp.pp_list pp_integer_variable_proto) fmt v.tightened_variables;
    Pbrt.Pp.pp_record_field ~first:false "sufficient_assumptions_for_infeasibility" (Pbrt.Pp.pp_list Pbrt.Pp.pp_int32) fmt v.sufficient_assumptions_for_infeasibility;
    Pbrt.Pp.pp_record_field ~first:false "integer_objective" (Pbrt.Pp.pp_option pp_cp_objective_proto) fmt v.integer_objective;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_inner_objective_lower_bound v)) ~first:false "inner_objective_lower_bound" Pbrt.Pp.pp_int64 fmt v.inner_objective_lower_bound;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_integers v)) ~first:false "num_integers" Pbrt.Pp.pp_int64 fmt v.num_integers;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_booleans v)) ~first:false "num_booleans" Pbrt.Pp.pp_int64 fmt v.num_booleans;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_fixed_booleans v)) ~first:false "num_fixed_booleans" Pbrt.Pp.pp_int64 fmt v.num_fixed_booleans;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_conflicts v)) ~first:false "num_conflicts" Pbrt.Pp.pp_int64 fmt v.num_conflicts;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_branches v)) ~first:false "num_branches" Pbrt.Pp.pp_int64 fmt v.num_branches;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_binary_propagations v)) ~first:false "num_binary_propagations" Pbrt.Pp.pp_int64 fmt v.num_binary_propagations;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_integer_propagations v)) ~first:false "num_integer_propagations" Pbrt.Pp.pp_int64 fmt v.num_integer_propagations;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_restarts v)) ~first:false "num_restarts" Pbrt.Pp.pp_int64 fmt v.num_restarts;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_num_lp_iterations v)) ~first:false "num_lp_iterations" Pbrt.Pp.pp_int64 fmt v.num_lp_iterations;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_wall_time v)) ~first:false "wall_time" Pbrt.Pp.pp_float fmt v.wall_time;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_user_time v)) ~first:false "user_time" Pbrt.Pp.pp_float fmt v.user_time;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_deterministic_time v)) ~first:false "deterministic_time" Pbrt.Pp.pp_float fmt v.deterministic_time;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_gap_integral v)) ~first:false "gap_integral" Pbrt.Pp.pp_float fmt v.gap_integral;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_solution_info v)) ~first:false "solution_info" Pbrt.Pp.pp_string fmt v.solution_info;
    Pbrt.Pp.pp_record_field ~absent:(not (cp_solver_response_has_solve_log v)) ~first:false "solve_log" Pbrt.Pp.pp_string fmt v.solve_log;
  in
  Pbrt.Pp.pp_brk pp_i fmt ()

[@@@ocaml.warning "-23-27-30-39"]

(** {2 Protobuf Encoding} *)

let rec encode_pb_integer_variable_proto (v:integer_variable_proto) encoder = 
  if integer_variable_proto_has_name v then (
    Pbrt.Encoder.string v.name encoder;
    Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  );
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.domain encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_bool_argument_proto (v:bool_argument_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.literals encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_linear_expression_proto (v:linear_expression_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.coeffs encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  if linear_expression_proto_has_offset v then (
    Pbrt.Encoder.int64_as_varint v.offset encoder;
    Pbrt.Encoder.key 3 Pbrt.Varint encoder; 
  );
  ()

let rec encode_pb_linear_argument_proto (v:linear_argument_proto) encoder = 
  begin match v.target with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  ) v.exprs encoder;
  ()

let rec encode_pb_all_different_constraint_proto (v:all_different_constraint_proto) encoder = 
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  ) v.exprs encoder;
  ()

let rec encode_pb_linear_constraint_proto (v:linear_constraint_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.coeffs encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.domain encoder;
  Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_element_constraint_proto (v:element_constraint_proto) encoder = 
  if element_constraint_proto_has_index v then (
    Pbrt.Encoder.int32_as_varint v.index encoder;
    Pbrt.Encoder.key 1 Pbrt.Varint encoder; 
  );
  if element_constraint_proto_has_target v then (
    Pbrt.Encoder.int32_as_varint v.target encoder;
    Pbrt.Encoder.key 2 Pbrt.Varint encoder; 
  );
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  begin match v.linear_index with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  begin match v.linear_target with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 6 Pbrt.Bytes encoder; 
  ) v.exprs encoder;
  ()

let rec encode_pb_interval_constraint_proto (v:interval_constraint_proto) encoder = 
  begin match v.start with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  begin match v.end_ with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  begin match v.size with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 6 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  ()

let rec encode_pb_no_overlap_constraint_proto (v:no_overlap_constraint_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.intervals encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_no_overlap2_dconstraint_proto (v:no_overlap2_dconstraint_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.x_intervals encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.y_intervals encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_cumulative_constraint_proto (v:cumulative_constraint_proto) encoder = 
  begin match v.capacity with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.intervals encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  ) v.demands encoder;
  ()

let rec encode_pb_reservoir_constraint_proto (v:reservoir_constraint_proto) encoder = 
  if reservoir_constraint_proto_has_min_level v then (
    Pbrt.Encoder.int64_as_varint v.min_level encoder;
    Pbrt.Encoder.key 1 Pbrt.Varint encoder; 
  );
  if reservoir_constraint_proto_has_max_level v then (
    Pbrt.Encoder.int64_as_varint v.max_level encoder;
    Pbrt.Encoder.key 2 Pbrt.Varint encoder; 
  );
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  ) v.time_exprs encoder;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 6 Pbrt.Bytes encoder; 
  ) v.level_changes encoder;
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.active_literals encoder;
  Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_circuit_constraint_proto (v:circuit_constraint_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.tails encoder;
  Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.heads encoder;
  Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.literals encoder;
  Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_routes_constraint_proto (v:routes_constraint_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.tails encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.heads encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.literals encoder;
  Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.demands encoder;
  Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  if routes_constraint_proto_has_capacity v then (
    Pbrt.Encoder.int64_as_varint v.capacity encoder;
    Pbrt.Encoder.key 5 Pbrt.Varint encoder; 
  );
  ()

let rec encode_pb_table_constraint_proto (v:table_constraint_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.values encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  ) v.exprs encoder;
  if table_constraint_proto_has_negated v then (
    Pbrt.Encoder.bool v.negated encoder;
    Pbrt.Encoder.key 3 Pbrt.Varint encoder; 
  );
  ()

let rec encode_pb_inverse_constraint_proto (v:inverse_constraint_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.f_direct encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.f_inverse encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_automaton_constraint_proto (v:automaton_constraint_proto) encoder = 
  if automaton_constraint_proto_has_starting_state v then (
    Pbrt.Encoder.int64_as_varint v.starting_state encoder;
    Pbrt.Encoder.key 2 Pbrt.Varint encoder; 
  );
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.final_states encoder;
  Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.transition_tail encoder;
  Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.transition_head encoder;
  Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.transition_label encoder;
  Pbrt.Encoder.key 6 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 7 Pbrt.Bytes encoder; 
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 8 Pbrt.Bytes encoder; 
  ) v.exprs encoder;
  ()

let rec encode_pb_list_of_variables_proto (v:list_of_variables_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_constraint_proto_constraint (v:constraint_proto_constraint) encoder = 
  begin match v with
  | Bool_or x ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  | Bool_and x ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  | At_most_one x ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 26 Pbrt.Bytes encoder; 
  | Exactly_one x ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 29 Pbrt.Bytes encoder; 
  | Bool_xor x ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  | Int_div x ->
    Pbrt.Encoder.nested encode_pb_linear_argument_proto x encoder;
    Pbrt.Encoder.key 7 Pbrt.Bytes encoder; 
  | Int_mod x ->
    Pbrt.Encoder.nested encode_pb_linear_argument_proto x encoder;
    Pbrt.Encoder.key 8 Pbrt.Bytes encoder; 
  | Int_prod x ->
    Pbrt.Encoder.nested encode_pb_linear_argument_proto x encoder;
    Pbrt.Encoder.key 11 Pbrt.Bytes encoder; 
  | Lin_max x ->
    Pbrt.Encoder.nested encode_pb_linear_argument_proto x encoder;
    Pbrt.Encoder.key 27 Pbrt.Bytes encoder; 
  | Linear x ->
    Pbrt.Encoder.nested encode_pb_linear_constraint_proto x encoder;
    Pbrt.Encoder.key 12 Pbrt.Bytes encoder; 
  | All_diff x ->
    Pbrt.Encoder.nested encode_pb_all_different_constraint_proto x encoder;
    Pbrt.Encoder.key 13 Pbrt.Bytes encoder; 
  | Element x ->
    Pbrt.Encoder.nested encode_pb_element_constraint_proto x encoder;
    Pbrt.Encoder.key 14 Pbrt.Bytes encoder; 
  | Circuit x ->
    Pbrt.Encoder.nested encode_pb_circuit_constraint_proto x encoder;
    Pbrt.Encoder.key 15 Pbrt.Bytes encoder; 
  | Routes x ->
    Pbrt.Encoder.nested encode_pb_routes_constraint_proto x encoder;
    Pbrt.Encoder.key 23 Pbrt.Bytes encoder; 
  | Table x ->
    Pbrt.Encoder.nested encode_pb_table_constraint_proto x encoder;
    Pbrt.Encoder.key 16 Pbrt.Bytes encoder; 
  | Automaton x ->
    Pbrt.Encoder.nested encode_pb_automaton_constraint_proto x encoder;
    Pbrt.Encoder.key 17 Pbrt.Bytes encoder; 
  | Inverse x ->
    Pbrt.Encoder.nested encode_pb_inverse_constraint_proto x encoder;
    Pbrt.Encoder.key 18 Pbrt.Bytes encoder; 
  | Reservoir x ->
    Pbrt.Encoder.nested encode_pb_reservoir_constraint_proto x encoder;
    Pbrt.Encoder.key 24 Pbrt.Bytes encoder; 
  | Interval x ->
    Pbrt.Encoder.nested encode_pb_interval_constraint_proto x encoder;
    Pbrt.Encoder.key 19 Pbrt.Bytes encoder; 
  | No_overlap x ->
    Pbrt.Encoder.nested encode_pb_no_overlap_constraint_proto x encoder;
    Pbrt.Encoder.key 20 Pbrt.Bytes encoder; 
  | No_overlap_2d x ->
    Pbrt.Encoder.nested encode_pb_no_overlap2_dconstraint_proto x encoder;
    Pbrt.Encoder.key 21 Pbrt.Bytes encoder; 
  | Cumulative x ->
    Pbrt.Encoder.nested encode_pb_cumulative_constraint_proto x encoder;
    Pbrt.Encoder.key 22 Pbrt.Bytes encoder; 
  | Dummy_constraint x ->
    Pbrt.Encoder.nested encode_pb_list_of_variables_proto x encoder;
    Pbrt.Encoder.key 30 Pbrt.Bytes encoder; 
  end

and encode_pb_constraint_proto (v:constraint_proto) encoder = 
  if constraint_proto_has_name v then (
    Pbrt.Encoder.string v.name encoder;
    Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  );
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.enforcement_literal encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  begin match v.constraint_ with
  | None -> ()
  | Some (Bool_or x) ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  | Some (Bool_and x) ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  | Some (At_most_one x) ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 26 Pbrt.Bytes encoder; 
  | Some (Exactly_one x) ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 29 Pbrt.Bytes encoder; 
  | Some (Bool_xor x) ->
    Pbrt.Encoder.nested encode_pb_bool_argument_proto x encoder;
    Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  | Some (Int_div x) ->
    Pbrt.Encoder.nested encode_pb_linear_argument_proto x encoder;
    Pbrt.Encoder.key 7 Pbrt.Bytes encoder; 
  | Some (Int_mod x) ->
    Pbrt.Encoder.nested encode_pb_linear_argument_proto x encoder;
    Pbrt.Encoder.key 8 Pbrt.Bytes encoder; 
  | Some (Int_prod x) ->
    Pbrt.Encoder.nested encode_pb_linear_argument_proto x encoder;
    Pbrt.Encoder.key 11 Pbrt.Bytes encoder; 
  | Some (Lin_max x) ->
    Pbrt.Encoder.nested encode_pb_linear_argument_proto x encoder;
    Pbrt.Encoder.key 27 Pbrt.Bytes encoder; 
  | Some (Linear x) ->
    Pbrt.Encoder.nested encode_pb_linear_constraint_proto x encoder;
    Pbrt.Encoder.key 12 Pbrt.Bytes encoder; 
  | Some (All_diff x) ->
    Pbrt.Encoder.nested encode_pb_all_different_constraint_proto x encoder;
    Pbrt.Encoder.key 13 Pbrt.Bytes encoder; 
  | Some (Element x) ->
    Pbrt.Encoder.nested encode_pb_element_constraint_proto x encoder;
    Pbrt.Encoder.key 14 Pbrt.Bytes encoder; 
  | Some (Circuit x) ->
    Pbrt.Encoder.nested encode_pb_circuit_constraint_proto x encoder;
    Pbrt.Encoder.key 15 Pbrt.Bytes encoder; 
  | Some (Routes x) ->
    Pbrt.Encoder.nested encode_pb_routes_constraint_proto x encoder;
    Pbrt.Encoder.key 23 Pbrt.Bytes encoder; 
  | Some (Table x) ->
    Pbrt.Encoder.nested encode_pb_table_constraint_proto x encoder;
    Pbrt.Encoder.key 16 Pbrt.Bytes encoder; 
  | Some (Automaton x) ->
    Pbrt.Encoder.nested encode_pb_automaton_constraint_proto x encoder;
    Pbrt.Encoder.key 17 Pbrt.Bytes encoder; 
  | Some (Inverse x) ->
    Pbrt.Encoder.nested encode_pb_inverse_constraint_proto x encoder;
    Pbrt.Encoder.key 18 Pbrt.Bytes encoder; 
  | Some (Reservoir x) ->
    Pbrt.Encoder.nested encode_pb_reservoir_constraint_proto x encoder;
    Pbrt.Encoder.key 24 Pbrt.Bytes encoder; 
  | Some (Interval x) ->
    Pbrt.Encoder.nested encode_pb_interval_constraint_proto x encoder;
    Pbrt.Encoder.key 19 Pbrt.Bytes encoder; 
  | Some (No_overlap x) ->
    Pbrt.Encoder.nested encode_pb_no_overlap_constraint_proto x encoder;
    Pbrt.Encoder.key 20 Pbrt.Bytes encoder; 
  | Some (No_overlap_2d x) ->
    Pbrt.Encoder.nested encode_pb_no_overlap2_dconstraint_proto x encoder;
    Pbrt.Encoder.key 21 Pbrt.Bytes encoder; 
  | Some (Cumulative x) ->
    Pbrt.Encoder.nested encode_pb_cumulative_constraint_proto x encoder;
    Pbrt.Encoder.key 22 Pbrt.Bytes encoder; 
  | Some (Dummy_constraint x) ->
    Pbrt.Encoder.nested encode_pb_list_of_variables_proto x encoder;
    Pbrt.Encoder.key 30 Pbrt.Bytes encoder; 
  end;
  ()

let rec encode_pb_cp_objective_proto (v:cp_objective_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.coeffs encoder;
  Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  if cp_objective_proto_has_offset v then (
    Pbrt.Encoder.float_as_bits64 v.offset encoder;
    Pbrt.Encoder.key 2 Pbrt.Bits64 encoder; 
  );
  if cp_objective_proto_has_scaling_factor v then (
    Pbrt.Encoder.float_as_bits64 v.scaling_factor encoder;
    Pbrt.Encoder.key 3 Pbrt.Bits64 encoder; 
  );
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.domain encoder;
  Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  if cp_objective_proto_has_scaling_was_exact v then (
    Pbrt.Encoder.bool v.scaling_was_exact encoder;
    Pbrt.Encoder.key 6 Pbrt.Varint encoder; 
  );
  if cp_objective_proto_has_integer_before_offset v then (
    Pbrt.Encoder.int64_as_varint v.integer_before_offset encoder;
    Pbrt.Encoder.key 7 Pbrt.Varint encoder; 
  );
  if cp_objective_proto_has_integer_after_offset v then (
    Pbrt.Encoder.int64_as_varint v.integer_after_offset encoder;
    Pbrt.Encoder.key 9 Pbrt.Varint encoder; 
  );
  if cp_objective_proto_has_integer_scaling_factor v then (
    Pbrt.Encoder.int64_as_varint v.integer_scaling_factor encoder;
    Pbrt.Encoder.key 8 Pbrt.Varint encoder; 
  );
  ()

let rec encode_pb_float_objective_proto (v:float_objective_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.float_as_bits64 x encoder;
    ) lst encoder;
  ) v.coeffs encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  if float_objective_proto_has_offset v then (
    Pbrt.Encoder.float_as_bits64 v.offset encoder;
    Pbrt.Encoder.key 3 Pbrt.Bits64 encoder; 
  );
  if float_objective_proto_has_maximize v then (
    Pbrt.Encoder.bool v.maximize encoder;
    Pbrt.Encoder.key 4 Pbrt.Varint encoder; 
  );
  ()

let rec encode_pb_decision_strategy_proto_variable_selection_strategy (v:decision_strategy_proto_variable_selection_strategy) encoder =
  match v with
  | Choose_first -> Pbrt.Encoder.int_as_varint (0) encoder
  | Choose_lowest_min -> Pbrt.Encoder.int_as_varint 1 encoder
  | Choose_highest_max -> Pbrt.Encoder.int_as_varint 2 encoder
  | Choose_min_domain_size -> Pbrt.Encoder.int_as_varint 3 encoder
  | Choose_max_domain_size -> Pbrt.Encoder.int_as_varint 4 encoder

let rec encode_pb_decision_strategy_proto_domain_reduction_strategy (v:decision_strategy_proto_domain_reduction_strategy) encoder =
  match v with
  | Select_min_value -> Pbrt.Encoder.int_as_varint (0) encoder
  | Select_max_value -> Pbrt.Encoder.int_as_varint 1 encoder
  | Select_lower_half -> Pbrt.Encoder.int_as_varint 2 encoder
  | Select_upper_half -> Pbrt.Encoder.int_as_varint 3 encoder
  | Select_median_value -> Pbrt.Encoder.int_as_varint 4 encoder
  | Select_random_half -> Pbrt.Encoder.int_as_varint 5 encoder

let rec encode_pb_decision_strategy_proto (v:decision_strategy_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.variables encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_linear_expression_proto x encoder;
    Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  ) v.exprs encoder;
  if decision_strategy_proto_has_variable_selection_strategy v then (
    encode_pb_decision_strategy_proto_variable_selection_strategy v.variable_selection_strategy encoder;
    Pbrt.Encoder.key 2 Pbrt.Varint encoder; 
  );
  if decision_strategy_proto_has_domain_reduction_strategy v then (
    encode_pb_decision_strategy_proto_domain_reduction_strategy v.domain_reduction_strategy encoder;
    Pbrt.Encoder.key 3 Pbrt.Varint encoder; 
  );
  ()

let rec encode_pb_partial_variable_assignment (v:partial_variable_assignment) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.vars encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.values encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_sparse_permutation_proto (v:sparse_permutation_proto) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.support encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.cycle_sizes encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_dense_matrix_proto (v:dense_matrix_proto) encoder = 
  if dense_matrix_proto_has_num_rows v then (
    Pbrt.Encoder.int32_as_varint v.num_rows encoder;
    Pbrt.Encoder.key 1 Pbrt.Varint encoder; 
  );
  if dense_matrix_proto_has_num_cols v then (
    Pbrt.Encoder.int32_as_varint v.num_cols encoder;
    Pbrt.Encoder.key 2 Pbrt.Varint encoder; 
  );
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.entries encoder;
  Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_symmetry_proto (v:symmetry_proto) encoder = 
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_sparse_permutation_proto x encoder;
    Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  ) v.permutations encoder;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_dense_matrix_proto x encoder;
    Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  ) v.orbitopes encoder;
  ()

let rec encode_pb_cp_model_proto (v:cp_model_proto) encoder = 
  if cp_model_proto_has_name v then (
    Pbrt.Encoder.string v.name encoder;
    Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  );
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_integer_variable_proto x encoder;
    Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  ) v.variables encoder;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_constraint_proto x encoder;
    Pbrt.Encoder.key 3 Pbrt.Bytes encoder; 
  ) v.constraints encoder;
  begin match v.objective with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_cp_objective_proto x encoder;
    Pbrt.Encoder.key 4 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  begin match v.floating_point_objective with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_float_objective_proto x encoder;
    Pbrt.Encoder.key 9 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_decision_strategy_proto x encoder;
    Pbrt.Encoder.key 5 Pbrt.Bytes encoder; 
  ) v.search_strategy encoder;
  begin match v.solution_hint with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_partial_variable_assignment x encoder;
    Pbrt.Encoder.key 6 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.assumptions encoder;
  Pbrt.Encoder.key 7 Pbrt.Bytes encoder; 
  begin match v.symmetry with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_symmetry_proto x encoder;
    Pbrt.Encoder.key 8 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  ()

let rec encode_pb_cp_solver_status (v:cp_solver_status) encoder =
  match v with
  | Unknown -> Pbrt.Encoder.int_as_varint (0) encoder
  | Model_invalid -> Pbrt.Encoder.int_as_varint 1 encoder
  | Feasible -> Pbrt.Encoder.int_as_varint 2 encoder
  | Infeasible -> Pbrt.Encoder.int_as_varint 3 encoder
  | Optimal -> Pbrt.Encoder.int_as_varint 4 encoder

let rec encode_pb_cp_solver_solution (v:cp_solver_solution) encoder = 
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.values encoder;
  Pbrt.Encoder.key 1 Pbrt.Bytes encoder; 
  ()

let rec encode_pb_cp_solver_response (v:cp_solver_response) encoder = 
  if cp_solver_response_has_status v then (
    encode_pb_cp_solver_status v.status encoder;
    Pbrt.Encoder.key 1 Pbrt.Varint encoder; 
  );
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int64_as_varint x encoder;
    ) lst encoder;
  ) v.solution encoder;
  Pbrt.Encoder.key 2 Pbrt.Bytes encoder; 
  if cp_solver_response_has_objective_value v then (
    Pbrt.Encoder.float_as_bits64 v.objective_value encoder;
    Pbrt.Encoder.key 3 Pbrt.Bits64 encoder; 
  );
  if cp_solver_response_has_best_objective_bound v then (
    Pbrt.Encoder.float_as_bits64 v.best_objective_bound encoder;
    Pbrt.Encoder.key 4 Pbrt.Bits64 encoder; 
  );
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_cp_solver_solution x encoder;
    Pbrt.Encoder.key 27 Pbrt.Bytes encoder; 
  ) v.additional_solutions encoder;
  Pbrt.List_util.rev_iter_with (fun x encoder ->
    Pbrt.Encoder.nested encode_pb_integer_variable_proto x encoder;
    Pbrt.Encoder.key 21 Pbrt.Bytes encoder; 
  ) v.tightened_variables encoder;
  Pbrt.Encoder.nested (fun lst encoder ->
    Pbrt.List_util.rev_iter_with (fun x encoder ->
      Pbrt.Encoder.int32_as_varint x encoder;
    ) lst encoder;
  ) v.sufficient_assumptions_for_infeasibility encoder;
  Pbrt.Encoder.key 23 Pbrt.Bytes encoder; 
  begin match v.integer_objective with
  | Some x -> 
    Pbrt.Encoder.nested encode_pb_cp_objective_proto x encoder;
    Pbrt.Encoder.key 28 Pbrt.Bytes encoder; 
  | None -> ();
  end;
  if cp_solver_response_has_inner_objective_lower_bound v then (
    Pbrt.Encoder.int64_as_varint v.inner_objective_lower_bound encoder;
    Pbrt.Encoder.key 29 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_integers v then (
    Pbrt.Encoder.int64_as_varint v.num_integers encoder;
    Pbrt.Encoder.key 30 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_booleans v then (
    Pbrt.Encoder.int64_as_varint v.num_booleans encoder;
    Pbrt.Encoder.key 10 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_fixed_booleans v then (
    Pbrt.Encoder.int64_as_varint v.num_fixed_booleans encoder;
    Pbrt.Encoder.key 31 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_conflicts v then (
    Pbrt.Encoder.int64_as_varint v.num_conflicts encoder;
    Pbrt.Encoder.key 11 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_branches v then (
    Pbrt.Encoder.int64_as_varint v.num_branches encoder;
    Pbrt.Encoder.key 12 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_binary_propagations v then (
    Pbrt.Encoder.int64_as_varint v.num_binary_propagations encoder;
    Pbrt.Encoder.key 13 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_integer_propagations v then (
    Pbrt.Encoder.int64_as_varint v.num_integer_propagations encoder;
    Pbrt.Encoder.key 14 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_restarts v then (
    Pbrt.Encoder.int64_as_varint v.num_restarts encoder;
    Pbrt.Encoder.key 24 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_num_lp_iterations v then (
    Pbrt.Encoder.int64_as_varint v.num_lp_iterations encoder;
    Pbrt.Encoder.key 25 Pbrt.Varint encoder; 
  );
  if cp_solver_response_has_wall_time v then (
    Pbrt.Encoder.float_as_bits64 v.wall_time encoder;
    Pbrt.Encoder.key 15 Pbrt.Bits64 encoder; 
  );
  if cp_solver_response_has_user_time v then (
    Pbrt.Encoder.float_as_bits64 v.user_time encoder;
    Pbrt.Encoder.key 16 Pbrt.Bits64 encoder; 
  );
  if cp_solver_response_has_deterministic_time v then (
    Pbrt.Encoder.float_as_bits64 v.deterministic_time encoder;
    Pbrt.Encoder.key 17 Pbrt.Bits64 encoder; 
  );
  if cp_solver_response_has_gap_integral v then (
    Pbrt.Encoder.float_as_bits64 v.gap_integral encoder;
    Pbrt.Encoder.key 22 Pbrt.Bits64 encoder; 
  );
  if cp_solver_response_has_solution_info v then (
    Pbrt.Encoder.string v.solution_info encoder;
    Pbrt.Encoder.key 20 Pbrt.Bytes encoder; 
  );
  if cp_solver_response_has_solve_log v then (
    Pbrt.Encoder.string v.solve_log encoder;
    Pbrt.Encoder.key 26 Pbrt.Bytes encoder; 
  );
  ()

[@@@ocaml.warning "-23-27-30-39"]

(** {2 Protobuf Decoding} *)

let rec decode_pb_integer_variable_proto d =
  let v = default_integer_variable_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      integer_variable_proto_set_domain v (List.rev v.domain);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      integer_variable_proto_set_name v (Pbrt.Decoder.string d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "integer_variable_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      integer_variable_proto_set_domain v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "integer_variable_proto" 2 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : integer_variable_proto)

let rec decode_pb_bool_argument_proto d =
  let v = default_bool_argument_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      bool_argument_proto_set_literals v (List.rev v.literals);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      bool_argument_proto_set_literals v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "bool_argument_proto" 1 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : bool_argument_proto)

let rec decode_pb_linear_expression_proto d =
  let v = default_linear_expression_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      linear_expression_proto_set_coeffs v (List.rev v.coeffs);
      linear_expression_proto_set_vars v (List.rev v.vars);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      linear_expression_proto_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "linear_expression_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      linear_expression_proto_set_coeffs v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "linear_expression_proto" 2 pk
    | Some (3, Pbrt.Varint) -> begin
      linear_expression_proto_set_offset v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "linear_expression_proto" 3 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : linear_expression_proto)

let rec decode_pb_linear_argument_proto d =
  let v = default_linear_argument_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      linear_argument_proto_set_exprs v (List.rev v.exprs);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      linear_argument_proto_set_target v (decode_pb_linear_expression_proto (Pbrt.Decoder.nested d));
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "linear_argument_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      linear_argument_proto_set_exprs v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.exprs);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "linear_argument_proto" 2 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : linear_argument_proto)

let rec decode_pb_all_different_constraint_proto d =
  let v = default_all_different_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      all_different_constraint_proto_set_exprs v (List.rev v.exprs);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      all_different_constraint_proto_set_exprs v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.exprs);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "all_different_constraint_proto" 1 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : all_different_constraint_proto)

let rec decode_pb_linear_constraint_proto d =
  let v = default_linear_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      linear_constraint_proto_set_domain v (List.rev v.domain);
      linear_constraint_proto_set_coeffs v (List.rev v.coeffs);
      linear_constraint_proto_set_vars v (List.rev v.vars);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      linear_constraint_proto_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "linear_constraint_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      linear_constraint_proto_set_coeffs v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "linear_constraint_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      linear_constraint_proto_set_domain v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "linear_constraint_proto" 3 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : linear_constraint_proto)

let rec decode_pb_element_constraint_proto d =
  let v = default_element_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      element_constraint_proto_set_exprs v (List.rev v.exprs);
      element_constraint_proto_set_vars v (List.rev v.vars);
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      element_constraint_proto_set_index v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "element_constraint_proto" 1 pk
    | Some (2, Pbrt.Varint) -> begin
      element_constraint_proto_set_target v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "element_constraint_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      element_constraint_proto_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "element_constraint_proto" 3 pk
    | Some (4, Pbrt.Bytes) -> begin
      element_constraint_proto_set_linear_index v (decode_pb_linear_expression_proto (Pbrt.Decoder.nested d));
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "element_constraint_proto" 4 pk
    | Some (5, Pbrt.Bytes) -> begin
      element_constraint_proto_set_linear_target v (decode_pb_linear_expression_proto (Pbrt.Decoder.nested d));
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "element_constraint_proto" 5 pk
    | Some (6, Pbrt.Bytes) -> begin
      element_constraint_proto_set_exprs v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.exprs);
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "element_constraint_proto" 6 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : element_constraint_proto)

let rec decode_pb_interval_constraint_proto d =
  let v = default_interval_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (4, Pbrt.Bytes) -> begin
      interval_constraint_proto_set_start v (decode_pb_linear_expression_proto (Pbrt.Decoder.nested d));
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "interval_constraint_proto" 4 pk
    | Some (5, Pbrt.Bytes) -> begin
      interval_constraint_proto_set_end_ v (decode_pb_linear_expression_proto (Pbrt.Decoder.nested d));
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "interval_constraint_proto" 5 pk
    | Some (6, Pbrt.Bytes) -> begin
      interval_constraint_proto_set_size v (decode_pb_linear_expression_proto (Pbrt.Decoder.nested d));
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "interval_constraint_proto" 6 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : interval_constraint_proto)

let rec decode_pb_no_overlap_constraint_proto d =
  let v = default_no_overlap_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      no_overlap_constraint_proto_set_intervals v (List.rev v.intervals);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      no_overlap_constraint_proto_set_intervals v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "no_overlap_constraint_proto" 1 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : no_overlap_constraint_proto)

let rec decode_pb_no_overlap2_dconstraint_proto d =
  let v = default_no_overlap2_dconstraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      no_overlap2_dconstraint_proto_set_y_intervals v (List.rev v.y_intervals);
      no_overlap2_dconstraint_proto_set_x_intervals v (List.rev v.x_intervals);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      no_overlap2_dconstraint_proto_set_x_intervals v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "no_overlap2_dconstraint_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      no_overlap2_dconstraint_proto_set_y_intervals v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "no_overlap2_dconstraint_proto" 2 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : no_overlap2_dconstraint_proto)

let rec decode_pb_cumulative_constraint_proto d =
  let v = default_cumulative_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      cumulative_constraint_proto_set_demands v (List.rev v.demands);
      cumulative_constraint_proto_set_intervals v (List.rev v.intervals);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      cumulative_constraint_proto_set_capacity v (decode_pb_linear_expression_proto (Pbrt.Decoder.nested d));
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cumulative_constraint_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      cumulative_constraint_proto_set_intervals v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cumulative_constraint_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      cumulative_constraint_proto_set_demands v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.demands);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cumulative_constraint_proto" 3 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : cumulative_constraint_proto)

let rec decode_pb_reservoir_constraint_proto d =
  let v = default_reservoir_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      reservoir_constraint_proto_set_active_literals v (List.rev v.active_literals);
      reservoir_constraint_proto_set_level_changes v (List.rev v.level_changes);
      reservoir_constraint_proto_set_time_exprs v (List.rev v.time_exprs);
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      reservoir_constraint_proto_set_min_level v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "reservoir_constraint_proto" 1 pk
    | Some (2, Pbrt.Varint) -> begin
      reservoir_constraint_proto_set_max_level v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "reservoir_constraint_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      reservoir_constraint_proto_set_time_exprs v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.time_exprs);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "reservoir_constraint_proto" 3 pk
    | Some (6, Pbrt.Bytes) -> begin
      reservoir_constraint_proto_set_level_changes v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.level_changes);
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "reservoir_constraint_proto" 6 pk
    | Some (5, Pbrt.Bytes) -> begin
      reservoir_constraint_proto_set_active_literals v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "reservoir_constraint_proto" 5 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : reservoir_constraint_proto)

let rec decode_pb_circuit_constraint_proto d =
  let v = default_circuit_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      circuit_constraint_proto_set_literals v (List.rev v.literals);
      circuit_constraint_proto_set_heads v (List.rev v.heads);
      circuit_constraint_proto_set_tails v (List.rev v.tails);
    ); continue__ := false
    | Some (3, Pbrt.Bytes) -> begin
      circuit_constraint_proto_set_tails v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "circuit_constraint_proto" 3 pk
    | Some (4, Pbrt.Bytes) -> begin
      circuit_constraint_proto_set_heads v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "circuit_constraint_proto" 4 pk
    | Some (5, Pbrt.Bytes) -> begin
      circuit_constraint_proto_set_literals v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "circuit_constraint_proto" 5 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : circuit_constraint_proto)

let rec decode_pb_routes_constraint_proto d =
  let v = default_routes_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      routes_constraint_proto_set_demands v (List.rev v.demands);
      routes_constraint_proto_set_literals v (List.rev v.literals);
      routes_constraint_proto_set_heads v (List.rev v.heads);
      routes_constraint_proto_set_tails v (List.rev v.tails);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      routes_constraint_proto_set_tails v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "routes_constraint_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      routes_constraint_proto_set_heads v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "routes_constraint_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      routes_constraint_proto_set_literals v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "routes_constraint_proto" 3 pk
    | Some (4, Pbrt.Bytes) -> begin
      routes_constraint_proto_set_demands v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "routes_constraint_proto" 4 pk
    | Some (5, Pbrt.Varint) -> begin
      routes_constraint_proto_set_capacity v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "routes_constraint_proto" 5 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : routes_constraint_proto)

let rec decode_pb_table_constraint_proto d =
  let v = default_table_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      table_constraint_proto_set_exprs v (List.rev v.exprs);
      table_constraint_proto_set_values v (List.rev v.values);
      table_constraint_proto_set_vars v (List.rev v.vars);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      table_constraint_proto_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "table_constraint_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      table_constraint_proto_set_values v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "table_constraint_proto" 2 pk
    | Some (4, Pbrt.Bytes) -> begin
      table_constraint_proto_set_exprs v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.exprs);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "table_constraint_proto" 4 pk
    | Some (3, Pbrt.Varint) -> begin
      table_constraint_proto_set_negated v (Pbrt.Decoder.bool d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "table_constraint_proto" 3 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : table_constraint_proto)

let rec decode_pb_inverse_constraint_proto d =
  let v = default_inverse_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      inverse_constraint_proto_set_f_inverse v (List.rev v.f_inverse);
      inverse_constraint_proto_set_f_direct v (List.rev v.f_direct);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      inverse_constraint_proto_set_f_direct v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "inverse_constraint_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      inverse_constraint_proto_set_f_inverse v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "inverse_constraint_proto" 2 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : inverse_constraint_proto)

let rec decode_pb_automaton_constraint_proto d =
  let v = default_automaton_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      automaton_constraint_proto_set_exprs v (List.rev v.exprs);
      automaton_constraint_proto_set_vars v (List.rev v.vars);
      automaton_constraint_proto_set_transition_label v (List.rev v.transition_label);
      automaton_constraint_proto_set_transition_head v (List.rev v.transition_head);
      automaton_constraint_proto_set_transition_tail v (List.rev v.transition_tail);
      automaton_constraint_proto_set_final_states v (List.rev v.final_states);
    ); continue__ := false
    | Some (2, Pbrt.Varint) -> begin
      automaton_constraint_proto_set_starting_state v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "automaton_constraint_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      automaton_constraint_proto_set_final_states v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "automaton_constraint_proto" 3 pk
    | Some (4, Pbrt.Bytes) -> begin
      automaton_constraint_proto_set_transition_tail v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "automaton_constraint_proto" 4 pk
    | Some (5, Pbrt.Bytes) -> begin
      automaton_constraint_proto_set_transition_head v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "automaton_constraint_proto" 5 pk
    | Some (6, Pbrt.Bytes) -> begin
      automaton_constraint_proto_set_transition_label v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "automaton_constraint_proto" 6 pk
    | Some (7, Pbrt.Bytes) -> begin
      automaton_constraint_proto_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (7, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "automaton_constraint_proto" 7 pk
    | Some (8, Pbrt.Bytes) -> begin
      automaton_constraint_proto_set_exprs v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.exprs);
    end
    | Some (8, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "automaton_constraint_proto" 8 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : automaton_constraint_proto)

let rec decode_pb_list_of_variables_proto d =
  let v = default_list_of_variables_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      list_of_variables_proto_set_vars v (List.rev v.vars);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      list_of_variables_proto_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "list_of_variables_proto" 1 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : list_of_variables_proto)

let rec decode_pb_constraint_proto_constraint d = 
  let rec loop () = 
    let ret:constraint_proto_constraint = match Pbrt.Decoder.key d with
      | None -> Pbrt.Decoder.malformed_variant "constraint_proto_constraint"
      | Some (3, _) -> (Bool_or (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (4, _) -> (Bool_and (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (26, _) -> (At_most_one (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (29, _) -> (Exactly_one (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (5, _) -> (Bool_xor (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (7, _) -> (Int_div (decode_pb_linear_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (8, _) -> (Int_mod (decode_pb_linear_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (11, _) -> (Int_prod (decode_pb_linear_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (27, _) -> (Lin_max (decode_pb_linear_argument_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (12, _) -> (Linear (decode_pb_linear_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (13, _) -> (All_diff (decode_pb_all_different_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (14, _) -> (Element (decode_pb_element_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (15, _) -> (Circuit (decode_pb_circuit_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (23, _) -> (Routes (decode_pb_routes_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (16, _) -> (Table (decode_pb_table_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (17, _) -> (Automaton (decode_pb_automaton_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (18, _) -> (Inverse (decode_pb_inverse_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (24, _) -> (Reservoir (decode_pb_reservoir_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (19, _) -> (Interval (decode_pb_interval_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (20, _) -> (No_overlap (decode_pb_no_overlap_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (21, _) -> (No_overlap_2d (decode_pb_no_overlap2_dconstraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (22, _) -> (Cumulative (decode_pb_cumulative_constraint_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (30, _) -> (Dummy_constraint (decode_pb_list_of_variables_proto (Pbrt.Decoder.nested d)) : constraint_proto_constraint) 
      | Some (n, payload_kind) -> (
        Pbrt.Decoder.skip d payload_kind; 
        loop () 
      )
    in
    ret
  in
  loop ()

and decode_pb_constraint_proto d =
  let v = default_constraint_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      constraint_proto_set_enforcement_literal v (List.rev v.enforcement_literal);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      constraint_proto_set_name v (Pbrt.Decoder.string d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      constraint_proto_set_enforcement_literal v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Bool_or (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 3 pk
    | Some (4, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Bool_and (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 4 pk
    | Some (26, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (At_most_one (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (26, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 26 pk
    | Some (29, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Exactly_one (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (29, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 29 pk
    | Some (5, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Bool_xor (decode_pb_bool_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 5 pk
    | Some (7, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Int_div (decode_pb_linear_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (7, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 7 pk
    | Some (8, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Int_mod (decode_pb_linear_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (8, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 8 pk
    | Some (11, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Int_prod (decode_pb_linear_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (11, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 11 pk
    | Some (27, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Lin_max (decode_pb_linear_argument_proto (Pbrt.Decoder.nested d)));
    end
    | Some (27, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 27 pk
    | Some (12, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Linear (decode_pb_linear_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (12, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 12 pk
    | Some (13, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (All_diff (decode_pb_all_different_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (13, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 13 pk
    | Some (14, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Element (decode_pb_element_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (14, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 14 pk
    | Some (15, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Circuit (decode_pb_circuit_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (15, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 15 pk
    | Some (23, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Routes (decode_pb_routes_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (23, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 23 pk
    | Some (16, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Table (decode_pb_table_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (16, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 16 pk
    | Some (17, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Automaton (decode_pb_automaton_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (17, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 17 pk
    | Some (18, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Inverse (decode_pb_inverse_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (18, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 18 pk
    | Some (24, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Reservoir (decode_pb_reservoir_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (24, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 24 pk
    | Some (19, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Interval (decode_pb_interval_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (19, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 19 pk
    | Some (20, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (No_overlap (decode_pb_no_overlap_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (20, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 20 pk
    | Some (21, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (No_overlap_2d (decode_pb_no_overlap2_dconstraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (21, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 21 pk
    | Some (22, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Cumulative (decode_pb_cumulative_constraint_proto (Pbrt.Decoder.nested d)));
    end
    | Some (22, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 22 pk
    | Some (30, Pbrt.Bytes) -> begin
      constraint_proto_set_constraint_ v (Dummy_constraint (decode_pb_list_of_variables_proto (Pbrt.Decoder.nested d)));
    end
    | Some (30, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "constraint_proto" 30 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : constraint_proto)

let rec decode_pb_cp_objective_proto d =
  let v = default_cp_objective_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      cp_objective_proto_set_domain v (List.rev v.domain);
      cp_objective_proto_set_coeffs v (List.rev v.coeffs);
      cp_objective_proto_set_vars v (List.rev v.vars);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      cp_objective_proto_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 1 pk
    | Some (4, Pbrt.Bytes) -> begin
      cp_objective_proto_set_coeffs v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 4 pk
    | Some (2, Pbrt.Bits64) -> begin
      cp_objective_proto_set_offset v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 2 pk
    | Some (3, Pbrt.Bits64) -> begin
      cp_objective_proto_set_scaling_factor v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 3 pk
    | Some (5, Pbrt.Bytes) -> begin
      cp_objective_proto_set_domain v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 5 pk
    | Some (6, Pbrt.Varint) -> begin
      cp_objective_proto_set_scaling_was_exact v (Pbrt.Decoder.bool d);
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 6 pk
    | Some (7, Pbrt.Varint) -> begin
      cp_objective_proto_set_integer_before_offset v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (7, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 7 pk
    | Some (9, Pbrt.Varint) -> begin
      cp_objective_proto_set_integer_after_offset v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (9, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 9 pk
    | Some (8, Pbrt.Varint) -> begin
      cp_objective_proto_set_integer_scaling_factor v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (8, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_objective_proto" 8 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : cp_objective_proto)

let rec decode_pb_float_objective_proto d =
  let v = default_float_objective_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      float_objective_proto_set_coeffs v (List.rev v.coeffs);
      float_objective_proto_set_vars v (List.rev v.vars);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      float_objective_proto_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "float_objective_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      float_objective_proto_set_coeffs v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.float_as_bits64 d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "float_objective_proto" 2 pk
    | Some (3, Pbrt.Bits64) -> begin
      float_objective_proto_set_offset v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "float_objective_proto" 3 pk
    | Some (4, Pbrt.Varint) -> begin
      float_objective_proto_set_maximize v (Pbrt.Decoder.bool d);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "float_objective_proto" 4 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : float_objective_proto)

let rec decode_pb_decision_strategy_proto_variable_selection_strategy d : decision_strategy_proto_variable_selection_strategy = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Choose_first
  | 1 -> Choose_lowest_min
  | 2 -> Choose_highest_max
  | 3 -> Choose_min_domain_size
  | 4 -> Choose_max_domain_size
  | _ -> Pbrt.Decoder.malformed_variant "decision_strategy_proto_variable_selection_strategy"

let rec decode_pb_decision_strategy_proto_domain_reduction_strategy d : decision_strategy_proto_domain_reduction_strategy = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Select_min_value
  | 1 -> Select_max_value
  | 2 -> Select_lower_half
  | 3 -> Select_upper_half
  | 4 -> Select_median_value
  | 5 -> Select_random_half
  | _ -> Pbrt.Decoder.malformed_variant "decision_strategy_proto_domain_reduction_strategy"

let rec decode_pb_decision_strategy_proto d =
  let v = default_decision_strategy_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      decision_strategy_proto_set_exprs v (List.rev v.exprs);
      decision_strategy_proto_set_variables v (List.rev v.variables);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      decision_strategy_proto_set_variables v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "decision_strategy_proto" 1 pk
    | Some (5, Pbrt.Bytes) -> begin
      decision_strategy_proto_set_exprs v ((decode_pb_linear_expression_proto (Pbrt.Decoder.nested d)) :: v.exprs);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "decision_strategy_proto" 5 pk
    | Some (2, Pbrt.Varint) -> begin
      decision_strategy_proto_set_variable_selection_strategy v (decode_pb_decision_strategy_proto_variable_selection_strategy d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "decision_strategy_proto" 2 pk
    | Some (3, Pbrt.Varint) -> begin
      decision_strategy_proto_set_domain_reduction_strategy v (decode_pb_decision_strategy_proto_domain_reduction_strategy d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "decision_strategy_proto" 3 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : decision_strategy_proto)

let rec decode_pb_partial_variable_assignment d =
  let v = default_partial_variable_assignment () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      partial_variable_assignment_set_values v (List.rev v.values);
      partial_variable_assignment_set_vars v (List.rev v.vars);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      partial_variable_assignment_set_vars v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "partial_variable_assignment" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      partial_variable_assignment_set_values v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "partial_variable_assignment" 2 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : partial_variable_assignment)

let rec decode_pb_sparse_permutation_proto d =
  let v = default_sparse_permutation_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      sparse_permutation_proto_set_cycle_sizes v (List.rev v.cycle_sizes);
      sparse_permutation_proto_set_support v (List.rev v.support);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      sparse_permutation_proto_set_support v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sparse_permutation_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      sparse_permutation_proto_set_cycle_sizes v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "sparse_permutation_proto" 2 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : sparse_permutation_proto)

let rec decode_pb_dense_matrix_proto d =
  let v = default_dense_matrix_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      dense_matrix_proto_set_entries v (List.rev v.entries);
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      dense_matrix_proto_set_num_rows v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "dense_matrix_proto" 1 pk
    | Some (2, Pbrt.Varint) -> begin
      dense_matrix_proto_set_num_cols v (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "dense_matrix_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      dense_matrix_proto_set_entries v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "dense_matrix_proto" 3 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : dense_matrix_proto)

let rec decode_pb_symmetry_proto d =
  let v = default_symmetry_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      symmetry_proto_set_orbitopes v (List.rev v.orbitopes);
      symmetry_proto_set_permutations v (List.rev v.permutations);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      symmetry_proto_set_permutations v ((decode_pb_sparse_permutation_proto (Pbrt.Decoder.nested d)) :: v.permutations);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "symmetry_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      symmetry_proto_set_orbitopes v ((decode_pb_dense_matrix_proto (Pbrt.Decoder.nested d)) :: v.orbitopes);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "symmetry_proto" 2 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : symmetry_proto)

let rec decode_pb_cp_model_proto d =
  let v = default_cp_model_proto () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      cp_model_proto_set_assumptions v (List.rev v.assumptions);
      cp_model_proto_set_search_strategy v (List.rev v.search_strategy);
      cp_model_proto_set_constraints v (List.rev v.constraints);
      cp_model_proto_set_variables v (List.rev v.variables);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      cp_model_proto_set_name v (Pbrt.Decoder.string d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      cp_model_proto_set_variables v ((decode_pb_integer_variable_proto (Pbrt.Decoder.nested d)) :: v.variables);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 2 pk
    | Some (3, Pbrt.Bytes) -> begin
      cp_model_proto_set_constraints v ((decode_pb_constraint_proto (Pbrt.Decoder.nested d)) :: v.constraints);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 3 pk
    | Some (4, Pbrt.Bytes) -> begin
      cp_model_proto_set_objective v (decode_pb_cp_objective_proto (Pbrt.Decoder.nested d));
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 4 pk
    | Some (9, Pbrt.Bytes) -> begin
      cp_model_proto_set_floating_point_objective v (decode_pb_float_objective_proto (Pbrt.Decoder.nested d));
    end
    | Some (9, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 9 pk
    | Some (5, Pbrt.Bytes) -> begin
      cp_model_proto_set_search_strategy v ((decode_pb_decision_strategy_proto (Pbrt.Decoder.nested d)) :: v.search_strategy);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 5 pk
    | Some (6, Pbrt.Bytes) -> begin
      cp_model_proto_set_solution_hint v (decode_pb_partial_variable_assignment (Pbrt.Decoder.nested d));
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 6 pk
    | Some (7, Pbrt.Bytes) -> begin
      cp_model_proto_set_assumptions v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (7, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 7 pk
    | Some (8, Pbrt.Bytes) -> begin
      cp_model_proto_set_symmetry v (decode_pb_symmetry_proto (Pbrt.Decoder.nested d));
    end
    | Some (8, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_model_proto" 8 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : cp_model_proto)

let rec decode_pb_cp_solver_status d : cp_solver_status = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> Unknown
  | 1 -> Model_invalid
  | 2 -> Feasible
  | 3 -> Infeasible
  | 4 -> Optimal
  | _ -> Pbrt.Decoder.malformed_variant "cp_solver_status"

let rec decode_pb_cp_solver_solution d =
  let v = default_cp_solver_solution () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      cp_solver_solution_set_values v (List.rev v.values);
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      cp_solver_solution_set_values v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_solution" 1 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : cp_solver_solution)

let rec decode_pb_cp_solver_response d =
  let v = default_cp_solver_response () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      (* put lists in the correct order *)
      cp_solver_response_set_sufficient_assumptions_for_infeasibility v (List.rev v.sufficient_assumptions_for_infeasibility);
      cp_solver_response_set_tightened_variables v (List.rev v.tightened_variables);
      cp_solver_response_set_additional_solutions v (List.rev v.additional_solutions);
      cp_solver_response_set_solution v (List.rev v.solution);
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      cp_solver_response_set_status v (decode_pb_cp_solver_status d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 1 pk
    | Some (2, Pbrt.Bytes) -> begin
      cp_solver_response_set_solution v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int64_as_varint d)::l) [] d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 2 pk
    | Some (3, Pbrt.Bits64) -> begin
      cp_solver_response_set_objective_value v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 3 pk
    | Some (4, Pbrt.Bits64) -> begin
      cp_solver_response_set_best_objective_bound v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 4 pk
    | Some (27, Pbrt.Bytes) -> begin
      cp_solver_response_set_additional_solutions v ((decode_pb_cp_solver_solution (Pbrt.Decoder.nested d)) :: v.additional_solutions);
    end
    | Some (27, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 27 pk
    | Some (21, Pbrt.Bytes) -> begin
      cp_solver_response_set_tightened_variables v ((decode_pb_integer_variable_proto (Pbrt.Decoder.nested d)) :: v.tightened_variables);
    end
    | Some (21, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 21 pk
    | Some (23, Pbrt.Bytes) -> begin
      cp_solver_response_set_sufficient_assumptions_for_infeasibility v @@ Pbrt.Decoder.packed_fold (fun l d -> (Pbrt.Decoder.int32_as_varint d)::l) [] d;
    end
    | Some (23, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 23 pk
    | Some (28, Pbrt.Bytes) -> begin
      cp_solver_response_set_integer_objective v (decode_pb_cp_objective_proto (Pbrt.Decoder.nested d));
    end
    | Some (28, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 28 pk
    | Some (29, Pbrt.Varint) -> begin
      cp_solver_response_set_inner_objective_lower_bound v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (29, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 29 pk
    | Some (30, Pbrt.Varint) -> begin
      cp_solver_response_set_num_integers v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (30, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 30 pk
    | Some (10, Pbrt.Varint) -> begin
      cp_solver_response_set_num_booleans v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (10, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 10 pk
    | Some (31, Pbrt.Varint) -> begin
      cp_solver_response_set_num_fixed_booleans v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (31, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 31 pk
    | Some (11, Pbrt.Varint) -> begin
      cp_solver_response_set_num_conflicts v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (11, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 11 pk
    | Some (12, Pbrt.Varint) -> begin
      cp_solver_response_set_num_branches v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (12, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 12 pk
    | Some (13, Pbrt.Varint) -> begin
      cp_solver_response_set_num_binary_propagations v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (13, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 13 pk
    | Some (14, Pbrt.Varint) -> begin
      cp_solver_response_set_num_integer_propagations v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (14, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 14 pk
    | Some (24, Pbrt.Varint) -> begin
      cp_solver_response_set_num_restarts v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (24, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 24 pk
    | Some (25, Pbrt.Varint) -> begin
      cp_solver_response_set_num_lp_iterations v (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (25, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 25 pk
    | Some (15, Pbrt.Bits64) -> begin
      cp_solver_response_set_wall_time v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (15, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 15 pk
    | Some (16, Pbrt.Bits64) -> begin
      cp_solver_response_set_user_time v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (16, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 16 pk
    | Some (17, Pbrt.Bits64) -> begin
      cp_solver_response_set_deterministic_time v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (17, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 17 pk
    | Some (22, Pbrt.Bits64) -> begin
      cp_solver_response_set_gap_integral v (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (22, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 22 pk
    | Some (20, Pbrt.Bytes) -> begin
      cp_solver_response_set_solution_info v (Pbrt.Decoder.string d);
    end
    | Some (20, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 20 pk
    | Some (26, Pbrt.Bytes) -> begin
      cp_solver_response_set_solve_log v (Pbrt.Decoder.string d);
    end
    | Some (26, pk) -> 
      Pbrt.Decoder.unexpected_payload_message "cp_solver_response" 26 pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  (v : cp_solver_response)
