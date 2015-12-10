%ButterworthHP
%Candidate No. 137037
%Date Created: 27 November 2015
%Last Modified: 09 December 2015


function [G]= ButterworthHP(CuttoffFreq,Stopbandedge,Stopbandattenuation,Samplingfreq) 

close all; clc;

wsam=Samplingfreq;
T=1/wsam;
wc=(2/T)*tan((T*(CuttoffFreq*2*pi))/2);
wst=(2/T)*tan((T*(Stopbandedge*2*pi))/2);
xdb=(Stopbandattenuation);
n=ceil(log10(sqrt((10^(xdb/10))-1))/log10(wc/wst)); 


w=(0:wsam);
for Z=1:wsam+1;
    z = exp(1i*2*pi*w(Z)*T);
    sbt=(2/T)*((z-1)/(z+1)); %Bilinear transform
    sn=(sbt^n)/((sbt^n)+((-1)^n)*wc^n);  %Apply filter order
    G(Z)=sn;
    G2(Z)=(0.579*(z-1))/(z-0.1584);
    
end


str=sprintf('Butterworth Highpass Filter with n=%d',n);
plot(w,abs(G).^2);
title(str)
xlabel('Frequency (Hz)'); 
ylabel('Magnitude (dB)');