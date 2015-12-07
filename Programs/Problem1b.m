%Problem 1b (i and ii)
%Generate a sawtooth waveform with a chosen duty cycle:
clear all; close all;

%Get the duty cycle percentage. Should be less than 100%.
duty = mod(ceil(input('Enter desired Duty Cycle (%) : ')),100);

%Generate the sawtooth shape
f = @(x) [x/duty.*(0<=x & x<=duty)];
x = linspace(0,100);
y = f(x);

%Number of times to repeat sawtooth in plot
repetitions = 10;
yy = y;
for i=1:repetitions;
yy = cat(2,yy,y);
end

% Plot
h = figure(1);
plot(1:length(yy),yy)
ylim([0 1.2]);
xlim([0 repetitions*100]);