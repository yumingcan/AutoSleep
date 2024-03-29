function [y,t]=filterIIR(x)                    
fs=1024;                           % 读入信号数据和采样频率
N=length(x);                       % 信号长N
t =(0:N-1)./fs;                    % 时间刻度 
fs2=fs/2;                          % 设置奈奎斯特频率
W0=50/fs2;                         % 陷波器中心频率50Hz
BW=0.1;                            % 陷波器带宽 
[b,a]=iirnotch(W0,BW);             % 设计IIR数字陷波器
y=filter(b,a,x);                   % 对信号滤波
