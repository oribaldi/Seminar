%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that implements k-means clustering with euclidean distance.
%
% Author: Oriana Baldizan
% Date: December 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [kM, kMInd] = k_means(X, k, ~)

sz    = size(X);
r     = sz(1);
c     = sz(2);
delta = inf;
idx   = zeros(r, 1); % Clusters membership for each sample
o_idx = idx; % To track if there are still changes in the clusters

% Initialize centroids picking k random points in X
rd        = randperm(r);
centroids = X(rd(1:k), :);

% Run k-means
while delta > 0.01
    
    % Find the closest centroid for each sample
    len = zeros(k, 1);
    for i = 1 : r
        for j = 1 : k
            len(j) = norm(X(i, :) - centroids(j, :))^2;
        end
        
        [Jmin, idx(i)] = min(len);
    end
        
    % Update centroids given the new memberships
    for i = 1 : k
        indices         = find(idx == i);
        centroids(i, :) = mean(X(indices, :));
    end
    
    delta = idx - o_idx;
    o_idx = idx;
end

kM    = centroids;
kMInd = idx;

end
