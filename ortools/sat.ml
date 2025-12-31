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

let option_of_list ~map = function [] -> None | xs -> Some (map xs)

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

  let get { contents; _ } i = Array.get contents i

end (* }}} *)

type var = int (* int32 *)
type intval = int (* int64 *)

type t = {
  name                : string option;
  variables           : PB.integer_variable_proto DynArray.t;
  mutable constraints : PB.constraint_proto list;
  mutable objective   : PB.cp_objective_proto option;
  mutable hints       : (var * intval) list;
  mutable assumptions : int32 list;
  mutable search_strategy : PB.decision_strategy_proto list;

  constant_to_index_map  : (intval, var) Hashtbl.t;
}

type model = t

module I64 = struct
  let (<) x y = Int64.compare x y < 0
  let (<=) x y = Int64.compare x y <= 0
  let (+) x y = Int64.add x y
end

let my_print_list pp_v fmt lparen xs rparen =
  let rec f = function
  | [] -> ()
  | [x] -> pp_v fmt x
  | x::xs ->
      Format.(pp_v fmt x; pp_print_char fmt ','; pp_print_space fmt (); f xs)
  in
  Format.pp_open_hvbox fmt 1;
  Format.pp_print_char fmt lparen;
  f xs;
  Format.pp_print_char fmt rparen;
  Format.pp_close_box fmt ()

module Domain = struct (* {{{ *)

  type t = (int64 * int64) list

  let compare_ivals (l1, _) (l2, _) = Int64.compare l1 l2

  let normalize xs =
    let open I64 in
    let rec f = function
      | (l1, u1) :: (((l2, u2) :: xs) as luxs) ->
          if u1 < l1 then f luxs
          else if u2 <= u1 then f ((l1, u1) :: xs)
          else if l2 <= u1 + 1L then f ((l1, u2) :: xs)
          else (l1, u1) :: f luxs
      | xs -> xs
    in
    f (List.fast_sort compare_ivals xs)

  let of_interval ?lb ?ub () =
    [(Option.(value ~default:Int64.min_int (map Int64.of_int lb)),
      Option.(value ~default:Int64.max_int (map Int64.of_int ub)))]

  let of_intervals xs =
    normalize (List.map (fun (l, u) -> Int64.(of_int l, of_int u)) xs)

  let of_values xs =
    normalize (List.(map (fun x -> (Int64.of_int x, Int64.of_int x))
                       (sort_uniq Int.compare xs)))

  let (@) lhs rhs = normalize (List.append lhs rhs)

  let union xs = normalize (List.concat xs)

  let flatten = List.concat_map (fun (l, u) -> [l; u])

  let pp1 fmt (lb, ub) =
    if lb = ub then Format.fprintf fmt "%Ld" lb
    else Format.fprintf fmt "[%Ld, %Ld]" lb ub

  let pp fmt xs =
    match xs with
    | [] -> Format.pp_print_string fmt "empty"
    | [x] -> pp1 fmt x
    | xs -> my_print_list pp1 fmt '[' xs ']'

  let to_string xs = Format.asprintf "%a" pp xs

end (* }}} *)

module Var = struct (* {{{ *)

  type 'a var = t * int
  type 'a t = 'a var

  type t_bool = [`Bool] t
  type t_int  = [`Int] t

  let new_int ({ variables; _ } as m) ~lb ~ub name =
    if lb > ub then invalid_arg "required: lb <= ub";
    let nvar = PB.make_integer_variable_proto
                 ~name ~domain:[Int64.of_int lb; Int64.of_int ub] ()
    in
    (m, DynArray.add_last variables nvar)

  let new_int_from_domain ({ variables; _ } as m) domain name =
    let nvar = PB.make_integer_variable_proto
                 ~name ~domain:(Domain.flatten domain) ()
    in
    (m, DynArray.add_last variables nvar)

  let new_bool m name = new_int m name ~lb:0 ~ub:1

  let ref_is_positive ref = ref >= 0
  let negated_ref ref = (Int.neg ref) - 1

  let not (m, x) = (m, negated_ref x)

  let to_index (_, ref) =
    if ref_is_positive ref then ref
    else negated_ref ref

  let new_constant ({ constant_to_index_map; _ } as m) c =
    match Hashtbl.find_opt constant_to_index_map c with
    | None ->
        let ((_, v) as nv) =
          new_int m ~lb:c ~ub:c ("_constant=" ^ Int.to_string c)
        in
        Hashtbl.add constant_to_index_map c v;
        nv
    | Some v -> (m, v)

  let to_bool ({ variables; _ } as m, x) =
    if ref_is_positive x
    then match DynArray.get variables x with
         | Some { PB.domain = [ 0L; 1L ]; _ } -> (m, x)
         | _ -> invalid_arg "not valid as a boolean variable"
    else invalid_arg "converting from negated boolean variable"

  let to_int (m, x) =
    if ref_is_positive x then (m, x)
    else invalid_arg "converting from negated boolean variable"

  let to_int32 (_, x) = Int32.of_int x

  let to_string ({ variables; _ }, x) =
    if ref_is_positive x
    then match DynArray.get variables x with
         | Some { PB.name = n; _ } -> n
         | _ -> assert false
    else match DynArray.get variables (negated_ref x) with
         | Some { PB.name = n; _ } -> "Not(" ^ n ^ ")"
         | _ -> assert false

  let pp fmt v = Format.pp_print_string fmt (to_string v)

end (* }}} *)

