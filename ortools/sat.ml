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

module PB = Cp_model

(* Ersatz DynArray for OCaml < 5.2 *)
module DynArray = struct (* {{{ *)

  let max32 = Int32.(to_int max_int)

  type 'a t = {
    mutable contents : ('a option) array;
    mutable size : int;
    size_inc : int;
  }

  let make n =
    let n = Int.min n max32 in
    {
      contents = Array.make n None;
      size = 0;
      size_inc = n;
    }

  let add_last ({ size; size_inc; contents } as a) v =
    if size = Array.length contents then begin
      let size' = Int.min (size + size_inc) max32 in
      if size' <= size then invalid_arg "too many variables";
      a.contents <-
        Array.init (size + size_inc)
          (fun i -> if i < size then Array.get contents i else None);
    end;
    Array.set a.contents size (Some v);
    a.size <- size + 1;
    size (* index of added element *)

  let to_list { contents; size; _ } =
    let rec f i xs =
      if i < 0 then xs
      else f (i - 1) (Option.get (Array.get contents i) :: xs)
    in
    f (size - 1) []

end (* }}} *)

type var = int (* int32 *)
type lit = int (* int32 *)
type intval = int (* int64 *)

type t = {
  name                : string option;
  variables           : PB.integer_variable_proto DynArray.t;
  mutable constraints : PB.constraint_proto list;
  mutable objective   : PB.cp_objective_proto option;
  mutable hints       : (var * intval) list;
  mutable assumptions : lit list;

  constant_to_index_map  : (intval, var) Hashtbl.t;
}

module Var = struct (* {{{ *)

  type 'a var = int
  type 'a t = 'a var
  (* TODO: track owning model and check for errors? *)

  type t_bool = [`Bool] t
  type t_int  = [`Int] t

  let new_int { variables; _ } ?name ~lb ~ub () =
    (* if lb > ub then invalid_arg "required: lb <= ub"; *)
    let nvar = PB.default_integer_variable_proto () in
    PB.integer_variable_proto_set_domain nvar [Int64.of_int lb; Int64.of_int ub];
    Option.iter (PB.integer_variable_proto_set_name nvar) name;
    DynArray.add_last variables nvar

  let new_bool { variables; _ } ?name () =
    let nvar = PB.default_integer_variable_proto () in
    PB.integer_variable_proto_set_domain nvar [Int64.zero; Int64.one];
    Option.iter (PB.integer_variable_proto_set_name nvar) name;
    DynArray.add_last variables nvar

  let neg = Int.neg

  let ref_is_positive ref = ref >= 0
  let negated_ref ref = (neg ref) - 1

  let to_index ref =
    if ref_is_positive ref then ref
    else negated_ref ref

  let new_constant ({ constant_to_index_map; _ } as m) c =
    match Hashtbl.find_opt constant_to_index_map c with
    | None ->
        let v = new_int m ~lb:c ~ub:c () in
        Hashtbl.add constant_to_index_map c v;
        v
    | Some v -> v

  let to_bool x = x (* TODO: check domain *)
  let to_int x = x (* TODO: ensure not negative *)

  (* TODO: richer domains? *)
  (* TODO: to_string, pp, etc. *)

end (* }}} *)

(* Linear Constraints *)

