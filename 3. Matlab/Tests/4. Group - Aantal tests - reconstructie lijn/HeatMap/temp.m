

% heatmap maken
n = 1:100:4800;
m = 1:step_m:(max_row*step_m);
imagesc(n,m,result)
colormap default
colorbar
