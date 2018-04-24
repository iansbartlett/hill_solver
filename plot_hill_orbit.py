#!/usr/bin/env

import numpy as np
import matplotlib.pyplot as plt
import hill_plotting
from hill_coords import cart2hill

try:
    import hill_solver
except ImportError: 
    raise ImportError('Error when attempting to load hill_solver, check hill_solver for f2py compile errors.')
print('Modules loaded.')

plt.style.use("fivethirtyeight")

print('Running solver...')
initial_state = np.array([1, 0, 0.6, 0])
hill_initial_state = cart2hill(initial_state)
(solution) = hill_solver.solve_hill_problem(hill_initial_state, 0.01, 2000)
print('Solver complete.')
print(solution)

hill_plotting.plot_cartesian_trajectory(solution)
hill_plotting.plot_hill_energy(solution)
plt.show()

