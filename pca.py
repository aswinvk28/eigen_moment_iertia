import numpy as np
from sklearn.decomposition import PCA

# returns pca components, pca vectors
def pca_sklearn(Z):

    n_components = Z.shape[1]
    pca = PCA(n_components=n_components).fit(Z)

    return pca.components_.T, pca.explained_variance_

# returns eigen values, eigen vectors
def eigen(Z):
    values, vectors = np.linalg.eig(Z)

    return values, vectors

# returns sign version of eigen vectors
def sgn(pca_components, pca_vectors):
    sign = np.cross(pca_components[:,0], pca_components[:,1])
    return sign / np.linalg.norm(sign,1)

# if __name__ == "__main__":

#     Z = np.random.random((3,2))
#     c, ev = pca_sklearn(Z)
#     print("PCA Sklearn", (c,ev))
#     print("Eigen: ", eigen(Z))
#     print("Sign: ", sgn(c,ev))
