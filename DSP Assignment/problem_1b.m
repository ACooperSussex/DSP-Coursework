%Problem_1b.m
%Candidate No. 137037
%Date Created: 27 November 2015
%Last Modified: 09 December 2015


clear all; close all; clc; %Clear all variables, close all figures and clear the command line.
A=input('Enter amplitude:'); %Specify the amplitude
T=input('Enter the period:'); %Specify the period
D=input('Enter the duty cycle:'); %Specify the duty cycle

tau=T*D; %Time signal is active
t(1)=0;
i=1;
l=0;
C=T;

%Generate Sawtooth shape
for j=1:4
    while t(i)<C
        i=i+1;
        t(i)=t(i-1)+1e-3;
        if t(i)<tau;
            x(i)=A*t(i-l)/(tau-T*(j-1));
        else
            x(i)=0;
        end
    end
    l=i-1;
    C=C+T;
    tau=tau+T;
end
%Plot Sawtooth
str=sprintf('Plot with Amplitude=%d Period=%d Duty cycle=%d',A,T,D);
plot(t,x)
xlabel('Time index(n)')
ylabel('Amplitude')
title(str)