module LinearExpr = struct (* {{{ *)

  type t = intval * (intval * [`Bool|`Int] Var.t) list

  let convert k (c, v) =
    if Var.ref_is_positive v
    then (k, (c, v))
    else (k + 1, (- c, Var.negated_ref v)) (* add 1 - var *)

  let converts = List.fold_left_map convert 0

  let sum = List.fold_left_map (fun k v -> convert k (1, v)) 0

  let weighted_sum = List.fold_left_map convert 0

  let term cv = converts [cv]

  let scale s (k, vs) = (s * k, List.map (fun (c, v) -> (s * c, v)) vs)

  let of_int c = (c, [])

  let var v = term (1, v)

  let neg (k, cvs) = (-k, List.map (fun (c, v) -> (-c, v)) cvs)

  module L = struct (* {{{ *)

    let ( * ) c v = term (c, v)

    let ( + ) (k_l, vs_l) (k_r, vs_r) = (k_l + k_r, vs_l @ vs_r)

    let ( - ) lhs rhs = lhs + (neg rhs)

    let var = var
    let scale = scale
    let of_int = of_int

  end (* }}} *)

  let to_proto (k, vs) =
    let coeffs, vars = List.split vs in
    PB.make_linear_expression_proto
      ~vars:(List.map Int32.of_int vars)
      ~coeffs:(List.map Int64.of_int coeffs)
      ~offset:(Int64.of_int k) ()

  let to_objective_proto (k, vs) =
    let coeffs, vars = List.split vs in
    PB.make_cp_objective_proto
      ~vars:(List.map Int32.of_int vars)
      ~coeffs:(List.map Int64.of_int coeffs)
      ~offset:(Int.to_float k) ()

end (* }}} *)

