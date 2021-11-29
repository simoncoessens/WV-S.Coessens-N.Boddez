mf = 6;
i = 3;

err = zeros(5,2);
count = 1;
for n = 1000:2000:10000
    for j = 1:i
        err(count,:) = err(count,:) + group_tester(n,0.05,mf);
    end
    count = count + 1;
end

err = err/i;
figure(1)
subplot(1,2,1)
title(['error percentage'],'FontSize',14)
plot(err(:,1))

subplot(1,2,2)
plot(err(:,2))