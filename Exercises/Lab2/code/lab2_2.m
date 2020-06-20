pkg load queueing

clc;
clear all;
close all;

# Sigkrisi me 2 eksipiretites
[U1,R1,Q1,X1] = qsmm1(5,10);

[U2,R2,Q2,X2] = qsmmm(10, 10, 2);
display([R1,R2])

exit;