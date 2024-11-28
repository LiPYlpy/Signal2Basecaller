load('testabfdata.mat')
fs=100000;

T_pA=T150(find(T150==615e3):find(T150==620e3),2); 
T_base=T150(find(T150==600e3):find(T150==605e3),2);
T_mean=mean(T_base)
T_adjust=T_pA+30;

A_pA=A150(find(A150==845e3):find(A150==850e3),2);
A_base=A150(find(A150==845e3):find(A150==855e3),2);
A_mean=mean(A_base)
A_adjust=A_pA-20;

C_pA=C150(find(C150==995e3):find(C150==1000e3),2);
C_base=C150(find(C150==980e3):find(C150==1030e3),2);
C_mean=mean(C_base)
C_adjust=C_pA-150;

G_pA=G150(find(G150==800e3):find(G150==805e3),2);
G_base=G150(find(G150==805e3):find(G150==810e3),2);
G_mean=mean(G_base)
G_adjust=G_pA+30;


% I_pA = T_pA + 

hd=Butter_8_100hz;
I_pA = [T_adjust; A_adjust; C_adjust; G_adjust];
T_pA_filter=filter(hd,T_pA);
A_pA_filter=filter(hd,A_pA);
C_pA_filter=filter(hd,C_pA);
G_pA_filter=filter(hd,G_pA);
I_pA_filter=[(T_pA_filter+30); (A_pA_filter-20); (C_pA_filter-150); (G_pA_filter+30)];
time=1:length(I_pA_filter);
% 
figure(1)
set(gcf, 'Position', [0, 100, 1600, 500])
subplot(2,1,1)
plot(time,I_pA)
% xlim([600e3 650e3])
xlabel('T/ms')
ylabel('Amplitude/pA')
title('放大')
title('滤波前局部图')

subplot(2,1,2)
plot(time,I_pA_filter)
% xlim([600e3 650e3])
xlabel('T/ms')
ylabel('Amplitude/pA')
title('滤波后局部图')