%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that updates the centroids of k clusters in the clustering C,
% by re-computing the mean of the points assigned to the corresponding
% cluster. Where C represents the cluster membership for each point in X.
%
% Author: Oriana Baldizan
% Date: December 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function centroids = updateCentroids(X, C, k)

sz = size(X);
rd  = randperm(sz(1));
c_x = X(rd(1:k), :);

for i = 1 : k
    indices = find(C == i);
    c_x(i, :) = mean(X(indices, :));
end

centroids = c_x;

end