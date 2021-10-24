% Load and preprocess Lena image
lena = imread('images/lena.tiff');
lena_gray = rgb2gray(lena);
lena_double = double(lena_gray)/255;

% Define filters
h1 = (1/6)*ones(1,6);
h2 = h1';
h3 = [-1 1];

% Convolve image.
c1 = conv2(lena_double, h1);
c2 = conv2(lena_double, h2);
c3 = conv2(lena_double, h3);

% Plot images
lena_fig = figure('Name', 'Lena Convolutions', 'NumberTitle', 'off');
subplot(2,2,1)
imshow(lena_double)
title('Original Image')
subplot(2,2,2)
imshow(c1)
title('Convolution h1')
subplot(2,2,3)
imshow(c2)
title('Convolution h2')
subplot(2,2,4)
imshow(c3)
title('Convolution h3')