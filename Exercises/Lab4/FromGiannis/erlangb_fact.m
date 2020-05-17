function P_blocking = erlangb_fact(r, c)
  den=1; # k = 0
  for k=1:c
    den +=(r^k/factorial(k));
  endfor
  P_blocking=(r^c/factorial(c))/den;
endfunction