module Constraint = struct (* {{{ *)

  type equality = {
    target: LinearExpr.t;
    exprs: LinearExpr.t list;
  }

  let check_equality { target; exprs = _ } =
    (match target with
     | (_, [ _ ]) -> ()
     | _ -> invalid_arg "target must be a constant or (scaled) variable")

  type equality2 = {
    target: LinearExpr.t;
    arg1:   LinearExpr.t;
    arg2:   LinearExpr.t;
  }

  let check_equality2 { target; arg1 = _; arg2 } =
    (match target with
     | (_, [ _ ]) -> ()
     | _ -> invalid_arg "target must be a constant or (scaled) variable");
    (match arg2 with
     | (_, [ (_, _v) ]) -> () (* should check that _v.ub = _v.lb... *)
     | _ -> invalid_arg "arg2 must be a (scaled) constant");

  type lt = PB.linear_constraint_proto

  type t =
    | Or of Var.t_bool list
    | And of Var.t_bool list
    | At_most_one of Var.t_bool list
    | Exactly_one of Var.t_bool list
    | Xor of Var.t_bool list
    | Div of equality2
    | Mod of equality2
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

  let check = function
    | Div eq2 | Mod eq2 -> check_equality2 eq2
    | Prod eq | Max eq -> check_equality eq
    | Or _ | And _ | At_most_one _ | Exactly_one _ | Xor _
    | Linear _ | All_diff _ -> ()

  let not x = Var.neg x
  let bool_or bs = Or bs
  let bool_and bs = And bs
  let bool_xor bs = Xor bs
  let at_most_one bs = At_most_one bs
  let exactly_one bs = Exactly_one bs
  let multiplication_equality x exprs =
    Prod { target = LinearExpr.var x; exprs }
  let division_equality x e c =
    Div { target = LinearExpr.var x; arg1 = e; arg2 = LinearExpr.of_int c }
  let modulo_equality x e c =
    Mod { target = LinearExpr.var x; arg1 = e; arg2 = LinearExpr.of_int c }
  let max_equality x exprs =
    Max { target = LinearExpr.var x; exprs }
  let all_different exprs = All_diff exprs

  let min { target; exprs } =
    Max { target = LinearExpr.scale (-1) target;
          exprs = List.map (LinearExpr.scale (-1)) exprs }
  let min_equality x exprs =
    min { target = LinearExpr.var x; exprs }

  let at_least_one bs = Or bs

  let implication a b = Or [Var.neg a; b]

  let abs { target; exprs } =
    Max { target;
          exprs = exprs @ List.map (LinearExpr.scale (-1)) exprs }
  let abs_equality x exprs =
    abs { target = LinearExpr.var x; exprs }

  let equality2_proto { target; arg1; arg2 } =
    let target = LinearExpr.to_proto target in
    PB.make_linear_argument_proto ~target
                                  ~exprs:[LinearExpr.to_proto arg1;
                                          LinearExpr.to_proto arg2] ()

  let equality_proto { target; exprs } =
    let target = LinearExpr.to_proto target in
    let exprs = List.map LinearExpr.to_proto exprs in
    PB.make_linear_argument_proto ~target ~exprs ()

  let int32 = List.map Int32.of_int

  let to_proto = function
    | Or bs  -> PB.(Bool_or (make_bool_argument_proto ~literals:(int32 bs) ()))
    | And bs -> PB.(Bool_and (make_bool_argument_proto ~literals:(int32 bs) ()))
    | At_most_one bs -> PB.(At_most_one (make_bool_argument_proto ~literals:(int32 bs) ()))
    | Exactly_one bs -> PB.(Exactly_one (make_bool_argument_proto ~literals:(int32 bs) ()))
    | Xor bs  -> PB.(Bool_xor (make_bool_argument_proto ~literals:(int32 bs) ()))
    | Div eq2 -> PB.(Int_div (equality2_proto eq2))
    | Mod eq2 -> PB.(Int_mod (equality2_proto eq2))
    | Prod eq -> PB.(Int_prod (equality_proto eq))
    | Max eq  -> PB.(Lin_max (equality_proto eq))
    | Linear lc      -> PB.(Linear lc)
    | All_diff exprs ->
        let exprs = List.map LinearExpr.to_proto exprs in
        PB.(All_diff (PB.make_all_different_constraint_proto ~exprs ()))

  let of_expr (k, vs) ~lb ~ub =
    let k = Int64.of_int k in
    let coeffs, vars = List.split vs in
    Linear (PB.make_linear_constraint_proto
              ~vars:(List.map Int32.of_int vars)
              ~coeffs:(List.map Int64.of_int coeffs)
              ~domain:Int64.[sub (of_int lb) k; sub (of_int ub) k]
              ())

  let fill_linear_terms (_, vs_l) (_, vs_r) =
    let coeffs_l, vars_l = List.split vs_l in
    let coeffs_r, vars_r = List.split vs_r in
    (PB.make_linear_constraint_proto
       ~vars:((List.map Int32.of_int vars_l) @ (List.map Int32.of_int vars_r))
       ~coeffs:(List.map Int64.of_int coeffs_l
                @ List.map (fun c -> Int64.of_int (-c)) coeffs_r)
       ())

  let (==) ((k_l, _) as left) ((k_r, _) as right) =
    let v = fill_linear_terms left right in
    let rhs = Int64.of_int (k_r - k_l) in
    PB.linear_constraint_proto_set_domain v [rhs; rhs];
    Linear v

  let (>=) ((k_l, _) as left) ((k_r, _) as right) =
    let v = fill_linear_terms left right in
    let rhs = Int64.of_int (k_r - k_l) in
    PB.linear_constraint_proto_set_domain v [rhs; Int64.max_int];
    Linear v

  let (<=) ((k_l, _) as left) ((k_r, _) as right) =
    let v = fill_linear_terms left right in
    let rhs = Int64.of_int (k_r - k_l) in
    PB.linear_constraint_proto_set_domain v Int64.[min_int; rhs];
    Linear v

  let (>) ((k_l, _) as left) ((k_r, _) as right) =
    let v = fill_linear_terms left right in
    let rhs = Int64.of_int (k_r - k_l) in
    PB.linear_constraint_proto_set_domain v Int64.[add rhs one; Int64.max_int];
    Linear v

  let (<) ((k_l, _) as left) ((k_r, _) as right) =
    let v = fill_linear_terms left right in
    let rhs = Int64.of_int (k_r - k_l) in
    PB.linear_constraint_proto_set_domain v Int64.[min_int; sub rhs one];
    Linear v

  let (!=) ((k_l, _) as left) ((k_r, _) as right) =
    let v = fill_linear_terms left right in
    let rhs = Int64.of_int (k_r - k_l) in
    PB.linear_constraint_proto_set_domain v
      Int64.[min_int; sub rhs one; add rhs one; max_int];
    Linear v

  include LinearExpr.L

end (* }}} *)

let make ?(nvars=10000) ?name () = {
  name;
  variables = DynArray.make nvars;
  constraints = [];
  objective = None;
  hints = [];
  assumptions = [];
  constant_to_index_map = Hashtbl.create (nvars / 10);
}

