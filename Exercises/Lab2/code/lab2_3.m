pkg load statistics
pkg load queueing

% system M/M/1/4
% when there are 3 clients in the system, the capability of the server doubles.

clc;
clear all;
close all;

# (i)

lambda = 5;
mu = 10;
states = [0, 1, 2, 3, 4]; % system with capacity 4 states
% the initial state of the system. The system is initially empty.
initial_state = [1, 0, 0, 0, 0];

% define the birth and death rates between the states of the system.
births_B = [lambda, lambda/2, lambda/3, lambda/4];
deaths_D = [mu, mu, mu, mu];

% get the transition matrix of the birth-death process
transition_matrix = ctmcbd(births_B, deaths_D);
display (transition_matrix)

# (ii)
% get the ergodic probabilities of the system
P = ctmc(transition_matrix);
display (P);
figure(1);
hold on;
title("Bar of Probabilities per state")
xlabel("State")
ylabel("Probability")
bar(states, P, "b", 0.5);
grid on;
saveas (1, "figures3/figure3_1.png")
hold off;
# (iii)
display( " Average Number of customers in the system : ")
display( sum(P.*[0,1,2,3,4]))

# (iv)
display( " Probability of blocking a customer :")
display( P(5) )

# (v)
% plot the ergodic probabilities (bar for bar chart)
index = 0;
for T = 0 : 0.01 : 50
  index = index + 1;
  P0 = ctmc(transition_matrix, T, initial_state);
  Prob0(index) = P0(1);
  Prob1(index) = P0(2);
  Prob2(index) = P0(3);
  Prob3(index) = P0(4);
  Prob4(index) = P0(5);
  if P0 - P < 0.01
    break;
  endif
endfor

T = 0 : 0.01 : T;
figure(2);
title(strjoin({"Probabilities of system states with \\lambda = ",num2str(lambda)," and \\mu = ",num2str(mu)},""))
xlabel("Time(sec)")
ylabel("Probability")
hold on;
plot(T, Prob0, "r", "linewidth", 1.5);
plot(T, Prob1, "g", "linewidth", 1.5);
plot(T, Prob2, "b", "linewidth", 1.5);
plot(T, Prob3, "k", "linewidth", 1.5);
plot(T, Prob4, "m", "linewidth", 1.5);
legend("State : 0","State : 1","State : 2","State : 3","State : 4");
grid on;
saveas (2, strjoin({"figures3/figure3_",num2str(2),".png"},""))
hold off;
% transient probability of state 0 until convergence to ergodic probability. Convergence takes place P0 and P differ by 0.01
mu = [1,5,20];
for i=1:columns(mu)
  deaths_D = [mu(i), mu(i), mu(i), mu(i)];
  transition_matrix = ctmcbd(births_B, deaths_D);
  index = 0;
  for T = 0 : 0.01 : 4
    index = index + 1;
    P0 = ctmc(transition_matrix, T, initial_state);
    Prob0(index) = P0(1);
    Prob1(index) = P0(2);
    Prob2(index) = P0(3);
    Prob3(index) = P0(4);
    Prob4(index) = P0(5);
    if P0 - P < 0.01
      break;
    endif
  endfor


  T = 0 : 0.01 : T;
  figure(i+2);
  title(strjoin({"Probabilities of system states with \\lambda = ",num2str(lambda)," and \\mu = ",num2str(mu(i))},""))
  xlabel("Time(sec)")
  ylabel("Probability")
  hold on;
  plot(T, Prob0, "r", "linewidth", 1.5);
  plot(T, Prob1, "g", "linewidth", 1.5);
  plot(T, Prob2, "b", "linewidth", 1.5);
  plot(T, Prob3, "k", "linewidth", 1.5);
  plot(T, Prob4, "m", "linewidth", 1.5);
  legend("State : 0","State : 1","State : 2","State : 3","State : 4");
  grid on;
  saveas (i+2, strjoin({"figures3/figure3_",num2str(i+2),".png"},""))
  hold off;
endfor


clc;
clear all;
close all;

exit;