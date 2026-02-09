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
#include <caml/callback.h>
#include <caml/threads.h>

// see ortools/sat/c_api/cp_solver_c.{h, cc}

#include "absl/log/check.h"
#include "ortools/base/memutil.h"
#include "ortools/sat/cp_model.pb.h"
#include "ortools/sat/cp_model_solver.h"
#include "ortools/sat/model.h"
#include "ortools/sat/sat_parameters.pb.h"
#include "ortools/sat/util.h"

#include <thread>

using namespace operations_research::sat;

static CAMLprim value val_response(const CpSolverResponse& res)
{
    CAMLparam0();
    CAMLlocal1(vres);

    std::string res_str;
    CHECK(res.SerializeToString(&res_str));

    if (res_str.data() == nullptr)
	caml_failwith("Empty Solver Response");

    int cres_len = static_cast<int>(res_str.size());
    vres = caml_alloc_initialized_string(cres_len, res_str.data());

    CAMLreturn(vres);
}

static CAMLprim void do_callback(value vcbf, const CpSolverResponse& res)
{
    CAMLparam1(vcbf);
    CAMLlocal1(vresponse);

    vresponse = val_response(res);
    caml_callback(vcbf, vresponse);

    CAMLreturn0;
}

extern "C" {

CAMLprim value ocaml_ortools_sat_solve(value vmodel, value vparams, value vocbf)
{
    CAMLparam3(vparams, vmodel, vocbf);
    CAMLlocal2(vresponse, vcbf);

    // convert OCaml model to protocol buffer strings
    const void* creq = String_val(vmodel);
    int creq_len = caml_string_length(vmodel);

    CpModelProto req;
    CHECK(req.ParseFromArray(creq, creq_len));

    // convert OCaml parameters to protocol buffer strings
    const void* cparams = String_val(vparams);
    int cparams_len = caml_string_length(vparams);

    SatParameters params;
    CHECK(params.ParseFromArray(cparams, cparams_len));

    // create a model with the given parameters
    Model model;
    model.Add(NewSatParameters(params));

    // attach a callback if requested
    if (Is_some(vocbf)) {
	std::thread::id thread_ocaml = std::this_thread::get_id();
	vcbf = Some_val(vocbf);

	auto wrapper = [&vcbf, thread_ocaml](const CpSolverResponse& res) {
	    std::thread::id thread_callback = std::this_thread::get_id();

	    if (thread_callback != thread_ocaml)
		caml_c_thread_register();

	    caml_acquire_runtime_system();
	    do_callback(vcbf, res);
	    caml_release_runtime_system();

	    if (thread_callback != thread_ocaml)
		caml_c_thread_unregister();
	  };

	model.Add(NewFeasibleSolutionObserver(wrapper));
    }

    // call CP-SAT
    caml_release_runtime_system();
    CpSolverResponse res = SolveCpModel(req, &model);
    caml_acquire_runtime_system();

    // translate the response to an OCaml string and return it
    vresponse = val_response(res);
    CAMLreturn(vresponse);
}

}  // extern "C"

