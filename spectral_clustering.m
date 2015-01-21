%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that implements spectral clustering based on the implementation
% of Ng et al. in "On spectral clustering; analyis and an algorithm".
%
% Author: Oriana Baldizan
% Date: December 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [kM, kMInd] = spectral_clustering(X, k, sigma)

sz = size(X);
n = sz(1);
m = sz(2);

A = zeros(n, n);
D = zeros(n, n);

% Define the affinity matrix A using the Gaussian Kernel as the
% similarity function
for i = 1 : n
    for j = 1 : n
       if i  ~= j
           dist    = norm(X(i, :) - X(j, :));
           A(i,j) = exp( -( dist*dist) / (2*(sigma*sigma)));
       end
    end
end

% Define the diagonal matrix D, whose (ii)-th element 
% is the sum of the i-th row in A.
for i = 1 : n
    D(i,i) = sum(A(i,:));
end

% Define the Laplacian matrix L
DSR = inv(sqrtm(D));
L = DSR *  A * DSR;


% Find the k largest eigenvector of L and form the matrix X 
% with the corresponding eigenvectors as its columns 
[X, ~] = eigs(L,k);

% All elements of X at the power of 2
Z = zeros(n,k);
for i = 1 : n
    for j = 1 : k
        Z(i,j) = X(i,j) * X(i,j); 
    end
end

% Renormalize each row in X to have a unit length and build the matrix Y
Y = zeros(n,k);
for i = 1 : n
    for j = 1 : k
        s      = sqrtm( sum(Z(i,:)) ); 
        Y(i,j) = X(i,j) / s;
    end
end

% Treating each row of Y as a point, cluster them using k-means
[kM, kMInd] = k_means(Y, k, sigma);
