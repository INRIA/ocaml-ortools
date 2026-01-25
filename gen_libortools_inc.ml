
open Sexplib0

let build_path = "../libortools-build/build/lib/"

let add_contents acc0 path =
  let cin = open_in path in
  let finally () = close_in cin in
  let rec loop acc =
    match input_line cin with
    | line -> loop (line :: acc)
    | exception End_of_file ->
        List.rev_append acc acc0
  in
  Fun.protect ~finally (fun () -> loop [])

let copy file = Sexp.(List [Atom "copy"; Atom (build_path ^ file); Atom file])

let () =
  let libs =
    Sys.argv
    |> Array.to_list
    |> List.tl
    |> List.fold_left add_contents []
  in
  if libs = [] then exit 0;
  let copy = Sexp.(List [
    Atom "rule";
    List [
      Atom "action";
      List (Atom "progn" :: List.map copy libs) ]
  ])
  in
  let install = Sexp.(List [
    Atom "install";
    List (Atom "files" :: List.map (fun x -> Atom x) libs);
    List [Atom "section"; Atom "lib"];
    List [Atom "package"; Atom "ortools_solvers"];
  ])
  in
  Format.printf "@[<v>%a@;@;%a@]"
    Sexp.(pp_hum_indent 2) copy
    Sexp.(pp_hum_indent 2) install

