% Problem # 3 Soln.:
%-----------Comparison of Correlation Methods-
%-----------
%-----------Candidate No. 137377 ---------------
%
% Graph 1 shows the input functions, Graph 2 shows the linear correlation, Graph 3 shows the circular correlation, Graph 4 shows the summed version of Graph 3 to show that it is the same as Graph 2.
% Ultimately, the different methods produce the same output in Graphs 2 and
% 4. However, the zero-padding circular method produces an output that is
% periodic and must be summed to produce the final result. 

clear all; close all;

N = 200;
% sin-shaped signal -- slowly varying
x(1:N) = sin((1:N)/20);
x_f = fft(fftshift(x));
y(1:N) = sin(((1:N)+20) / 20);
y_f = fft(fftshift(y));

% Correlation without Padding
% Do the multiplication in frequency space
psi_f = x_f .* conj(y_f);
psi_1 = (ifft(psi_f))/N;

% Correlation with Zero Padding
% Pad arrays to size N >= N_1 + N_2 - 1
pad_size = size(x,2) + size(y,2) - 1;
x_padded = zeros(1,pad_size); x_padded(size(x,2):end) = x(1:end); 
y_padded = zeros(1,pad_size); y_padded(1:size(y,2)) = y(1:end);
x_padded_f = fft(fftshift(x_padded));
y_padded_f = fft(fftshift(y_padded));

y_save = x_padded_f .* conj(y_padded_f);
y_save = ifftshift(ifft(y_save));

psi_2 = y_save / N;
psi_2_sum = (y_save(1:N) + y_save(N:end)) / N;


h = figure
subplot(1,4,1)
plot(-floor(N/2)+1:floor(N/2),x,'b');
title('Input Functions');
axis([-floor(N/2)+1 floor(N/2) -1 1]);
hold on;
plot(-floor(N/2)+1:floor(N/2),y,'r');
subplot(1,4,2)
plot(-N/2:N/2-1,psi_1);
title('DFT Correlation Method -- Linear');
axis([-N/2 N/2 -1 1])
subplot(1,4,3)
plot(-N+1:N-1,psi_2); hold on;
title('With Padding -- Circular')
axis([-N N -1 1])
subplot(1,4,4)
plot(-N/2:N/2-1,psi_2_sum);
title('With Padding and Sum -- Summed Circular')
axis([-N/2 N/2 -1 1])