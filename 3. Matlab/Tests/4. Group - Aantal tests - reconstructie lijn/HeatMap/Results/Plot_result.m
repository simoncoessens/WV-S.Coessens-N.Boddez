load('heat_data_1_4700.mat');

% heatmap maken
[max_row, max_collumn] = size(result);
n = 1:100:5000;
m = 1:step_m:(max_row*10);
imagesc(n,m,result)
colormap default
colorbar