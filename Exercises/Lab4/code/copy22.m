pkg load queueing
addpath(pwd);
function Result = erlang_factorial(ro,c)
    arithmitis = 1
    paranomasthsAll = 0;
    for k=1:c
        curparanomasths = 1
        for l=1:k
            curparanomasths *= (ro)/l;
        endfor
        paranomasths(k) = curparanomasths
        for l=1:k
            %for m=1:l
                paranomasths(l) /= ((ro)/(k-l+1));
            %endfor
                paranomasths(k) /= ((ro)/l);
        endfor
                paranomasths(k) *= ro;
    endfor
    for k=1:c
        paranomasthsAll += paranomasths(k)
    endfor

    Result = 1/paranomasthsAll;
endfunction


display(erlang_factorial(10,10));
display(erlangb(10,10));

exit;