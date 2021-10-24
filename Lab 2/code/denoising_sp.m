% Load and preprocess Lena image
lena = imread('images/lena.tiff');
lena_gray = rgb2gray(lena);
lena_double = double(lena_gray)/255;

% Add noise to image
density = 0.05;
lena_noise_sp = imnoise(lena_double, 'salt & pepper', density);
lena_noise_psnr = psnr(lena_double, lena_noise_sp);

% Plot original, noisy image + histograms
lena_fig = figure('Name', 'Lena Noisy', 'NumberTitle', 'off');

subplot(2,2,1)
imshow(lena_double)
title('Lena Original Image')
subplot(2,2,2)
imhist(lena_double)
title('Lena Original Histogram')

subplot(2,2,3)
imshow(lena_noise_sp)
title(sprintf('Lena Noise Image, PSNR: %.3f',lena_noise_psnr)); 
subplot(2,2,4)
imhist(lena_noise_sp)
title('Lena Noise Histogram')
xlim([-0.1, 1.1])


% Create filters
gaussian_std = 1;
filter_g77 = fspecial('gaussian', 7, gaussian_std);
filter_av77 = fspecial('average', 7);

% Apply filters
lena_g77 = imfilter(lena_noise_sp, filter_g77);
lena_g77_psnr = psnr(lena_double, lena_g77);

lena_av77 = imfilter(lena_noise_sp, filter_av77);
lena_av77_psnr = psnr(lena_double, lena_av77);

% Plot denoised images + psnr
figure;
subplot(1, 3, 1);
imshow(lena_double)
title('Lena Original Image');

subplot(1, 3, 2);
imshow(lena_av77);
title(sprintf('7x7 Averaging, PSNR: %.3f', lena_av77_psnr))

subplot(1, 3, 3);
imshow(lena_g77);
title(sprintf('7x7 Gaussian, PSNR: %.3f', lena_g77_psnr))

% Plot denoised images + histograms
lena_denoised = figure('Name', 'Lena S&P Denoised', 'NumberTitle', 'off');

subplot(1, 4, 1);
imhist(lena_double);
title('Lena Original Histogram')

subplot(1, 4, 2);
imhist(lena_noise_sp)
title(sprintf('Lena Noise, PSNR: %.3f', lena_noise_psnr));
xlim([-0.1, 1.1])

subplot(1, 4, 3);
imhist(lena_av77);
title(sprintf('7x7 Averaging, PSNR: %.3f', lena_av77_psnr))

subplot(1, 4, 4);
imhist(lena_g77);
title(sprintf('7x7 Gaussian, PSNR: %.3f', lena_g77_psnr))