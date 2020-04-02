# System of linear Equations

## Octave on solving system of equations

```octave

    pca_custom()

```

### Installation

```bash

apt-get install liboctave-dev

```

```octave

pkg load tisean

```

#### Tisean

```octave

pkg install tisean-x.x.x.tar.gz

```

#### Statistics

```octave

pkg install statistics-x.x.x.tar.gz

```

### PCA

```octave

source("pcaoct.m")

```

## R on solving a system of equations

```R

install.packages("FactoMineR")

```

### Installation

Install RStudio and Microsoft R Open on Linux

### PCA

```R

Z = matrix(c(2,3,4,8,7,1,3,2), nrows=4, ncols=2, byrow=TRUE)

```

```R

pca.eigen_data(Z,4,2)
pca.pca_normalizer(Z)
pca.pca_transform(Z)

```

## Python on solving a system of equations

```python

python pca.py

```

# Moment of Inertia

Eigen vectors are valid solutions to discretize and orthogonolize a singular matrix. It is known that Hermitian matrices have real solutions for eigen vectors. Consider a homogeneous moment of inertia matrix, as given in the example it generates complex valued eigen vectors. To convert a given homogeneous matrix into hermitian matrix, you execute this code.

## Python on finding eigen values for Moment of Inertia

```python

def hermitian(M):
    H = np.matrix.H(M)
    return (H + np.triu(M)) / 2

```

```python

stiffness_floor = stiffness_storey(22360e3, 0.001893, 3.5**3)

stiffness_in = stiffness_infill(0.1972, 13800 * 1e6, 6.103, math.arctan2(3.5,5))

k1 = k2 = k3 = k4 = 3 * stiffness_floor + 2 * stiffness_in
                  = 633712.430 KNm-1

stiffness_matrix = np.array(
    [k1+k2, -k2, 0, 0], 
    [-k2, k2+k3, -k3, 0],
    [0, -k3, k3+k4, -k4],
    [0, 0, -k4, k4]
)

# Eigen values of the stiffness matrix above by considering the load

values, vectors = eigen(stiffness_matrix)

# Natural Frequency in Various Modes

(omega)^2           =       Eigen Values

# Natural Time period

T                   =       1 / omega

```

```python

modal_participation_factors(
    omega, eigen_vectors
)

modal_mass(
    omega, eigen_vectors
)

```