(* Linear Constraints *)

module LinearExpr = struct (* {{{ *)

  type t = intval * (intval * [`Bool|`Int] Var.t) list

  let zero = (0, [])

  let convert k (c, ((m, v) : 'a Var.t)) =
    if Var.ref_is_positive v
    then (k, (c, (m, v)))
    else (k + 1, (- c, (m, Var.negated_ref v))) (* add 1 - var *)

  let converts = List.fold_left_map convert 0

  let sum_vars = List.fold_left_map (fun k v -> convert k (1, v)) 0

  let weighted_sum = List.fold_left_map convert 0

  let term cv = converts [cv]

  let scale s (k, vs) = (s * k, List.map (fun (c, v) -> (s * c, v)) vs)

  let of_int c = (c, [])

  let var v = term (1, v)

  let neg (k, cvs) = (-k, List.map (fun (c, v) -> (-c, v)) cvs)

  let pp fmt (k, cvs) =
    let rec f first =
      function
      | [] ->
          if k = 0 then ()
          else if first then Format.pp_print_int fmt k
          else if k > 0 then Format.fprintf fmt "@ + %d" k
          else Format.fprintf fmt "@ - %d" (-k)
      | (c, v)::cvs ->
          if c = 0 then f first cvs
          else begin
            if c = 1 then Format.fprintf fmt "@ + %a" Var.pp v
            else if c > 0 then Format.fprintf fmt "@ + %d * %a" c Var.pp v
            else Format.fprintf fmt "@ - %d * %a" (-c) Var.pp v;
            f false cvs
          end
    in
    f true cvs

  let to_string e = Format.asprintf "%a" pp e

  module L = struct (* {{{ *)

    let zero = zero

    let ( * ) c v = term (c, v)

    let ( + ) (k_l, vs_l) (k_r, vs_r) = (k_l + k_r, vs_l @ vs_r)

    let ( - ) lhs rhs = lhs + (neg rhs)

    let var = var
    let scale = scale
    let of_int = of_int
    let not = Var.not

  end (* }}} *)

  let sum es = List.fold_right (fun e v -> L.(v + e)) es zero

  let to_proto (k, vs) =
    let coeffs, vars = List.split vs in
    PB.make_linear_expression_proto
      ~vars:(List.map Var.to_int32 vars)
      ~coeffs:(List.map Int64.of_int coeffs)
      ~offset:(Int64.of_int k) ()

  let to_objective_proto (k, vs) =
    let coeffs, vars = List.split vs in
    PB.make_cp_objective_proto
      ~vars:(List.map Var.to_int32 vars)
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
     | _ -> invalid_arg "arg2 must be a (scaled) constant")

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
    | Linear of LinearExpr.t * Domain.t
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
    | Or _ | And _ | At_most_one _ | Exactly_one _ | Xor _ | All_diff _
    | Linear (_, _) -> ()

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

  module WithArray = struct

    let bool_or bs = bool_or (Array.to_list bs)

    let bool_and bs = bool_and (Array.to_list bs)

    let bool_xor bs = bool_xor (Array.to_list bs)

    let at_most_one bs = at_most_one (Array.to_list bs)

    let exactly_one bs = exactly_one (Array.to_list bs)

    let at_least_one bs = at_least_one (Array.to_list bs)

    let sum es = Array.fold_right LinearExpr.L.(+) es LinearExpr.L.zero

    let vars xs = Array.fold_right LinearExpr.L.(fun v e -> 1 * v + e)
                    xs LinearExpr.L.zero

  end

  let implication a b = Or [Var.not a; b]

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

  let int32 = List.map Var.to_int32

  let lt_to_proto (k, vs) domain =
    let k = Int64.of_int k in
    let coeffs, vars = List.split vs in
    PB.make_linear_constraint_proto
      ~coeffs:(List.map Int64.of_int coeffs)
      ~vars:(List.map Var.to_int32 vars)
      ~domain:(List.map (fun b -> Int64.(sub b k)) (Domain.flatten domain))
      ()

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
    | Linear (expr, domain) -> PB.(Linear (lt_to_proto expr domain))
    | All_diff exprs ->
        let exprs = List.map LinearExpr.to_proto exprs in
        PB.(All_diff (PB.make_all_different_constraint_proto ~exprs ()))

  let of_expr expr ~lb ~ub = Linear (expr, Domain.of_interval ~lb ~ub ())

  let in_domain expr domain = Linear (expr, domain)

  module Linear = struct

    let (==) lhs rhs =
      let (k, vs) = LinearExpr.L.(lhs - rhs) in
      Linear ((0, vs), Domain.of_values [-k])

    let (>=) lhs rhs =
      let (k, vs) = LinearExpr.L.(lhs - rhs) in
      Linear ((0, vs), Domain.of_interval ~lb:(-k) ())

    let (<=) lhs rhs =
      let (k, vs) = LinearExpr.L.(lhs - rhs) in
      Linear ((0, vs), Domain.of_interval ~ub:(-k) ())

    let (>) lhs rhs =
      let (k, vs) = LinearExpr.L.(lhs - rhs) in
      Linear ((0, vs), Domain.of_interval ~lb:(-k + 1) ())

    let (<) lhs rhs =
      let (k, vs) = LinearExpr.L.(lhs - rhs) in
      Linear ((0, vs), Domain.of_interval ~ub:(-k - 1) ())

    let (!=) lhs rhs =
      let (k, vs) = LinearExpr.L.(lhs - rhs) in
      Linear ((0, vs), Domain.(of_interval ~ub:(-k - 1) ()
                               @
                               of_interval ~lb:(-k + 1) ()))

  end

  let print_bounds fmt ~lb ~ub expr =
    if lb = Int64.min_int
    then Format.fprintf fmt "%a <= %Ld" LinearExpr.pp expr ub
    else if ub = Int64.max_int
    then Format.fprintf fmt "%Ld <= %a" lb LinearExpr.pp expr
    else Format.fprintf fmt "%Ld <= %a <= %Ld" lb LinearExpr.pp expr ub

  let print_lt fmt expr domain =
    let rec f = function
      | [] -> ()
      | [(lb, ub)] -> print_bounds fmt ~lb ~ub expr
      | (lb, ub) :: xs ->
          print_bounds fmt ~lb ~ub expr;
          Format.pp_print_string fmt " ||@ ";
          f xs
    in
    Format.pp_open_hvbox fmt 4;
    f domain;
    Format.pp_close_box fmt ()

  let print_bool_op op fmt args =
    Format.pp_print_string fmt op;
    my_print_list Var.pp fmt '(' args ')'

  let print_equality2 op fmt { target; arg1; arg2 } =
    Format.(fprintf fmt "%a = @[<hv>%a %s@ %a@]"
              LinearExpr.pp target
              LinearExpr.pp arg1
              op
              LinearExpr.pp arg2)

  let print_equality op fmt { target; exprs } =
    Format.fprintf fmt "%a = %s" LinearExpr.pp target op;
    my_print_list LinearExpr.pp fmt '(' exprs ')'

  let print_op op fmt args =
    Format.pp_print_string fmt op;
    my_print_list LinearExpr.pp fmt '(' args ')'

  let pp fmt c =
    match c with
    | Or bs -> print_bool_op "or" fmt bs
    | And bs -> print_bool_op "and" fmt bs
    | At_most_one bs -> print_bool_op "at_most_one" fmt bs
    | Exactly_one bs -> print_bool_op "exactly_one" fmt bs
    | Xor bs -> print_bool_op "xor" fmt bs
    | Div eq2 -> print_equality2 "//" fmt eq2
    | Mod eq2 -> print_equality2 "%" fmt eq2
    | Prod eq -> print_equality "prod" fmt eq
    | Max eq -> print_equality "max" fmt eq
    | Linear (expr, domain) -> print_lt fmt expr domain
    | All_diff exprs -> print_op "all_diff" fmt exprs

  let to_string e = Format.asprintf "%a" pp e

  include LinearExpr.L

end (* }}} *)

let make ?(nvars=10000) ?name () = {
  name;
  variables = DynArray.make nvars;
  constraints = [];
  objective = None;
  hints = [];
  assumptions = [];
  search_strategy = [];
  constant_to_index_map = Hashtbl.create (nvars / 10);
}

let to_proto { name; variables; constraints; objective;
               hints; assumptions; search_strategy;
               constant_to_index_map = _ } =
  let solution_hint =
    option_of_list ~map:(fun xs ->
        let vars, values = List.split xs in
        PB.make_partial_variable_assignment
          ~vars:(List.map Int32.of_int vars)
          ~values:(List.map Int64.of_int values) ()) hints
  in
  let assumptions = option_of_list ~map:Fun.id assumptions in
  PB.make_cp_model_proto
    ?name
    ~variables:(DynArray.to_list variables)
    ~constraints
    ?objective
    ?solution_hint
    ?assumptions
    ?search_strategy:(option_of_list ~map:Fun.id search_strategy)
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
  let constraint_ = Constraint.to_proto c in
  let c = PB.make_constraint_proto
    ?name
    ?enforcement_literal:(option_of_list
                            ~map:(fun xs -> List.map Var.to_int32 xs)
                            only_enforce_if)
    ~constraint_ ()
  in
  m.constraints <- c :: constraints

let add_implication m ?name lhs rhs =
  add m ?name ~only_enforce_if:lhs (Constraint.And rhs)

let minimize m expr =
  m.objective <- Some LinearExpr.(to_objective_proto expr)

let maximize m expr =
  let obj = LinearExpr.(to_objective_proto (scale (-1) expr)) in
  PB.cp_objective_proto_set_scaling_factor obj (-1.0);
  m.objective <- Some obj

let fix_hint ((_, v), c) =
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
  m.assumptions <- List.(rev_append (rev_map Var.to_int32 bs)) assumptions

let clear_assumptions m =
  m.assumptions <- []

type variable_selection_strategy =
  | ChooseFirst
  | ChooseLowestMin
  | ChooseHighestMax
  | ChooseMinDomainSize
  | ChooseMaxDomainSize

let variable_selection_strategy_to_proto = function
  | ChooseFirst         -> PB.Choose_first
  | ChooseLowestMin     -> PB.Choose_lowest_min
  | ChooseHighestMax    -> PB.Choose_highest_max
  | ChooseMinDomainSize -> PB.Choose_min_domain_size
  | ChooseMaxDomainSize -> PB.Choose_max_domain_size

type domain_reduction_strategy =
  | SelectMinValue
  | SelectMaxValue
  | SelectLowerHalf
  | SelectUpperHalf
  | SelectMedianValue
  | SelectRandomHalf

let domain_reduction_strategy_to_proto = function
  | SelectMinValue    -> PB.Select_min_value
  | SelectMaxValue    -> PB.Select_max_value
  | SelectLowerHalf   -> PB.Select_lower_half
  | SelectUpperHalf   -> PB.Select_upper_half
  | SelectMedianValue -> PB.Select_median_value
  | SelectRandomHalf  -> PB.Select_random_half

let add_decision_strategy m vars varsel domred =
  m.search_strategy <- [ PB.make_decision_strategy_proto
   ~variables:(List.map Var.to_int32 vars)
   ~variable_selection_strategy:(variable_selection_strategy_to_proto varsel)
   ~domain_reduction_strategy:(domain_reduction_strategy_to_proto domred)
   () ]

let add_decision_strategy_with_exprs m exprs varsel domred =
  m.search_strategy <- [ PB.make_decision_strategy_proto
   ~exprs:(List.map LinearExpr.to_proto exprs)
   ~variable_selection_strategy:(variable_selection_strategy_to_proto varsel)
   ~domain_reduction_strategy:(domain_reduction_strategy_to_proto domred)
   () ]

module Response = struct (* {{{ *)

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

  let objective_of_proto m PB.{ _presence;
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
      terms =
        List.map2 (fun c v -> (int_of_int64 c, (m, Int32.to_int v))) coeffs vars;
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

  let of_proto m PB.{ _presence;
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
      List.map (fun x -> (m, Int32.to_int x)) sufficient_assumptions_for_infeasibility;
    integer_objective           = Option.map (objective_of_proto m) integer_objective;
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

  let pb_decode m dec = of_proto m (PB.decode_pb_cp_solver_response dec)

  let of_input m fin =
    let decoder = Pbrt.Decoder.of_string (In_channel.input_all fin) in
    pb_decode m decoder

end (* }}} *)

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
  Response.of_proto model response

include LinearExpr.L
include Constraint.Linear

