function [Rho] = mean_clients(lambda,mu)
[rho,is_ergodic] = intensities(lambda,mu);
Rho = rho ./ (1-rho);
for i=1:5 
  printf("Mean Clients at Q%d: %d\n",i,Rho(i))
endfor
endfunction