%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DAKM Algorithm
%
% Extends k-means assuming there are two valid clusterings associated to
% two different views of the data (one for actions and one for scenes).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [kM, kMInd] = dakm(X, Y, k_x, k_y, lambda)


% Initialize clusterings with original k-means
[centroid_x, cluster_x] = k_means(X, k_x, 0);
[centroid_y, cluster_y] = k_means(Y, k_y, 0);

% Proceed until the clusterings C_action and C_scenes do not change
newUpdate = 1;

while newUpdate == 1
    
    % Update correlation matrix R
    R = updateRelationships(cluster_x, cluster_y, lambda);
    
    % Update clustering memberships
    [cluster_x, cluster_y] = updateMemberships(X, Y, centroid_x, centroid_y, R);
    
    % Update centroids of X
    centroid_x = updateCentroid(X, cluster_x, k_x);
    centroid_y = updateCentroid(Y, cluster_y, k_y);
end


end
