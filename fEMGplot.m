function fEMGplot(y,t)
figure()
plot(t,y,'k');
xlabel('Time/s'); ylabel('Amplitude');
title('filtered EMG')
set(gcf,'color','w');