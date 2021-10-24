% Gamma correction
gammas = [0.5, 1.3];

% Loop through gamma = 0.5, 1.3
for idx = 1:length(gammas)
    gamma = gammas(idx);
    % Normalize image -> gamma correction -> denormalize image
    tire_gamma = uint8((double(tire)./255).^gamma*255);
    
    % Plot gamma corrected image
    figure;
    imshow(tire_gamma);
    title(sprintf('Gamma Corrected Tire Image, gamma = %.2f', gamma));

    % Plot gamma corrected histogram
    figure;
    imhist(tire_gamma)
    title(sprintf('Equalized Tire Histogram, gamma = %.2f', gamma));
    ylim([0 3300])
end