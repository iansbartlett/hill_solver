#!/usr/bin/env

import numpy as np

try:
    import hill_solver
except ImportError: 
    raise ImportError('Error when attempting to load hill_solver, check hill_solver for f2py compile errors.')

print('Modules loaded.')

print('Running solver...')
hill_solver.solve_hill_problem(np.array([1, 1, 1.5, 0]), 1, 10)

print('Solver complete.')
