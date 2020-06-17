clc;
clear all;
close all;
a=0.001:0.001:0.999;
l = 10*1000;
m_1 = 15*10^6/128/8;
m_2 = 12*10^6/128/8;
l_1 = a.*l;
l_2 = (1-a).*l;
[U1 R1 Q1 X1 P1] = qsmm1(l_1,m_1);
[U2 R2 Q2 X2 P2] = qsmm1(l_2,m_2);
R = a.*R1 + (1-a).*R2;
figure(1);
plot(a,R,'b');
title("Mean waiting time per value of a");
xlabel("a");
ylabel("mean waiting time (sec)");
[min_R,min_pos] = min(R);

