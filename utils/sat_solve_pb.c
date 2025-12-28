/* Licensed under the Apache License, Version 2.0 (the "License");
   You may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. */

//  2025 T. Bourke
#if 0
// 1. OR-Tools is already installed/built at $ORTOOLS

export ORTOOLS=<path>
cc -o sat_solve_pb \
   -DHAVE_ORTOOLS_HEADERS -I $ORTOOLS/include \
   -L $ORTOOLS/lib sat_solve_pb.c -lortools

// macOS:
export DYLD_LIBRARY_PATH="$ORTOOLS:$DYLD_LIBRARY_PATH"

// linux/bsd:
export LD_LIBRARY_PATH="$ORTOOLS:$LD_LIBRARY_PATH"

./sat_solve_pb -p parameters.pb model.pb -o response.pb

// 2. Download OR-Tools from Github for macOS arm64

wget https://github.com/google/or-tools/releases/download/v9.14/Google.OrTools.runtime.osx-arm64.9.14.6206.nupkg
unzip Google.OrTools.runtime.osx-arm64.9.14.6206.nupkg \
     'runtimes/osx-arm64/native/*' \
     -d 'ortools'
  
export ORTOOLS_LIBS=$(realpath ./ortools/runtimes/osx-arm64/native)
cc -o sat_solve_pb -L "$ORTOOLS_LIBS" sat_solve_pb.c -lortools.9
DYLD_LIBRARY_PATH="$ORTOOLS_LIBS:$DYLD_LIBRARY_PATH" ./sat_solve_pb ...
// (or specify the rpath when compiling: -Wl,-rpath,"$ORTOOLS"

#endif

#include <fcntl.h>
#include <unistd.h>
#include <sys/errno.h>
#include <sys/stat.h>
#include <sys/mman.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#ifdef HAVE_ORTOOLS_HEADERS
#include <ortools/sat/c_api/cp_solver_c.h>
#else
extern void SolveCpModelWithParameters(
	const void* creq, int creq_len,
	const void* cparams, int cparams_len,
	void** cres, int* cres_len);
#endif

#define PROGNAME "sat_solve_pb"

int main(int argc, char** argv)
{
    char *path_model = NULL, *path_parameters = NULL, *path_response = NULL;
    void *model = NULL, *parameters = NULL, *response = NULL;
    int size_model = 0, size_parameters = 0, size_response = 0;
    int verbose = 0;

    // simple command-line parsing
    {
	int error = 0;
	int ignore_dash = 0;

	while (*(++argv) != NULL) {

	    if (strcmp(*argv, "-p") == 0) {
		if (++argv != NULL) {
		    path_parameters = *argv;
		} else {
		    error = 1;
		}

	    } else if (strcmp(*argv, "-o") == 0) {
		if (++argv != NULL) {
		    path_response = *argv;
		} else {
		    error = 1;
		}

	    } else if (strcmp(*argv, "-v") == 0) {
		verbose++;

	    } else if (strcmp(*argv, "--") == 0) {
		ignore_dash = 1;

	    } else if (!ignore_dash && (*argv)[0] == '-') {
		error = 1;

	    } else {
		error = error || path_model != NULL;
		path_model = *argv;
	    }
	}

	if (error || path_model == NULL || path_response == NULL) {
	    fprintf(stderr,
		"usage: %s [-p parameters.pb] <model.pb> -o <response.pb>\n",
		PROGNAME);
	    return 1;
	}
    }

    // open and mmap files
    if (1 <= verbose)
	fprintf(stderr, "opening and mapping files...\n");

    {
	int fd_model = -1, fd_parameters = -1;
	struct stat filestat;

	fd_model = open(path_model, O_RDONLY);
	if (fd_model < 0 || fstat(fd_model, &filestat) != 0) {
	    fprintf(stderr, "could not access %s: %s (%d)\n",
		    path_model, strerror(errno), errno);
	    return 2;
	}
	size_model = filestat.st_size;

	if (path_parameters != NULL) {
	    fd_parameters = open(path_parameters, O_RDONLY);
	    if (fd_parameters < 0 || fstat(fd_parameters, &filestat) != 0) {
		fprintf(stderr, "could not access %s: %s (%d)\n",
			path_parameters, strerror(errno), errno);
		return 2;
	    }
	    size_parameters = filestat.st_size;
	}

	model = mmap(NULL, size_model, PROT_READ, MAP_PRIVATE, fd_model, 0);
	if (model == MAP_FAILED) {
	    fprintf(stderr, "could not mmap %s: %s (%d)\n",
		    path_model, strerror(errno), errno);
	    return 3;
	}
	close(fd_model);

	if (0 < size_parameters) {
	    parameters = mmap(NULL, size_parameters, PROT_READ, MAP_PRIVATE,
			      fd_parameters, 0);
	    if (parameters == MAP_FAILED) {
		fprintf(stderr, "could not mmap %s: %s (%d)\n",
			path_parameters, strerror(errno), errno);
		return 3;
	    }
	    close(fd_parameters);
	}
    }

    // call the solver
    if (1 <= verbose)
	fprintf(stderr, "calling the solver (parameters=%p, model=%p)...\n",
		parameters, model);

    SolveCpModelWithParameters(model, size_model,
			       parameters, size_parameters,
			       &response, &size_response);

    munmap(model, size_model);
    model = NULL;

    if (parameters != NULL) {
	munmap(parameters, size_parameters);
	parameters = NULL;
    }

    if (response == NULL) {
	fprintf(stderr, "empty response!");
	return 4;
    }

    // write the reponse
    if (1 <= verbose)
	fprintf(stderr, "writing the response (size=%d bytes)...\n", size_response);

    {
	int fd_response = open(path_response, O_WRONLY | O_CREAT | O_TRUNC, 0666);
	void* buf = response;
	ssize_t nbytes = size_response;

	if (fd_response < 0) {
	    fprintf(stderr, "could not access %s: %s (%d)\n",
		    path_response, strerror(errno), errno);
	    return 5;
	}

	while (nbytes > 0) {
	    ssize_t written = write(fd_response, buf, nbytes);
	    if (written < 0) {
		fprintf(stderr, "error writing to %s: %s (%d)\n",
			path_response, strerror(errno), errno);
		return 6;
	    }

	    nbytes -= written;
	    buf += written;
	}

	close(fd_response);
    }

    if (response != NULL) {
	free(response);
    }

    if (1 <= verbose)
	fprintf(stderr, "done.\n");

    return 0;
}

