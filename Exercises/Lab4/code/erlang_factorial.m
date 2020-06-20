pkg load queueing
addpath(pwd);
function Result = erlang_factorial(ro,c)
    arithmitis = (ro^c)/factorial(c)
    paranomasths = 0
    i = 0;
    while i <= c
        paranomasths += (ro^i)/factorial(i);
        i++;
    endwhile
    Result = arithmitis/paranomasths;
endfunction
display(erlang_factorial(1024,1024));
display(erlangb(1024,1024));
exit;