%Problem 1a - Generate the following discrete sequence:
% delta(n-3) + delta(n+4)
x=-5:5;
m = zeros(1,size(x,2));
% Delta function at x= -4
m(2) = 1;
% Delta function at x= 3
m(9) = 1;

h = figure;
circshift(m,-4,1);
stem(x,m)
xlabel('x')
title('Problem 1 -- Delta Function Positions')