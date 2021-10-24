% Load tire image
tire = imread('images/tire.tif');

% % Plot tire image
% figure;
% imshow(tire);
% title('Tire Image')
% 
% % Plot tire image histogram
% figure;
% imhist(tire);
% title('Tire histogram')
% ylim([0 2100])

% Negative Tire Image
figure;
tire_negative = imcomplement(tire);
imshow(tire_negative);
title('Tire Negative Image')

% Negative Tire Image Histogram
figure;
imhist(tire);
title('Tire Negative Histogram')
ylim([0 2100])