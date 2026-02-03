/* Licensed under the Apache License, Version 2.0 (the "License");
   You may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. */

/* Based on OR-Tools, Copyright 2010-2025 Google LLC
   OCaml Interface: 2026 T. Bourke */

#include <cstdlib>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/fail.h>

// see ortools/sat/c_api/cp_solver_c.{h, cc}

#include "absl/log/check.h"
#include "ortools/base/memutil.h"
#include "ortools/sat/cp_model.pb.h"
#include "ortools/sat/cp_model_solver.h"
#include "ortools/sat/model.h"
#include "ortools/sat/sat_parameters.pb.h"
#include "ortools/sat/util.h"

extern "C" {

CAMLprim value ocaml_ortools_sat_solve(value vmodel, value vparams)
{
    CAMLparam2(vparams, vmodel);
    CAMLlocal1(vresponse);

    const void* creq = String_val(vmodel);
    int creq_len = caml_string_length(vmodel);

    const void* cparams = String_val(vparams);
    int cparams_len = caml_string_length(vparams);

    operations_research::sat::Model model;

    int cres_len = 0;

    operations_research::sat::CpModelProto req;
    CHECK(req.ParseFromArray(creq, creq_len));

    operations_research::sat::SatParameters params;
    CHECK(params.ParseFromArray(cparams, cparams_len));

    model.Add(NewSatParameters(params));
    operations_research::sat::CpSolverResponse res = SolveCpModel(req, &model);

    std::string res_str;
    CHECK(res.SerializeToString(&res_str));

    if (res_str.data() == nullptr)
	caml_failwith("Empty Solver Response");

    cres_len = static_cast<int>(res_str.size());
    vresponse = caml_alloc_initialized_string(cres_len, res_str.data());

    CAMLreturn(vresponse);
}

}  // extern "C"

