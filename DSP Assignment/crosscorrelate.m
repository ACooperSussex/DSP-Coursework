function [CC] = crosscorrelate(x,y);

close all; clc; %Clear all variables, close all figures and clear the command line.

leng_x=length(x); leng_y=length(y);
y_rev= fliplr(y); 
CC=zeros(1,leng_x+leng_y-1);% Cross-correlation vector % 
for n=1:leng_x
    for k=1:leng_y     
     CC(n+k-1)=CC(n+k-1)+x(n)*conj(y_rev(k))/leng_x;          
    end
end

% Plot of sequence 1  
figure
stem(real(x),'filled'); 
title('Plot of Sequence x');
xlabel('Time index (n)');
ylabel('Amplitude');

% Plot of sequence 2  
figure;
stem(real(y),'filled'); 
title('Plot of Sequence y');
xlabel('Time index (n)'); 
ylabel('Amplitude');

%Plot cross-correlation sequence
figure;
stem(real(CC),'filled'); 
title('Cross-Correlation of Sequence x with Sequence y');
xlabel('Time index (n)');
ylabel('Amplitude');