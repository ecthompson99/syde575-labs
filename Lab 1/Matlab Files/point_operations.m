tire = imread('images/tire.tif');
% imshow(tire);
% title('Tire Image')
% imhist(tire);
% title('Tire histogram')
% ylim([0 2100])

% Negative Tire Image Histogram
figure;
tire_negative = imcomplement(tire);
imshow(tire_negative);
title('Tire Negative Image')

imhist(tire);
title('Tire Negative Histogram')
ylim([0 2100])

figure;
gamma = 0.5;
tire_gamma = uint8((double(tire)./255).^gamma*255);
imhist(tire_gamma);
title('Gamma Corrected Tire Image, gamma = 0.5')
% xlim([0 255])
% ylim([0 3300])

% imhist(eq_tire)
% title('Equalized Tire histogram')
% ylim([0 2100])