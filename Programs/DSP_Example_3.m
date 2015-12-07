% To convolve two sequences
seq1 = input('Type in the first sequence = ');
seq2 = input('Type in the second sequence = ');
convSeq = conv(seq1, seq2);
M = length(convSeq)-1;
n = 0:1:M;
disp('output sequence =');disp(convSeq)
stem(n,convSeq)
xlabel('Time index n'); ylabel('Amplitude');
