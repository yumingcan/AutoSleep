function y=filterFIR(x,f1,f2)                    
fs=1024;                           % �����ź����ݺͲ���Ƶ��
fs2=fs/2;                          % �����ο�˹��Ƶ��
W1=f1/fs2;                         % ͨ��Ƶ��1                      
W2=f2/fs2;                         % ͨ��Ƶ��2
b=fir1(48,[W1 W2]);                % ���FIR�����˲���
y=filter(b,1,x);                   % ���ź��˲