let to_proto { name; variables; constraints; objective;
               hints; assumptions; constant_to_index_map = _ } =
  let solution_hint =
    match hints with
    | [] -> None
    | xs ->
        let vars, values = List.split xs in
        Some (PB.make_partial_variable_assignment
                ~vars:(List.map Int32.of_int vars)
                ~values:(List.map Int64.of_int values) ())
  in
  let assumptions = match assumptions with
      | [] -> None
      | xs -> Some (List.map Int32.of_int xs)
  in
  PB.make_cp_model_proto
    ?name
    ~variables:(DynArray.to_list variables)
    ~constraints
    ?objective
    ?solution_hint
    ?assumptions
    ()

let pb_encode m enc = PB.encode_pb_cp_model_proto (to_proto m) enc

let pb_output m oc =
  let encoder = Pbrt.Encoder.create () in
  pb_encode m encoder;
  Pbrt.Encoder.write_chunks (output oc) encoder

module Parameters =
  struct
    type t = Sat_parameters.sat_parameters

    let defaults = Sat_parameters.default_sat_parameters

    let pb_encode params enc = Sat_parameters.encode_pb_sat_parameters params enc

    let pb_output params oc =
      let encoder = Pbrt.Encoder.create () in
      pb_encode params encoder;
      Pbrt.Encoder.write_chunks (output oc) encoder
  end

let add ({ constraints; _ } as m) ?name ?(only_enforce_if=[]) c =
  Constraint.check c;
  let enforcement_literal =
    match only_enforce_if with [] -> None | xs -> Some (List.map Int32.of_int xs) in
  let constraint_ = Constraint.to_proto c in
  let c = PB.make_constraint_proto ?name ?enforcement_literal ~constraint_ () in
  m.constraints <- c :: constraints

let add_implication m ?name lhs rhs =
  add m ?name ~only_enforce_if:lhs (Constraint.And rhs)

let minimize m expr =
  m.objective <- Some LinearExpr.(to_objective_proto expr)

let maximize m expr =
  let obj = LinearExpr.(to_objective_proto (scale (-1) expr)) in
  PB.cp_objective_proto_set_scaling_factor obj (-1.0);
  m.objective <- Some obj

let fix_hint (v, c) =
  if Var.ref_is_positive v
  then (v, c)
  else (Var.negated_ref v, if c = 0 then 1 else 0)

let add_hint ({ hints; _ } as m) v c =
  m.hints <- fix_hint (v, c) :: hints

let add_hints ({ hints; _ } as m) vcs =
  m.hints <- List.(rev_append (map fix_hint vcs) hints)

let clear_hints m =
  m.hints <- []

let add_assumptions ({ assumptions; _ } as m) bs =
  m.assumptions <- List.rev_append bs assumptions

let clear_assumptions m =
  m.assumptions <- []

