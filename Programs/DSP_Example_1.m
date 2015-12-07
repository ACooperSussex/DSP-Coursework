% To generate a complex exponential sequence
realExp = input('Type in real exponent = ');
imExp = input('Type in imaginary exponent = ');
c = realExp + imExp*i;
A = input('Type in the gain constant = ');
N = input ('Type in length of sequence = ');
n = 1:N;
x = A*exp(c*n);%Generate the sequence
stem(n,real(x));%Plot the real part
xlabel('Time index n');ylabel('Amplitude');
title('Real part');
disp('ENTER');
pause
stem(n,imag(x));%Plot the imaginary part
xlabel('Time index n');ylabel('Amplitude');
title('Imaginary part');


% All this does is plot a complex exponential function A*exp((real + imag) * n)