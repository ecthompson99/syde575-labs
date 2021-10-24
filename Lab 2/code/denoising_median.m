% Create filters
gaussian_std = 1;
filter_g77 = fspecial('gaussian', 7, gaussian_std);
filter_av77 = fspecial('average', 7);

% Apply filters
lena_med = medfilt2(lena_noise_sp);
lena_med_psnr = psnr(lena_double, lena_med);

% Plot denoised images + psnr
figure;
subplot(1, 2, 1);
imshow(lena_med);
title(sprintf('Median-corrected Image, PSNR: %.3f', lena_med_psnr));

subplot(1, 2, 2);
imhist(lena_med);
title('Median-corrected Histogram');