module Response =
  struct

    type status =
      | Unknown
      | ModelInvalid
      | Feasible
      | Infeasible
      | Optimal

    let string_of_status = function
      | Unknown      -> "UNKNOWN"
      | ModelInvalid -> "MODEL_INVALID"
      | Feasible     -> "FEASIBLE"
      | Infeasible   -> "INFEASIBLE"
      | Optimal      -> "OPTIMAL"

    type vardom = {
      name : string;
      domain : (int64 * int64) list;
    }

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

    let int_of_int64 (x : int64) =
       if Int64.of_int min_int <= x && x <= Int64.of_int max_int
       then Int64.to_int x
       else failwith "int64 is too big for int"

    let rec make_domain = function
      | [] -> []
      | lb::ub::xs -> (lb, ub) :: make_domain xs
      | _ -> failwith "domain is not a list of pairs"

    let objective_of_proto PB.{ _presence;
                                vars;
                                coeffs;
                                offset;
                                scaling_factor;
                                domain;
                                scaling_was_exact;
                                integer_before_offset;
                                integer_after_offset;
                                integer_scaling_factor } =
      {
        terms = List.map2 (fun c v -> (int_of_int64 c, Int32.to_int v)) coeffs vars;
        offset;
        scaling_factor;
        domain = make_domain domain;
        scaling_was_exact;
        integer_before_offset;
        integer_after_offset;
        integer_scaling_factor;
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
      integer_objective_lower_bound            : int;
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

    let rec int_of_int64_seq xs () =
      match xs with
      | [] -> Seq.Nil
      | x :: xs -> Seq.Cons (int_of_int64 x, int_of_int64_seq xs)

    let solution_array x = Array.of_seq (int_of_int64_seq x)

    let make_vardom PB.{ _presence; name; domain } =
      { name; domain = make_domain domain }

    let of_proto PB.{ _presence;
                      status;
                      solution;
                      objective_value;
                      best_objective_bound;
                      additional_solutions;
                      tightened_variables;
                      sufficient_assumptions_for_infeasibility;
                      integer_objective;
                      inner_objective_lower_bound;
                      num_integers;
                      num_booleans;
                      num_fixed_booleans;
                      num_conflicts;
                      num_branches;
                      num_binary_propagations;
                      num_integer_propagations;
                      num_restarts;
                      num_lp_iterations;
                      wall_time;
                      user_time;
                      deterministic_time;
                      gap_integral;
                      solution_info;
                      solve_log;
    } = {
      status                      = (match status with
                                     | PB.Unknown       -> Unknown
                                     | PB.Model_invalid -> ModelInvalid
                                     | PB.Feasible      -> Feasible
                                     | PB.Infeasible    -> Infeasible
                                     | PB.Optimal       -> Optimal);
      solution                    = solution_array solution;
      objective_value;
      best_objective_bound;
      additional_solutions        = List.map
                                      (fun PB.{values} -> solution_array values)
                                      additional_solutions;
      tightened_variables         = List.map make_vardom tightened_variables;
      sufficient_assumptions_for_infeasibility =
        List.map Int32.to_int sufficient_assumptions_for_infeasibility;
      integer_objective           = Option.map objective_of_proto integer_objective;
      integer_objective_lower_bound = int_of_int64 inner_objective_lower_bound;
      num_integers                = int_of_int64 num_integers;
      num_booleans                = int_of_int64 num_booleans;
      num_fixed_booleans          = int_of_int64 num_fixed_booleans;
      num_conflicts               = int_of_int64 num_conflicts;
      num_branches                = int_of_int64 num_branches;
      num_binary_propagations     = int_of_int64 num_binary_propagations;
      num_integer_propagations    = int_of_int64 num_integer_propagations;
      num_restarts                = int_of_int64 num_restarts;
      num_lp_iterations           = int_of_int64 num_lp_iterations;
      wall_time;
      user_time;
      deterministic_time;
      gap_integral;
      solution_info;
      solve_log;
    }

  end

type raw_solver = parameters_pb:string -> model_pb:string -> string

let solve (raw_solver : raw_solver) ?parameters model =
  (* encode model *)
  let enc = Pbrt.Encoder.create () in
  pb_encode model enc;
  let model_pb = Pbrt.Encoder.to_string enc in

  (* encode parameters *)
  let parameters = match parameters with
                   | None -> Sat_parameters.default_sat_parameters ()
                   | Some p -> p
  in
  Pbrt.Encoder.clear enc;
  Parameters.pb_encode parameters enc;
  let parameters_pb = Pbrt.Encoder.to_string enc in
  Pbrt.Encoder.reset enc;

  (* solve and decode response *)
  let response_pb = raw_solver ~parameters_pb ~model_pb in
  let dec = Pbrt.Decoder.of_string response_pb in
  let response = Cp_model.decode_pb_cp_solver_response dec in
  Response.of_proto response

include LinearExpr.L
let (<=) x y  = Constraint.(x <= of_int y)
let (>=) x y  = Constraint.(x >= of_int y)
let (<)  x y  = Constraint.(x < of_int y)
let (>)  x y  = Constraint.(x > of_int y)
let (==) x y  = Constraint.(x == of_int y)
let (!=) x y  = Constraint.(x != of_int y)

