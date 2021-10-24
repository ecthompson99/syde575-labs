% Histogram Equalization
% Plot Equalized Image
figure;
tire_eq = histeq(tire);
imshow(tire_eq);
title('Equalized Tire Image');

% Plot Equalized Image Histogram
figure;
imhist(tire_eq);
title('Equalized Tire Image Histogram');
