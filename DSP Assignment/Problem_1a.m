%Problem_1a.m
%Candidate No. 137037
%Date Created: 19 ?November ?2015
%Last Modified: 09 December 2015


clear all; close all; clc %Clear all variables, close all figures and clear the command line.
n=[-10:0.5:10]; %Generate a sequence from -10 to 10 in steps of 0.5
delta=(n==3)+(n==-4);
stem(n,delta,'filled'); %plot n against delta
xlabel('Time index(n)');
ylabel('delta(n)');
title('Discete Sequence')
