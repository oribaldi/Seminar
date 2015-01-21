%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that estimates the correlation matrix R between the two given 
% clusterings, using the regularization parameter lambda.
%
% Author: Oriana Baldizan
% Date: December 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function R  = updateRelationships(cluster_x, cluster_y, k_x, k_y, lambda)

sz_x = size(cluster_x);
sz_y = size(cluster_y);
n    = sz_x(1) % Number of action-scene pairs
r    = zeros(k_x, k_y);

marginal_x = zeros(k_x, 1);
marginal_y = zeros(k_y, 1);


% Calculate an estimation of the joint probability and marginal priors
for i = 1 : n
    
    marginal_x(i, :) = 1 / n;
    marginal_y(i, :) = 1 / n;
end

% R = r / (marginal_x X marginal_y)


% Normalize r and obtain r'
for i = 1 : 
    % R = log (1 + lambda * R) / sum( log(1 + lambda * R) )
end