(*

   Download Google OR-Tools runtime from github
   2025 T. Bourke

   refs:
   - https://github.com/google/or-tools/releases
   - https://dune.readthedocs.io/en/latest/dune-libs.html#configurator
   - https://github.com/ocaml/ocaml/pull/12405
   - odig doc dune-configurator
   - https://ocaml.org/cookbook/decompress-zip-archive/camlzip
 *)

let sprintf = Printf.sprintf
let printf = Printf.printf

(* Required version of OR-Tools *)
let vmajor, vminor, vpatch = (9, 14, 6206)

let nupkg_url =
  sprintf "https://github.com/google/or-tools/releases/download/v%d.%d"
    vmajor vminor

(* os ∈ { "osx", "win", "linux" }, arch ∈ { "arm64", "x64" } *)
let nupkg_file os arch =
  sprintf "Google.OrTools.runtime.%s-%s.%d.%d.%d.nupkg"
    os arch vmajor vminor vpatch

let main_empty = {|
int main(void)
{
  return 0;
}
|}

(* Open the ZIP file for reading. *)
let unzip prefix zip_path dstdir =
  let length_prefix = String.length prefix in
  let zip = Zip.open_in zip_path in
  let unzip acc (Zip.{ filename; is_directory; _ } as entry) =
    if not (String.starts_with ~prefix filename) || is_directory then acc
    else
    let suffix = String.(sub filename length_prefix (length filename - length_prefix)) in
    if String.contains suffix '/' then acc
    else (Zip.copy_entry_to_file zip entry (Filename.concat dstdir suffix);
          suffix :: acc)
  in
  let unzipped = List.fold_left unzip [] (Zip.entries zip) in
  Zip.close_in zip;
  unzipped

module C = Configurator.V1

module F = struct
    include Filename
    let (^) = concat
  end

let () =
  C.main ~name:"ortools-config"
    (fun c ->
      (* setup basic parameters *)
      let os = match C.ocaml_config_var_exn c "system" with
               | "macosx" -> "osx"
               | "linux" -> "linux"
               | "mingw64" | "win64" -> "win"
               | _ -> "none"
      in
      let arch = match C.ocaml_config_var_exn c "architecture" with
                 | "amd64" -> "x64"
                 | "arm64" -> "arm64"
                 | _ -> "none"
      in
      let file = nupkg_file os arch in
      let dstdir = "runtime" in

      let lortools =
        if os = "osx" then sprintf "-lortools.%d" vmajor
        else sprintf "-l:libortools.so.%d" vmajor
      in
      if C.c_test c main_empty ~link_flags:[lortools]
         || os = "none" || arch = "none"
      then begin
        (* already installed on the system or not downloadable *)
        C.Flags.write_sexp "runtime.sexp" [];
        C.Flags.write_sexp "flags.sexp" [lortools]
      end
      else begin
        (* download and install with the package *)
        if not (Sys.file_exists dstdir) then Sys.mkdir dstdir 0o775;
        let fetch = Option.value (Sys.getenv_opt "OPAMFETCH") ~default:"wget" in
        if not (Sys.file_exists file)
        then begin
          let extra_args =
            if String.ends_with ~suffix:"wget" fetch
            then ["-nv"]
            else if String.ends_with ~suffix:"curl" fetch
            then ["-L"; "--no-progress-meter"; "--output"; file]
            else []
          in
          printf "downloading %s.\n" file;
          if not (C.Process.run_ok c fetch (extra_args @ [sprintf "%s/%s" nupkg_url file]))
          then failwith (sprintf "could not download %s/%s" nupkg_url file)
        end;
        let unzipped =
          unzip (sprintf "runtimes/%s-%s/native/" os arch) file dstdir
          |> List.map (fun f -> sprintf "%s/%s" dstdir f)
        in
        C.Flags.write_sexp "runtime.sexp" unzipped;
        let build_flags = (* find the libraries when building *)
          [ sprintf "-L%s" F.(Sys.getcwd () ^ dstdir); lortools ]
        in
        let rpath_flags = (* find the libraries when running *)
          match Sys.getenv_opt "OPAM_SWITCH_PREFIX" with
          | None -> [] (* use LD_LIBRARY_PATH or DYLD_LIBRARY_PATH *)
          | Some prefix ->
              [ sprintf "-rpath %s" F.(prefix ^ "lib" ^ "ortools_solvers") ]
        in
        C.Flags.write_sexp "flags.sexp" (build_flags @ rpath_flags)
      end)

