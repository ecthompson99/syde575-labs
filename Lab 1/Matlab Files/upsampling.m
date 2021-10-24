% Load images from files.
lena = imread('images/lena.tiff');
cameraman = imread('images/cameraman.tif');

% Convert to grayscale
lena_g = rgb2gray(lena);
cameraman_g = cameraman; % cameraman is already grayscale

% Downsample
lena_down = imresize(lena_g, 1/4, 'bilinear');
cameraman_down = imresize(cameraman_g, 1/4, 'bilinear');

% Constants
upscale_factor = 4;

% NN Interpolation
lena_nn = imresize(lena_down, upscale_factor, 'nearest');
lena_nn_psnr = PSNR(lena_g, lena_nn);
cameraman_nn = imresize(cameraman_down, upscale_factor, 'nearest');
cameraman_nn_psnr = PSNR(cameraman_g, cameraman_nn);

% Bilinear Interpolation
lena_bilinear = imresize(lena_down, upscale_factor, 'bilinear');
lena_bilinear_psnr = PSNR(lena_g, lena_bilinear);
sprintf('Bilinear Lena PSNR: %.3f', PSNR(lena_g, lena_bilinear))
cameraman_bilinear = imresize(cameraman_down, upscale_factor, 'bilinear');
cameraman_bilinear_psnr = PSNR(cameraman_g, cameraman_bilinear);

% Bicubic Interpolation
lena_bicubic = imresize(lena_down, upscale_factor, 'bicubic');
lena_bicubic_psnr = PSNR(lena_g, lena_bicubic);
cameraman_bicubic = imresize(cameraman_down, upscale_factor, 'bicubic');
cameraman_bicubic_psnr = PSNR(cameraman_g, cameraman_bicubic);

% Plotting lena
lena_fig = figure('Name', 'Lena Upsampled', 'NumberTitle', 'off');
subplot(2,2,1)
imshow(lena_g)
title('Original Image')
subplot(2,2,2)
imshow(lena_nn)
title('Nearest Neighbour')
subplot(2,2,3)
imshow(lena_bilinear)
title('Bilinear Interpolation')
subplot(2,2,4)
imshow(lena_bicubic)
title('Bicubic Interpolation')

% Plotting cameraman
cameraman_fig = figure('Name', 'Cameraman Upsampled', 'NumberTitle', 'off');
subplot(2,2,1)
imshow(cameraman_g)
title('Original Image')
subplot(2,2,2)
imshow(cameraman_nn)
title('Nearest Neighbour')
subplot(2,2,3)
imshow(cameraman_bilinear)
title('Bilinear Interpolation')
subplot(2,2,4)
imshow(cameraman_bicubic)
title('Bicubic Interpolation')
