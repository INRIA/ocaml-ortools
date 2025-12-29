
let sprintf = Printf.sprintf

let vmajor = 9

module C = Configurator.V1

let () =
  C.main ~name:"ortools-config"
    (fun c ->
      let lortools =
        match C.ocaml_config_var_exn c "system" with
        | "macosx" -> sprintf "-lortools.%d" vmajor
        | "linux"  -> sprintf "-l:libortools.so.%d" vmajor
        | "mingw64" | "win64" | _ -> "-lortools"
      in
      C.Flags.write_sexp "runtime.sexp" [];
      C.Flags.write_sexp "flags.sexp" [lortools])

