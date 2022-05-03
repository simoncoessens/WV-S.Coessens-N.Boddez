load('heat_data_1_4700.mat');
%load('1_2600.mat');
% heatmap maken
result = flipud(result);
[max_row, max_collumn] = size(result);
n = 1:100:4701;
m = 1:10:(max_row*10);
%m = 1800.-m;

f = figure;
hold on
f.Position = [100 100 600 400];
title('Reconstructiegraad');
xlabel('Groep grootte')
ylabel('Aantal metingen')
xlim([0 4700]);
ylim([0 1800]);

imagesc(n,m,result)
colorbar
%set(gca,'YDir','normal')
%colormap default
%colorbar
set(gca,"FontSize",14);

%set(gca, 'YDir','reverse')
%heatmap(n,m,result);
%surf(n,m,result);
%imagesc(n,m,result);