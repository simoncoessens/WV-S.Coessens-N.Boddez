% gewone plot
f = figure;
f.Position = [100 100 600 400];
hold on
%title('Reconstructielijn');
xlabel('Groepsgrootte')
ylabel('Aantal testen')

load('100_19100_noiseless.mat');
plot(result(1:10,1),result(1:10,2),LineWidth=1.5, color='#02b002');

load('100_9600_linprog_noisy.mat');
plot(result(1:end-1,1),result(1:end-1,2),LineWidth=1.5, color='#fc7d1c');

legend("zonder ruis", "met ruis");
legend('Location','northwest')
set(gca,"FontSize",14);

xlim([0 8000])


% plot van de percenten
%prctn = result(:,2) ./ result(:,1);
%figure;
%plot(result(:,1),prctn);