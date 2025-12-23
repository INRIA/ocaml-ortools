#!/usr/bin/env python
"""Solve a Cp_model protocol buffer."""

from ortools.sat.python import cp_model
from ortools.sat import cp_model_pb2
from pathlib import Path
import argparse

def main() -> None:
    """Solve a generated CP-SAT pb file."""

    parser = argparse.ArgumentParser('solve_pb')
    parser.add_argument('model',
        help='Path to a protocol buffer describing a CP-SAT CpModel.')
    parser.add_argument('-v', '--verbose',
        action='store_true',
        help='Show extra information (for debugging)')
    parser.add_argument('-p', '--parameters',
        help='Path to a protocol buffer describing CP-SAT SatParameters')
    args = parser.parse_args();

    verbose = args.verbose

    # Creates the model.
    model = cp_model.CpModel()
    model.Proto().ParseFromString(Path(args.model).read_bytes())
    proto = model.Proto()

    if args.verbose:
        print(proto)

    # Creates a solver and solves the model.
    solver = cp_model.CpSolver()
    if args.parameters:
        solver.parameters.MergeFromString(Path(args.parameters).read_bytes())
    if args.verbose:
        print(solver.parameters)
    status = solver.solve(model)

    # help(solver)
    if status == cp_model.OPTIMAL or status == cp_model.FEASIBLE:
        print(f"Maximum of objective function: {solver.objective_value}\n")
        for i, v in enumerate(proto.variables):
            pv = cp_model.IntVar(proto, i, v.domain == [0, 1], None)
            print(f"{v.name} = {solver.value(pv)}")
    else:
        print("No solution found.")

    # Statistics.
    print("\nStatistics")
    print(f"  status   : {solver.status_name(status)}")
    print(f"  conflicts: {solver.num_conflicts}")
    print(f"  branches : {solver.num_branches}")
    print(f"  wall time: {solver.wall_time} s")

if __name__ == "__main__":
    main()

