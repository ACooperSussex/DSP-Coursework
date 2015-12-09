% Problem # 2(i) Soln.:
%-----------Autocorrelation-------------
%-----------
%-----------Candidate No. 137377 ---------------
%Auto-correlate a sequence with itself
clear all; close all;
    
N = 200;
% Simple Line Input
x = (1:200)/N;


% Initialize array to hold the autocorrelation data
psi = x*0;

for i = 1:N
    xshift = circshift(x,[0,(i + N/2)]);
    psi(i) = N^-1 * sum(x .* xshift);
end

h=  figure;
subplot(1,2,1)
plot(-floor(N/2)+1:floor(N/2),x);
title('Input Function');
axis([-floor(N/2)+1 floor(N/2) -1 1]);
subplot(1,2,2)
plot(-floor(N/2)+1:floor(N/2),psi);
title('Autocorrelation Function');
axis([-floor(N/2)+1 floor(N/2) min(psi) max(psi)])
