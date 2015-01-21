%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function that plosts the clusters found in the data "file", by the 
% chosed algorithm "algo" Based on: https://github.com/jagatsastry/ml-clustering-algos/.
%
% Call k-means:
% plotClusters('myFile.data', xLimit, yLimit, numberOfClusters, @k_means, 0)
%
% Call spectral clustering:
% plotClusters('myFile.data', xLimit, yLimit, numberOfClusters, @spectral_clustering, sigma)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plotClusters(file, xlm, ylm, k, algo, sigma)

% Read the data file
data = dlmread(file);

% Set values for plot
hold on;
axis equal
xlim(xlm);
ylim(ylm);
set(gca, 'FontSize', 14);
colors = ['gh'; 'rd'; 'co'; 'ms'; 'yh';  'wo'; 'gs'; 'rh'; 'cd'; 'mo'; 'ys'; 'wd'; 'go'; 'rs'; 'ch'; 'md'; 'yo'; 'wh'];

% Set title of the plot
%title(ttl,'FontSize',14);

% Call the clustering algorithm "algo"
[Mean, MInd] = algo(data, k, sigma);

% Plot the data and give each cluster a color
for i=1:k
    scatter(data(MInd == i,1), data(MInd == i,2), 15,  char(colors(i, :)));
end

hold off;

end