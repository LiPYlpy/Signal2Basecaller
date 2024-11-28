
load('testabfdata.mat')

fs=100000;

time=C150(:,1); % time=testabfdata(:,2)
I_pA=C150(:,2); % time=testabfdata(:,3)
% time=time(1000000:5000000-1);
% I_pA=I_pA(1000000:5000000-1);

figure(1)
set(gcf, 'Position', [0, 100, 1600, 500])
subplot(2,1,1)
plot(time,I_pA)
xlabel('T/ms')
ylabel('Amplitude/pA')
title('滤波前整体图')


[m,n]=size(time);

% y_data=sin(2*pi*2000*time)+sin(2*pi*1000*time);

fft_out=abs((fft(I_pA)));
x_list=(0:(m-1))/m*fs;




% % 均值滤波
% h=fspecial('average',[1,1000]);
% I_pA=filter(h,1,I_pA);
% 
% % 中值滤波
% h_size=1000;
% I_pA=medfilt1(I_pA,h_size);

hd=Butter_8_100hz;
I_pA_filter=filter(hd,I_pA);
subplot(2,1,2)
% hold on
plot(time,I_pA_filter)
xlabel('T/ms')
ylabel('Amplitude/pA')
title('滤波后整体图')

I_pA_filter_fft=abs(fft(fftshift(I_pA_filter)));


figure(3)
set(gcf, 'Position', [0, 100, 1600, 500])
subplot(2,1,1)
plot(time,I_pA)
xlim([995e3 1005e3])
xlabel('T/ms')
ylabel('Amplitude/pA')
title('放大')
title('滤波前局部图')

subplot(2,1,2)
plot(time,I_pA_filter)
xlim([995e3 1005e3])
xlabel('T/ms')
ylabel('Amplitude/pA')
title('滤波后局部图')




figure(4)
set(gcf, 'Position', [0, 100, 1600, 500])
subplot(2,1,1)
plot((x_list(1:floor(m/2-1))),log10(fft_out(1:floor(m/2-1))))
xlabel('frequrency/Hz')
ylabel('Amplitude')
title('滤波前频谱图')
xlim([0 100])

subplot(2,1,2)
plot((x_list(1:floor(m/2-1))),log10(I_pA_filter_fft(1:floor(m/2-1))))
xlabel('frequrency/Hz')
ylabel('Amplitude')
title('滤波后频谱图')
xlim([0,100])
ylim([0,7])




