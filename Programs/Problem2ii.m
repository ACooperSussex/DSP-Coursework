%Problem 2(ii) 
%Write a program to cross-correlate two sequences
clear all; close all;

N = 200;
% sin-shaped signal -- slowly varying
x(1:N) = sin((1:N) / 20);
y(1:N) = sin(((1:N)+20) / 20);

% Initialize array to hold the correlation data
psi = x*0;

for i = 1:N
    yshift = circshift(y,[0,(i + N/2)]);
    psi(i) = N^-1 * sum(x .* yshift);
end

h = figure
subplot(1,2,1)
plot(-floor(N/2)+1:floor(N/2),x,'b');
title('Input Functions');
axis([-floor(N/2)+1 floor(N/2) -1 1]);
hold on;
plot(-floor(N/2)+1:floor(N/2),y,'r');
subplot(1,2,2)
plot(1:size(psi,2),psi);
title('Cross-correlation Function');



