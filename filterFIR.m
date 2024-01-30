function y=filterFIR(x,f1,f2)                    
fs=1024;                           % 读入信号数据和采样频率
fs2=fs/2;                          % 设置奈奎斯特频率
W1=f1/fs2;                         % 通带频率1                      
W2=f2/fs2;                         % 通带频率2
b=fir1(48,[W1 W2]);                % 设计FIR数字滤波器
y=filter(b,1,x);                   % 对信号滤波