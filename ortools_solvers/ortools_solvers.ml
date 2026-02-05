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

module Sat = struct

  external c_solve
    :    string (* model protocol buffer *)
      -> string (* parameters protocol buffer *)
      -> (string -> unit) option (* solution callback *)
      -> string (* response protocol buffer *)
    = "ocaml_ortools_sat_solve"

  let solve ?observer ?parameters model =
    Ortools.Sat.solve
      (fun ?observer_pb ~parameters_pb ~model_pb () ->
        c_solve model_pb parameters_pb observer_pb)
      ?observer
      ?parameters
      model

end

