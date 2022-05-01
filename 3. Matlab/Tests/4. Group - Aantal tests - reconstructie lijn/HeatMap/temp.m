
% naar normale richting brengen, (matlab telt naar beneden)
result = flipud(result);
[max_row, max_collumn] = size(result)


% heatmap maken
n = 1:100:1000;
m = 1:step_m:max_row;
imagesc(n,m,result)
colormap default
colorbar
% heatmap maken
n = 1:100:4800;
m = 1:step_m:(max_row*step_m);
imagesc(n,m,result)
colormap default
colorbar
