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