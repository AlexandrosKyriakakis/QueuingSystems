clc;
clear;
1;
function P_blocking = erlangb_factorial(r, c)
  denominator=1; # k = 0
  for k=1:c
    denominator = denominator+(r^k/factorial(k));
  endfor
  P_blocking=(r^c/factorial(c))/denominator;
endfunction
