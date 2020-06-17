pkg load queueing

clc;
clear all;
close all;

breakProb = 0.001:0.001:0.999;
lambda = 10000;

mu1 = (15 * 10^6) / (128 * 8);
mu2 = (12 * 10^6) / (128 * 8);

lambda1 = breakProb.*lambda;
lambda2 = (1-breakProb).*lambda;

[U1 R1 Q1 X1 P1] = qsmm1(lambda1,mu1);
[U2 R2 Q2 X2 P2] = qsmm1(lambda2,mu2);

R = breakProb.*R1 + (1-breakProb).*R2;

figure(1);
plot(breakProb,R,'r',"linewidth",2);
title("Average waiting time","fontsize", 15);
xlabel("Prob a","fontsize", 15);
ylabel("Average waiting time (sec)","fontsize", 15);
saveas (1, "figure1.png");
[minR,position] = min(R);
display(minR);
display(position);

clc;
clear all;
close all;
exit;