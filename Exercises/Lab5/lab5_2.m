addpath(pwd);
% (2)
function [rho,is_ergodic] = intensities(lambda,mu)
rho(1) = lambda(1)/mu(1);
rho(2) = (lambda(2) + 2*lambda(1)/7)/mu(2);
rho(3) = (4*lambda(1)/7)/mu(3);
rho(4) = (3*lambda(1)/7)/mu(4);
rho(5) = (lambda(2) + (4/7)*lambda(1))/mu(5);
is_ergodic = true;
for i=1:5 
  printf('Q%d: %f\n',i,rho(i));
  is_ergodic  = is_ergodic && (rho(i) < 1)
endfor
printf("Ergodicity: %d \n",is_ergodic)
endfunction
% (3)
function [Rho] = mean_clients(lambda,mu)
[rho,is_ergodic] = intensities(lambda,mu);
Rho = rho ./ (1-rho);
for i=1:5 
  printf("Mean Clients at Q%d: %d\n",i,Rho(i))
endfor
endfunction
% (4)
l = 4;
lambda = [l,1];
mu = [6,5,8,7,6];
Rho = mean_clients(lambda,mu);
sumation = sum(Rho)/sum(lambda);
printf("Average service time: %d", sumation);

% (6)

max_lambda = 6
for i=1:99
   l = max_lambda*i/100;
   vec_lambda(i) = l;
   lambda = [l,1];
   mu = [6,5,8,7,6];
   vec_sum(i) = sum(mean_clients(lambda,mu))/sum(lambda);
endfor

figure(1);
plot(vec_lambda,vec_sum,"r","linewidth",2);
title("Mean Waiting Time","fontsize", 15);
xlabel('\lambda_1',"fontsize", 15);
ylabel("Waiting Time","fontsize", 15);
saveas (1, "figure2.png");

clc;
clear all;
close all;
exit;
%intensities([1,2],[2,5,3,4,5]);
