clc;
clear all;
close all;
function [r,ergodic] = intensities(l,m)
r(1) = l(1);
r(2) = l(2) + 2*l(1)/7;
r(3) = 4*l(1)/7;
r(4) = 3*l(1)/7;
r(5) = l(2) + 4*l(1)/7;
r = r./m;
for i=1:5 
  disp(r(i));
endfor
ergodic = ((r(1)<1) && (r(2)<1) && (r(3)<1) && (r(4)<1) && (r(5)<1));
if (ergodic == 1)
  display("Ergodic");
else 
  display("Not Ergodic");
endif
endfunction


function [R, sum] = mean_clients(l,m)
[r,ergodic] = intensities(l,m);
R = r ./ (1-r);
sum = sum(R)/sum(l);
endfunction

l=[4 1];
m=[6 5 8 7 6];
[R, sum] = mean_clients(l,m);
disp(sum);


j=1;
for i=0.1:0.01:0.99
[R, sum2] = mean_clients([i*6 1],m);
mean_delay(j) = sum2
j = j+1;
endfor
i=0.1:0.01:0.99
lam1 = i.*6;
figure(2);
plot(lam1,mean_delay,'g',"linewidth",1.5);
title("Mean waiting time per value of lambda");
xlabel("lambda");
ylabel("mean waiting time (sec)");