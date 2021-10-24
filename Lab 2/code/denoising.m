% Load and preprocess Lena image
lena = imread('images/lena.tiff');
lena_gray = rgb2gray(lena);
lena_double = double(lena_gray)/255;
variance = 0.002;
lena_noise = imnoise(lena_double, 'gaussian', 0, variance);
lena_noise_psnr = psnr(lena_double, lena_noise);

% Plot images
lena_fig = figure('Name', 'Lena Noisy', 'NumberTitle', 'off');

subplot(2,2,1)
imshow(lena_double)
title('Lena Original Image')
subplot(2,2,2)
imhist(lena_double)
title('Lena Original Histogram')

subplot(2,2,3)
imshow(lena_noise)
title(sprintf('Lena Noise Image, PSNR: %.3f',lena_noise_psnr)); 
subplot(2,2,4)
imhist(lena_noise)
title('Lena Noise Histogram')

% Declare Filter Configs
filter_type = 'gaussian';
filter_name = 'Gaussian';
filter_size = 7;

if strcmp(filter_type, 'gaussian')
    filter_std = 1;
    filter = fspecial(filter_type,filter_size, filter_std);
else
    filter = fspecial(filter_type,filter_size);
end

% Plot filter;
figure('Name', sprintf('%dx%d %s Filter', filter_size, filter_size, filter_name));
imagesc(filter);
colormap(gray);
grid on;
tick_vals = (1:filter_size)-0.5;
annot_vals = 1:filter_size;
xticks(tick_vals);
yticks(tick_vals);

count = 1;
for i=1:length(annot_vals)
    for j=1:length(annot_vals)
        text(i, j, sprintf('%.3f', filter(count)));
        count = count + 1;
    end
end

title(sprintf('%dx%d %s Kernel', filter_size, filter_size, filter_name));

% Denoise model using 3x3 filter
lena_filter = imfilter(lena_noise, filter);
lena_filter_psnr = psnr(lena_double, lena_filter);

% Plot denoised models
lena_denoised = figure('Name', 'Lena Denoised', 'NumberTitle', 'off');

subplot(1, 2, 1)
imshow(lena_filter);
title(sprintf('Lena %dx%d %s Image, PSNR: %.3f', filter_size, filter_size, filter_name, lena_filter_psnr));

subplot(1,2,2)
imhist(lena_filter);
title(sprintf('Lena %dx%d %s Histogram', filter_size, filter_size, filter_name));

figure;
subplot(1, 3, 1);
imhist(lena_double)
title('Lena Original Histogram')

subplot(1, 3, 2);
imhist(lena_noise)
title('Lena Noise Histogram')

subplot(1, 3, 3);
imhist(lena_filter);
title(sprintf('Lena %dx%d %s Histogram', filter_size, filter_size, filter_name));