import math
import numpy as np

def compute_hill_energy(state):
    """Compute the total energy using the Hill Hamiltonian.
    """
    X = state[0]
    Y = state[1]
    PX = state[2]
    PY = state[3]

    return (1/2)*(PX**2 + PY**2) - 2*X*PY + X**2/2 - 1/math.sqrt(X**2 + Y**2)

def hill2cart(state):
    """Convert Hill coordinates back to x/y Cartesian coords.
    """
    X = state[0]
    Y = state[1]
    PX = state[2]
    PY = state[3]

    x_cart = X
    y_cart = Y
    px_cart = PX - Y
    py_cart = PY - X
    
    return np.array([x_cart, y_cart, px_cart, py_cart])

def cart2hill(state):
    x = state[0]
    y = state[1]
    px = state[2]
    py = state[3]

    X_hill = x
    Y_hill = y
    PX_hill = x + py
    PY_hill = y + px

    return np.array([X_hill, Y_hill, PX_hill, PY_hill])


