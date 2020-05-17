pkg load queueing
addpath(pwd);
function Result = erlang_iterative(ro,n)
    i = 0;
    Result = 1;
    while i <= n
        Result = ro * Result/(ro*Result + i);
        i = 1+i;
    endwhile
endfunction

display(erlang_iterative(1024,1024));
display(erlangb(1024,1024));

ro = 200*23/60;
c = 1:200;
for k=1:200
    erl(k) = erlang_iterative(ro,k)
endfor
figure(1);
hold on;
title("Probabilities per state")
xlabel("State")
ylabel("Probability")
plot(c, erl, "b", "linewidth", 1.5);
grid on;
saveas (1, "figures/figureIterative.png")
hold off;
P=1;
lines = 0;
while P>0.01
    P = erlang_iterative(ro,lines);
    lines++;
endwhile
display(lines);
clc;
clear all;
close all;
exit;