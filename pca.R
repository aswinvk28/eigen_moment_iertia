library(stats)

args = commandArgs(trailingOnly=TRUE)

pca <- vector(mode="list", length=3)

names(pca) <- c("eigen_data", "pca_normalizer", "pca_transform")

eigen_data <- function(Z, rows, cols) {
    # function to print x raised to the power y
    Z <- matrix(Z, nrow = rows, ncol = cols, byrow = TRUE)

    eig <- eigen(Z, symmetric = FALSE)

    return (c(eig['values'], eig['vectors']))
}

pca_normalizer <- function(Z) {

    col.mean = apply(Z, 1, mean)
    mat <- Z - col.mean
    V <- cov(t(mat))
    eig <- eigen(V, symmetric = FALSE)
    return (eig)
}

pca_transform <- function(Z) {
    
    library(FactoMineR)
    res.pca <- PCA(Z)
    
    return (c(res.pca['eig'], res.pca['var'], res.pca['ind']))

}

pca.eigen_data = eigen_data
pca.pca_normalizer = pca_normalizer
pca.pca_transform = pca_transform
