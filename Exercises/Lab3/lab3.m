% M/M/1 simulation. We will find the probabilities of the first states.
% Note: Due to ergodicity, every state has a probability >0.

clc;
clear all;
close all;
rand('seed',1);
total_arrivals = 0; % to measure the total number of arrivals
current_state = 0;  % holds the current state of the system
previous_mean_clients = 0; % will help in the convergence test
index = 0;
arrivals(11) = 0;
lambda = 5; 
mu = 5;
threshold = lambda/(lambda + mu); % the threshold used to calculate probabilities
counter = 0;

transitions = 0; % holds the transitions of the simulation in transitions steps

while transitions >= 0
  transitions = transitions + 1; % one more transitions step
  traceMatr = [];
  if (counter < 30)
    traceMatr[]
    disp(counter);
    disp(current_state);
    disp(arrivals(current_state + 1)); 
  endif
  
  if mod(transitions,1000) == 0 % check for convergence every 1000 transitions steps
    index = index + 1;
    for i=1:1:length(arrivals)
        P(i) = arrivals(i)/total_arrivals; % calcuate the probability of every state in the system
    endfor
    
    mean_clients = 0; % calculate the mean number of clients in the system
    for i=1:1:length(arrivals)
       mean_clients = mean_clients + (i-1).*P(i);
    endfor
    
    to_plot(index) = mean_clients;
        
    if abs(mean_clients - previous_mean_clients) < 0.00001 || transitions > 1000000 % convergence test
      break;
    endif
    
    previous_mean_clients = mean_clients;
    
  endif
  
  random_number = rand(1); % generate a random number (Uniform distribution)
  if current_state == 0 || random_number < threshold % arrival
    if (counter < 30)
      disp("arrival");
    endif    
    total_arrivals = total_arrivals + 1;
    try % to catch the exception if variable arrivals(i) is undefined. Required only for systems with finite capacity.
      arrivals(current_state + 1) = arrivals(current_state + 1) + 1; % increase the number of arrivals in the current state
      if (current_state != 10) 
        current_state = current_state + 1;
      endif
    catch
      arrivals(current_state + 1) = 1;
      if (current_state != 10)
        current_state = current_state + 1;
      endif
    end
  else % departure
    if (counter < 30)
      disp("departure");
    endif
    if current_state != 0 % no departure from an empty system
      current_state = current_state - 1;
    endif
  endif
  counter = counter + 1;
endwhile

for i=1:1:length(arrivals)
  display(P(i));
endfor

figure(1);
plot(to_plot,"r","linewidth",1.3);
title("Average number of clients in the M/M/1/10 queue: Convergence");
xlabel("transitions in thousands");
ylabel("Average number of clients");

figure(2);
x = 0:1:10;
bar(x,P,'r',0.4);
title("Probabilities")
ylabel("Probability");
xlabel("Number of clients in system");
