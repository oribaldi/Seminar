%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Technische Unversität München
% Computer Vision Group
% Seminar: Current Trends in Machine Learning
%
% Paper: Unsupervised Spectral Clustering of Human Actions in Context.
%
% Summary:
% Implementation of the algorithm DAKM proposed by [1]. The first one
% uses k-means with 2 views and 2 clusterings (one for the actions and
% one for the scenes). The second one combines DAKM with the spectral
% clustering algorithm proposed by Ng et al.
%
% Reference:
% S. Jones and L. Shao. "Unsupervised Spectral Dual Assignment Clustering 
% of Human Actions in Context"
%
% Author: Oriana Baldizan
% Date: December 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


close all;

% Parameters
k_actions = 4;  % number of action clusters
k_scenes  = 40; % number of scene clusters
lambda    = 1;  % controls the sparsity of the correlation matrix R
sigma     = 0.1;

% Load the data and call DAKM
%plotClusters('fourclouds.data', [0 5], [0 5], k_actions, k_scenes, 'DAKM', @dakm, lambda)
dakm('actions.data', 'scenes.data', k_actions, k_scenes, lambda);
