function P_blocking = erlang_iterative(r,c)
  P_blocking = 1;
  for k=1:c
      P_blocking =((r*P_blocking)/((r*P_blocking)+ k));
  endfor
endfunction

display(erlang_iterative(1024,1024));


exit;