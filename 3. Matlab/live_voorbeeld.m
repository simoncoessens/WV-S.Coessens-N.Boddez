A = imread('steve_mccurry','jpeg');

Abw2 = rgb2gray(A);
[nx,ny] = size(Abw2);
figure(1), subplot(1,2,1), imshow(Abw2)
title(['Original'],'FontSize',14)

Ahat = fft2(Abw2);   %fourier transformatie


%zero out small coefficients
thresh = .1*0.001*max(abs(Ahat(:)));
ind = abs(Ahat)>thresh;
AhatFilt = Ahat.*ind;
count = nx*ny - sum(ind(:));
percent = 100-count/(nx*ny)*100;
Afilt = ifft2(AhatFilt);
figure(1), subplot(1,2,2),imshow(uint8(Afilt));
title([num2str(percent) '% of FFT basis'],'FontSize',14)