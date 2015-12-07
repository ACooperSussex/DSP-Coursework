% Use of a Moving-Average filter to smooth a signal
% corrupted by noise.
R = 50;
noiseSig = rand(R,1)-0.5;
m = 0:1:R-1;
sig1 = 2*m.*(0.9.^m);
corrSig = sig1 + noiseSig';
plot(m,noiseSig,'r-',m,sig1,'b--',m,corrSig,'g:')
xlabel('Time index n'); ylabel('Amplitude')
legend('noiseSig[n]','sig1[n]','corrSig[n]');
pause
M = input('Number of input samples = ');
b = ones(M,1)/M;
smoothSig = filter(b,1,corrSig);
plot(m,sig1,'r-',m,smoothSig,'b--')
legend('sig1[n]','smoothSig[n]');
xlabel ('Time index n');ylabel('Amplitude')


%Swaps the plot colours, which is confusing.
%Filters out the noise by smoothing the curve using a moving average.
%Shouldn't use an input sample value that is too high.