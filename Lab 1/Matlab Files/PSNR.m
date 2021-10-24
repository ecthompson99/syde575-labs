function [PSNR_out] = PSNR(f,g)
% Calculates the peak signal to noise ratio (PSNR).
%
% Args:
%   f (2D matrix) : Reference image array.
%   g (2D matrix) : Test image array.
%
% Returns:
%   PSNR_out (float) : The peak signal to noise ratio between reference and
%   test images.

    % Get image size
    dims = size(f);
    m = dims(1);
    n = dims(2);
    
    % Max pixel intensity
    max_f = 255.0;
    
    % Calculate mean squared error between images
    mse = 1/(m*n) * sum((double(f) - double(g)).^2, 'all');
    
    % Peak signal to noise ratio calculation
    PSNR_out = 10*log10((max_f^2) / mse);
end