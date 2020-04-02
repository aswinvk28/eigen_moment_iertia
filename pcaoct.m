pcaoct = {}

function [lambda, V] = eigen (Z)

  rows = size(Z, 1)
  cols = size(Z, 2)

  [V, lambda] = eig(Z, "vector")

endfunction

function [V, lambda, transform] = pca_normalizer (Z)

  A = Z - mean(Z, 1)
  V = cov(A')
  [V, lambda] = eig(V)
  T = V' * A'

  transform = T

endfunction

function [V, lambda, transform] = pca_transform (Z)
  
  pkg load tisean
  [lambda, V, transform] = pca (Z)

endfunction

pcaoct.eigen = @eigen
pcaoct.pca_normalizer = @pca_normalizer
pcaoct.pca_transform = @pca_transform
