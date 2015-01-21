%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that updates the actions and scenes clusterings according to
% the information they share, saved in the correlation matrix R.
%
% Author: Oriana Baldizan
% Date: December 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [cluster_x cluster_y]  = updateRelationships(X, Y, centroid_x, centroid_y, R)

sz = size(X);
n  = sz(1);

sz_x = size(centroid_x);
sz_y = size(centroid_y);
k_x  = sz_x(1);
k_y  = sz_y(1);

% Keep the distances according to both clusterings
dists = zeros(k_x, k_y);

for i = 1 : n 
    for j = 1 : k_x
       for l = 1 : k_y
           norm_x     = norm(X(i, :) - centroid_x(j, :));
           norm_y     = norm(Y(i, :) - centroid_y(j, :));
           dists(j,l) = (norm_x + norm_y) / R(j,l);
       end
    end
    
    % Keep the minimal distance
    cluster_x(i,:) = min 
end

end