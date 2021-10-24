% Image parameters
m = 200;
n = 100;

f = [0.3*ones(m,n) 0.7*ones(m,n)];
f_hist = imhist(f);

% Gaussian noise with zero-mean and variance of 0.01
gaussian_f = imnoise(f, 'gaussian');
gaussian_hist = imhist(gaussian_f);

% Salt and pepper noise with density of 0.05
sp_f = imnoise(f, 'salt & pepper');
sp_hist = imhist(sp_f);

% Speckle noise with variance of 0.04;
speckle_f = imnoise(f, 'speckle', 0.04);
speckle_hist = imhist(speckle_f);


% Plot noisy images
lena_fig = figure('Name', 'Toy Image with Additive Noise', 'NumberTitle', 'off');
subplot(4,2,1)
imshow(f)
title('Original Image')
subplot(4,2,2)
imhist(f)
title('Original Image Histogram')

subplot(4,2,3)
imshow(gaussian_f)
title('Gaussian Noise');
subplot(4,2,4)
imhist(gaussian_f)
title('Gaussian histogram');

subplot(4,2,5)
imshow(sp_f)
title('Salt and Pepper Noise')
subplot(4,2,6);
imhist(sp_f)
title('Salt and Pepper Histogram');
xlim([-0.1, 1.1])

subplot(4,2,7)
imshow(speckle_f)
title('Multiplicative Speckle Noise')
subplot(4,2,8)
imhist(speckle_f)
title('Multiplicative Speckle Histogram')
