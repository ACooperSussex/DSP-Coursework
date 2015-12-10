%conv
%Candidate No. 137037
%Date Created: 27 November 2015
%Last Modified: 09 December 2015

function [conv1,conv2]=conv(x,y);
close all; clc;
format long;
clear conv1 conv2 conv3
lx=length(x);
ly=length(y);
n=lx+ly-1;


x_f = fft(x);
y_f = fft(y);
%Linear Correlation
conv1=ifft(((x_f)).*y_f);
%Circular Correlation
xz=fft([x zeros(1,ly-1)]);
yz=fft([zeros(1,lx-1) y]);
conv2=ifft(xz.*yz);

conv3 = conv2(1:100)+conv2(100:end);
%plot sequence 1
stem(x,'filled')
ylabel('amplitude')
xlabel('time')
title('Plot sequence x')


%plot sequence 2
figure;
stem(y,'filled')
ylabel('amplitude')
xlabel('time')
title('Plot sequence y')

%Plot Correlated Sequence without Zero Supplementation (Linear)
figure;
stem(conv1,'filled')
ylabel('amplitude')
xlabel('time')
title('Plot of Correlated Sequence without Zero Supplementation (Linear)')

%Plot Correlated Sequence with Zero Supplementation (Circular)
figure;
stem(conv2,'filled')
ylabel('amplitude')
xlabel('time')
title('Plot of Correlated Sequence with Zero Supplementation (Circular)')

%Plot of summed circular correlation
figure;
plot(1:100,conv3)
hold on
plot(1:100,conv1,'r')
ylabel('amplitude')
xlabel('time')
title('Plot of summed circular correlation and linear correlation')
