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
   OCaml Interface: 2025 T. Bourke */

#include <stdlib.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/fail.h>

// see ortools/sat/c_api/cp_solver_c.h

extern void SolveCpModelWithParameters(
	const void* creq, int creq_len,
	const void* cparams, int cparams_len,
	void** cres, int* cres_len);

CAMLprim value ocaml_ortools_sat_solve(value vmodel, value vparams)
{
    CAMLparam2(vparams, vmodel);
    CAMLlocal1(vresponse);
    void *cres = NULL;
    int cres_len = 0;

    SolveCpModelWithParameters(
	    String_val(vmodel), caml_string_length(vmodel),
	    String_val(vparams), caml_string_length(vparams),
	    &cres, &cres_len);

    if (cres == NULL) caml_failwith("Empty Solver Response");

    // TODO: try to avoid double copy by reimplementing SolveCpModelWithParameters?
    vresponse = caml_alloc_initialized_string(cres_len, cres);
    free(cres);

    CAMLreturn(vresponse);
}

