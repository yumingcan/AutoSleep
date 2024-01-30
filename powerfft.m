function P1=powerfft(S,n)
Y = fft(S,n);
P2 = abs(Y/n);
P1 = P2(1:n);
P1(2:end-1) = 2*P1(2:end-1);
% ×÷Í¼
% f = Fs*(0:(n/2))/n;
% Pt =P1(1:60);
% ft= f(1:60);
% figure;plot(ft,Pt) 
% title('Single-Sided Amplitude Spectrum of S(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')