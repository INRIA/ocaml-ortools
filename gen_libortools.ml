
open Sexplib0

let build_path = "../libortools-build/build/lib/"

let from_channel acc0 cin =
  let rec loop acc =
    match input_line cin with
    | line -> loop (line :: acc)
    | exception End_of_file ->
        List.rev_append acc acc0
  in
  loop []

let add_contents acc0 path =
  let cin = open_in path in
  let finally () = close_in cin in
  Fun.protect ~finally (fun () -> from_channel acc0 cin)

let copy file =
  Sexp.(List [
    Atom "rule";
    List [
      Atom "action";
      List [Atom "copy"; Atom (build_path ^ file); Atom file]]])

let uniq xs =
  let rec f l ys =
    match ys with
    | [] -> []
    | y :: ys' when y = l -> f y ys'
    | y :: ys' -> y :: f y ys'
  in
  match xs with
  | [] -> []
  | x::xs' -> x :: f x xs'

let lib_files = ref []
let do_copy = ref false

let anon_fun lib_file =
  lib_files := lib_file :: !lib_files

let spec_list = [
  ("-copy", Arg.Set do_copy, "generate copy rules");
]

let () =
  let () = Arg.parse spec_list anon_fun "gen_libortools [-copy] [<file>] ..." in
  let libs =
    (if !lib_files = []
     then from_channel [] stdin
     else List.fold_left add_contents [] !lib_files)
    |> List.sort String.compare
    |> uniq
  in
  if libs = [] then exit 0;
  if !do_copy
  then Format.(printf "@[<v>%a@]"
         (pp_print_list Sexp.(pp_hum_indent 2)) (List.map copy libs))
  else Format.(printf "@[<v>%a@]"
         Sexp.(pp_hum_indent 2)
         (Sexp.(List (List.map (fun x -> Atom x) libs))))

