import math
import numpy as np
import matplotlib.pyplot as plt
from hill_coords import hill2cart, compute_hill_energy

def plot_hill_energy(solution):
    """Plot the system energy varation over time.
    """
    state_vectors = solution[0].T
    timestamps = solution[1]

    energy = [compute_hill_energy(state) for state in state_vectors]
    initial_energy = [energy[0] for i in timestamps]

    plt.figure(figsize=(10,8))
    plt.title('Total System Energy')
    plt.plot(timestamps, initial_energy)
    plt.plot(timestamps, energy)
    plt.legend(['Initial Energy', 'Instantaneous Energy'])
    plt.xlabel('Time')
    plt.ylabel('Energy')

def plot_cartesian_trajectory(solution):
    """Plot the orbit in Cartesian coordinates.
    """

    state_vectors = solution[0].T
    timestamps = solution[1]

    cartesian_state_vectors = [hill2cart(state) for state in state_vectors]

    plt.figure(figsize=(10,8))
    plt.title('Cartesian Orbit')
    plt.plot(([x[0] for x in cartesian_state_vectors]), 
             ([x[1] for x in cartesian_state_vectors]))
    plt.xlabel('x')
    plt.ylabel('y')




    




    
