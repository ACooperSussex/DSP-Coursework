%autocorrelate
%Candidate No. 137037
%Date Created: 27 November 2015
%Last Modified: 09 December 2015
 


function [AC] = autocorrelate(x);


lengthx=length(x); %Calculate length of sequence
x_rev= fliplr(x); %flip the vector x
AC=zeros(1,2*lengthx-1); %define variable AC
for n=1:lengthx %autocorrelation loop
    for k=1:lengthx 
        AC(n+k-1)=AC(n+k-1)+x(n)*conj(x_rev(k))/(lengthx);
    end 
end

%plot original sequence
figure
stem(real(x),'filled')
title('Original sequence')
xlabel('time')
ylabel('amplitude')


%Plot auto correlation
figure
stem(real(AC),'filled')
title('Autocorrelation')
xlabel('time')
ylabel('amplitude')


