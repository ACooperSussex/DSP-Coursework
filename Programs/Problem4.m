% Problem # 4 Soln.:
%-----------IIR Filter Design-------------
%-----------
%-----------Candidate No. 137377 ---------------
% Computes the frequency response through the bilinear transform method of
% a high-pass IIR filter.
% See report for the derivation of G.

clear all; close all;

% point_1_f = input('Enter desired -3dB cut-off frequency : ')
% point_2 = input('Enter next attenuation point (dB): ')
% point_2_f = input('Enter desired frequency at the next attenuation point : ')
% sample_rate = input('Enter sampling rate : ')

% Inputs used for graph in report
point_1_f = 1000;
point_2 = 10;
point_2_f = 350;
sample_rate = 5000;

T = 1/sample_rate;
w = 2*pi*(0:sample_rate/2);
w_ac = (2/T) * tan(2*pi * point_1_f * T / 2);
w_att = (2/T) * tan(2*pi * point_2_f * T /2);

filter_order = round(log10(10^(point_2/10) - 1) / (2*log10(w_ac/w_att)));
disp(['Filter has order: ', num2str(filter_order)]);

% Generate range of frequencies based on sample rate
z = exp(1i*w*T);
% Apply substitution for s for the type of filter, and the bilinear
% transform
s = ((2/T) .* ((z-1)./(z+1))).^filter_order;
G = s ./ (s + (-1 ^ filter_order) * (w_ac)^filter_order);

% High-pass filter:


% Plot up until operating range of filter at z=-1
h = figure;
plot(w./(2*pi),abs(G).^2);
xlabel('Frequency');
ylabel('|G(f)|^2');
title('Frequency Response of Filter')