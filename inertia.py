import numpy as np
from pca import eigen
import matplotlib.pyplot as plt
import pandas as pd
import cv2

def eigen_inertia(I):
    values, vectors = eigen(I)
    return values, vectors

def hermitian(M):
    H = np.matrix(M)
    return H.H

def stiffness_storey(E, I, L):

    return 12 * E * I / L**3

def stiffness_infill(A, Em, ld, theta):

    return A * Em / ld * (math.cos(theta))**2

def modal_participation_factors(W, vectors):
    return np.matmul(W, vectors) / np.matmul(W, vectors**2)

def modal_mass(W, vectors):
    return (np.matmul(W, vectors))**2 / (g * (np.matmul(W, vectors**2)))

