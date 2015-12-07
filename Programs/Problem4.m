% Problem 4
% Write a program to design an IIR high-pass digital filter based on a Butterworth analogue prototype. 
%The user should be able to specify the filter with: the -3 dB cut-off frequency; and the frequency at 
%an X dB attenuation point of the filter; and the sampling rate. (From these specifications the program 
%should automatically determine the required filter order).
% Plot the magnitude of the frequency response of the filter.

point_1_f = input('Enter desired -3dB cut-off frequency : ')
point_2 = input('Enter next attenuation point (dB): ')
point_2_f = input('Enter desired frequency at the next attenuation point : ')
sample_rate = input('Enter sampling rate : ')

T = 1/sample_rate;
w = 0:sample_rate;
w_ac = (2/T) * tan(2*pi * point_1_f * T / 2);
w_att = (2/T) * tan(2*pi * T * point_2_f/2);

filter_order = round(log10(10^(point_2/10) - 1) / (2*log10(w_ac/w_att)));
disp(['Filter has order: ', num2str(filter_order)]);

z = exp(1i*w*T);
% High-pass filter:
G = (z-1) ./ (2 + w_ac * (T/2)).*z + (w_ac*(T/2) - 1);

% Plot up until operating range of filter at z=-1
h = figure;
plot(w,abs(G).^2);
xlabel('Frequency');
ylabel('G(f)');
title('Frequency Response of Filter')