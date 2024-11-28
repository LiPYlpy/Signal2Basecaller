% 定义滤波器参数
Fs = 100000;    % 采样频率
Fc = 1000;       % 截止频率
N = 8;         % 阶数

% 构造FDESIGN对象并调用其BUTTER方法
h = fdesign.lowpass('N,F3dB', N, Fc, Fs);
Hd = design(h, 'butter');

% 计算频率响应
[H, W] = freqz(Hd, 'half', 1024000);

% 将频率转换为原始频率（单位Hz）
f = (Fs/2/pi) * W;

% 绘制幅值响应曲线
figure;
plot(f, abs(H),'linewidth',3);
title('Butterworth Lowpass Filter Amplitude Response');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0,2000])

phase_response = angle(H);
figure
plot(f,phase_response,'linewidth',3);
title('Butterworth Lowpass Filter Phase Response');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
xlim([0,5000])
