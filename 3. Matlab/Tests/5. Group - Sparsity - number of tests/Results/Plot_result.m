load("100_20000.mat");
figure
hold on
surf(n_start:n_step:n_max,k_min:k_step:k_max,result)
%title('Heatmap aantal metingen');
xlabel('Groepsgrootte');
ylabel('Spaarsheid');
zlabel('Aantal metingen')
%yticks([0.001 0.01 0.02 0.03 0.04 0.05])
%xlim([0 8100])
colorbar
set(gca,"FontSize",14);